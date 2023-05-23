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
// MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var blueValueText: UITextField!
    @IBOutlet var greenValueText: UITextField!
    @IBOutlet var redValueText: UITextField!
    
    @IBOutlet var sliderRedOutlet: UISlider!
    @IBOutlet var sliderGreenOutlet: UISlider!
    @IBOutlet var sliderBlueOutlet: UISlider!
    
    @IBOutlet var blueTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var redTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingStart()
        
        redTF.delegate = self
        blueTF.delegate = self
        greenTF.delegate = self
    }
    


    @IBAction func sliderAction(_ sender: UISlider) {
        colorMix()
        
        switch sender {
        case sliderRedOutlet:
            redValueText.text = String(format: "%.2f", sliderRedOutlet.value)
            redTF.text = String(format: "%.2f", sliderRedOutlet.value)
        case sliderGreenOutlet:
            greenValueText.text = String(format: "%.2f", sliderGreenOutlet.value)
            greenTF.text = String(format: "%.2f", sliderGreenOutlet.value)
        default:
            blueValueText.text = String(format: "%.2f", sliderBlueOutlet.value)
            blueTF.text = String(format: "%.2f", sliderBlueOutlet.value)
        }
    }
    
    @IBAction func doneBuutonPress() {
        delegate.setNewColor(newColor)
        dismiss(animated: true)
    }
    
   
    
    
}
extension SettingViewController {
    
    private func colorMix(){
        newColor = UIColor(
            red: CGFloat(sliderRedOutlet.value),
            green: CGFloat(sliderGreenOutlet.value),
            blue: CGFloat(sliderBlueOutlet.value),
            alpha: 1)
        colorView.backgroundColor = newColor
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueText: label.text = string(from: sliderRedOutlet)
            case greenValueText: label.text = string(from: sliderGreenOutlet)
            default: blueValueText.text = string(from: sliderBlueOutlet)
            }
        }
    }
    
    private func settingStart() {
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = colorWelcom
                
   }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}
// MARK - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        blueValueText.text = blueTF.text
        redValueText.text = redTF.text
        greenValueText.text = greenTF.text
        
        sliderRedOutlet.value = Float(redTF.text ?? "") ?? 1
        sliderBlueOutlet.value = Float(blueTF.text ?? "") ?? 1
        sliderGreenOutlet.value = Float(greenTF.text ?? "") ?? 1
    }
}
