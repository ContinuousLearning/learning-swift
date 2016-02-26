//: Playground - noun: a place where people can play

import UIKit

print("Hello, World!")

func openRequest(searchTerm: String!){
    let url = NSURL(string: "https://itunes.apple.com/search?term=\(searchTerm)&media=software")
    let request = NSURLRequest(URL: url!)
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: config)
    
    let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
        
        // notice that I can omit the types of data, response and error
        
        // your code
        print(data);
        
    });
    
    // do whatever you need with the task e.g. run
    task.resume()
}
openRequest("facebook")