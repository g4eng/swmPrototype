//
//  menteeSubmitVC.swift
//  ClimbingProject
//
//  Created by Kyle Yang on 2020/06/17.
//  Copyright © 2020 Kyle Yang. All rights reserved.
//

import UIKit
class menteeFirstVC: UIViewController {
    var menteeName: String = ""
    var menteeCnt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var menteeNameLbl: UILabel!
    @IBOutlet weak var menteeNameTf: UITextField!
    
    @IBOutlet weak var menteeCntLbl: UILabel!
    @IBOutlet weak var menteeCntTf: UITextField!
    
    @IBAction func menteeInfoSubmit(_ sender: Any) {
        self.menteeName = menteeNameTf.text!
        self.menteeCnt = Int(menteeCntTf.text!)!
        
        print(self.menteeName)
        print(self.menteeCnt)
        
        let newVC = self.storyboard?.instantiateViewController(identifier: "MainPageVC")
               newVC?.modalPresentationStyle = .fullScreen
               self.present(newVC!, animated: true, completion: nil)
    }
}
