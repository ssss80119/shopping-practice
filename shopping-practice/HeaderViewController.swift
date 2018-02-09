//
//  HeaderViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/22.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController,SWRevealViewControllerDelegate {

    @IBOutlet weak var toggleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
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

}
