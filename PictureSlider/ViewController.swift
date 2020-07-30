//
//  ViewController.swift
//  PictureSlider
//
//  Created by Roman Dod on 7/29/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Direction {
        case left
        case right
    }
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var nextImageButton: UIButton?
    @IBOutlet weak var previousImageButton: UIButton?
    
    var currentImageIndex = 0
    var durationAnimation = 0.3
    var delayAnimation = 0.1
    var imagesArray = [UIImage]()
    var animationInProgress = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagesArray.append(Images.audiImage!)
        imagesArray.append(Images.bmwImage!)
        imagesArray.append(Images.ferrariImage!)
        imagesArray.append(Images.lambaImage!)
        imagesArray.append(Images.mers_clsImage!)
        imagesArray.append(Images.rolls_royceImage!)
        imagesArray.append(Images.teslaImage!)
        
        imageView?.image = imagesArray.first
        
    }

    @IBAction func nextImageButton(_ sender: UIButton) {
        
        guard !animationInProgress else {
            return
        }
        
        var nextIndex = currentImageIndex + 1
        if nextIndex > imagesArray.count - 1 {
            nextIndex = 0
        }
        
        animateImage(imageIndex: nextIndex, direction: Direction.right)
    }
    
    
    @IBAction func previousImageButton(_ sender: UIButton) {
        guard !animationInProgress else {
            return
        }
        
        var nextIndex = currentImageIndex - 1
        if nextIndex < 0 {
            nextIndex = imagesArray.count - 1
        }
         
        animateImage(imageIndex: nextIndex, direction: Direction.left)
    }
    
    private func animateImage(imageIndex: Int, direction: Direction){
        animationInProgress = true
        let frame = imageView!.bounds
        
        let imgView = UIImageView(frame: frame)
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .white
        imgView.image = imagesArray[imageIndex]
        
        let center = imageView?.center as! CGPoint
        imgView.center = center
        switch direction {
        case .left:
            imgView.center.x = (imageView?.center.x)! - (imageView?.bounds.width)!
        case .right:
            imgView.center.x = (imageView?.center.x)! + (imageView?.bounds.width)!
        }
        
        view.addSubview(imgView)
        UIView.animate(withDuration: durationAnimation, delay: delayAnimation, options: .curveEaseIn, animations: {
            
            imgView.center = center
            
        }) {(_) in
            self.animationInProgress = false
            
            switch direction {
            case .left:
                self.currentImageIndex -= 1
                
                if self.currentImageIndex > self.imagesArray.count - 1{
                    self.currentImageIndex = 0
                }
            case .right:
                self.currentImageIndex += 1
                
                if self.currentImageIndex < 0 {
                    self.currentImageIndex = self.imagesArray.count - 1
                }
            }
        }
    
}

}
