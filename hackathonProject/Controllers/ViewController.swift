//
//  ViewController.swift
//  hackathonProject
//
//  Created by Sarah Bloom on 7/16/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startALetter: UIButton!
    @IBOutlet weak var draftALetter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func draftButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "draft", sender: nil)
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toNewLetter", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    
}

