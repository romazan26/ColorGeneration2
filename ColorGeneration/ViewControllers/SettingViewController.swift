//
//  ViewController.swift
//  ColorGeneration
//
//  Created by Роман on 01.05.2023.
//

import UIKit

final class SettingViewController: UIViewController {
    
    var colorWelcom: UIColor!
    
    private var newColor: UIColor!
    
    unowned var delegate: SettingViewControllerDelegate!
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var blueValueText: UITextField!
    @IBOutlet var greenValueText: UITextField!
    @IBOutlet var redValueText: UITextField!
    
    @IBOutlet var sliderRedOutlet: UISlider!
    @IBOutlet var sliderGreenOutlet: UISlider!
    @IBOutlet var sliderBlueOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // colorMix()
        settingStart()
        
    }
    


    @IBAction func sliderAction(_ sender: UISlider) {
        colorMix()
        
        switch sender {
        case sliderRedOutlet:
            redValueText.text = String(format: "%.2f", sliderRedOutlet.value)
        case sliderGreenOutlet:
            greenValueText.text = String(format: "%.2f", sliderGreenOutlet.value)
        default:
            blueValueText.text = String(format: "%.2f", sliderBlueOutlet.value)
        }
    }
    
    @IBAction func doneBuutonPress() {
        delegate.setNewColor(newColor)
        dismiss(animated: true)
    }
    
    private func colorMix(){
        newColor = UIColor(
            red: CGFloat(sliderRedOutlet.value),
            green: CGFloat(sliderGreenOutlet.value),
            blue: CGFloat(sliderBlueOutlet.value),
            alpha: 1)
        colorView.backgroundColor = newColor
    }
    
    private func settingStart() {
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = colorWelcom
        
        
        
        
//        redValueText.text = String(format: "%.2f", sliderRedOutlet.value)
//        greenValueText.text = String(format: "%.2f", sliderGreenOutlet.value)
//        blueValueText.text = String(format: "%.2f", sliderBlueOutlet.value)
   }
    
    
}

extension SettingViewController: UITextFieldDelegate {
    
}
