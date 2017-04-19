//
//  ViewController.swift
//  CarTable
//
//  Created by Cord Stojeba on 4/13/17.
//  Copyright © 2017 Cord N Stojeba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var UICarTableView: UIView!
   
    var cars:[Car]? = [
        Car(name: "Name1", model: "Model1", year: 2000, make: "Make1" ),
        Car(name: "Name2", model: "Model2", year: 2001, make: "Make2")
    ]
    
   

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let cars = cars{
            return cars.count
        }
        else{
            return 0
        }

    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let carCell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "carCell")
        if let cars = cars{
           // print(cars.count)
            carCell.textLabel?.text = cars[indexPath.row].model + " " + cars[indexPath.row].name
//        carCell.imageView?.image = cars[indexPath.row].image
        }
        
        return (carCell)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

