//
//  HomeViewController.swift
//  High or Low
//
//  Created by Elton Ruhani @Kin+Carta on 26.1.24.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    var betViewController = BetViewController()
    let backgroundColor = UIColor(named: "BackgroundC")
    let primaryColor = UIColor(named: "PrimaryC")
    
    
    // MARK: - VARIABLES
    var lastNumber: Int = 0
    var currentNumber: Int = 0
    var newNumber: Int = 0
    var userGuess: String = ""
    var multiplier: Double = 1.0
    var betAmount: Double = 0
    var corners: CGFloat = 0.0

    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUIElements()
        getNewNumber()
        updateNewNumber()
    }
    
 }

