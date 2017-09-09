//
//  AddTaskViewController.swift
//  TODOListApp
//
//  Created by Sium on 9/9/17.
//  Copyright © 2017 refat. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController  {
    
    //outlet
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var taskNametextFieldOutlet: UITextField!
    
    //variable
    var newTaskName : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for textfield 
        self.taskNametextFieldOutlet.delegate = self
        
        // Disable the Done button if the text field is empty
        self.changeButtonState()
        
    }
    
    // Pass the selected object to the new view controller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        guard let button = sender as? UIBarButtonItem, button === doneButton else {
            fatalError("Done button is not pressed. ")
        }
        newTaskName = taskNametextFieldOutlet.text!

    }
    
    // to dismiss the add task view controller
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //method
    func changeButtonState() {
        // Disable the Done button if the text field is empty
        let text = taskNametextFieldOutlet.text ?? ""
        doneButton.isEnabled = !text.isEmpty
    }
   

}

// for textfield 
// delegate methods
extension AddTaskViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.changeButtonState()
        newTaskName = taskNametextFieldOutlet.text!
    
    }
    
   
}
