//
//  Change Password.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/15/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class changepasswordVC: UIViewController {
    
    
    //MARK:- IBoutlet
    
    
    @IBOutlet weak var currentpass: UITextField!
    
    @IBOutlet weak var newpass: UITextField!
    @IBOutlet weak var confirmpass: UITextField!
    
    
    //MARK:- VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK:- BUTTONS
    @IBAction func changepassBUTTON(_ sender: Any) {
        if currentpass.text!.isEmpty || newpass.text!.isEmpty || confirmpass.text!.isEmpty {
            showAlert(title: "Error", text: "Textfield Should not be empty!")
        }
        else{
            if newpass.text! != confirmpass.text! {
                showAlert(title: "", text: "Password not Matched!")
            }
            else{
                changepassAPI()
            }
        }
    }
    
    func changepassAPI(){
        let param:Parameters = ["currentPassword":currentpass.text!,
                                "newPassword":newpass.text!]
        let header = ["Authorization":"Bearer \(UserDefaults.standard.string(forKey: "Token")!)",
                      "Content-Type":"application/json"]
        Alamofire.request("https://www.dev.conektr.com/index.php/rest/V1/customers/me/password",
                          method: .put,
                          parameters: param,
                          encoding: JSONEncoding.default,
                          headers: header).responseString { response in
                            switch response.result {
                                
                                
                            case .success(let data):
                                print(data)
                                print(" true")
                                if data == " true" {
                                    showAlert(title: "", text: "Password Successfully Changed!")
                                }else{
                                    showAlert(title: "Error", text: "The password doesn't match this account.")
                                }
                                
                                
                                
                            case .failure(let err):
                                print("fail")
                                print(err.localizedDescription)
                            }
        }
    }
    
    
    @IBAction func backBUTTON(_ sender: Any) {
        print("back")
    }
    
    
    
}
