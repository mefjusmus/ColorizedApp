//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Vladislav Suslov on 25.09.22.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
//    MARK: Private Properties
    private let colorComponents = ColorComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = getCurrentColor()
        redSlider.tag = 1
        greenSlider.tag = 2
        setStartLabelValues()
    }
    
    //MARK: IBActions
    @IBAction func sliderDidMoved(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            colorComponents.red = CGFloat(redSlider.value)
            redLabel.text = String(format: "%.1f", redSlider.value)
        case 2:
            colorComponents.green = CGFloat(greenSlider.value)
            greenLabel.text = String(format: "%.1f", greenSlider.value)
        default:
            colorComponents.blue = CGFloat(blueSlider.value)
            blueLabel.text = String(format: "%.1f", blueSlider.value)
        }
        colorView.backgroundColor = getCurrentColor()
    }

    //MARK: Private Methods
    private func setStartLabelValues() {
        redLabel.text = String(format: "%.1f", redSlider.value)
        greenLabel.text = String(format: "%.1f", greenSlider.value)
        blueLabel.text = String(format: "%.1f", blueSlider.value)
    }
    
    private func getCurrentColor() -> UIColor {
        let currentColor = UIColor(red: colorComponents.red,
                               green: colorComponents.green,
                               blue: colorComponents.blue,
                               alpha: 1)
        return currentColor
    }


}

