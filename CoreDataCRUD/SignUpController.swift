//
//  SignUpController.swift
//  CoreDataCRUD
//
//  Created by Marwan Khalid on 1/2/21.
//

import UIKit
import CoreData


class SignUpController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        insetData()
    }
    
    func insetData(){
        guard let appDelagate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelagate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        user.setValue(name.text!, forKey: "name")
        user.setValue(password.text!, forKey: "password")
        
        do {
            try managedContext.save()
            print("Save")
        } catch let error as NSError {
            print("Could not save. \(error),\(error.userInfo)")
        }
    }

}
