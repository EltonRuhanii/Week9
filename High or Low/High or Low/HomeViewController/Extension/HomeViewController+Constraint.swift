//
//  HomeViewController+Constraint.swift
//  High or Low
//
//  Created by Kin+Carta on 9.2.24.
//

import UIKit

extension HomeViewController {
    func setupUI() {
        lowerButton.addTarget(self, action: #selector(lowerPressed), for: .touchUpInside)
        higherButton.addTarget(self, action: #selector(higherPressed), for: .touchUpInside)
        cashoutButton.addTarget(self, action: #selector(cashoutPressed), for: .touchUpInside)
        view.backgroundColor = backgroundColor
        topView.backgroundColor = primaryColor
        topView.layer.cornerRadius = corners
        
        let bottomView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        view.addSubview(topView)
        topView.addSubview(moneyAmountLabel)
        view.addSubview(bottomView)
        topView.addSubview(lastCard)
        topView.addSubview(newCard)
        bottomView.addSubview(lowerButton)
        bottomView.addSubview(higherButton)
        bottomView.addSubview(cashoutButton)
        bottomView.addSubview(multiplierView)
        multiplierView.addSubview(multiplierLabel)
        lastCard.addSubview(lastCardLabel)
        newCard.addSubview(newCardLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
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
            
            lastCardLabel.centerXAnchor.constraint(equalTo: lastCard.centerXAnchor),
            lastCardLabel.centerYAnchor.constraint(equalTo: lastCard.centerYAnchor),
        
            newCard.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            newCard.topAnchor.constraint(equalTo:lastCard.topAnchor),
            newCard.widthAnchor.constraint(equalToConstant: 90),
            newCard.heightAnchor.constraint(equalToConstant: 160),
            
            newCardLabel.centerXAnchor.constraint(equalTo: newCard.centerXAnchor),
            newCardLabel.centerYAnchor.constraint(equalTo: newCard.centerYAnchor),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
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
}
