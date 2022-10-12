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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
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
        setToolbarForKeyboard()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        hideKeyboard()
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
    
    private func setToolbarForKeyboard() {
        let toolBar = UIToolbar()
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(hideKeyboard)
        )
        toolBar.items = [doneButton]
        toolBar.sizeToFit()
        redTextField.inputAccessoryView = toolBar
        greenTextField.inputAccessoryView = toolBar
        blueTextField.inputAccessoryView = toolBar
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func showAlert(_ title: String, _ message: String,_ handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: TextField Delegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let inputValue = textField.text, textField.text != nil else { return }
        guard let inputFloat = Float(inputValue) else { return }
        
        if inputFloat > Float(1) {
            showAlert(
                "Incorrect input",
                "Only in range 0...1") { _ in
                    textField.text = ""
                }
        }
        
//        let inputFloatValue = Float(textField.text ?? "0.0") ?? 0.0
        
        switch textField {
        case redTextField:
            redSlider.setValue(inputFloat, animated: true)
            redLabel.text = textField.text
        case greenTextField:
            greenSlider.setValue(inputFloat, animated: true)
            greenLabel.text = textField.text
        default:
            blueSlider.setValue(inputFloat, animated: true)
            blueLabel.text = textField.text
        }
        setCurrentColor()
    }
}

