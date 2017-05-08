//
//  CarsUIViewController.swift
//  AutoMaintenanceTracker
//
//  Created by Aaron Whaley on 4/11/17.
//  Copyright © 2017 Mohammed Diab. All rights reserved.
//

import UIKit
import CoreData

class CarsUIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate  {
    @IBOutlet weak var welcomeLabel: UILabel!

    @IBOutlet weak var myGarage: UITableView!
    @IBOutlet var AppBackground: UIView!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy var fetchedResultsController: NSFetchedResultsController<Car> = {
        let request = NSFetchRequest<Car>(entityName: "Car")
        request.predicate = nil
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
    
        let frc = NSFetchedResultsController<Car>(fetchRequest: request,
                                             managedObjectContext: self.managedObjectContext,
                                             sectionNameKeyPath: nil, cacheName: nil)
        
        
        frc.delegate = self
        try! frc.performFetch()
        
        return frc
    }()
    
   
    
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myGarage.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Landing.png")!)

          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if fetchedResultsController.fetchedObjects?.count == 0
        {
            welcomeLabel.text = "Welcome! Please Add a New Car"
        }
        else
        {
            welcomeLabel.text = ""
        }

        
        
        
        return fetchedResultsController.fetchedObjects?.count ?? 0
        
    
    
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath)
        let car = fetchedResultsController.fetchedObjects![indexPath.row]
        
        cell.textLabel?.text = car.name
        cell.detailTextLabel?.text = car.year + " " + car.make + car.model
        cell.imageView?.image = #imageLiteral(resourceName: "carimage.png")
        
        cell.backgroundColor = UIColor.clear
        //  cell.backgroundView =
    //    cell.selectedBackgroundView =
        
        
        return cell
    
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
//        if let vc =  segue.destination as? carDetailViewController {
//            let indexPath = self.myGarage.indexPathForSelectedRow!
//            let car = fetchedResultsController.object(at: indexPath)
//            vc.car = car
//        }
        
    }
}
