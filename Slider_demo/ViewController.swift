//
//  ViewController.swift
//  Slider_demo
//
//  Created by Steven on 2022/8/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var bottomSlider: UISlider!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var currentValue: UILabel!
    
    @IBOutlet weak var noVibrationSlider: UISlider!
    
    var currentValueString: String = "light"
    var controlBool: Bool = true
    var bottomControlBool: Bool = true
    
        
    @IBAction func swipeAction(_ sender: UISlider) {
        sender.value.round()
       
        if controlBool == true {
            changeVibration(value: currentValueString)
            controlBool = false
        }
        
        switch Int(sender.value) {
        case 0:
            valueLabel.text = "最小"
            textLabel.font = UIFont.systemFont(ofSize: 14.0)
        case 1:
            valueLabel.text = "小"
            textLabel.font = UIFont.systemFont(ofSize: 16.0)
        case 2:
            valueLabel.text = "偏小"
            textLabel.font = UIFont.systemFont(ofSize: 17.0)
            
        case 3:
            valueLabel.text = "標準大小"
            textLabel.font = UIFont.systemFont(ofSize: 18.0)
        case 4:
            valueLabel.text = "偏大"
            textLabel.font = UIFont.systemFont(ofSize: 19.0)
        case 5:
            valueLabel.text = "大"
            textLabel.font = UIFont.systemFont(ofSize: 20.0)
        case 6:
            valueLabel.text = "最大"
            textLabel.font = UIFont.systemFont(ofSize: 22.0)
            
        default:
            valueLabel.text = ""
        }
        
    }
    
    //第二個Slider
    @IBAction func bottomSliderAction(_ sender: UISlider) {
        bottomLabel.text = Int(sender.value).description
       
        if bottomControlBool == true{
            changeVibration(value: currentValueString)
            bottomControlBool = false
        }
    }
    
    @IBAction func noVibrationAction(_ sender: UISlider) {
        bottomLabel.text = Int(sender.value).description
    }
    
    
    @IBAction func toPickerView(_ sender: Any) {
        if let next = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withClass: PickerController.self) {
            
            next.onClickConfirm = { (value: String) in
                self.currentValueString = value
                self.currentValue.text = value
            }
            
            next.modalPresentationStyle = .formSheet
            self.present(next, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.font = UIFont.systemFont(ofSize: 18.0)
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        controlBool = true
        bottomControlBool = true
    }

    func changeVibration(value: String) {
        switch value {
        case "light":
            UIImpactFeedbackGenerator.init(style: .light).impactOccurred()
        case "medium":
            UIImpactFeedbackGenerator.init(style: .medium).impactOccurred()
        case "heavy":
            UIImpactFeedbackGenerator.init(style: .heavy).impactOccurred()
        case "soft":
            UIImpactFeedbackGenerator.init(style: .soft).impactOccurred()
        case "rigid":
            UIImpactFeedbackGenerator.init(style: .rigid).impactOccurred()
            
        default:
            UIImpactFeedbackGenerator.init(style: .light).impactOccurred()
        }
    }
    
}

