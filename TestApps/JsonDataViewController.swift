//
//  JsonDataViewController.swift
//  TestApps
//
//  Created by Ishan Weerasooriya on 5/29/17.
//  Copyright © 2017 Elegant Media. All rights reserved.
//

import UIKit

class JsonDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testJsonData(filename fileName: String) -> [String: AnyObject]? {
    
//        if let path = Bundle.main.path(forResource: "data", ofType: "json"){
//            
//            print("This is the file (path)")
//        
//            do{
//            
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
//                let jsonObj = JSON(data: data)
//                if jsonObj != JSON.null {
//                
//                    print("jsonData:\(jsonObj)")
//                    
//                }else {
//                
//                    print("File not found")
//                
//                }
//            } catch let error {
//            print(error.localizedDescription)
//        } else{
//        
//            print("Invalid File")
//        }
//        
        
        
        // test code 2
        
        if let url = Bundle.main.url(forResource: "user", withExtension: "json") {
        
            if let data = NSData(contentsOf: url){
            
                do{
                
                    let object = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
                    if let dictionary = object as? [String: AnyObject] {
                    
                        return dictionary
                    }
                
                } catch {
                
                    print("Error!! Unable to parse \(fileName).json")
                }
            
            }
            print("Error unable to find \(fileName).json")
        
        }
        
        return nil
    
    }
    
    func readJson() {
    
        
//        do {
//        
//            let file = Bundle.main.path(forResource: "data", ofType: "json")
//            let data = try? Data(contentsOf: URL(fileURLWithPath: file!))
//            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
//            print(jsonData)
//
//        
//        } catch {
//        
//            print("Error File")
//        
//        }
        
        
        do {
            
            if let file = Bundle.main.url(forResource: "user", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func jsonPrasedData(_ sender: Any) {
        
      //  testJsonData(filename: "user")
        readJson()
        
    }
    
    
    
    
    
    

    
}
