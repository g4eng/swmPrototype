//
//  menteeSubmitVC.swift
//  ClimbingProject
//
//  Created by Kyle Yang on 2020/06/17.
//  Copyright © 2020 Kyle Yang. All rights reserved.
//

import UIKit

var menteeName = [String]()
var menteeExCount = [Int]()

class MenteeFirstVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var menteeNameLbl: UILabel!
    @IBOutlet weak var menteeNameTf: UITextField!
    
    @IBOutlet weak var menteeCntLbl: UILabel!
    @IBOutlet weak var menteeCntTf: UITextField!
    
    @IBAction func menteeInfoSubmit(_ sender: Any) {
        menteeName.append(menteeNameTf.text!)
        menteeExCount.append(Int(menteeCntTf.text!)!)
        
        let newVC = self.storyboard?.instantiateViewController(identifier: "MainPageVC")
               newVC?.modalPresentationStyle = .fullScreen
               self.present(newVC!, animated: true, completion: nil)
    }
}
