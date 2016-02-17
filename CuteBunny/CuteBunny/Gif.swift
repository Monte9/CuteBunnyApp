//
//  Gif.swift
//  CuteBunny
//
//  Created by Monte's Pro 13" on 2/17/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class Gif: NSObject {
    
    var id: String?
    var rating: String?
    var slug: String?
    
    
    init(dictionary: NSDictionary) {
        id = dictionary["id"] as? String
        print("Gif id: \(id)")
        rating = dictionary["rating"] as? String
        slug = dictionary["slug"] as? String
    }
    
    //convinience method that takes array of dictionaries and returns array of gif
    class func gifsWithArray(array: [NSDictionary]) -> [Gif] {
        var gifs = [Gif]()
        
        for dictionary in array {
            gifs.append(Gif(dictionary: dictionary))
        }
        
        return gifs
    }
}
