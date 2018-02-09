//
//  NewTableViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/25.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class NewTableViewController: UITableViewController {
    var dataList = JSON()
    var Arr = [AnyObject]()
    var newArr : [New] = [New]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let url = "http://45.79.133.15:3000/news"
        Alamofire.request(url).responseJSON{(response) in
            if response.result.isSuccess {
                // convert data to dictionary array
                self.dataList = JSON(data:response.data!)
                
                if let resData = self.dataList.arrayObject {
                    
                    self.Arr = resData as [AnyObject]
                    for i in self.Arr{
                        let new = New()
                        new.title = i["title"] as! String
                        new.content = i["content"] as! String
                        if(new.title != ""){
                        self.newArr.append(new)
                        }
            
                    }
                    self.tableView.reloadData()
                }
                
            }
            SVProgressHUD.dismiss()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.newArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewTableViewCell
        // Configure the cell...
        
        cell.newtitle.text = newArr[indexPath.row].title


        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let controller = segue.destination as! NewDetailViewController
                controller.NewTitle = newArr[indexPath.row].title
                controller.NewContent = newArr[indexPath.row].content
                
            }
        }
    }
            
 

}
