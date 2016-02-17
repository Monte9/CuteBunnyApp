//
//  HomeViewController.swift
//  CuteBunny
//
//  Created by Monte's Pro 13" on 2/17/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

extension HomeCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    //        let size = CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    //
    //        return size
    //    }
    //
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifs?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GifCollectionViewCell", forIndexPath: indexPath) as! GifCollectionViewCell
        print("Collection View cell set")
        
        return cell
    }
}

class HomeCollectionViewController: UIViewController {
    
    var gifs: [Gif]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let clientInstance = APIClient()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        clientInstance.makeSearchCallWithCompletion { (gifs, error) -> () in
            if (error == nil) {
                self.gifs = gifs
                print("yay! JSON received successfully")
            } else {
                print("Error encountered: \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
