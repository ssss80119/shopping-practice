//
//  FirstViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/21.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SJSegmentedScrollView


class FirstViewController: SJSegmentedViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        if let storyboard = self.storyboard {
            let headerViewController = storyboard
                .instantiateViewController(withIdentifier: "HeaderViewController")
            
            let firstViewController = storyboard
                .instantiateViewController(withIdentifier: "ProductViewController")
            firstViewController.title = "人氣商品"
           let secondViewController = storyboard
                .instantiateViewController(withIdentifier: "NewViewController")
            secondViewController.title = "最新消息"
            let thirdViewController = storyboard
                .instantiateViewController(withIdentifier: "CategoryViewController")
            thirdViewController.title = "種類商品"
            let segmentedViewController = SJSegmentedViewController(headerViewController: headerViewController,
                                                                    segmentControllers: [firstViewController,
                                                                                        secondViewController,
                                                                                        thirdViewController])
            segmentedViewController.selectedSegmentViewColor = UIColor(red: 204.0/255.0, green: 51.0/255.0, blue: 102.0/255.0, alpha: 1.0)
            segmentedViewController.headerViewHeight = 120.0
            segmentedViewController.headerViewOffsetHeight = 120.0
            segmentedViewController.segmentBackgroundColor = UIColor.black
            segmentedViewController.segmentTitleColor = UIColor.white
            segmentedViewController.segmentTitleFont = UIFont.systemFont(ofSize: 18.0)
            
            self.present(segmentedViewController, animated: false, completion: nil)
            self.navigationController?.pushViewController(segmentedViewController,
                                                          animated: true)
            addChildViewController(segmentedViewController)
            self.view.addSubview(segmentedViewController.view)
            segmentedViewController.didMove(toParentViewController: self)
            
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        if(Items.sharedInstance.cartArr.count > 0){
        tabBarController?.tabBar.items?[1].badgeValue = "\(Items.sharedInstance.cartArr.count)"
        tabBarController?.tabBar.items?[1].badgeColor = UIColor(red: 204.0/255.0, green: 51.0/255.0, blue: 102.0/255.0, alpha: 1.0)
        }

    }
    


}

