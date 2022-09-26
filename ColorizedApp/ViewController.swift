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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = .black
        redSlider.tag = 1
        greenSlider.tag = 2
        setStartLabelValues()
    }
    
    //MARK: IBActions
    @IBAction func sliderDidMoved(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            redLabel.text = String(format: "%.2f", redSlider.value)
        case 2:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
        default:
            blueLabel.text = String(format: "%.2f", blueSlider.value)
        }
        
        setupCurrentColor()
    }

    //MARK: Private Methods
    private func setStartLabelValues() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setupCurrentColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }


}

