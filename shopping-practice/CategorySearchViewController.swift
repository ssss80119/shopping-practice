//
//  CategorySearchViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/26.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import SVProgressHUD

class CategorySearchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var brandImage: UIImageView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.cateArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        cell.layer.cornerRadius = 5
        
        // Configure the cell...
        if let label = cell.viewWithTag(10) as? UILabel{
            //label.text = String(describing: Items.sharedInstance.productArr[indexPath.row].price)
            label.text = self.cateArr[indexPath.row].name
        }
        if let label2 = cell.viewWithTag(2) as? UILabel{
            label2.text = "$" + String(describing: self.cateArr[indexPath.row].price)
        }
        if let prodImg = cell.viewWithTag(1) as? UIImageView{
            let url = URL(string: self.cateArr[indexPath.row].imgsrc)
            prodImg.kf.setImage(with: url)
        }
        if let brandImage = cell.viewWithTag(3) as? UIImageView{
            brandImage.image = UIImage(named:self.cateArr[indexPath.row].brand)
        }
        return cell
    }
    
    var category:String!
    var dataList = JSON()
    var Arr = [AnyObject]()
    var cateArr : [Product] = [Product]()

    @IBOutlet weak var collectionImg: UIImageView!
    @IBOutlet weak var collectionView2: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let width = (view.frame.size.width - 30 ) / 2
        let layout = collectionView2.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width:width,height:250)
        collectionView2.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        SVProgressHUD.show()
        
        let url = "http://45.79.133.15:3000/product/search?c=" + category
        print(url)
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
                        self.cateArr.append(product)
                        
                    }
                    self.collectionView2.reloadData()
                }
                
            }
            SVProgressHUD.dismiss()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
