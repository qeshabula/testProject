

import UIKit

class DemoCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}
