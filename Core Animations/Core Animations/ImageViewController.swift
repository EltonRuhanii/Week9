//
//  ImageViewController.swift
//  Core Animations
//
//  Created by Kin+Carta on 24.1.24.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var heartImages: [UIImage] = []
    var liked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heartImages = createImageArray(total: 7, imagePrefix: "heart")
    }

    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount)"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    
    @IBAction func didTapLike(_ sender: Any) {
        if !liked {
            animate(imageView: imageView, images: heartImages)
            imageView.image = UIImage(named: "heart-6")
        }
    }
}
