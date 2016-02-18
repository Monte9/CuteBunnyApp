//
//  ViewController.swift
//  CuteBunnyApp
//
//  Created by Monte's Pro 13" on 2/17/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import AFNetworking
import Gifu

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var gifs: [Gif]?
    
    var isTrending: Bool?
    
    let clientInstance = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        if (isTrending == true) {
            //make API call to get data for search query: cute bunnies
            clientInstance.makeSearchCallWithCompletion { (gifs, error) -> () in
                if (error == nil) {
                    self.gifs = gifs
                    print("yay! JSON received successfully")
                    self.tableView.reloadData()
                } else {
                    print("Error encountered: \(error)")
                }
            }
        } else {
            //make API call to get data for trending tab
            clientInstance.getTrendingWithCompletion { (gifs, error) -> () in
                if (error == nil) {
                    self.gifs = gifs
                    print("yay! JSON received successfully")
                    self.tableView.reloadData()
                } else {
                    print("Error encountered: \(error)")
                }
            }
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifs?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GifCell
        
        if ((gifs) != nil) {
            cell.gifID.text = gifs![indexPath.row].id
            cell.gifRating.text = gifs![indexPath.row].rating
            cell.gifSlug.text = gifs![indexPath.row].slug
            
        //  cell.gifImageView.setImageWithURL(NSURL(string: gifs![indexPath.row].stillImageUrl!)!)
            
            var gifData = NSData(contentsOfURL: NSURL(string: gifs![indexPath.row].stillImageUrl!)!)
            cell.gifImageView.animateWithImageData(gifData!)
//            
//            cell.gifImageView.prepareForAnimation(imageData: gifData!)
//            cell.gifImageView.startAnimatingGIF()
            
             //  cell.gifImageView.animateWithImage(named: "sample")
            //   print("gif set successfully")
        }
        
        return cell
        
    }
    //
    //    @IBAction func toggleGif(sender: AnyObject) {
    //        if imageView.isAnimatingGIF {
    //            imageView.stopAnimatingGIF()
    //        } else {
    //            imageView.startAnimatingGIF()
    //        }
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

