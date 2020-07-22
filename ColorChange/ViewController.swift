//
//  ViewController.swift
//  ColorChange
//
//  Created by tantsunsin on 2020/7/22.
//  Copyright © 2020 tantsunsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let LargeTempView = UIImageView(image: UIImage(named: "LargeCloth"))
        LargeTempView.frame = LargeClothView.frame
        LargeTempView.contentMode = .scaleAspectFit
        LargeClothView.mask = LargeTempView
        
        let SmallTempView = UIImageView(image: UIImage(named: "SmallCloth"))
        SmallTempView.frame = SmallClothView.frame
        SmallTempView.contentMode = .scaleAspectFit
        SmallClothView.mask = SmallTempView
        
        creatGardient()
    }
    
    @IBOutlet weak var BodyColor: UIView!
    @IBOutlet weak var LargeClothView: UIView!
    @IBOutlet weak var SmallClothView: UIView!
    @IBOutlet weak var BodyNumber: UILabel!
    @IBOutlet weak var ClothNumber: UILabel!
    @IBOutlet weak var BodyGradientView: UIView!
    @IBOutlet weak var ClothGradientView: UIView!
    
    @IBAction func BodyControl(_ sender: UISlider) {
        let slider = sender
        slider.maximumValue = 1
        slider.minimumValue = 0
        BodyColor.backgroundColor = UIColor(hue: CGFloat(slider.value), saturation: 0.8, brightness: 1, alpha: 1)
        let number = round(slider.value*10000)/100
        BodyNumber.text = "\(number)"
    }

    @IBAction func ClothControl(_ sender: UISlider) {
        let slider = sender
        slider.maximumValue = 1
        slider.minimumValue = 0
        LargeClothView.backgroundColor = UIColor(hue: CGFloat(slider.value), saturation: 0.8, brightness: 0.8, alpha: 1)
        SmallClothView.backgroundColor = UIColor(hue: CGFloat(slider.value), saturation: 1, brightness: 0.8, alpha: 1)
         let number = round(slider.value*10000)/100
        ClothNumber.text = "\(number)"
    }
    
    
    //身體與衣服的slider漸層
    
    func creatGardient(){
        let BodyGardientLayer = CAGradientLayer()
        BodyGardientLayer.frame = CGRect(x: 0, y: 10, width: 304, height: 10)
        BodyGardientLayer.startPoint = CGPoint(x:0.0, y:0.5)
        BodyGardientLayer.endPoint = CGPoint(x:1.0, y:0.5)
        BodyGardientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, CGColor(srgbRed: 0, green: 253, blue: 255, alpha: 1), UIColor.blue.cgColor, UIColor.systemPink.cgColor, UIColor.red.cgColor]
        BodyGradientView.layer.addSublayer(BodyGardientLayer)
    
        let ClothGardientLayer = CAGradientLayer()
        ClothGardientLayer.frame = CGRect(x: 0, y: 10, width: 304, height: 10)
        ClothGardientLayer.startPoint = CGPoint(x:0.0, y:0.5)
        ClothGardientLayer.endPoint = CGPoint(x:1.0, y:0.5)
        ClothGardientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, CGColor(srgbRed: 0, green: 253, blue: 255, alpha: 1), UIColor.blue.cgColor, UIColor.systemPink.cgColor, UIColor.red.cgColor]
        ClothGradientView.layer.addSublayer(ClothGardientLayer)
        
    }
}

