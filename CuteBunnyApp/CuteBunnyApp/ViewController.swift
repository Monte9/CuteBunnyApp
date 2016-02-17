//
//  ViewController.swift
//  CuteBunnyApp
//
//  Created by Monte's Pro 13" on 2/17/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var gifs: [Gif]?
    
    let clientInstance = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //make API call to get data
        clientInstance.makeSearchCallWithCompletion { (gifs, error) -> () in
            if (error == nil) {
                self.gifs = gifs
                print("yay! JSON received successfully")
                self.tableView.reloadData()
            } else {
                print("Error encountered: \(error)")
            }
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GifCell
        
        if ((gifs) != nil) {
            cell.gifID.text = gifs![indexPath.row].id
            cell.gifRating.text = gifs![indexPath.row].rating
            cell.gifSlug.text = gifs![indexPath.row].slug
//            cell.gifImageView
        }
        
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

