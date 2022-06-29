
import UIKit

protocol ThirdViewControllerDelegate: AnyObject {
    func vcWasClosed()
}

class ThirdViewController: UIViewController {
    
    weak var delegate: ThirdViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        delegate?.vcWasClosed()
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
    

