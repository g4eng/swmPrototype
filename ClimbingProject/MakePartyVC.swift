//
//  MakePartyVC.swift
//  ClimbingProject
//
//  Created by Kyle Yang on 2020/06/20.
//  Copyright © 2020 Kyle Yang. All rights reserved.
//

import UIKit

class MakePartyVC: UIViewController {
    let myPickerData = [String](arrayLiteral: "강남 클라이밍파크", "비클라이밍", "은평인공암벽장", "도곡 클라이밍장", "클라이밍파크", "클라이밍룸")
    
    @IBOutlet weak var partyTitleTf: UITextField!
    @IBOutlet weak var partyDateTf: UITextField!
    @IBOutlet weak var partyLocationTf: UITextField!
    @IBOutlet weak var partyMaxTf: UITextField!
    @IBOutlet weak var partyDescTv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.partyDateTf.setInputViewDatePicker(target: self, selector: #selector(tapDone))
        let thePicker = UIPickerView()
        thePicker.delegate = self
        partyLocationTf.inputView = thePicker
    }
    
    @objc func tapDone() {
        if let datePicker = self.partyDateTf.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateFormat = "yyyy-MM-dd h:mm a"
            self.partyDateTf.text = dateformatter.string(from: datePicker.date) //2-4
        }
        self.partyDateTf.resignFirstResponder() // 2-5
    }
}

extension UITextField {
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        datePicker.datePickerMode = .dateAndTime //2
        self.inputView = datePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
}


extension MakePartyVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        partyLocationTf.text = myPickerData[row]
    }

}
