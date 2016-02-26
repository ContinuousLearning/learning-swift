//
//  ViewController.swift
//  day-2-swift
//
//  Created by Yeung Yiu Hung on 26/2/2016.
//  Copyright © 2016 Yeung Yiu Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://itunes.apple.com/search?term=facebook&media=software")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(str);
        }
        
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

