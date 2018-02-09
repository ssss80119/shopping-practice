//
//  TableViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/22.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    var dataList = JSON()
    var Arr = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let url = "http://45.79.133.15:3000/product"
        Alamofire.request(url).responseJSON{(response) in
            if response.result.isSuccess {
                // convert data to dictionary array
                self.dataList = JSON(data:response.data!)
                
                if let resData = self.dataList.arrayObject {
                    self.Arr = resData as [AnyObject]
                    for i in self.Arr{
                        let product = Product()
                        product.name = i["name"] as! String
                        product.json_str = i["json_str"] as! String
                        product.price = i["price"]! ?? "defalt price"
                        product.id = i["id"]! ?? "defalt id"
                        product.description = i["description"] as! String
                        product.category = i["category"] as! String
                        product.imgsrc = i["imgsrc"] as! String
                        product.type = i["type"] as! String
                        product.brand = i["brand"] as! String
                        product.blade_special = i["blade_special"] as! String
                        product.blade_structure = i["blade_structure"] as! String
                        product.blade_vibrate = i["blade_vibrate"] as! String
                        product.blade_hitsize = i["blade_hitsize"] as! String
                        product.blade_thick = i["blade_thick"] as! String
                        product.blade_holdsize = i["blade_holdsize"] as! String
                        product.blade_holdwidth = i["blade_holdwidth"] as! String
                        product.blade_madein = i["blade_madein"] as! String
                        product.robber_hard = i["robber_hard"] as! String
                        product.robber_speed = i["robber_speed"] as! String
                        product.robber_spin = i["robber_spin"] as! String
                        product.robber_hard = i["robber_hard"] as! String
                        product.robber_madein = i["robber_madein"] as! String
                        product.robber_control = i["robber_control"] as! String
                        product.other_madein = i["other_madein"] as! String
                        product.specification = i["specification"] as! String
                        Items.sharedInstance.productArr.append(product)
                    }
                    self.tableView.reloadData() //for 迴圈出來後要reload不然會接到空的
                }
                
            }
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
        return Items.sharedInstance.productArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = String(describing: Items.sharedInstance.productArr[indexPath.row].price)

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
