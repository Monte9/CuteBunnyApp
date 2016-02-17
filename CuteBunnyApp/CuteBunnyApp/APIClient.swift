//
//  APIClient.swift
//  CuteBunny
//
//  Created by Monte's Pro 13" on 2/17/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class APIClient {
    
    var searchTerm = "cute+bunny"
    let publicBetaApiKey = "dc6zaTOxFJmzC"
    var loginCompletion: ((gif: Gif?, error: NSError?) -> ())?
    var gifs: [Gif]?
    
//    class var sharedInstance: APIClient {
//        return Static.instance
//    }
    
    func makeSearchCallWithCompletion(completion: (gifs: [Gif]?, error: NSError?) -> ()) {
        let url = NSURL(string:"http://api.giphy.com/v1/gifs/search?q=\(searchTerm)&api_key=\(publicBetaApiKey)")
        
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            //print(responseDictionary)
                            if (responseDictionary["data"] != nil ) {
                                
                                self.gifs = Gif.gifsWithArray(responseDictionary["data"] as! [NSDictionary])
                                
                                print("Connection to API successful!")
                                completion(gifs: self.gifs, error: nil)
                            }
                            else {
                                print("error")
                                completion(gifs: nil, error: error)
                            }
                    } else { completion(gifs: nil, error: error) }
                } else { completion(gifs: nil, error: error) }
        });
        task.resume()
    }

}
