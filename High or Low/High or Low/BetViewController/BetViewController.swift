//
//  BetViewController.swift
//  High or Low
//
//  Created by Elton Ruhani @Kin+Carta on 30.1.24.
//

import UIKit

var userOne: UserModel = UserDatabase().userOne
class BetViewController: UIViewController {
    // MARK: - VARIABLES
    var corners: CGFloat = 0.0
    
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtonTargets()
        setupLabels()
    }
    
}
