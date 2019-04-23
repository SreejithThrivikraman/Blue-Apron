//
//  ReminderViewController.swift
//  Blue Apron
//
//  Created by newuser on 2019-04-23.
//  Copyright © 2019 Sreejith Thrivikraman. All rights reserved.
//

import UIKit
import UserNotifications

class ReminderViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    let localNotification = UILocalNotification()
    
    
    var recipeName = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow,error in })
    }
    
    @IBAction func setButton(_ sender: Any) {
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker.date )
        let t = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let c = UNMutableNotificationContent()
        c.title = "Lets Roll"
        c.subtitle  = "dx"
        c.body = "fyb"
        
        let r = UNNotificationRequest(identifier: "any", content: c, trigger: t)
        
        UNUserNotificationCenter.current().add(r, withCompletionHandler: nil)
        
        setUpNotificationsOptions()
    }
    
    
    func setUpNotificationsOptions()  {
//        datePicker.datePickerMode = .time
//        localNotification.timeZone = NSTimeZone.local
//        localNotification.repeatInterval = .day
//        localNotification.alertAction = "Open App"
//        localNotification.alertBody = "a notification"
//        localNotification.soundName = UILocalNotificationDefaultSoundName
//        localNotification.fireDate = datePicker.date
//        UIApplication.shared.scheduleLocalNotification(localNotification)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let displayDate  = dateFormatter.string(from: datePicker.date)
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker.date )
        let content = UNMutableNotificationContent()
        content.title = "The Recipe \(recipeName) is ready to cook"
        content.subtitle = "They are up now"
        content.body = "The 5 seconds are really up"
        content.badge = 1
        
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest(identifier: "timeDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
