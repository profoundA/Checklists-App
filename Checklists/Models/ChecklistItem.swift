//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Andrey Lobanov on 06.10.2021.
//

import Foundation
import UserNotifications

//MARK: - Data model

class ChecklistItem: NSObject, Codable {
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    var text = ""
    var checked = false
    
    func scheduleNotifications() {
        if shouldRemind && dueDate > Date() {
            let content = UNMutableNotificationContent()
                content.title = "Checklists"
                content.body = text
                content.sound = UNNotificationSound.default
            
                let calendar = Calendar(identifier: .gregorian)
                let components = calendar.dateComponents(
                  [.year, .month, .day, .hour, .minute],
                  from: dueDate)
            
                let trigger = UNCalendarNotificationTrigger(
                  dateMatching: components,
                  repeats: false)
            
                let request = UNNotificationRequest(
                  identifier: "\(itemID)",
                  content: content, trigger: trigger)
            
                let center = UNUserNotificationCenter.current()
                center.add(request)
                print("Scheduled: \(request) for itemID: \(itemID)")
        }
    }
    
    func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
    
    func scheduleNotification() {
        removeNotification()
        
    }
    
    override init() {
        itemID = DataModel.nextChecklistItemID()
    }
    
    deinit {
        removeNotification()
    }
}
