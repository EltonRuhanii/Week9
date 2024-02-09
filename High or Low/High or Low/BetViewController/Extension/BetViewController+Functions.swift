//
//  BetViewController+Functions.swift
//  High or Low
//
//  Created by Kin+Carta on 9.2.24.
//

import UIKit

extension BetViewController {
    // MARK: - Setup Button Targets
    func setupButtonTargets() {
        oneDollar.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        fiveDollars.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        tenDollars.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        twentyDollars.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        fiftyDollars.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
        hundredDollars.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
    }
    
    // MARK: - Button Action Func
    @objc func buttonPressed(sender: UIButton) {
        var amount: CGFloat = 0
        setupLabels()
        
        switch sender {
                case oneDollar: amount = 1
                case fiveDollars: amount = 5
                case tenDollars: amount = 10
                case twentyDollars: amount = 20
                case fiftyDollars: amount = 50
                case hundredDollars: amount = 100
                default: amount = userOne.moneyAmount
        }
        
        UIView.animate(withDuration: 0.5) {
            sender.layer.opacity -= 0.5
            sender.layer.opacity += 0.5
        }
        
        if amount <= userOne.moneyAmount{
            let homeVc = HomeViewController()
            homeVc.betAmount = amount
            
            userOne.moneyAmount -= amount
            
            self.navigationController?.pushViewController(homeVc, animated: true)
        } else if userOne.moneyAmount <= 0  {
        } else {
        }
    }
    
    // MARK: - Setup Labels
    func setupLabels() {
        moneyAmountLabel.text = "\(String(format: "%.2f", userOne.moneyAmount))"
    }
}
