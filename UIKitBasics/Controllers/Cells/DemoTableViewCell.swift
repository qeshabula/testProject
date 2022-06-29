
import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        nameLabel.textColor = .black
        contentView.backgroundColor = .white
        
    }
    
    func configure(with object: (Int, String)) {
        nameLabel.text = "\(object.0)"
        
        switch object.1 {
        case "video":
            contentView.backgroundColor = .green
        case "audio":
            nameLabel.text?.insert(contentsOf:  "audio", at: nameLabel.text!.startIndex)
        case "text":
            nameLabel.textColor = .red
        default:
            break
            
        }
    }
}
