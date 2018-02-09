//
//  loginViewController.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/29.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class loginViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate{

    @IBOutlet weak var displayName: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var selectedImageFromPicker: UIImage?
    let uniqueString = NSUUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailText.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x:0, y: 0, width: 30, height: 30))
        let image = UIImage(named: "mail")
        imageView.image = image
        emailText.leftView = imageView
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        
        displayName.leftViewMode = UITextFieldViewMode.always
        let imageView2 = UIImageView(frame: CGRect(x:0, y: 0, width: 30, height: 30))
        let image2 = UIImage(named: "username")
        imageView2.image = image2
        displayName.leftView = imageView2
        imageView2.contentMode = UIViewContentMode.scaleAspectFit
        
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
    @IBAction func upload(_ sender: UIButton) {
        SVProgressHUD.show()
        if let selectedImage = selectedImageFromPicker {
            let storageRef = Storage.storage().reference().child("testimage").child("\(uniqueString).png")
            if let uploadData = UIImagePNGRepresentation(selectedImage) {
                // 這行就是 FirebaseStorage 關鍵的存取方法。
                storageRef.putData(uploadData, metadata: nil,completion: { (data, error) in
                    
                    if error != nil {
                        
                        // 若有接收到錯誤，我們就直接印在 Console 就好，在這邊就不另外做處理。
                        print("Error: \(error!.localizedDescription)")
                        return
                    }
                    Items.sharedInstance.photoUrl = data?.downloadURL()?.absoluteString
                    // 連結取得方式就是：data?.downloadURL()?.absoluteString。
                    if let uploadImageUrl = data?.downloadURL()?.absoluteString {
                        SVProgressHUD.dismiss()

                        // 我們可以 print 出來看看這個連結事不是我們剛剛所上傳的照片。
                       // print("Photo Url: \(uploadImageUrl)")
                        Auth.auth().createUser(withEmail: self.emailText.text!, password: self.passwordText.text!) { (user, error) in
                            // ...
                            
                            self.view.endEditing(true)
                            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                            changeRequest?.displayName = self.displayName.text!
                            if let url = URL(string:uploadImageUrl){
                                changeRequest?.photoURL = url
                            }
                            changeRequest?.commitChanges { (error) in
                                // ...
                                print(error ?? "defalt")
                            }
                            let alert = UIAlertController(title: "註冊", message: "註冊成功", preferredStyle: .alert)
                            
                            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {(action) in
                                self.dismiss(animated: true, completion: nil)

                                
                            }))
                            self.present(alert, animated: true)
                        }
//
//                        let databaseRef = Database.database().reference().child("AppCodaFireUpload").child(self.uniqueString)
//
//                            databaseRef.setValue(uploadImageUrl, withCompletionBlock: { (error, dataRef) in
//
//                            if error != nil {
//
//                                print("Database Error: \(error!.localizedDescription)")
//                            }
//                            else {
//
//                                print("圖片已儲存")
//                            }
//
//                        })
//                        if let imageUrl = URL(string: uploadImageUrl) {
//                            URLSession.shared.dataTask(with: imageUrl, completionHandler: { (data, response, error) in
//                                if error != nil {
//                                    
//                                    print("Download Image Task Fail: \(error!.localizedDescription)")
//                                }
//                                else if let imageData = data {
//                                    
//                                    DispatchQueue.main.async {
//                                        
//                                        self.userImage.image = UIImage(data: imageData)
//                                    }
//                                }
//                                
//                            }).resume()
//                        }
                        
                    }
                })
            }
        }
    }
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func chooseImage(_ sender: Any) {
        // 建立一個 UIImagePickerController 的實體
        let imagePickerController = UIImagePickerController()
        
        // 委任代理
        imagePickerController.delegate = self
        // 建立一個 UIAlertController 的實體
        // 設定 UIAlertController 的標題與樣式為 動作清單 (actionSheet)
        let imagePickerAlertController = UIAlertController(title: "上傳圖片", message: "請選擇要上傳的圖片", preferredStyle: .actionSheet)
        
        // 建立三個 UIAlertAction 的實體
        // 新增 UIAlertAction 在 UIAlertController actionSheet 的 動作 (action) 與標題
        let imageFromLibAction = UIAlertAction(title: "照片圖庫", style: .default) { (Void) in
            
            // 判斷是否可以從照片圖庫取得照片來源
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                
                // 如果可以，指定 UIImagePickerController 的照片來源為 照片圖庫 (.photoLibrary)，並 present UIImagePickerController
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        let imageFromCameraAction = UIAlertAction(title: "相機", style: .default) { (Void) in
            
            // 判斷是否可以從相機取得照片來源
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                // 如果可以，指定 UIImagePickerController 的照片來源為 照片圖庫 (.camera)，並 present UIImagePickerController
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        
        // 新增一個取消動作，讓使用者可以跳出 UIAlertController
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (Void) in
            
            imagePickerAlertController.dismiss(animated: true, completion: nil)
        }
        
        // 將上面三個 UIAlertAction 動作加入 UIAlertController
        imagePickerAlertController.addAction(imageFromLibAction)
        imagePickerAlertController.addAction(imageFromCameraAction)
        imagePickerAlertController.addAction(cancelAction)
        
        // 當使用者按下 uploadBtnAction 時會 present 剛剛建立好的三個 UIAlertAction 動作與
        present(imagePickerAlertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        
        // 取得從 UIImagePickerController 選擇的檔案
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            selectedImageFromPicker = pickedImage
            self.userImage.image = selectedImageFromPicker
        }
        
        // 可以自動產生一組獨一無二的 ID 號碼，方便等一下上傳圖片的命名
        
        
        // 當判斷有 selectedImage 時，我們會在 if 判斷式裡將圖片上傳
        if let selectedImage = selectedImageFromPicker {
            
            print("\(uniqueString), \(selectedImage)")
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with:event)
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailText.resignFirstResponder()
        return true;
        
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
