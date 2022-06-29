
import UIKit

class CollectionViewDemoController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var array = [
        UIImage(named: "archer"),
        UIImage(named: "archer"),
        UIImage(named: "amongUS"),
        UIImage(named: "archer"),
        UIImage(named: "amongUS"),
        UIImage(named: "myImage"),
        UIImage(named: "archer"),
        UIImage(named: "myImage")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension CollectionViewDemoController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemoCollectionViewCell", for: indexPath) as? DemoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: array[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.frame.size.width - 15)/2
        return CGSize(width: side, height: side)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}
