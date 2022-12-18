import UIKit

class SetTableViewCell: UITableViewCell {

    @IBOutlet weak var setLabel1: UILabel!
    @IBOutlet weak var setLabel2: UILabel!
    @IBOutlet weak var setLabel3: UILabel!
    @IBOutlet weak var setLabel4: UILabel!
    @IBOutlet weak var setLabel5: UILabel!
    
    @IBOutlet weak var cellBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
