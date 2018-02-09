//
//  ProductDetailViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/23.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit
import Kingfisher

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var addcart: UIButton!
    @IBOutlet weak var prod_description: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var holdsize: UILabel!
    @IBOutlet weak var bladespecial: UILabel!
    @IBOutlet weak var bladeVibrate: UILabel!
    @IBOutlet weak var bladeStructure: UILabel!
    @IBOutlet weak var prod_location: UILabel!
    @IBOutlet weak var blade_width: UILabel!
    @IBOutlet weak var bladeArea: UILabel!
    @IBOutlet weak var blade_thick: UILabel!
    @IBOutlet weak var price: UILabel!
    var a :String!
    var url:String!
    var product_des: String!
    var blade_Special : String!
    var blade_Vibrate : String!
    var blade_Structure : String!
    var hold_size : String!
    
    var blade_location : String!
    var blade_Width : String!
    var blade_Area : String!
    var blade_Thick : String!
    var Price : String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = a
        // Do any additional setup after loading the view.
        prod_description.text = product_des
        let imgurl = URL(string: url!)
        image.kf.setImage(with: imgurl)
        holdsize.text = hold_size
        bladespecial.text = blade_Special
        bladeStructure.text = blade_Structure
        bladeVibrate.text = blade_Vibrate
        prod_location.text = blade_location
        blade_width.text = blade_Width
        bladeArea.text = blade_Area
        blade_thick.text = blade_Thick
        price.text = "$" + Price


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AddCart(_ sender: UIButton) {
        let cart = Cart()
        cart.name = a
        cart.price = Price
        cart.imgsrc = url
        Items.sharedInstance.cartArr.append(cart)
        let alert = UIAlertController(title: "購物車", message: "成功加入購物車", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {(action) in self.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true)

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
