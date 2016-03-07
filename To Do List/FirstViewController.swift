//
//  FirstViewController.swift
//  To Do List
//
//  Created by Besjana Shabani
//  Copyright © 2016 Besjana Shabani. All rights reserved.
//

import UIKit
//declare an array to save the listed items
var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    //outlet for the table view
    @IBOutlet var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //test if there is any element saved inside the user defaults, in case there is add them to the array
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil){
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //function to set the number of rows of the table, to the number of the items there are inside the todolist array
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    //function to define the table cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //defining the cell identifier
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell" )
        
        //setting the cell text to the to do list item
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    // function to remove the list item
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //test if the user swiped left- to delete item
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            //remove item from the array
            toDoList.removeAtIndex(indexPath.row)
            
            //reset the todolist in the user defaults
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            //reloading table
            toDoListTable.reloadData()
            
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }

}

