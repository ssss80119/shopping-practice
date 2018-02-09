//
//  CartTableViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/23.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase
class CartTableViewController: UITableViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
       
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
    
    override func viewWillAppear(_ animated: Bool) {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
            if let user = user {
                // User is signed in.
            } else {
                // No user is signed in.
                print("logout")
                self.tabBarController?.selectedIndex = 3

            }
        }
        if(Items.sharedInstance.cartArr.count != 0){
            label.isHidden = true
            totalPrice.isHidden = false
        }
        else{
            label.isHidden = false
            totalPrice.isHidden = true
        }
        for i in Items.sharedInstance.cartArr {
            total = total + Int(i.price)!
        }
        totalPrice.text = "商品金額總計：     \(total)元"
        total = 0
        if(Items.sharedInstance.cartArr.count > 0){
        tabBarController?.tabBar.items?[1].badgeValue = "\(Items.sharedInstance.cartArr.count)"
        }
        else{
            tabBarController?.tabBar.items?[1].badgeValue = nil

        }
        self.tableView.reloadData()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Items.sharedInstance.cartArr.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell

        // Configure the cell...
        cell.name.text = Items.sharedInstance.cartArr[indexPath.row].name
        let url = URL(string: Items.sharedInstance.cartArr[indexPath.row].imgsrc)
        cell.cellImage.kf.setImage(with: url)
        cell.cerllPrice.text = "$" + Items.sharedInstance.cartArr[indexPath.row].price
        

        return cell
    }
    @IBAction func deleteItem(_ sender: UIButton) {
        print("DELETE")
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Items.sharedInstance.cartArr.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
            
            self.viewWillAppear(true)
        }
        print(Items.sharedInstance.cartArr.count)
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
