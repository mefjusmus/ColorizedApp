//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Vladislav Suslov on 12.10.22.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setBackgroundColor(with color: UIColor)
}

class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.startColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension StartViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(with color: UIColor) {
        view.backgroundColor = color
    }
}
