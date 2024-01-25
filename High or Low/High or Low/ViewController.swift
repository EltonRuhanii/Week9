//
//  ViewController.swift
//  High or Low
//
//  Created by Kin+Carta on 25.1.24.
//

import UIKit

class ViewController: UIViewController {
    let card: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        return view
    }()
    let cardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        
        return label
    }()
    
    var lastNumber = 0
    var currentNumber = 5
    var newNumber = 0
    var userGuess = ""
    var score: Double = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getNewNumber()
    }

   func showAlert() {
       let alertController = UIAlertController(title: "Alert Title", message: "This is a message.", preferredStyle: .alert)
       let formattedString = String(format: "%.2f", score)
       UIView.animate(withDuration: 0.5) {
           self.card.image = UIImage(named: "Back")
       }
       let okAction = UIAlertAction(title: "You won \(formattedString)x", style: .default) { (action) in
           self.score = 0
       }
       alertController.addAction(okAction)
       score = 1.00
       
       present(alertController, animated: true, completion: nil)
   }
    
    func getNewNumber() {
        let randomNumber = Int(arc4random_uniform(10)) + 1
        newNumber = randomNumber
    }
    
    func updateNewNumber() {
        lastNumber = currentNumber
        currentNumber = newNumber
        card.image = UIImage(named: "\(currentNumber)")
    }
    
    func checkForWin() {
        if userGuess == "Higher" {
            if currentNumber >= lastNumber {
                score = score * 1.33
            } else {
                score = 1
            }
        } else {
            if currentNumber <= lastNumber {
                score = score * 1.33
            } else {
                score = 1
            }
        }
    }
    
    func animateFromBottom() {
        userGuess = "Higher"
        
        UIView.transition(with: card, duration: 0.5, options: .transitionCurlUp, animations: {
            self.getNewNumber()
            self.updateNewNumber()
            self.checkForWin()
        }, completion: nil)
    }
    
    @objc func higherTapped() {
        animateFromBottom()
    }
    
    @objc func lowerTapped() {
        userGuess = "Lower"
        UIView.transition(with: card, duration: 0.5, options: .transitionCurlDown, animations: {
            self.getNewNumber()
            self.updateNewNumber()
            self.checkForWin()
        }, completion: nil)
    }
    
    @objc func cashout() {
        showAlert()
    }
    
}

extension ViewController {
    func setupUI() {
       
        let lowerButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Lower", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(lowerTapped), for: .touchUpInside)
            button.backgroundColor = .white
            button.layer.cornerRadius = 5
            return button
        }()
        
        let higherButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Higher", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(higherTapped), for: .touchUpInside)
            button.backgroundColor = .white
            button.layer.cornerRadius = 5
            return button
        }()
        
        let cashoutButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Cashout", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(cashout), for: .touchUpInside)
            button.backgroundColor = .white
            button.layer.cornerRadius = 5
            return button
        }()
        
        view.addSubview(card)
        card.addSubview(cardLabel)
        view.addSubview(lowerButton)
        view.addSubview(higherButton)
        view.addSubview(cashoutButton)
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            card.heightAnchor.constraint(equalTo: card.widthAnchor, multiplier: 1.5),
            
//            cardLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),
//            cardLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            
            lowerButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 24),
            lowerButton.leadingAnchor.constraint(equalTo: card.leadingAnchor),
            lowerButton.trailingAnchor.constraint(equalTo: card.centerXAnchor, constant: -6),
            lowerButton.heightAnchor.constraint(equalToConstant: 40),
             
            higherButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 24),
            higherButton.leadingAnchor.constraint(equalTo: card.centerXAnchor, constant: 6),
            higherButton.trailingAnchor.constraint(equalTo: card.trailingAnchor),
            higherButton.heightAnchor.constraint(equalToConstant: 40),
            
            cashoutButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            cashoutButton.leadingAnchor.constraint(equalTo: lowerButton.leadingAnchor),
            cashoutButton.trailingAnchor.constraint(equalTo: higherButton.trailingAnchor),
            cashoutButton.heightAnchor.constraint(equalTo: higherButton.heightAnchor),
        ])
    }
}
