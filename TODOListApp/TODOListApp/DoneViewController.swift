//
//  DoneViewController.swift
//  TODOListApp
//
//  Created by Sium on 9/8/17.
//  Copyright © 2017 refat. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // properties: outlets
    @IBOutlet weak var tableViewForDone: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //introduce delegate and datasource to the view controller
        self.tableViewForDone.delegate = self
        self.tableViewForDone.dataSource = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // for reloading the table view
        tableViewForDone.reloadData()
    }
    
    //datasource for the tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AppDelegate.globalDoneList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "doneCell", for: indexPath) as? DoneTableViewCell else  {
            fatalError("the dequed cell is not an instance of PendingTableViewCell")
        }
        cell.doneTaskLabelOutlet.text = AppDelegate.globalDoneList[indexPath.row]
        return cell
    }
    
    //delegate for the tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        AppDelegate.globalPendingList.append(AppDelegate.globalDoneList[indexPath.row])
        AppDelegate.globalDoneList.remove(at: indexPath.row)
        
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AppDelegate.globalDoneList.remove(at: indexPath.row)
        }
        
        tableView.reloadData()
    }

}
