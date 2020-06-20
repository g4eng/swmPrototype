//
//  mainHomeDetailVC.swift
//  ClimbingProject
//
//  Created by Kyle Yang on 2020/06/20.
//  Copyright © 2020 Kyle Yang. All rights reserved.
//

import UIKit
import MapKit

class MainHomeDetailVC: UIViewController {
    
    var partyTitle: String = ""
    var partyHost: String = ""
    var partyTarget: String = ""
    var partyLocation: String = ""
    var partyDate: String = ""
    var partyDesc: String = ""
    var partyMaxPeople: Int = 0
    var partyCurrentPeople: Int = 0
    
    @IBOutlet weak var partyTitleLbl: UILabel!
    @IBOutlet weak var partyOwnerNameLbl: UILabel!
    @IBOutlet weak var partyTartgetLbl: UILabel!
    @IBOutlet weak var partyLocationMapView: MKMapView!
    @IBOutlet weak var partyDataLbl: UILabel!
    @IBOutlet weak var partyDescTxtView: UITextView!
    @IBOutlet weak var partyPeopleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        partyTitleLbl.text = self.partyTitle
        partyOwnerNameLbl.text = self.partyHost
        partyTartgetLbl.text = self.partyTarget
        partyDataLbl.text = partyDate
        partyDescTxtView.text = partyDesc
        partyPeopleLbl.text = "\(partyCurrentPeople) / \(partyMaxPeople)"
        
    }
    
    func receiveItems(title: String, host: String, target: String, date: String, location: String, desc: String, maxPeople: Int, currentPeople: Int) {
        partyTitle = title
        partyHost = host
        partyTarget = target
        partyLocation = location
        partyDate = date
        partyDesc = desc
        partyMaxPeople = maxPeople
        partyCurrentPeople = currentPeople
    }
    
}
