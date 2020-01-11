//
//  CreateAccount.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/3/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class createAccountVC: UIViewController {
    
        
    // MARK:- BUTTONS
    
    @IBAction func chooseFile(_ sender: Any) {
        print("choose file")
    }
    
    @IBAction func getOTP(_ sender: Any) {
        print("get otp")
    }
    
    @IBAction func createAccount(_ sender: Any) {
        print("create account")
    }
    
    @IBAction func back(_ sender: Any) {
        print("back")
    }
    
    @IBAction func AcceptContitions(_ sender: UIButton) {

        if sender.currentImage == UIImage(named: "checktrue") {
            sender.setImage(UIImage(named: "checkfalse"), for: .normal)
        }
        else{
            sender.setImage(UIImage(named: "checktrue"), for: .normal)
        }
    }
    
    
    
    
    
    
    // MARK:- IBoutlet
    
    @IBOutlet weak var body: UIScrollView!
    @IBOutlet weak var shopname: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var comfirmpasswrod: UITextField!
    @IBOutlet weak var countryframe: UIView!
    @IBOutlet weak var emirateframe: UIView!
    @IBOutlet weak var area1frame: UIView!
    @IBOutlet weak var area2frame: UIView!
    @IBOutlet weak var mobileNo: UITextField!
    @IBOutlet weak var postalCode: UITextField!
    @IBOutlet weak var channelframe: UIView!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var telephoneNo: UITextField!
    @IBOutlet weak var landmark: UITextField!
    @IBOutlet weak var vdcodeframe: UIView!
    @IBOutlet weak var licenseNo: UITextField!
    @IBOutlet weak var chooselabel: UILabel!
    @IBOutlet weak var otp: UITextField!
    
    
    
    
    
    
    // MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
