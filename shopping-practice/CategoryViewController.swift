//
//  CategoryViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/22.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        button1.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button1.clipsToBounds = true
        button2.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button2.clipsToBounds = true
        button3.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button3.clipsToBounds = true
        button4.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button4.clipsToBounds = true
        button5.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button5.clipsToBounds = true
        button6.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button6.clipsToBounds = true
        button7.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button7.clipsToBounds = true
        button8.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button8.clipsToBounds = true
        button9.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button9.clipsToBounds = true
        button10.layer.cornerRadius = 0.5 * button1.bounds.size.width
        button10.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func button1(_ sender: Any) {
    }
    @IBAction func button2(_ sender: Any) {
    }
    @IBAction func button3(_ sender: Any) {
    }
    @IBAction func button4(_ sender: Any) {
    }
    @IBAction func button5(_ sender: Any) {
    }
    @IBAction func button6(_ sender: Any) {
    }
    @IBAction func button7(_ sender: Any) {
    }
    @IBAction func button8(_ sender: Any) {
    }
    @IBAction func button9(_ sender: Any) {
    }
    @IBAction func button10(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "button1" {
                let controller = segue.destination as! CategorySearchViewController
                controller.category = "shoes"
        }
        if segue.identifier == "button2" {
            let controller = segue.destination as! CategorySearchViewController
            controller.category = "tables"
        }
        if segue.identifier == "button3" {
            let controller = segue.destination as! CategorySearchViewController
            controller.category = "accessory"
        }
        if segue.identifier == "button4" {
            let controller = segue.destination as! CategorySearchViewController
            controller.category = "clothes"
        }
        if segue.identifier == "button5" {
            let controller = segue.destination as! CategorySearchViewController
            controller.category = "bags"
        }
        if segue.identifier == "button6" {
            let controller = segue.destination as! CategorySearchViewController
            controller.category = "balls"
        }
        if segue.identifier == "button7" {
            let controller = segue.destination as! CategorySearchViewController
            controller.category = "lowblades"
        }
        if segue.identifier == "button8" {
            let controller = segue.destination as! CategorySearchViewController
            controller.category = "penhold"
        }
        if segue.identifier == "button9" {
            let controller = segue.destination as! CategorySearchViewController
            controller.category = "robbers"
        }
        if segue.identifier == "button10" {
            let controller = segue.destination as! CategorySearchViewController
            controller.category = "blades"
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
