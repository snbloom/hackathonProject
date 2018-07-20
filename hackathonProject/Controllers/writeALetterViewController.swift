//
//  writeALetterViewController.swift
//  hackathonProject
//
//  Created by Sarah Bloom on 7/20/18.
//

import Foundation
import UIKit

class writeALetterViewController: UIViewController{
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newLetterToLabel: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let date = Date()
//        dateLabel.text = String(date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
    }
    
    @IBOutlet weak var sendButtonPressed: UIButton!
    
    
}
