//
//  MailingManager.swift
//  hackathonProject
//
//  Created by Zhanxi Ni on 7/19/18.
//

import Foundation
//import UIKit
import SwiftSoup

struct MailingManager {
    
    static func sendMail(draft: Draft,from userID: String,to recipient: String, callback: @escaping() -> ()) {
        let link = "https://api.lob.com/v1/letters"
        let url = URL(string: link)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
       let file = htmlMailBody(draft: draft, senderName: "Colleen")
        
        
        let body = ["from": userID, "to": recipient, "color": "false", "file": file]
                
        //turns body info into JSON data
        let bodyData = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        
        //add the body into the request
        request.httpBody = bodyData
        
        //add authorization into header
        request.setValue("Basic dGVzdF82M2ZmMDgwNWNjZTFjZDI5OTg5N2ZmMzZkYzJiYjU0NjJkNjo=", forHTTPHeaderField: "Authorization")
        
        //create a url session
        let session = URLSession.shared
        
        //create a task within the url session
        let task = session.dataTask(with: request) {(data, response, error) in
        guard let data = data else {
            return
        }
        let dataID = try! JSONDecoder().decode(DataID.self, from: data)
        callback()
        }
    
    task.resume()

        
    }
    
    static func getRecipientMailID(name: String, address: Address, callback:@escaping  (String) -> Void) {

        // get link
        let link = "https://api.lob.com/v1/addresses"
        // turn link to url
        let url = URL(string: link)!
       
        // create a url request
        var request = URLRequest(url: url)
        
        //define body using by filling in models
        let body = ["name":name, "address_line1":address.street, "address_city":address.city, "address_state":address.state, "address_zip": address.zipCode]
        
        //turns body info into JSON data
        let bodyData = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        
        //add the body into the request
        request.httpBody = bodyData
        
        // add authorization into header
        request.setValue("Basic dGVzdF82M2ZmMDgwNWNjZTFjZDI5OTg5N2ZmMzZkYzJiYjU0NjJkNjo=", forHTTPHeaderField: "Authorization")
        
        //create a url session
        let session = URLSession.shared
        
        //create a task within the url session
        let task = session.dataTask(with: request) { (data, response, error) in
           
            guard let data = data else {
                return
            }
            let dataID = try! JSONDecoder().decode(DataID.self, from: data)
            callback((dataID.data.first?.id)!)
        }
        task.resume()
    }


static func getUserMailID(name: String, address: UserAddress, callback:@escaping  (String) -> Void) {
    
    // get link
    let link = "https://api.lob.com/v1/addresses"
    
    // turn link to url
    let url = URL(string: link)!
    
    // create a url request
    var request = URLRequest(url: url)
    
    //define body using by filling in models
    let body = ["name":name, "address_line1":address.street, "address_city":address.city, "address_state":address.state, "address_zip": address.zipCode]
    
    //turns body info into JSON data
    let bodyData = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    
    //add the body into the request
    request.httpBody = bodyData
    
    // add authorization into header
    request.setValue("Basic dGVzdF82M2ZmMDgwNWNjZTFjZDI5OTg5N2ZmMzZkYzJiYjU0NjJkNjo=", forHTTPHeaderField: "Authorization")
    
    //create a url session
    let session = URLSession.shared
    
    //create a task within the url session
    let task = session.dataTask(with: request) { (data, response, error) in
        
        guard let data = data else {
            return
        }
        let dataID = try! JSONDecoder().decode(DataID.self, from: data)
        callback((dataID.data.first?.id)!)
    }
    task.resume()
}
    static func htmlMailBody(draft: Draft, senderName: String) -> String{

//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let templateViewController = storyboard.instantiateViewController(withIdentifier: "htmlFormat") as! HTMLTemplateViewController
        
        let recipientFullName = "Heather Nolte"// draft.recipient!.firstName! + draft.recipient!.lastName!
        let content = "I like panda express and i want to go eat :) \nMy Scoot will charge me soon."
        let closing = "Hungry,"
        let letter = HTMLTemplate (body: content, salutations: "Dear \(recipientFullName)", closing: closing, senderName: senderName )
        
        return letter.getHTML()
//        let template = templateViewController.htmlTemplateTextView.text
//        let salutation = template?.replacingOccurrences(of: "salutation", with: "salutation")
//        let body = salutation?.replacingOccurrences(of: "letterContent", with: draft.content!)
//        let closing = body?.replacingOccurrences(of: "closing", with: "closing")
//        let finalTemplate = closing?.replacingOccurrences(of: "senderName", with: senderName)
//
//        return finalTemplate!
    }
}

struct DataID: Decodable{
    let data: [IdModel]
}
struct IdModel: Decodable{
    let id: String
}




