//
//  SendeeInfoViewController.swift
//  hackathonProject
//
//  Created by Sarah Bloom on 7/20/18.
//

import Foundation
import UIKit

class SendeeInfoViewController: UIViewController {
    
    @IBOutlet weak var sendeeNameTextfield: UITextField!
    @IBOutlet weak var sendeeStreetTextfield: UITextField!
    @IBOutlet weak var sendeeCityTextfield: UITextField!
    @IBOutlet weak var sendeeStateTextfield: UITextField!
    @IBOutlet weak var sendeeZipcodeTextfield: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
//        let firstName = firstNameTextfield.text, !firstName.isEmpty,
//        let lastName = lastNameTextfield.text, !lastName.isEmpty,
//        let street = streetTextfield.text, !street.isEmpty,
//        let city = cityTextfield.text, !city.isEmpty,
//        let state = stateTextfield.text, !state.isEmpty,
//        let zipcodeStr = zipcodeTextfield.text, !zipcodeStr.isEmpty,
//        let zipcode = Int(zipcodeStr)
//        else { return }
        
        self.performSegue(withIdentifier: "toNewLetter", sender: nil)
    }
    
}
