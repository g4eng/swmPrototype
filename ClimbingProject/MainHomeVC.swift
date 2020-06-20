//
//  mainHomeVC.swift
//  ClimbingProject
//
//  Created by Kyle Yang on 2020/06/17.
//  Copyright © 2020 Kyle Yang. All rights reserved.
//

import UIKit

class MainHomeVC: UITableViewController {
    var titles = ["초급 모임", "중급 모임", "고급 모임"]
    var targets = ["초급", "중급", "고급"]
    var times = ["2020/06/30 13:00", "2020/06/30 14:00", "2020/07/01 12:30"]
    var locations = ["강남 클라이밍파크", "강남 비클라이밍", "도곡 클라이밍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 65
    }
}

extension MainHomeVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableCell
                
        cell.partyTitleLbl.text = self.titles[indexPath.row]
        cell.partyTitleLbl.font = UIFont.systemFont(ofSize: 12)
        cell.partyTargetLbl.text = self.targets[indexPath.row]
        cell.partyTargetLbl.font = UIFont.systemFont(ofSize: 10)
        cell.partyTimeLbl.text = self.times[indexPath.row]
        cell.partyTimeLbl.font = UIFont.systemFont(ofSize: 12)
        cell.partyLocationLbl.text = self.locations[indexPath.row]
        cell.partyLocationLbl.font = UIFont.systemFont(ofSize: 10)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let infoVC = self.storyboard?.instantiateViewController(withIdentifier: "partyInfo")
        
        if let _infoVC = infoVC as? ViewController {
            self.navigationController?.pushViewController(_infoVC, animated: true)
        }
    }

}
