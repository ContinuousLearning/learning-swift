//: Playground - noun: a place where people can play

import UIKit

print("Hello, World!")

func openRequest(searchTerm: String!){
    let url = NSURL(string: "https://itunes.apple.com/search?term=\(searchTerm)&media=software")
    let request = NSURLRequest(URL: url!)
    
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
        print("YES");
    }
}

openRequest("facebook")