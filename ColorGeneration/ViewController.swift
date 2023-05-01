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
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderRedAction() {
        redValueText.text = sliderRedOutlet.value.formatted()
    }

}

