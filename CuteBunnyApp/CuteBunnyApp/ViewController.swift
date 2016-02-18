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
            //            cell.gifID.text = gifs![indexPath.row].id
            //            cell.gifRating.text = gifs![indexPath.row].rating
            //            cell.gifSlug.text = gifs![indexPath.row].slug
            
            // var gifData = NSData(contentsOfURL: NSURL(string: gifs![indexPath.row].stillImageUrl!)!)
            // print("Still image set")
            
            cell.gifImageView.setImageWithURL(NSURL(string: gifs![indexPath.row].stillImageUrl!)!)
            cell.gifImageView.stopAnimatingGIF()
           // self.tableView.reloadData()
            
            // cell.gifImageView.prepareForAnimation(imageData: gifData!)
            // cell.gifImageView.stopAnimatingGIF()
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("cell click detected index path \(indexPath.row)")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GifCell
        
        //  if gifs![indexPath.row].isPlaying != true {
        
        var gifData = NSData(contentsOfURL: NSURL(string: gifs![indexPath.row].playingImageUrl!)!)
        
        cell.gifImageView.prepareForAnimation(imageData: gifData!)
        cell.gifImageView.startAnimatingGIF()
      //  self.tableView.reloadData()
        
        //  }
        //        else {
        //            cell.gifImageView.stopAnimatingGIF()
        //            gifs![indexPath.row].isPlaying = false
        //            print("Is playing set to false")
        //        }
        //
        //cell.gifImageView.stopAnimatingGIF()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

