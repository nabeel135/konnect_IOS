//
//  ForgotPassword.swift
//  Conektr
//
//  Created by apple on 1/15/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class forgotpassVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    //MARK:- BUTTONS
    
    @IBAction func forgotBUTTON(_ sender: UIButton) {
        if email.text!.isEmpty {
            showAlert(title: "Error", text: "Enter Your Email!")
        }else{
            let param:Parameters = ["email":email.text!,
                                    "template":"email_reset"]
            let header = ["Content-Type":"application/json"]
            Alamofire.request("https://www.dev.conektr.com/index.php/rest/V1/customers/password",
                              method: .put,
                              parameters: param,
                              encoding: JSONEncoding.default,
                              headers: header).responseString { response in
                                switch response.result {
                                    
                                case .success(let data):
                                    self.alamoSuccess(data: data)
                                    
                                case .failure(let err):
                                    showAlert(title: "Error", text: err.localizedDescription)
                                }
            }
        }
    }
    
    func alamoSuccess(data:String){
        print(data)
        print(" true")
        if data == " true"  {
                    showAlert(title: "", text: "Email Successfully sent")
        }
        else{
            showAlert(title: "", text: "Email not Found!")
        }
    }
}
