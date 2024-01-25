//
//  ViewController.swift
//  Core Animations
//
//  Created by Kin+Carta on 24.1.24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var meteor: UIImageView!
    
    @IBOutlet weak var explosion: UIImageView!
    
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetup()
        configureEndAnimation()
    }

    func configureInitialSetup() {
        meteor.alpha = 0.0
        meteor.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    }
    
    func configureEndAnimation() {
        animator.addAnimations {
            self.meteor.alpha = 1.0
            self.meteor.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
        }
        
        animator.addAnimations({
            self.meteor.frame.origin.y -= 400
        }, delayFactor: 0.9)
    }

    @IBAction func didSlide(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
    
}

