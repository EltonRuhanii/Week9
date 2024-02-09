//
//  BetViewController+FunctionExtension.swift
//  High or Low
//
//  Created by Elton Ruhani @Kin+Carta on 9.2.24.
//

import UIKit

extension BetViewController {
    // MARK: - UI ELEMENTS
    var topView: UIView {
        let view = BetViewController.createStyledView(cornerRadius: 0, borderWidth: 10, borderColor: UIColor.brown.cgColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = corners
        view.backgroundColor = UIColor(named: "PrimaryC")
        return view
    }
    var moneyAmountLabel: UILabel {
        let label = BetViewController.createLabel(text: "$ \(userOne.moneyAmount)", fontSize: 16, textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    var lastCard: UIView {
        let view = BetViewController.createCardView(color: UIColor(named: "Red Gradient Start") ?? .red)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    var newCard: UIView {
        let view = BetViewController.createCardView(color: UIColor(named: "Green Gradient End") ?? .green)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    var bottomView: UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    var oneDollar: UIButton {
        let button = BetViewController.createStyledButton(title: "$ 1", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
        button.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        return button
    }
    var fiveDollars: UIButton {
        let button = BetViewController.createStyledButton(title: "$ 5", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
        button.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        return button
    }
    var tenDollars: UIButton {
        let button = BetViewController.createStyledButton(title: "$ 10", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
        button.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        return button
    }
    var twentyDollars: UIButton {
        let button = BetViewController.createStyledButton(title: "$ 20", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
        button.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        return button
    }
    var fiftyDollars: UIButton {
        let button = BetViewController.createStyledButton(title: "$ 50", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
        button.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        return button
    }
    var hundredDollars: UIButton {
        let button = BetViewController.createStyledButton(title: "$ 100", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
        button.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        return button
    }
    
    func setupUI() {
        moneyAmountLabel.text = "$ \(userOne.moneyAmount)"
        view.backgroundColor =  UIColor(named: "BackgroundC")
        topView.backgroundColor = UIColor(named: "PrimaryC")
        corners = self.view.frame.width / 2
        topView.layer.cornerRadius = corners
        moneyAmountLabel.text = "\(String(format: "%.2f", userOne.moneyAmount))"
        view.addSubview(topView)
        view.addSubview(moneyAmountLabel)
        view.addSubview(lastCard)
        view.addSubview(newCard)
        view.addSubview(bottomView)
        view.addSubview(oneDollar)
        view.addSubview(fiveDollars)
        view.addSubview(tenDollars)
        view.addSubview(twentyDollars)
        view.addSubview(fiftyDollars)
        view.addSubview(hundredDollars)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: -corners),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            moneyAmountLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            moneyAmountLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12),
            moneyAmountLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lastCard.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            lastCard.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -125),
            lastCard.widthAnchor.constraint(equalToConstant: 90),
            lastCard.heightAnchor.constraint(equalToConstant: 160),
            
            newCard.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            newCard.topAnchor.constraint(equalTo: lastCard.topAnchor),
            newCard.widthAnchor.constraint(equalToConstant: 90),
            newCard.heightAnchor.constraint(equalToConstant: 160),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            oneDollar.bottomAnchor.constraint(equalTo: tenDollars.topAnchor, constant: -10),
            oneDollar.heightAnchor.constraint(equalToConstant: 40),
            oneDollar.widthAnchor.constraint(equalToConstant: 120),
            oneDollar.trailingAnchor.constraint(equalTo: tenDollars.trailingAnchor),
            
            fiveDollars.bottomAnchor.constraint(equalTo: tenDollars.topAnchor, constant: -10),
            fiveDollars.heightAnchor.constraint(equalToConstant: 40),
            fiveDollars.widthAnchor.constraint(equalToConstant: 120),
            fiveDollars.leadingAnchor.constraint(equalTo: twentyDollars.leadingAnchor),
            
            tenDollars.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            tenDollars.trailingAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: -10),
            tenDollars.heightAnchor.constraint(equalToConstant: 40),
            tenDollars.widthAnchor.constraint(equalToConstant: 120),
            
            twentyDollars.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            twentyDollars.leadingAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 10),
            twentyDollars.heightAnchor.constraint(equalToConstant: 40),
            twentyDollars.widthAnchor.constraint(equalToConstant: 120),
            
            fiftyDollars.topAnchor.constraint(equalTo: tenDollars.bottomAnchor, constant: 10),
            fiftyDollars.heightAnchor.constraint(equalToConstant: 40),
            fiftyDollars.widthAnchor.constraint(equalToConstant: 120),
            fiftyDollars.trailingAnchor.constraint(equalTo: tenDollars.trailingAnchor),
            
            hundredDollars.topAnchor.constraint(equalTo: tenDollars.bottomAnchor, constant: 10),
            hundredDollars.heightAnchor.constraint(equalToConstant: 40),
            hundredDollars.widthAnchor.constraint(equalToConstant: 120),
            hundredDollars.leadingAnchor.constraint(equalTo: twentyDollars.leadingAnchor),
        ])
    }
}
