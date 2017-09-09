//
//  ViewController.swift
//  TODOListApp
//
//  Created by Sium on 9/8/17.
//  Copyright © 2017 refat. All rights reserved.
//

import UIKit

class PendingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //properties : outlet
    @IBOutlet weak var tableViewOutletForPending: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //introduce delegate and datasource to the view controller
        tableViewOutletForPending.delegate = self
        tableViewOutletForPending.dataSource = self
        
        //for tab bar color
        UITabBar.appearance().barTintColor = UIColor.clear
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // for reloading the table view
        tableViewOutletForPending.reloadData()
    }
    
   
    
    
    //datasource for the tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.globalPendingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pendingCell", for: indexPath) as? PendingTableViewCell else {
          fatalError("the dequed cell is not an instance of PendingTableViewCell")
        }
        cell.pendingTaskLabelOutlet.text = AppDelegate.globalPendingList[indexPath.row]
        return cell
    }
    
    //delegate for the tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        AppDelegate.globalDoneList.append(AppDelegate.globalPendingList[indexPath.row])
        AppDelegate.globalPendingList.remove(at: indexPath.row)
        tableView.reloadData()
       
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                AppDelegate.globalPendingList.remove(at: indexPath.row)
           }
            
            tableView.reloadData()
        }
    
    //Private Action
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddTaskViewController,  let task = sourceViewController.newTaskName {
            
                //add the task
                let newIndexPath = IndexPath(row: AppDelegate.globalPendingList.count, section: 0)
                AppDelegate.globalPendingList.append(task)
                tableViewOutletForPending.insertRows(at: [newIndexPath], with: .automatic)
                
            }
        
            
        }
    }
    





