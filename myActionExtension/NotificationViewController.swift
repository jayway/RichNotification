//
//  NotificationViewController.swift
//  myActionExtension
//
//  Created by Robert Hedgate on 2016-11-18.
//  Copyright © 2016 Robert Hedgate. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        //self.label?.text = notification.request.content.body
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        
        if response.actionIdentifier == "fistBump" {
            completion(.dismissAndForwardAction)
        } else if response.actionIdentifier == "addBump" {
            label?.text = (label?.text!)! + "👊"
            completion(.doNotDismiss)
        } else if response.actionIdentifier == "dismiss" {
            completion(.dismiss)
        }
        
    }
}
