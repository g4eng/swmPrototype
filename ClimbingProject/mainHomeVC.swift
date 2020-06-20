//
//  mainHomeVC.swift
//  ClimbingProject
//
//  Created by Kyle Yang on 2020/06/17.
//  Copyright © 2020 Kyle Yang. All rights reserved.
//

import UIKit
import CoreData

var titles = ["초급 모임", "중급 모임", "고급 모임"]
var hosts = ["홍길동", "김길동", "박길동"]
var targets = ["초급", "중급", "고급"]
var dates = ["2020/06/30 13:00", "2020/06/30 14:00", "2020/07/01 12:30"]
var locations = ["강남 클라이밍파크", "강남 비클라이밍", "도곡 클라이밍"]
var descs = ["abc", "dfadsf", "asdfadsfadsfasdfasdfasd"]
var maxPeople = [10, 10, 10]
var currentPeople = [3, 4, 5]

class MainHomeVC: UITableViewController {
    @IBOutlet var tableViewList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.tableView.rowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
           tableViewList.reloadData()
    }
    
    func initUI() {
        let navTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        navTitle.numberOfLines = 2
        navTitle.textAlignment = .center
        navTitle.font = UIFont.systemFont(ofSize: 14)
        navTitle.text = "모임 목록 \n" + " 총 \(titles.count) 개"
        
        self.navigationItem.titleView = navTitle
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            let cell = sender as! CustomTableCell
            let indexPath = self.tableViewList.indexPath(for: cell)
            let detailView = segue.destination as! MainHomeDetailVC
            detailView.receiveItems(title: titles[((indexPath as NSIndexPath?)?.row)!],
                                    host: hosts[((indexPath as NSIndexPath?)?.row)!],
                                    target: targets[((indexPath as NSIndexPath?)?.row)!],
                                    date: dates[((indexPath as NSIndexPath?)?.row)!],
                                    location: locations[((indexPath as NSIndexPath?)?.row)!],
                                    desc: descs[((indexPath as NSIndexPath?)?.row)!],
                                    maxPeople: maxPeople[((indexPath as NSIndexPath?)?.row)!],
                                    currentPeople: currentPeople[((indexPath as NSIndexPath?)?.row)!])
        }
    }
}

extension MainHomeVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableCell
                
        cell.partyTitleLbl.text = titles[indexPath.row]
        cell.partyTitleLbl.font = UIFont.systemFont(ofSize: 12)
        cell.partyTargetLbl.text = targets[indexPath.row]
        cell.partyTargetLbl.font = UIFont.systemFont(ofSize: 10)
        cell.partyTimeLbl.text = dates[indexPath.row]
        cell.partyTimeLbl.font = UIFont.systemFont(ofSize: 12)
        cell.partyLocationLbl.text = locations[indexPath.row]
        cell.partyLocationLbl.font = UIFont.systemFont(ofSize: 10)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }

}
