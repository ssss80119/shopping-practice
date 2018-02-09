//
//  SecondViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/21.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import Kingfisher

class SecondViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userDisplay: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.emailText.delegate = self
        self.passwordText.delegate = self
//        emailText.borderStyle = .none
//        emailText.layer.backgroundColor = UIColor.black.cgColor
//        emailText.layer.masksToBounds = false
//        emailText.layer.shadowColor = UIColor.white.cgColor
//        emailText.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        emailText.layer.shadowOpacity = 1.0
//        emailText.layer.shadowRadius = 0.0
//        passwordText.borderStyle = .none
//        passwordText.layer.backgroundColor = UIColor.black.cgColor
//        passwordText.layer.masksToBounds = false
//        passwordText.layer.shadowColor = UIColor.white.cgColor
//        passwordText.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        passwordText.layer.shadowOpacity = 1.0
//        passwordText.layer.shadowRadius = 0.0
        emailText.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x:0, y: 0, width: 30, height: 30))
        let image = UIImage(named: "mail")
        imageView.image = image
        emailText.leftView = imageView
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        passwordText.leftViewMode = UITextFieldViewMode.always
        let imageView3 = UIImageView(frame: CGRect(x:0, y: 0, width: 30, height: 30))
        let image3 = UIImage(named: "password")
        imageView3.image = image3
        passwordText.leftView = imageView3
        imageView3.contentMode = UIViewContentMode.scaleAspectFit

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            // User is signed in.
            self.loginView.isHidden = true
            print("signed in")

            // ...
        } else {
            // No user is signed in.
            self.loginView.isHidden = false
            print("logout")

            // ...
        }
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
            if let user = user {
                // User is signed in.
                self.userDisplay.text = user.displayName
                self.userEmail.text = user.email
                self.userImage.kf.setImage(with: user.photoURL)

                print(user.photoURL ?? "defalt")
                print("signed in")
                self.loginView.isHidden = true
            } else {
                // No user is signed in.
                print("logout")
            }
        }
       
    }

    @IBAction func registerButton(_ sender: Any) {
       
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            // ...
            SVProgressHUD.show()
            self.loginView.isHidden = true
            self.view.endEditing(true)
            SVProgressHUD.dismiss()
        }
    }
    @IBAction func signout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        self.loginView.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with:event)
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true;
        
    }
    
}


