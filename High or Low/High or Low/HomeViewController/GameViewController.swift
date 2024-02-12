//
//  HomeViewController.swift
//  High or Low
//
//  Created by Elton Ruhani @Kin+Carta on 26.1.24.
//

import UIKit

class GameViewController: UIViewController {
    var newCardLeadingConstraint: NSLayoutConstraint!
    var newCardTrailingConstraint: NSLayoutConstraint!
    var lastCardLeadingConstraint: NSLayoutConstraint!
    var lastCardTrailingConstraint: NSLayoutConstraint!
    
     // UI Elements
    let topView: UIView = {
         let view = createStyledView(cornerRadius: 0, borderWidth: 10, borderColor: UIColor.brown.cgColor)
         return view
     }()
    let moneyAmountLabel: UILabel = {
         let label = createLabel(text: "$ 1234", fontSize: 16, textColor: .white)
         return label
     }()
    let lastCard: UIView = createCardView(color: UIColor(named: "Red Gradient Start") ?? .red)
    let newCard: UIView = createCardView(color: UIColor(named: "Green Gradient End") ?? .green)
    let lastCardLabel: UILabel = createCardLabel()
    let newCardLabel: UILabel = createCardLabel()
    let multiplierLabel: UILabel = {
        let label = createLabel(text: "x 1", fontSize: 18, textColor: .white)
        label.textAlignment = .center
        return label
     }()
     
    let lowerButton: UIButton = createStyledButton(title: "LOWER", backgroundColor: UIColor(named: "Red Gradient Start") ?? .red)
    let higherButton: UIButton = createStyledButton(title: "HIGHER", backgroundColor: UIColor(named: "Green Gradient End") ?? .green)
    let cashoutButton: UIButton = createStyledButton(title: "CASHOUT", backgroundColor: UIColor(named: "Red Gradient Start") ?? .red)
     
    let multiplierView: UIView = createStyledView(cornerRadius: 10)
     
     // Color assets
    let background = UIColor(named: "BackgroundC")
    let primary = UIColor(named: "PrimaryC")
     
    var corners: CGFloat = 0.0
    
    // MARK: - VARIABLES
    var lastNumber: Int = 0
    var currentNumber: Int = 0
    var newNumber: Int = 0
    var userGuess: String = ""
    var multiplier: Double = 1.0
    var betAmount: Double = 0
     
    var shuffled: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        corners = self.view.frame.width / 2
        setupUI()
        setupUIElements()
        updateNewNumber()
    }
 }




