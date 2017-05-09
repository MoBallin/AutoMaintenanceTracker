//
//  CarDetailViewController.swift
//  AutoMaintenanceTracker
//
//  Created by Mohammed Diab on 5/9/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import UIKit
import EventKit
import CoreData


class CarDetailViewController: UIViewController, NSFetchedResultsControllerDelegate {

    
    /* -------------------------------------------------------------------------------------------------------- */
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    /* -------------------------------------------------------------------------------------------------------- */
    
    
    var car: Car!

    @IBOutlet weak var carLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Landing.png")!)
        // Do any additional setup after loading the view.
        
        updateViews()
    }
    
    func updateViews() {
        carLabel.text = car.name
    }
}
