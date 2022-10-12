//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Vladislav Suslov on 25.09.22.
//

import UIKit

class SettingsViewController: UIViewController {

    
    //MARK: IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
//    MARK: Public properties
    var startColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
//    MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 20
        setSliderValues()
        setStartLabelValues()
        setCurrentColor()
    }
    
    //MARK: IBActions
    @IBAction func sliderDidMoved(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
        case greenSlider:
            greenLabel.text = string(from: sender)
        default:
            blueLabel.text = string(from: sender)
        }
        setCurrentColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setBackgroundColor(with: colorView.backgroundColor ?? UIColor.clear)
        dismiss(animated: true)
    }
    

    //MARK: Private Methods
    private func setSliderValues() {
        redSlider.value = Float(CIColor(color: startColor).red)
        greenSlider.value = Float(CIColor(color: startColor).green)
        blueSlider.value = Float(CIColor(color: startColor).blue)
    }
    
    private func setStartLabelValues() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    private func setCurrentColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }


}

