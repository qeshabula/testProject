

import UIKit

class CustomView: UIView {

    @IBOutlet weak var label: UILabel!
    
    static func instanceFromNib() -> CustomView {
        return UINib(nibName: "CustomView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomView
    }
    
    func configure(text: String) {
        label.text = text
    }
   
}
