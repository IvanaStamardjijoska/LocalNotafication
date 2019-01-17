//
//  ViewController.swift
//  LocalNotafication
//
//  Created by CodeWell on 1/16/19.
//  Copyright © 2019 Ivana Stamardjioska. All rights reserved.
//

import UIKit
import UserNotifications

protocol  AddTaskProtocol {
    func addtask(task:Task)
}

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: AddTaskProtocol?
    
    @IBAction func notifyMeButton(_ sender: Any) {
//        sendNotification()
        
    }
    
    
    @IBAction func cancelNotificationsButton(_ sender: Any) {
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
    }
    
    @IBAction func create(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        self.createTask()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func createTask() {
        
        let title = textField.text ?? "defaultTitle"
        let date = datePicker.date
        let task = Task(withTitle: title, date: date)
        delegate?.addtask(task:task)
        
    }
    

 //Funkcija za notifikacija

    func sendNotification(){

        //Poveke notifikaci


        //Sodrzina na notifikacijata

        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "SubTitle"
        content.body = "Bla, bla, bla, bla"
        content.sound = UNNotificationSound.default()

        //Triger na notifikacijata

            var dateComponents = DateComponents()

            dateComponents.day = 16
            dateComponents.month = 1
            dateComponents.year = 2019
            dateComponents.hour = 18
            dateComponents.minute = 51


        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        //prajkanje na request

        let request =  UNNotificationRequest(identifier: "NotifyMe", content: content, trigger: trigger)

        //dodavanej an notifikacijat vo sistemot-zakazuvanje


        UNUserNotificationCenter.current().add(request) { (error) in
            print("notifikacijata e zakazana")
        }
    }

}
// Ova e za da ti ja pokazi notifikacijata
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .alert, .sound])
    }


