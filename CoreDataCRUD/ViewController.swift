//
//  ViewController.swift
//  CoreDataCRUD
//
//  Created by Marwan Khalid on 1/2/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var name: UITextField!
    
    @IBOutlet var password: UITextField!
    
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        retrieveData()
    }
    
    @IBAction func signUP(_ sender: Any) {
    }
    
    func retrieveData() {
            
            //As we know that container is set up in the AppDelegates so we need to refer that container.
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            //We need to create a context from this container
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Prepare the request of type NSFetchRequest  for the entity
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
            do {
                let result = try managedContext.fetch(fetchRequest)
                for data in result as! [NSManagedObject] {
                    if data.value(forKey: "name") as! String == name.text! && data.value(forKey: "password") as! String == password.text! {
                        flag = true
                    }else{
                        flag = false
                    }
                }
                
                if flag {
                    guard let welcome = storyboard?.instantiateViewController(withIdentifier: "welcome") as? WelcomeController else {
                        return
                    }
                    welcome.modalTransitionStyle = .crossDissolve
                    welcome.modalPresentationStyle = .fullScreen
                    self.present(welcome, animated: true, completion: nil)
                }else{
                    print("Not Match")
                }
                
            } catch {
                print("Failed")
            }
        }
    

}

