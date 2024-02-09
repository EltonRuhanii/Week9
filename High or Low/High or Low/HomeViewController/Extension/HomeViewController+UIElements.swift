//
//  HomeViewController+UIElements.swift
//  High or Low
//
//  Created by Kin+Carta on 9.2.24.
//

import UIKit

extension HomeViewController {
    // MARK: - Computed Properties
    var topView: UIView {
        let view = BetViewController.createStyledView(cornerRadius: 0, borderWidth: 10, borderColor: UIColor.brown.cgColor)
        return view
    }
    
    var moneyAmountLabel: UILabel {
        let label = BetViewController.createLabel(text: "$ ", fontSize: 16, textColor: .white)
        return label
    }
    
    var lastCard: UIView {
        return BetViewController.createCardView(color: UIColor(named: "Red Gradient Start") ?? .red)
    }
    
    var newCard: UIView {
        return BetViewController.createCardView(color: UIColor(named: "Green Gradient End") ?? .green)
    }
    
    var lastCardLabel: UILabel {
        return BetViewController.createCardLabel()
    }
    
    var newCardLabel: UILabel {
        return BetViewController.createCardLabel()
    }
    
    var multiplierLabel: UILabel {
        let label = BetViewController.createLabel(text: "x 1", fontSize: 18, textColor: .white)
        label.textAlignment = .center
        return label
    }
    
    var lowerButton: UIButton {
        return BetViewController.createStyledButton(title: "LOWER", backgroundColor: UIColor(named: "Red Gradient Start") ?? .red)
    }
    
    var higherButton: UIButton {
        return BetViewController.createStyledButton(title: "HIGHER", backgroundColor: UIColor(named: "Green Gradient End") ?? .green)
    }
    
    var cashoutButton: UIButton {
        return BetViewController.createStyledButton(title: "CASHOUT", backgroundColor: UIColor(named: "Red Gradient Start") ?? .red)
    }
    
    var multiplierView: UIView {
        return BetViewController.createStyledView(cornerRadius: 10)
    }
    
    var bottomView: UIView {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
    }
}

