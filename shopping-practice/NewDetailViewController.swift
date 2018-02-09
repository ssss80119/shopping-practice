//
//  NewDetailViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/25.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit

class NewDetailViewController: UIViewController {
    @IBOutlet weak var newTitle: UILabel!
    
    @IBOutlet weak var newContent: UILabel!
    var NewContent : String!
    var NewTitle : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newTitle.text = NewTitle
        newContent.text = NewContent
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
