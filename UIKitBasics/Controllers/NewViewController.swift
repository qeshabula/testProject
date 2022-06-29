//
//  NewViewController.swift
//  UIKitBasics
//
//  Created by Bula on 6/14/22.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet var topLabelConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.topLabelConstraint.constant += 100
        self.view.layoutIfNeeded()
    }
    
}
