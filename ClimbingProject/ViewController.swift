//
//  ViewController.swift
//  ClimbingProject
//
//  Created by Kyle Yang on 2020/06/17.
//  Copyright © 2020 Kyle Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menteeBtn: UIButton!
    @IBOutlet weak var mentorBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func presentMenteeFirstVC(_ sender: Any) {
        let newVC = self.storyboard?.instantiateViewController(identifier: "MenteeFirstVC")
        newVC?.modalPresentationStyle = .pageSheet
        self.present(newVC!, animated: true, completion: nil)
    }
    @IBAction func presentMentorFirsttVC(_ sender: Any) {
        let newVC = self.storyboard?.instantiateViewController(identifier: "MentorFirstVC")
        newVC?.modalPresentationStyle = .pageSheet
        self.present(newVC!, animated: true, completion: nil)
    }
}

