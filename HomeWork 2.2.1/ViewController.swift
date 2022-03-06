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
    
    private var redColor: Double = 0.00
    private var greenColor: Double = 0.00
    private var blueColor: Double = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        redSlider.setValue(Float(redSetting.text ?? "0.0") ?? 0.0, animated: false)
        greenSlider.setValue(Float(greenSetting.text ?? "0.0") ?? 0.0, animated: false)
        blueSlider.setValue(Float(blueSetting.text ?? "0.0") ?? 0.0, animated: false)
        
        redColor = round(Double(redSlider.value * 100)) / 100.00
        greenColor = round(Double(greenSlider.value * 100)) / 100.00
        blueColor = round(Double(blueSlider.value * 100)) / 100.00
        
        resultedColorView.layer.cornerRadius = 10
        
        setResultViewBackground()
    }
    
    @IBAction func changeRedSetting() {
        redColor = round(Double(redSlider.value * 100)) / 100.00
        redSetting.text = String(format: "%.2f", redColor)
        
        setResultViewBackground()
    }
    
    @IBAction func changeGreenSetting() {
        greenColor = round(Double(greenSlider.value * 100)) / 100.00
        greenSetting.text = String(format: "%.2f", greenColor)
        
        setResultViewBackground()
    }
    
    @IBAction func changeBlueSetting() {
        blueColor = round(Double(blueSlider.value * 100)) / 100.00
        blueSetting.text = String(format: "%.2f", blueColor)
        
        setResultViewBackground()
    }
    
    private func setResultViewBackground() {
        resultedColorView.backgroundColor = UIColor(
            red: redColor * 255 / 255.00,
            green: greenColor * 255 / 255.00,
            blue: blueColor *  255 / 255.00,
            alpha: 1.0)
    }
    
}

