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


class CarDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate {

    
    /* -------------------------------------------------------------------------------------------------------- */
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    /* -------------------------------------------------------------------------------------------------------- */

    
    
    @IBOutlet weak var myImageView: UIImageView!
    let picker = UIImagePickerController()
    @IBOutlet weak var carLabel: UILabel!
    
    @IBAction func photoFromLibrary(_ sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
//        var Car: Car
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Landing.png")!)        // Do any additional setup after loading the view.
   
        
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @nonobjc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage]
        myImageView.contentMode = .scaleAspectFit //3
        myImageView.image = chosenImage as? UIImage //4
        dismiss(animated: true, completion: nil) //5
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
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
