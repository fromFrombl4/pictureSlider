//
//  ViewController.swift
//  PictureSlider
//
//  Created by Roman Dod on 7/29/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextImageButton: UIButton!
    @IBOutlet weak var previousImageButton: UIButton!
    
    var imagesArray = [UIImage]()
    
    
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
        
        
    }

    @IBAction func nextImageButton(_ sender: UIButton) {
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block:{_ in
            
            for i in self.imagesArray{
            UIView.animate(withDuration: 2, animations: {
                self.imagesArray[i].layer.position = CGPoint(x: +1000, y: imageView.center)
                
            }) { (_) in
                
            })
            
            
        })
        }
    }
    @IBAction func previousImageButton(_ sender: UIButton) {
    }
    
}

