//
//  ViewController.swift
//  RGBSelector
//
//  Created by pavel on 16.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    enum ColorComponent {
        case red
        case green
        case blue
    }
    
    @IBOutlet var resultColorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func redValueChanged(_ sender: UISlider) {
        redValueLabel.text = String(format: "%.2f", sender.value)
        changeColorComponent(component: .red, value: sender.value)
    }
    
    @IBAction func greenValueChanged(_ sender: UISlider) {
        greenValueLabel.text = String(format: "%.2f", sender.value)
        changeColorComponent(component: .green, value: sender.value)
    }
    
    @IBAction func blueValueChanged(_ sender: UISlider) {
        blueValueLabel.text = String(format: "%.2f", sender.value)
        changeColorComponent(component: .blue, value: sender.value)
    }
    
    private func changeColorComponent(component: ColorComponent, value: Float) {
        
        var redComponent: CGFloat = 0.0
        var greenComponent: CGFloat = 0.0
        var blueComponent: CGFloat = 0.0
        var alphaComponent: CGFloat = 0.0
        
        resultColorView?.backgroundColor?.getRed(
            &redComponent,
            green: &greenComponent,
            blue: &blueComponent,
            alpha: &alphaComponent
        )
        
        switch component {
        case .red:
            resultColorView?.backgroundColor = UIColor(
                red: CGFloat(value),
                green: greenComponent,
                blue: blueComponent,
                alpha: 1
            )
        case .green:
            resultColorView?.backgroundColor = UIColor(
                red: redComponent,
                green: CGFloat(value),
                blue: blueComponent,
                alpha: 1
            )
        case .blue:
            resultColorView?.backgroundColor = UIColor(
                red: redComponent,
                green: greenComponent,
                blue: CGFloat(value),
                alpha: 1
            )
        }
        
    }
}

