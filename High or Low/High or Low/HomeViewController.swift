//
//  HomeViewController.swift
//  High or Low
//
//  Created by Elton Ruhani @Kin+Carta on 26.1.24.
//

import UIKit

class HomeViewController: UIViewController {
    // UI Elements
    let tableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 10
        view.layer.borderColor = UIColor.brown.cgColor
        return view
    }()
    let moneyAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$ 1234"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white

        return label
    }()
    let lastCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .red
        
        return view
    }()
    let newCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .blue
        
        return view
    }()
    let lastCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        return label
    }()
    let newCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        return label
    }()
    let multiplierLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "x 1"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    let lowerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOWER", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(lowerPressed), for: .touchUpInside)

        return button
    }()
    let higherButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("HIGHER", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(higherPressed), for: .touchUpInside)

        return button
    }()
    let cashoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CASHOUT", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(cashoutPressed), for: .touchUpInside)

        return button
    }()
    let multiplierView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        

        return view
    }()
    
    // Color assets
    let background = UIColor(named: "BackgroundC")
    let primary = UIColor(named: "PrimaryC")
    let greenGS = UIColor(named: "Green Gradient Start")
    let greenGE = UIColor(named: "Green Gradient End")
    let redGS = UIColor(named: "Red Gradient Start")
    let redGE = UIColor(named: "Red Gradient End")
    let grayGS = UIColor(named: "Gray Gradient Start")
    let grayGE = UIColor(named: "Gray Gradient End")
    let brown = UIColor(named: "brown")
    var corners: CGFloat = 0.0
    
   // MARK: - VARIABLES
    var lastNumber: Int = 0
    var currentNumber: Int = 0
    var newNumber: Int = 0
    var userGuess: String = ""
    var multiplier: Double = 1.0
    
    var shuffled: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        corners = self.view.frame.width / 2
        setupUI()
        newCardLabel.text = "\(currentNumber)"
        lastCardLabel.text = "\(lastNumber)"
        multiplierLabel.text = "x \(multiplier)"
        higherButton.backgroundColor = greenGE
        multiplierView.backgroundColor = greenGE
    }
    
    // MARK: - GAME LOGIC
    func getNewNumber() {
        let randomNumber = Int(arc4random_uniform(10)) + 1
        newNumber = randomNumber
    }
    
    func updateNewNumber() {
        lastNumber = currentNumber
        currentNumber = newNumber
        UIView.transition(with: lastCard, duration: 0.5, options: .transitionCurlUp) {
            self.lastCardLabel.text = "\(self.lastNumber)"
        }
        UIView.transition(with: newCard, duration: 0.5, options: .transitionCurlUp) {
            self.newCardLabel.text = "\(self.newNumber)"
        }
        
    }
    
    func checkForWin() {
        var formatedMultiplier = String(format: "%.2f", multiplier)
        getNewNumber()
        updateNewNumber()
        if userGuess == "Higher" {
            if currentNumber >= lastNumber {
                if lastNumber > 7 {
                    multiplier = multiplier * 3.2
                } else {
                    multiplier = multiplier * 1.33
                }
                formatedMultiplier = String(format: "%.2f", multiplier)
                multiplierLabel.text = "\(formatedMultiplier)"
            } else {
                multiplier = 1
                multiplierLabel.text = "\(multiplier)"
            }
        } else {
            if currentNumber <= lastNumber {
                multiplier = multiplier * 1.33
                formatedMultiplier = String(format: "%.2f", multiplier)
                multiplierLabel.text = "\(formatedMultiplier)"
            } else {
                multiplier = 1
                multiplierLabel.text = "\(multiplier)"
            }
        }
    }
}

