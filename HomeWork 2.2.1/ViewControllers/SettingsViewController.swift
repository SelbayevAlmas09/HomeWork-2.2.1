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
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10

        setKeyboardSettings()
        updateColorDetail(color: rgb)
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
        delegate.setNewBackgroundColor(color: colorView.backgroundColor
                            ?? UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        dismiss(animated: true)
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
    
    private func updateColorDetail(color: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redLabel.text = string(Float(red))
        greenLabel.text = string(Float(green))
        blueLabel.text = string(Float(blue))
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        redTextField.text = string(Float(red))
        greenTextField.text = string(Float(green))
        blueTextField.text = string(Float(blue))
        
        colorView.backgroundColor = color
    }
}

// MARK: - Keyboard Actions
extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard var floatValue = Float(textField.text ?? "0.00") else {
            showAlert(title: "Ошибка!", message: "Не корректные данные", textField: textField)
            return
        }
        
        floatValue = round(floatValue * 100) / 100.00
        
        // Тут по идее хотел реализовать чтобы можно было округлить до .00 для
        // тексфилда, но что-то затянулось и забил
        switch textField{
        case redTextField:
            redLabel.text = string(floatValue)
            redSlider.setValue(floatValue, animated: true)
            redTextField.text = string(floatValue)
        case greenTextField:
            greenLabel.text = string(floatValue)
            greenSlider.setValue(floatValue, animated: true)
            greenTextField.text = string(floatValue)
        default:
            blueLabel.text = string(floatValue)
            blueSlider.setValue(floatValue, animated: true)
            blueTextField.text = string(floatValue)
        }
        
        setColor()
    }
    
}

// MARK: - Keyboard Settings
extension SettingsViewController {
    private func setKeyboardSettings() {
        redTextField.keyboardType = .decimalPad
        greenTextField.keyboardType = .decimalPad
        blueTextField.keyboardType = .decimalPad
        
        let numberToolbar = UIToolbar()
        numberToolbar.barStyle = UIBarStyle.default
        numberToolbar.items=[
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done",
                            style: UIBarButtonItem.Style.plain,
                            target: self,
                            action: #selector(doneButtonTapped))]
        
        numberToolbar.sizeToFit()

        redTextField.inputAccessoryView = numberToolbar
        greenTextField.inputAccessoryView = numberToolbar
        blueTextField.inputAccessoryView = numberToolbar
    }

    @objc private func doneButtonTapped() {
        view.endEditing(true)
    }
}

// MARK: - Alert Controller
extension SettingsViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = "0.00"
            guard let floatValue = Float(textField?.text ?? "0.00") else { return }
            
            switch textField {
            case self.redTextField:
                self.redLabel.text = textField?.text
                self.redSlider.setValue(floatValue, animated: true)
            case self.greenTextField:
                self.greenLabel.text = textField?.text
                self.greenSlider.setValue(floatValue, animated: true)
            default:
                self.blueLabel.text = textField?.text
                self.blueSlider.setValue(floatValue, animated: true)
            }
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
