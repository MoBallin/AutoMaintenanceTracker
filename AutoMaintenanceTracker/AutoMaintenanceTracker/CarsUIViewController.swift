//
//  CarsUIViewController.swift
//  AutoMaintenanceTracker
//
//  Created by Aaron Whaley on 4/11/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import UIKit

class CarsUIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var myGarage: UITableView!
    
    var cars:[Car]? = [
        Car(name: "Cord's Car", model: "X Terra", year: "2004", make: "Nissan" ),
        Car(name: "Mohammed's Whip", model: "TL-S", year: "2008", make: "Acura")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let cars = cars{
            return cars.count
        }
        else{
            return 0
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let carCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "carCell")
        if let cars = cars{
            
            carCell.textLabel?.text = cars[indexPath.row].name
                
            carCell.detailTextLabel?.text = cars[indexPath.row].year + " " + cars[indexPath.row].make + cars[indexPath.row].model

            carCell.imageView?.image = #imageLiteral(resourceName: "carimage.png")
        }
        
        return (carCell)
        
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