extension HomeViewController {
    func setupUI() {
        view.backgroundColor = background
        tableView.backgroundColor = primary
        tableView.layer.cornerRadius = corners
        
        let bottomView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        view.addSubview(tableView)
        tableView.addSubview(moneyAmountLabel)
        view.addSubview(bottomView)
        tableView.addSubview(lastCard)
        tableView.addSubview(newCard)
        bottomView.addSubview(lowerButton)
        bottomView.addSubview(higherButton)
        bottomView.addSubview(cashoutButton)
        bottomView.addSubview(multiplierView)
        multiplierView.addSubview(multiplierLabel)
        
        lastCard.addSubview(lastCardLabel)
        newCard.addSubview(newCardLabel)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -corners),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            moneyAmountLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            moneyAmountLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12),
            moneyAmountLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lastCard.trailingAnchor.constraint(equalTo: tableView.centerXAnchor, constant: -10),
            lastCard.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -125),
            lastCard.widthAnchor.constraint(equalToConstant: 90),
            lastCard.heightAnchor.constraint(equalTo: lastCard.widthAnchor, multiplier: 1.5),
            
            lastCardLabel.centerXAnchor.constraint(equalTo: lastCard.centerXAnchor),
            lastCardLabel.centerYAnchor.constraint(equalTo: lastCard.centerYAnchor),
            
            newCard.leadingAnchor.constraint(equalTo: tableView.centerXAnchor, constant: 10),
            newCard.topAnchor.constraint(equalTo:lastCard.topAnchor),
            newCard.widthAnchor.constraint(equalToConstant: 90),
            newCard.heightAnchor.constraint(equalTo: newCard.widthAnchor, multiplier: 1.5),
            
            newCardLabel.centerXAnchor.constraint(equalTo: newCard.centerXAnchor),
            newCardLabel.centerYAnchor.constraint(equalTo: newCard.centerYAnchor),
            
            bottomView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            lowerButton.bottomAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -10),
            lowerButton.widthAnchor.constraint(equalToConstant: 120),
            lowerButton.heightAnchor.constraint(equalToConstant: 40),
            lowerButton.trailingAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: -10),
            
            higherButton.bottomAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -10),
            higherButton.widthAnchor.constraint(equalToConstant: 120),
            higherButton.heightAnchor.constraint(equalToConstant: 40),
            higherButton.leadingAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 10),
            
            cashoutButton.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 10),
            cashoutButton.leadingAnchor.constraint(equalTo: lowerButton.leadingAnchor),
            cashoutButton.trailingAnchor.constraint(equalTo: lowerButton.trailingAnchor),
            cashoutButton.heightAnchor.constraint(equalTo: higherButton.heightAnchor),
            
            multiplierView.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 10),
            multiplierView.leadingAnchor.constraint(equalTo: higherButton.leadingAnchor),
            multiplierView.trailingAnchor.constraint(equalTo: higherButton.trailingAnchor),
            multiplierView.heightAnchor.constraint(equalTo: higherButton.heightAnchor),
            
            multiplierLabel.leadingAnchor.constraint(equalTo: multiplierView.leadingAnchor, constant: 6),
            multiplierLabel.trailingAnchor.constraint(equalTo: multiplierView.trailingAnchor, constant: -6),
            multiplierLabel.topAnchor.constraint(equalTo: multiplierView.topAnchor, constant: 3),
            multiplierLabel.bottomAnchor.constraint(equalTo: multiplierView.bottomAnchor, constant: -3),
            
        ])
    }
    
    @objc func shuffleCard() {
        if !shuffled {
            changeCardPositions()
        }
    }
    
    @objc func higherPressed() {
        userGuess = "Higher"
        checkForWin()
        UIView.animate(withDuration: 0.5) {
            self.higherButton.layer.opacity -= 0.5
            self.higherButton.layer.opacity += 0.5
        }
    }
    
    @objc func lowerPressed() {
        userGuess = "Lower"
        checkForWin()
        UIView.animate(withDuration: 0.5) {
            self.lowerButton.layer.opacity -= 0.5
            self.lowerButton.layer.opacity += 0.5
        }
    }
    
    @objc func cashoutPressed() {
        multiplier = 1.0
        getNewNumber()
        updateNewNumber()
        multiplierLabel.text = "\(multiplier)"
        UIView.animate(withDuration: 0.5) {
            self.cashoutButton.layer.opacity -= 0.5
            self.cashoutButton.layer.opacity += 0.5
        }
    }
    
    func changeCardPositions() {
        print(newCard.frame)
        print(lastCard.frame)
        NSLayoutConstraint.deactivate([
            lastCard.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            newCard.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            
        ])
        
        NSLayoutConstraint.activate([
            newCard.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            lastCard.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            ])
        
        print(newCard.frame)
        print(lastCard.frame)
        
        view.layoutIfNeeded()
        }
}
