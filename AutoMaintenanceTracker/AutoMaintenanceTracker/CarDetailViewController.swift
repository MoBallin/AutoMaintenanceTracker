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

    @IBOutlet weak var carLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UIImageView(image: UIImage(named: "Landing.png"))
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
