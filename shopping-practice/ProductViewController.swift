//
//  ProductViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/22.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit
import ImageSlideshow
import Alamofire
import SwiftyJSON
import Kingfisher
import SVProgressHUD

class ProductViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    var dataList = JSON()
    var Arr = [AnyObject]()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let width = (view.frame.size.width - 30 ) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width:width,height:250)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        SVProgressHUD.show()
        
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
                    self.collectionView.reloadData()
                }
                
            }
            SVProgressHUD.dismiss()
        }
        slideshow.setImageInputs([
            ImageSource(image: UIImage(named: "slideshow1")!),
            ImageSource(image: UIImage(named: "slideshow2")!),
            ImageSource(image: UIImage(named: "slideshow3")!),
            ])
        slideshow.slideshowInterval = 3
        // Do any additional setup after loading the view.
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Items.sharedInstance.productArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        cell.layer.cornerRadius = 5
        
        // Configure the cell...
        if let label = cell.viewWithTag(10) as? UILabel{
            //label.text = String(describing: Items.sharedInstance.productArr[indexPath.row].price)
            label.text = Items.sharedInstance.productArr[indexPath.row].name
        }
        if let label2 = cell.viewWithTag(2) as? UILabel{
            label2.text = "$" + String(describing: Items.sharedInstance.productArr[indexPath.row].price)
        }
        if let prodImg = cell.viewWithTag(1) as? UIImageView{
            let url = URL(string: Items.sharedInstance.productArr[indexPath.row].imgsrc)
            prodImg.kf.setImage(with: url)
        }
        if let brandImage = cell.viewWithTag(3) as? UIImageView{
            brandImage.image = UIImage(named:Items.sharedInstance.productArr[indexPath.row].brand)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
                let controller = segue.destination as! ProductDetailViewController
                controller.a = Items.sharedInstance.productArr[indexPath.row].name
                controller.url = Items.sharedInstance.productArr[indexPath.row].imgsrc
                controller.product_des =  Items.sharedInstance.productArr[indexPath.row].description
                controller.blade_Special = Items.sharedInstance.productArr[indexPath.row].blade_special
                controller.blade_Structure = Items.sharedInstance.productArr[indexPath.row].blade_structure
                controller.blade_Vibrate = Items.sharedInstance.productArr[indexPath.row].blade_vibrate
                controller.hold_size = Items.sharedInstance.productArr[indexPath.row].blade_holdsize
                controller.blade_location =  Items.sharedInstance.productArr[indexPath.row].blade_madein
                controller.blade_Width =  Items.sharedInstance.productArr[indexPath.row].blade_holdwidth
                controller.blade_Area =  Items.sharedInstance.productArr[indexPath.row].blade_hitsize
                controller.blade_Thick =  Items.sharedInstance.productArr[indexPath.row].blade_thick
                controller.Price = String(describing: Items.sharedInstance.productArr[indexPath.row].price)
            }

    }
    }
}
