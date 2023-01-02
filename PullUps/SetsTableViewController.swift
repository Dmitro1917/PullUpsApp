//
//  SetsTableViewController.swift
//  PullUps
//
//  Created by Дмитро Селиванов on 19.12.2022.
//

import UIKit

protocol SetsDelegate{
    func setDelegate(_ data: [String])
}

struct Sets{
    var level = ""
    var setsOfLevel: [[Int]] = [[]]
}

class SetsTableViewController: UITableViewController {
    
    var allSets = SetsPlan.sets()
    
    var delegate: SetsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return allSets.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSets[section].setsOfLevel.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allSets[section].level
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SetCell") as! SetTableViewCell
        cell.setLabel1.text = "\(allSets[indexPath.section].setsOfLevel[indexPath.row][0])"
        cell.setLabel2.text = "\(allSets[indexPath.section].setsOfLevel[indexPath.row][1])"
        cell.setLabel3.text = "\(allSets[indexPath.section].setsOfLevel[indexPath.row][2])"
        cell.setLabel4.text = "\(allSets[indexPath.section].setsOfLevel[indexPath.row][3])"
        cell.setLabel5.text = "\(allSets[indexPath.section].setsOfLevel[indexPath.row][4])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var activeSetArray: [String] = []
        for i in 0...4{
            let actSet = "\(allSets[indexPath.section].setsOfLevel[indexPath.row][i])"
            activeSetArray.append(actSet)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "SetCell") as! SetTableViewCell
        cell.cellBackground.backgroundColor = .red
        
        delegate?.setDelegate(activeSetArray)
        UserSets.shared.selectionSet = activeSetArray
        
        print(activeSetArray)
        print(tableView.indexPathsForSelectedRows!)
        performSegue(withIdentifier: "toMain", sender: nil)
    }
}
