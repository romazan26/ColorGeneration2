//
//  WelcomViewController.swift
//  ColorGeneration
//
//  Created by Роман on 21.05.2023.
//

import UIKit

protocol SettingViewControllerDelegate: AnyObject {
    func setNewColor(_ newColor: UIColor)
}

class WelcomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else {return}
        settingVC.colorWelcom = view.backgroundColor
        settingVC.delegate = self
    }

}
// MARK: - SettingViewControllerDelegate
extension WelcomViewController: SettingViewControllerDelegate {
    func setNewColor(_ newColor: UIColor) {
        view.backgroundColor = newColor
    }
    
    
}
