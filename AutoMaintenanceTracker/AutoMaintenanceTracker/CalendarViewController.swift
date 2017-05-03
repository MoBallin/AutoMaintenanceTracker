//
//  CalendarViewController.swift
//  AutoMaintenanceTracker
//
//  Created by Aaron Whaley on 5/2/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var milesTrav: UITextField!
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
        
        if(oilType.selectedSegmentIndex == 0)
        {
            
        }
        else{
            
        }
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
