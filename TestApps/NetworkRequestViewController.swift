//
//  NetworkRequestViewController.swift
//  TestApps
//
//  Created by Ishan Weerasooriya on 5/29/17.
//  Copyright © 2017 Elegant Media. All rights reserved.
//

import UIKit

class NetworkRequestViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func request() {
        
        let urlString = "http://jsonplaceholder.typicode.com/users/1"
        guard let requestUrl = URL(string: urlString) else { return }
        let request = URLRequest(url: requestUrl)
        let task = URLSession.shared.dataTask(with: request) {
            
            (data, response, error) in if error == nil,let usableData = data {
                
                print(usableData)
            }
        }
        
        task.resume()
        
    }
    
    func newRequest() {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "http://jsonplaceholder.typicode.com/users/1")!
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                // print(error!.localizedDescription)
                print("Error Test Url \(error!.localizedDescription)..!")
            } else {
               
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    //                    let currentConditions = parsedData["currently"] as! [String:Any]
                    let name = parsedData["name"] as! String
                    print("name:\(name)")
                    
                    let addressObj = parsedData["address"] as! [String: Any]
                    let strret = addressObj["street"] as! String
                    print("Street:\(strret)")
                    
                    
                   // print(parsedData)
                } catch let error as NSError {
                    print(error)
                }
                
            }
        }
        
        task.resume()
        
    }
    
    
    func testRequest() {
    
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "http://jsonplaceholder.typicode.com/users/3")!
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                // print(error!.localizedDescription)
                print("Error Test Url \(error!.localizedDescription)..!")
            } else {
                
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    //print(parsedData)
                    
                    let name = parsedData["name"] as! String
                    print("user Name is \(name)")
                    
                    let address = parsedData["address"] as! [String:Any]
                    let zipcode = address["zipcode"] as! String
                    
                    //let position = parsedData["address"] as! [String:Any]
                    let currentPosition = address["geo"] as! [String:Any]
                    let length = currentPosition["lat"] as! String
                    
                    print("user zip code is \(zipcode)")
                    print(length)
                    
                    let company = parsedData["company"] as! [String:Any]
                    let companyName = company["name"] as! String
                    print(companyName)
                    
//                    let position = parsedData["geo"] as! [String:Any]
//                    let length = position["lat"] as! Double
//                    print(length)
                    
                } catch let error as NSError {
                    print(error)
                }
                
            }
        }
        
        task.resume()
           
    }
    
    
    
    /*
     func weatherRequest() {
     
     let config = URLSessionConfiguration.default
     let session = URLSession(configuration: config)
     let url = URL(string: "http://jsonplaceholder.typicode.com/users/1")!
     let task = session.dataTask(with: url) { (data, response, error) in
     if error != nil {
     print("Error Test Url \(error!.localizedDescription)..!")
     } else {
     
     do{
     
     let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
     let currentData = parsedData["Currently"] as [String: Any]
     print(currentData)
     
     let currentAvailableData =
     
     }
     
     print("Test Url...! \(data!)")
     }
     }
     
     task.resume()
     
     }
     */
    
    
    func sendRequestTest() {
    
        
    
    }
    
    
    
    
    
    @IBAction func pressedRequest(_ sender: Any) {
        //newRequest()
        testRequest()
       // request()
    }
    
    
    
}
