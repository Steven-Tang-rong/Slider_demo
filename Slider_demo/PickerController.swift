//
//  PickerController.swift
//  Slider_demo
//
//  Created by Steven on 2022/8/27.
//

import UIKit

class PickerController: UIViewController {
    
    @IBOutlet weak var vibrationPicker: UIPickerView!
    
    var onClickConfirm: ((_ value: String) -> ())?
    var vibrationValue: String = "light"
    let vibrationOption: [String] = ["light", "medium", "heavy", "soft", "rigid"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vibrationPicker.delegate = self
        vibrationPicker.dataSource = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.onClickConfirm?(vibrationValue)
        print(vibrationValue)
    }
}

extension PickerController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vibrationOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vibrationOption[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        vibrationValue = vibrationOption[row]
    }
    
}
