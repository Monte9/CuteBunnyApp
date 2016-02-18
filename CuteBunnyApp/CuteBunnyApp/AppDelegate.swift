//
//  AppDelegate.swift
//  CuteBunnyApp
//
//  Created by Monte's Pro 13" on 2/17/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var storyboard = UIStoryboard(name: "Main", bundle: nil)
    let tabBarController = UITabBarController()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        setupTabBars()
        
        return true
    }
    
    func setupTabBars() {
        
        // Set up the Home (cute bunny) View Controller
        let homeNavigationController = storyboard.instantiateViewControllerWithIdentifier("HomeNavigationController") as! UINavigationController
        let homeViewController = homeNavigationController.topViewController as! ViewController
        homeViewController.isTrending = false
        
        //Customize Home navigation bar UI
        homeNavigationController.navigationBar.barTintColor = UIColor.blackColor()
        homeNavigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(rgba: "#55acee")]
        homeNavigationController.tabBarItem.image = UIImage(named: "rabbit")
        homeNavigationController.navigationBar.topItem?.title = "CuteBunny Gifs"
        
        
        // Set up the Trending View Controller
        let trendingNavigationController = storyboard.instantiateViewControllerWithIdentifier("HomeNavigationController") as! UINavigationController
        let trendingViewController = homeNavigationController.topViewController as! ViewController
        trendingViewController.isTrending = true
        
        
        //Customize Trending navigation bar UI
        trendingNavigationController.navigationBar.barTintColor = UIColor.blackColor()
        trendingNavigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(rgba: "#55acee")]
        trendingNavigationController.tabBarItem.image = UIImage(named: "trending")
        trendingNavigationController.navigationBar.topItem?.title = "Trending Gifs"
        
        
        // Set up the Tab Bar Controller to have two tabs
        tabBarController.viewControllers = [homeNavigationController, trendingNavigationController]
        UITabBar.appearance().tintColor =
            UIColor(rgba: "#55acee")
        UITabBar.appearance().barTintColor = UIColor.blackColor()
        
        // Make the Tab Bar Controller the root view controller
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

