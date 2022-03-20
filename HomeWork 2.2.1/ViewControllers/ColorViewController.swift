//
//  ColorViewController.swift
//  HomeWork 2.2.1
//
//  Created by Almas Selbayev on 20.03.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        
        settingsVC.rgb = getRGB(from: view.backgroundColor)
    }
    
    private func getRGB(from view: UIColor?) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        view?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIColor(
                red: CGFloat(red),
                green: CGFloat(green),
                blue: CGFloat(blue),
                alpha: CGFloat(alpha))
    }
    
}

