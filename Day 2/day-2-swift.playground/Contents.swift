//: Playground - noun: a place where people can play

import UIKit

print("Hello, World!")

func openRequest(searchTerm: String!){
    let url = NSURL(string: "https://itunes.apple.com/search?term=\(searchTerm)&media=software")
    let request = NSURLRequest(URL: url!)
    let session = NSURLSession.sharedSession()
    
    let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
        
        do{
            let jsonBlob = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
            print(jsonBlob);
        }catch _ {
            
        }
        // your code
        
        
    });
    
    // do whatever you need with the task e.g. run
    task.resume()
}
openRequest("facebook")