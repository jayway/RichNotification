//
//  ViewController.swift
//  RichNotification
//
//  Created by Robert Hedgate on 2016-11-04.
//  Copyright © 2016 Robert Hedgate. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Request permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted, error) in
            if granted {
                print("Notification access granted")
            } else {
                print(error?.localizedDescription ?? "error")
            }
        })
    }
    @IBAction func nofityButtonTapped(_ sender: UIButton) {
        scheduleNotification(inSeconds: 5, completion: { success in
            if success {
                print("successfully scheduled notification")
            } else {
                print("error scheduled notification")
            }
        })
    }
    
    @IBAction func notifyAttachmentButtonTapped(_ sender: UIButton) {
        scheduleAttachmentNotification(inSeconds: 5, completion: { success in
            if success {
                print("successfully scheduled notification")
            } else {
                print("error scheduled notification")
            }
        })
        
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (Bool) -> ()) {
        
        let notif = UNMutableNotificationContent()
        
        notif.title = "New Notification"
        notif.subtitle = "These are great!"
        notif.body = "The new iOS 10 notification are great"
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print(error?.localizedDescription ?? "error")
                completion(false)
            } else {
                completion(true)
            }
        })
    }

    func scheduleAttachmentNotification(inSeconds: TimeInterval, completion: @escaping (Bool) -> ()) {
        
        // Add attachment
        let myImage = "andreas_lund"
        guard let imageUrl = Bundle.main.url(forResource: myImage, withExtension: "jpg") else {
            completion(false)
            return
        }
        var attachment: UNNotificationAttachment
        
        attachment = try! UNNotificationAttachment(identifier: "myNotification", url: imageUrl, options: .none)
        
        let notif = UNMutableNotificationContent()
        
        notif.title = "New Notification"
        notif.subtitle = "These are great!"
        notif.body = "The new iOS 10 notification are great"
        
        notif.attachments = [attachment]
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print(error?.localizedDescription ?? "error")
                completion(false)
            } else {
                completion(true)
            }
        })
    }
    
}

