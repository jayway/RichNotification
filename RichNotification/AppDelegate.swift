//
//  AppDelegate.swift
//  RichNotification
//
//  Created by Robert Hedgate on 2016-11-04.
//  Copyright © 2016 Robert Hedgate. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Add this to get notification when app is in use
        UNUserNotificationCenter.current().delegate = self
        
        // Extension call category setup configureUserNotification()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // Extension setup category
    private func configureUserNotification() {
        // Use category with custom view
        //let category = UNNotificationCategory(identifier: "myNotificationCategory", actions: [], intentIdentifiers: [], options: [])
        
        // Use category with custom view and with actions
        // create actions
        //let favAction = UNNotificationAction(identifier: "fistBump", title: "👊 fistbump", options: [.foreground])
        //let addAction = UNNotificationAction(identifier: "addBump", title: "add 👊", options: [])
        //let dismissAction = UNNotificationAction(identifier: "dismiss", title: "Dismiss", options: [])
        
        // add actions to category
        //let categoryAction = UNNotificationCategory(identifier: "myNotificationActionCategory", actions: [favAction, addAction, dismissAction], intentIdentifiers: [], options: [])
        
        // Add categories to notification center
        //UNUserNotificationCenter.current().setNotificationCategories([category, categoryAction])
        
    }

}

// Extension tell app to be able to get notification when in use and also for extensions
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
    
    // handle response from actions
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        
//        if response.actionIdentifier == "fistBump" {
//            let alert = UIAlertController(title: "Cool", message: "👊👊👊👊", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Close", style: .default, handler: nil)
//            alert.addAction(action)
//            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
//        }
//        print("Response received for \(response.actionIdentifier)")
//        completionHandler()
//    }
}





