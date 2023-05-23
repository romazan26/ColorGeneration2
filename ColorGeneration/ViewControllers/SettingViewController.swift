//
//  ViewController.swift
//  ColorGeneration
//
//  Created by Роман on 01.05.2023.
//

import UIKit

final class SettingViewController: UIViewController {
    
    var colorWelcom: UIColor!
    
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
    
    // MARK: - overrideFunctions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingStart()
        
        redTF.delegate = self
        blueTF.delegate = self
        greenTF.delegate = self
        
        setValue(for: sliderRedOutlet, sliderBlueOutlet, sliderGreenOutlet)
        setValue(fo: redTF, blueTF, greenTF)
        setValue(fo: blueValueText, greenValueText, redValueText)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

// MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        colorMix()
        
        switch sender {
        case sliderRedOutlet:
            setValue(fo: redValueText)
            setValue(fo: redTF)
        case sliderGreenOutlet:
            greenValueText.text = String(format: "%.2f", sliderGreenOutlet.value)
            greenTF.text = String(format: "%.2f", sliderGreenOutlet.value)
        default:
            blueValueText.text = String(format: "%.2f", sliderBlueOutlet.value)
            blueTF.text = String(format: "%.2f", sliderBlueOutlet.value)
        }
    }
    
    @IBAction func doneBuutonPress() {
        delegate.setNewColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
   
    
    
}
// MARK: - Private functions
extension SettingViewController {
    
    private func colorMix(){
        colorView.backgroundColor = UIColor(
            red: CGFloat(sliderRedOutlet.value),
            green: CGFloat(sliderGreenOutlet.value),
            blue: CGFloat(sliderBlueOutlet.value),
            alpha: 1)
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
    
    private func setValue(fo textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF: textField.text = string(from: sliderRedOutlet)
            case blueTF: textField.text = string(from: sliderBlueOutlet)
            default: textField.text = string(from: sliderGreenOutlet)
            }
            
        }
    }
    
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: colorWelcom)
        colorSliders.forEach { slider in
            switch slider {
            case sliderRedOutlet: sliderRedOutlet.value = Float(ciColor.red)
            case sliderGreenOutlet: sliderGreenOutlet.value = Float(ciColor.green)
            default: sliderBlueOutlet.value = Float(ciColor.blue)
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
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            textField?.text = "1.00"
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
// MARK - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            showAlert(title: "Wrong format!", message: "Please enter correct value")
            return
        }
        guard let currentValue = Float(text), (0...1).contains(currentValue) else {
            showAlert(
                title: "Wrong format!",
                message: "Please enter correct value",
                textField: textField
            )
            return
        }
        
        switch textField {
        case redTF:
            sliderRedOutlet.setValue(currentValue, animated: true)
            setValue(fo: redValueText)
        case greenTF:
            sliderGreenOutlet.setValue(currentValue, animated: true)
            setValue(fo: greenValueText)
        default:
            sliderBlueOutlet.setValue(currentValue, animated: true)
            setValue(fo: blueValueText)
        }
        
        colorMix()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
