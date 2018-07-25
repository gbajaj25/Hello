//
//  ClaimSearchListVC.swift
//  AutoParts
//
//  Created by MacMini-1 on 7/24/18.
//  Copyright © 2018 Bulls. All rights reserved.
//

import UIKit

class ClaimSearchListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tblClaimSearch: UITableView!
    var ClaimArray  : [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         UtilityClass.addNavigationController(displayViewController: self, hideBack: true, hideMenu: false, hideCart: true, hideSearch: true, hideNotification: false, headingStr: "Claim Search", headerColor: "d74541")

        let dict1 : Dictionary = ["Name" : "Claim Summary", "isExpanded" : "false"]
        let dict2 : Dictionary = ["Name" : "Claim Payment", "isExpanded" : "false"]
        let dict3 : Dictionary = ["Name" : "Claim Recovery", "isExpanded" : "false"]
        
        ClaimArray.append(dict1)
        ClaimArray.append(dict2)
        ClaimArray.append(dict3)
        
        self.tblClaimSearch.reloadData()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ClaimArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ClaimSearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ClaimSearchTableViewCell") as! ClaimSearchTableViewCell
        var  objDict : [String : String]  = ClaimArray[indexPath.row] as! Dictionary
            cell.lblDisplay.text = objDict["Name"]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var  tblHeight : Float = 0
        var expandedDict : [String : String] = ClaimArray[indexPath.row] as! Dictionary
        
        if  Bool(expandedDict["isExpanded"]!)!{
           tblHeight = 150
        }
        else {
            tblHeight = 70
        }
        
        return CGFloat(tblHeight)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var expandedDict : [String : String] = ClaimArray[indexPath.row] as! Dictionary
        let selectedCell  = tableView.cellForRow(at: indexPath) as! ClaimSearchTableViewCell
        
        if Bool(expandedDict["isExpanded"]!)! {
            expandedDict["isExpanded"] = "false"
            UtilityClass.rotatedView(rotatedView: selectedCell.imgDownArrow, angle: 180, animationDuration: 0.40)
        }
        else {
            expandedDict["isExpanded"] = "true"
            UtilityClass.rotatedView(rotatedView: selectedCell.imgDownArrow, angle: 0, animationDuration: 0.40)
            
        }
        
        ClaimArray[indexPath.row]  = expandedDict
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        tableView.endUpdates()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
