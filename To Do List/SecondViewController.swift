//
//  SecondViewController.swift
//  To Do List
//
//  Created by Besjana Shabani 
//  Copyright © 2016 Besjana Shabani. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    //text field outlet
    @IBOutlet var item: UITextField!
    
    //function when the Save button is pressed
    @IBAction func addItem(sender: AnyObject) {
        
        //add the input as an item to the todolist array
        toDoList.append(item.text!)
        
        //empty the input field
        item.text = ""
        
        //reset the todolist inside the user defaults to save the item
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //set the delegate for the input field to the current view controller
        self.item.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // whenever the user ends filling the text field, and clicks anywhere in the screen to hide the keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textfieldShouldReturn(textField: UITextField!) -> Bool {
        item.resignFirstResponder()
        return true
    }


}

