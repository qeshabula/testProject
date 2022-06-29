

import UIKit
import MessageUI
import CoreLocation
import AVFoundation
import AVKit
import Contacts

enum Direction: String {
    case left = "left"
    case right = "right"
}

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var button: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet weak var topLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var textField: UITextField!
     
    
    let locationManager = CLLocationManager()
     
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        label.text = "Localizable label".localized()
        
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
       // player?.stop()
        playSecondVideo()
    }
    
    @IBAction func loadButtonPressed(_ sender: UIButton) {
      //  playSound()
       // playFirstVideo()
        
        let status = CNContactStore.authorizationStatus(for: .contacts)
        if status == .denied || status == .restricted {
            // presentSettingsActionSheet()
            return
        }
        
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, error in
            guard granted else {
                DispatchQueue.main.async {
                    //  self.presentSettingsActionSheet()
                }
                return
            }
            
            // get the contacts
            var contacts = [CNContact]()
            let request = CNContactFetchRequest(keysToFetch: [
                CNContactIdentifierKey as NSString,
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                CNContactPhoneNumbersKey,
                CNContactPostalAddressesKey,
                CNContactEmailAddressesKey
            ] as! [CNKeyDescriptor])
            do {
                try store.enumerateContacts(with: request) { contactsArray, stop in
                    contacts.append(contactsArray)
                }
            } catch {
                print(error)
            }
            
            for contact in contacts {
                print("\(contact.familyName) \(contact.givenName) \(contact.phoneNumbers.first!.value.stringValue), \(contact.postalAddresses.first!.value.street)")
            }
        }

    }
    
    func playFirstVideo() {
        let videoURL = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    
    func playSecondVideo() {
        guard let videoURL = Bundle.main.url(forResource: "Clack", withExtension: "mp4") else { return }
        //  let videoURL = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    
    func playSound() {
            guard let url = Bundle.main.url(forResource: "Skrip", withExtension: "mpeg") else { return }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                
                player = try AVAudioPlayer(contentsOf: url)
                if let player = player {
                    player.play()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(location.latitude) \(location.longitude)")
    }
    
    @IBAction func showSecondVCButtonPressed(_ sender: UIButton) {
        guard let controller = UIStoryboard(name: "Second", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as?
                ThirdViewController else {
                    return
                }
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func demoButtonPressed(_ sender: UIButton) {

    }
    
    @IBAction func showAlert() {
        let customView = CustomView.instanceFromNib()
        customView.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 150)
        customView.configure(text: "That's right")
        view.addSubview(customView)
        
    }
    override func handlePickedImage(_ image: UIImage) {
        imageView.image = image
    }
}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        controller.dismiss(animated: true, completion: nil)
    }
}


extension ViewController: ThirdViewControllerDelegate {
    func vcWasClosed() {
        showAlert()
    }
}

extension UIViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var chosenImage = UIImage()
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            chosenImage = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            chosenImage = image
        }
        handlePickedImage(chosenImage)
        picker.dismiss(animated: true, completion: nil)
    }
    @objc func handlePickedImage(_ image: UIImage) {
        
    }
    
}
    

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func hideKeyboard() {
//        textField.resignFirstResponder()
        view.endEditing(true)
    }
}

// Another class
extension Notification.Name {
    static let internetDown = Notification.Name("internetDown" )
}
   
    
   







































