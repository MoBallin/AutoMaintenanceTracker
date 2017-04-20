//
//  NewCarUIViewController.swift
//  AutoMaintenanceTracker
//
//  Created by Cord Stojeba on 4/19/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import UIKit

class NewCarUIViewController: UIViewController {

    @IBOutlet weak var newCarName: UITextField!
    @IBOutlet weak var newCarMake: UITextField!
    @IBOutlet weak var newCarModel: UITextField!
    @IBOutlet weak var newCarYear: UITextField!
  //  var newCar: Car
    
    @IBAction func SaveNewCar(_ sender: UIButton) {
        var newCar: Car! = Car(name: " ", model: " ", year: " ", make: " " )
        //
        //
        //POSSIBLY DANEROUS CODE 
        //
        //
        if newCarName == nil || newCarName.text == " "
        {
            newCar.name = "New Car"
        }
        
        else
        {
            newCar.name = newCarName.text!
        }
        
        newCar.make = newCarMake.text!
        newCar.model = newCarModel.text!
        newCar.year = newCarYear.text!
        
    
    
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
