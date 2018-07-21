//
//  LoginViewController.swift
//  hackathonProject
//
//  Created by Sarah Bloom on 7/16/18.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

class LoginViewController: UIViewController {
 
    typealias FIRUser = FirebaseAuth.User
    
    @IBOutlet weak var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // test the api call
        
        let draft = CoreDataHelper.newDraft()
        let recipient = draft.recipient
        recipient?.lastName = "Songolo"
        recipient?.firstName = "Yves"
        
        let address  = CoreDataHelper.newAddress()
        
        address.street = "383 berryman Pl"
        address.city = "Orange"
        address.state = "NJ"
        address.zipCode = "07050"
        
        let name = ("\(draft.recipient?.firstName ?? "No Name") \(draft.recipient?.lastName ?? "No Name")")
        
        
        let userAddress = UserAddress(street: "835 Turk St", city: "San Francisco", state: "CA", zipCode: "94102")
        
        MailingManager.getRecipientMailID(name: name, address: address) { (recipientID) in
            
            MailingManager.getUserMailID(name: "Colleen ", address: userAddress, callback: { (userID) in
                
                // send mail
                print(userID)
                print(recipientID)
                
                
                MailingManager.sendMail(draft: draft, from: userID, to: recipientID, callback: {
                    
                })
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}


extension LoginViewController: FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }

        guard let user = authDataResult?.user
            else { return }

        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: {  (snapshot) in
            if let _ = User(snapshot: snapshot) {
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                self.performSegue(withIdentifier: "toCreateAccount", sender: self)
            }
        })
    }
}
