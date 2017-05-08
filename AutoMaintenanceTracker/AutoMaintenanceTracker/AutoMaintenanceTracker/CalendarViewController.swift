//
//  CalendarViewController.swift
//  AutoMaintenanceTracker
//
//  Created by Aaron Whaley on 5/2/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import UIKit
import EventKit
import CoreData

class CalendarViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    var delegate: EventAddedDelegate?
    var calendar: EKCalendar?
    @IBOutlet weak var milesTrav: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var oilType: UISegmentedControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Landing.png")!)
        
        let request = NSFetchRequest<Car>(entityName: "Car")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let cars = try! managedObjectContext.fetch(request)
        
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
            return
        }
        
        let milesText: String = milesTrav.text!
        let currentDate: Date = date.date
        let cal: Calendar = Calendar(identifier: .gregorian)
        if let intVal = Int(milesText)
        {
            
        }
        else
        {
            testLabel.text = "Please Enter integer value for mileage"
            return
        }
        let num: Int = Int(milesTrav.text!)!
        let totalDays: Int = Int((Int(oilMileage)/num).toIntMax())
        dayComponent.day = totalDays
        let schedDate = cal.date(byAdding: dayComponent, to: currentDate)
        //testLabel.text = String(describing: schedDate)
        addEventToCalendar(title: "Oil Change", startDate: schedDate!, endDate: schedDate!)
        
        UIApplication.shared.open(URL(string: "calshow://")!, options: [:], completionHandler: nil)
        
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
