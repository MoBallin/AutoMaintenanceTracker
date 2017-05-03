//
//  CalendarViewController.swift
//  AutoMaintenanceTracker
//
//  Created by Aaron Whaley on 5/2/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import UIKit
import EventKit

class CalendarViewController: UIViewController {
    
    var delegate: EventAddedDelegate?
    var calendar: EKCalendar?
    @IBOutlet weak var milesTrav: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var oilType: UISegmentedControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Landing.png")!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func scheduleChange(_ sender: Any) {
        var oilMileage: Float = 0
        testLabel.text = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        var dayComponent = DateComponents()
        switch oilType.selectedSegmentIndex{
            case 0:
                oilMileage = 3000
            case 1:
                oilMileage = 5000
            default:
                oilMileage = 3000
        }
        if(milesTrav.text == "")
        {
            testLabel.text = "Please Enter Average Mileage"
        }
        
        let currentDate: Date = date.date
        let cal: Calendar = Calendar(identifier: .gregorian)
        let num: Int = Int(milesTrav.text!)!
        let totalDays: Int = Int(oilMileage)/num
        dayComponent.day = totalDays
        let schedDate = cal.date(byAdding: dayComponent, to: currentDate)
        testLabel.text = String(describing: schedDate)
        addEventToCalendar(title: "Oil Change", startDate: schedDate!, endDate: schedDate!)
        
        UIApplication.shared.openURL(NSURL(string: "calshow://")! as URL)
        /*else
        {
            testLabel.text = milesTrav.text
        }*/
        //testLabel.text = String(oilMileage)
    }
    
    func addEventToCalendar(title: String, startDate: Date, endDate: Date, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                let event = EKEvent(eventStore: eventStore)
                event.title = title
                event.startDate = startDate as Date
                event.endDate = endDate as Date
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let e as NSError {
                    completion?(false, e)
                    return
                }
                completion?(true, nil)
            } else {
                completion?(false, error as NSError?)
            }
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
