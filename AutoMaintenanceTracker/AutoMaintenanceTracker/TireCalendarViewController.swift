//
//  TireCalendarViewController.swift
//  AutoMaintenanceTracker
//
//  Created by Aaron Whaley on 5/9/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import UIKit
import EventKit
import CoreData

class TireCalendarViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var carPicker: UIPickerView!
    @IBOutlet weak var milesTrav: UITextField!
    
    @IBOutlet weak var testLabel: UILabel!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var delegate: EventAddedDelegate?
    var calendar: EKCalendar?
    private var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Landing.png")!)
        
        //print(carNames)
        carPicker.dataSource = self
        carPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let request = NSFetchRequest<Car>(entityName: "Car")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        cars = try! managedObjectContext.fetch(request)
        carPicker.reloadAllComponents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cars.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cars[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //carText = carNames[row]
    }
    
    
    @IBAction func scheduleChange(_ sender: Any) {
        let tireMileage: Float = 7500
        testLabel.text = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let car = cars[carPicker.selectedRow(inComponent: 0)]
        let carText: String = car.name
        
        var dayComponent = DateComponents()
  /*      switch oilType.selectedSegmentIndex{
        case 0:
            oilMileage = 3000
        case 1:
            oilMileage = 5000
        default:
            oilMileage = 3000
        }*/
        if(milesTrav.text == "")
        {
            testLabel.text = "Please Enter Average Mileage"
            return
        }
        
        let milesText: String = milesTrav.text!
        let currentDate: Date = date.date
        let cal: Calendar = Calendar(identifier: .gregorian)
        if Int(milesText) != nil
        {
            
        }
        else
        {
            testLabel.text = "Please Enter Whole Number for Mileage"
            return
        }
        let num: Int = Int(milesTrav.text!)!
        let totalDays: Int = Int((Int(tireMileage)/num).toIntMax())
        dayComponent.day = totalDays
        let schedDate = cal.date(byAdding: dayComponent, to: currentDate)
        
        //testLabel.text = String(describing: schedDate)
        addEventToCalendar(title: ("Tire Rotation - " + carText), startDate: schedDate!, endDate: schedDate!)
        
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


}
