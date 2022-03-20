//
//  ViewController.swift
//  HomeWork 2.2.1
//
//  Created by Almas Selbayev on 06.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var rgb: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.layer.cornerRadius = 10
        updateColorInfo(color: rgb)
        
    }
    
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(redSlider.value)
            redTextField.text = string(redSlider.value)
        case greenSlider:
            greenLabel.text = string(greenSlider.value)
            greenTextField.text = string(greenSlider.value)
        default:
            blueLabel.text = string(blueSlider.value)
            blueTextField.text = string(blueSlider.value)
        }
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
    }
    
    private func string(_ value: Float) -> String {
        String(format: "%.2f", value)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
    }
    
    private func updateColorInfo(color: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redLabel.text = string(Float(red))
        greenLabel.text = string(Float(green))
        blueLabel.text = string(Float(blue))
        
        redTextField.text = string(Float(red))
        greenTextField.text = string(Float(green))
        blueTextField.text = string(Float(blue))
        
        colorView.backgroundColor = color
    }
}

