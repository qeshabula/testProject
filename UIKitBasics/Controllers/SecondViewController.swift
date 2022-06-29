
import UIKit
import WebKit


class SecondViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonMap: UIButton!
    
    
    
    let array = [
        "ondasgf",
        "dsf",
        "sdfdf",
        "qwrtt",
        "dsgqef",
        "wow"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let webView = WKWebView(frame: view.frame)
        view.addSubview(webView)
        
        let adress = "https://onliner.by"
        guard let url = URL(string: adress) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let date = sender.date
        print(date)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM/dd/yyyy"
        label.text = formatter.string(from: date)
    }
    
}

    
    extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
