//
//  RefreshViewController.swift
//  Core Animations
//
//  Created by Kin+Carta on 24.1.24.
//

import UIKit

class RefreshViewController: UIViewController {
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    @IBOutlet weak var coverHolder: UIView!
    
    var animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut)
    
    var background: Bool = true
    
    var originalFrame: CGRect!

        override func viewDidLoad() {
            super.viewDidLoad()
            originalFrame = coverHolder.frame
            animator.addAnimations {
                self.view.backgroundColor = self.background ? .blue : .red
                self.background.toggle()
                print(self.background)
            }
        }

        func animateBlur() {
            UIView.animate(withDuration: 1.0, animations: {
                self.blurEffect.alpha = 1.0
                self.coverHolder.transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
            }) { _ in
                UIView.animate(withDuration: 1.0) {
                    self.blurEffect.alpha = 0.0
                    self.coverHolder.transform = .identity
                }
            }
        }
    
    @IBAction func swipedDown(_ sender: Any) {
        animateBlur()
        animator.startAnimation()
    }
}
