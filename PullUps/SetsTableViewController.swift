import UIKit

struct Sets{
    var level = ""
    var setsOfLevel: [[Int]] = [[]]
}

class SetsFabric{
    
    static func sets() -> [Sets] {
        
        let levelOne = [
            [2, 7, 5, 5, 7],
            [3, 8, 6, 6, 8],
            [4, 9, 6, 6, 8],
            [5, 9, 7, 7, 9],
            [5, 10, 8, 8, 10],
            [6, 10, 8, 8, 12]
        ]
        
        let levelTho = [
            [4, 9, 6, 6, 9],
            [5, 9, 7, 7, 9],
            [6, 10, 8, 8, 10],
            [6, 11, 8, 8, 11],
            [7, 12, 10, 10, 12],
            [8, 14, 11, 11, 14]
        ]
        
        let levelThree = [
            [2, 3, 2, 2, 3],
            [2, 3, 2, 2, 4],
            [3, 4, 2, 2, 4],
            [3, 4, 3, 3, 4],
            [3, 5, 3, 3, 5],
            [4, 5, 4, 4, 6]
        ]
        
        let levelFour = [
            [3, 5, 3, 3, 5],
            [4, 6, 4, 4, 6],
            [5, 7, 5, 5, 6],
            [5, 8, 5, 5, 8],
            [6, 9, 6, 6, 8],
            [6, 9, 6, 6, 10]
        ]
        
        let levelFive = [
            [6, 8, 6, 6, 8],
            [6, 9, 6, 6, 9],
            [7, 10, 6, 6, 9],
            [7, 10, 7, 7, 10],
            [8, 11, 8, 8, 10],
            [9, 11, 9, 9, 11]
        ]
        
        let levelSix = [
            [8, 11, 8, 8, 10],
            [9, 12, 9, 9, 11],
            [9, 13, 9, 9, 12],
            [10, 14, 10, 10, 13],
            [11, 15, 10, 10, 13],
            [11, 15, 11, 11, 13],
            [12, 16, 11, 11, 15],
            [12, 16, 12, 12, 16],
            [13, 17, 13, 13, 16]
        ]
        
        let levelSeven = [
            [12, 16, 12, 12, 15],
            [13, 16, 12, 12, 16],
            [13, 17, 13, 13, 16],
            [14, 19, 13, 13, 18],
            [14, 19, 14, 14, 19],
            [15, 20, 14, 14, 20],
            [16, 20, 16, 16, 20],
            [16, 21, 16, 16, 20],
            [17, 22, 16, 16, 21]
        ]
        
        let levelEight = [
            [16, 18, 15, 15, 17],
            [16, 20, 16, 16, 19],
            [17, 21, 16, 16, 20],
            [17, 22, 17, 17, 22],
            [18, 23, 18, 18, 22],
            [19, 25, 18, 18, 24],
            [19, 26, 18, 18, 25],
            [19, 27, 19, 19, 26],
            [20, 28, 20, 20, 28]
        ]
        
        let levelNine = [
            [20, 25, 19, 19, 23],
            [22, 25, 21, 21, 25],
            [23, 26, 23, 23, 25],
            [24, 27, 24, 24, 26],
            [25, 28, 24, 24, 27],
            [25, 29, 25, 25, 28],
            [26, 29, 25, 25, 29],
            [26, 30, 26, 26, 30],
            [26, 32, 26, 26, 32]
        ]
        
        let levelTen = [
            [23, 27, 22, 22, 26],
            [24, 28, 24, 24, 28],
            [25, 29, 24, 24, 29],
            [26, 30, 25, 25, 30],
            [26, 31, 25, 25, 31],
            [26, 31, 26, 26, 26],
            [27, 31, 26, 26, 32],
            [28, 32, 26, 26, 32],
            [28, 34, 27, 27, 34]
        ]
        
        let levelEleventh = [
            [25, 28, 24, 24, 27],
            [25, 29, 25, 25, 28],
            [25, 30, 25, 25, 29],
            [26, 31, 25, 25, 31],
            [26, 32, 26, 26, 31],
            [27, 32, 26, 26, 26],
            [27, 34, 26, 26, 33],
            [28, 34, 26, 26, 34],
            [29, 35, 27, 27, 35]
        ]
        
        return [
    Sets(level: "1-й Уровень(Обратные подтягивания)", setsOfLevel: levelOne),
    Sets(level: "2-ой Уровень(Обратные подтягивания)", setsOfLevel: levelTho),
    Sets(level: "3-й Уровень", setsOfLevel: levelThree),
    Sets(level: "4-й Уровень", setsOfLevel: levelFour),
    Sets(level: "5-й Уровень", setsOfLevel: levelFive),
    Sets(level: "6-й Уровень", setsOfLevel: levelSix),
    Sets(level: "7-й Уровень", setsOfLevel: levelSeven),
    Sets(level: "8-й Уровень", setsOfLevel: levelEight),
    Sets(level: "9-й Уровень", setsOfLevel: levelNine),
    Sets(level: "10-й Уровень", setsOfLevel: levelTen),
    Sets(level: "11-й Уровень", setsOfLevel: levelEleventh)
    ]
}
}

class SetsTableViewController: UITableViewController {
    
    var allSets = SetsFabric.sets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return allSets.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allSets[section].setsOfLevel.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allSets[section].level
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SetCell") as! SetTableViewCell
        var setText = ""
        for i in allSets[indexPath.section].setsOfLevel[indexPath.row]{
            setText += String(i) + " "
        }
        cell.setLabel.text = setText
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var activeSetArray: [String] = []
        let activeSet = allSets[indexPath.row]
        for i in 0...4{
            let actSet = "\(allSets[indexPath.section].setsOfLevel[indexPath.row][i])"
            activeSetArray.append(actSet)
        }
        UserSets.shared.selectionSet = activeSetArray
        print(activeSetArray)
        print(tableView.indexPathsForSelectedRows!)
    }
}
