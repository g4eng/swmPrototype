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
    var partyOwnerName: String = ""
    var partyLocation: Array<Float> = []
    var partyDate: String = ""
    var partyDesc: String = ""
    var partyPeople: Int = 0
    
    @IBOutlet weak var partyTitleLbl: UILabel!
    @IBOutlet weak var partyOwnerNameLbl: UILabel!
    @IBOutlet weak var partyLocationMapView: MKMapView!
    @IBOutlet weak var partyDataLbl: UILabel!
    @IBOutlet weak var partyDescTxtView: UITextView!
    @IBOutlet weak var partyPeopleLbl: UILabel!
    
    
}
