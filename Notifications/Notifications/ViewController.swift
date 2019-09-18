//
//  ViewController.swift
//  Notifications
//
//  Created by Gabriel on 18/09/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var fancyNotificationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func getRegularNotification(_ sender: Any) {
        let regularNotificationContent = UNMutableNotificationContent()
        regularNotificationContent.title = "This is a regular title"
        regularNotificationContent.subtitle = "This is the subtitle"
        regularNotificationContent.body = "This is the body of a regular notification uhul!"
        regularNotificationContent.badge = 1
        
        let regularNotificationTimer = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        let regularNotificationId = "regularNotification"
        let regularNotificationRequest = UNNotificationRequest(identifier: regularNotificationId, content: regularNotificationContent, trigger: regularNotificationTimer)
        
        UNUserNotificationCenter.current().add(regularNotificationRequest) { (error) in
            print(error)
        }
    }
    
    @IBAction func getFancyNotification(_ sender: Any) {
        
        let fancyNId = "fancyId"
        let fancyNotificationContent = UNMutableNotificationContent()
        fancyNotificationContent.title = "This is a fancy notification"
        fancyNotificationContent.body = "So what do you want to do today?"
        fancyNotificationContent.sound = .default
        fancyNotificationContent.badge = 1
        fancyNotificationContent.categoryIdentifier = fancyNId
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let fancyRequest = UNNotificationRequest(identifier: fancyNId, content: fancyNotificationContent, trigger: notificationTrigger)
        
        let action1 = UNNotificationAction(identifier: "sushi", title: "Sushi", options: [.foreground])
        let action2 = UNNotificationAction(identifier: "code", title: "Code", options: [.foreground])
        let action3 = UNNotificationAction(identifier: "shalom", title: "Shalom", options: [.foreground])
        
        let fancyCategory = UNNotificationCategory(identifier: "fancyId", actions: [action1,action2,action3], intentIdentifiers: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([fancyCategory])
        
        UNUserNotificationCenter.current().add(fancyRequest) { (error) in
            print(error)
        }
    }
    
    @IBAction func listNotificationsTapped(_ sender: Any) {
        UNUserNotificationCenter.current().getDeliveredNotifications { (notifications) in
            print("Delivered: \(notifications.count)")
            for notification in notifications {
                print("Notification Id: \(notification.request.identifier)")
            }
        }
        UNUserNotificationCenter.current().getPendingNotificationRequests(completionHandler: { (notifications) in
            print("Pendind: \(notifications.count)")
            for notification in notifications {
                print("Notification Id: \(notification.identifier)")
            }
        })
    }
    
    @IBAction func deleteNotificationsTapped(_ sender: Any) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["regularNotification"])
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "sushi" {
            fancyNotificationLabel.text = "Great! I love sushi too!"
        } else if response.actionIdentifier == "code" {
            fancyNotificationLabel.text = "No pain! no Gain!"
        } else {
            fancyNotificationLabel.text = "Great! Let's take care of the soul"
        }
    }
}

