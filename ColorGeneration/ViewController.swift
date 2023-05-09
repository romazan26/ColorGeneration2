//
//  ViewController.swift
//  ColorGeneration
//
//  Created by Роман on 01.05.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var blueValueText: UITextField!
    @IBOutlet var greenValueText: UITextField!
    @IBOutlet var redValueText: UITextField!
    
    @IBOutlet var sliderRedOutlet: UISlider!
    @IBOutlet var sliderGreenOutlet: UISlider!
    @IBOutlet var sliderBlueOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
    }

    @IBAction func sliderRedAction() {
        redValueText.text = sliderRedOutlet.value.formatted()
        colorMix()
    }
    @IBAction func sliderGreenAction() {
        greenValueText.text = sliderGreenOutlet.value.formatted()
        colorMix()
    }
    @IBAction func sliderBlueAction() {
        blueValueText.text = sliderBlueOutlet.value.formatted()
        colorMix()
    }
    
    private func setupSlider(){
        sliderRedOutlet.minimumValue = 0
        sliderRedOutlet.maximumValue = 1
        sliderRedOutlet.minimumTrackTintColor = .red
        
        sliderGreenOutlet.minimumValue = 0
        sliderGreenOutlet.maximumValue = 1
        sliderGreenOutlet.minimumTrackTintColor = .green
        
        sliderBlueOutlet.minimumValue = 0
        sliderBlueOutlet.maximumValue = 1
        sliderBlueOutlet.minimumTrackTintColor = .blue
    }
    
    private func colorMix(){
        colorView.backgroundColor = UIColor(
            red: CGFloat(sliderRedOutlet.value),
            green: CGFloat(sliderGreenOutlet.value),
            blue: CGFloat(sliderBlueOutlet.value),
            alpha: 1)
    }
    
}

