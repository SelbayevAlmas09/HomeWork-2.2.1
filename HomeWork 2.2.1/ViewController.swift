//
//  ViewController.swift
//  HomeWork 2.2.1
//
//  Created by Almas Selbayev on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultedColorView: UIView!
    
    @IBOutlet var redSetting: UILabel!
    @IBOutlet var greenSetting: UILabel!
    @IBOutlet var blueSetting: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultedColorView.layer.cornerRadius = 10
        
        setResultViewBackground()
    }
    
    @IBAction func changeRedSetting() {
        redSetting.text = String(format: "%.2f", redSlider.value)
        
        setResultViewBackground()
    }
    
    @IBAction func changeGreenSetting() {
        greenSetting.text = String(format: "%.2f", greenSlider.value)
        
        setResultViewBackground()
    }
    
    @IBAction func changeBlueSetting() {
        blueSetting.text = String(format: "%.2f", blueSlider.value)
        
        setResultViewBackground()
    }
    
    private func setResultViewBackground() {
        resultedColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
    }
    
}

