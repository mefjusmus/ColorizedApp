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
    
    private let colorComponents = ColorComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = .black
        setStartLabelValues()
    }
    
    //MARK: IBActions
    @IBAction func redSliderDidMoved(_ sender: UISlider) {
        colorComponents.red = CGFloat(sender.value)
        redLabel.text = String(format: "%.1f", sender.value)
        setColor()
    }
    
    @IBAction func greenSliderDidMoved(_ sender: UISlider) {
        colorComponents.green = CGFloat(sender.value)
        greenLabel.text = String(format: "%.1f", sender.value)
        setColor()
    }
    
    @IBAction func blueSliderDidMoved(_ sender: UISlider) {
        colorComponents.blue = CGFloat(sender.value)
        blueLabel.text = String(format: "%.1f", sender.value)
        setColor()
    }
    
    //MARK: Private Methods
    
    private func setStartLabelValues() {
        redLabel.text = String(format: "%.1f", redSlider.value)
        greenLabel.text = String(format: "%.1f", greenSlider.value)
        blueLabel.text = String(format: "%.1f", blueSlider.value)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: colorComponents.red,
                                            green: colorComponents.green,
                                            blue: colorComponents.blue,
                                            alpha: 1)
    }


}

