//
//  NewCarUIViewController.swift
//  AutoMaintenanceTracker
//
//  Created by Cord Stojeba on 4/19/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import UIKit
import CoreData
class NewCarUIViewController: UIViewController {

    
    @IBOutlet var backGroundView: UIView!
  //  @IBOutlet var backgroundView: UIView!

   
  
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var newCarName: UITextField!
    @IBOutlet weak var newCarMake: UITextField!
    @IBOutlet weak var newCarModel: UITextField!
    @IBOutlet weak var newCarYear: UITextField!
    
    @IBAction func saveNewCar(_ sender: UIButton) {
        
        let car = Car(context: managedObjectContext)
        
        car.name = newCarName.text ?? ""
        car.make = newCarMake.text ?? ""
        car.year = newCarYear.text ?? ""
        car.model = newCarModel.text ?? ""
        
        try! managedObjectContext.save()
        
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Landing.png")!)
        
//  backGroundView = UIImageView(image: UIImage(named: "Landing.png"))
        
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
