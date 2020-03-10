//
//  CreateAccount.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/3/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import DropDown
import Alamofire
import SwiftyJSON

class createAccountVC: UIViewController, UITextFieldDelegate {
    
    // MARK:- IBoutlet
    
    @IBOutlet weak var body: UIScrollView!
    @IBOutlet weak var shopname: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpassword: UITextField!
    @IBOutlet weak var countryframe: UIView!
    @IBOutlet weak var countryTextfield: UITextField!
    @IBOutlet weak var emirateframe: UIView!
    @IBOutlet weak var stateTextfield: UITextField!
    @IBOutlet weak var area1frame: UIView!
    @IBOutlet weak var cityTextfield: UITextField!
    @IBOutlet weak var area2frame: UIView!
    @IBOutlet weak var streetTextfield: UITextField!
    
    @IBOutlet weak var mobileNo: UITextField!
    @IBOutlet weak var postalCode: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var telephoneNo: UITextField!
    @IBOutlet weak var landmark: UITextField!
    @IBOutlet weak var licenseNo: UITextField!
    @IBOutlet weak var VATTRNnoTextfield: UITextField!
    
    // MARK:- Variables
    var countryDropDown = DropDown()
    var regionDropDowwn = DropDown()
    var selectedCountryIndex:Int = -1
    
    // MARK:- Arrays
    var arraySignupCountries:[String] = []
    var regions:[String] = []
    var arrayRegions:[[String]] = []
    
    
    // MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        body.contentSize.width = x
        countryTextfield.delegate = self
        
    }
    
    // MARK:- VIEW DID APPEAR
    override func viewDidAppear(_ animated: Bool) {
        getCountries()
    }
    
    
    
    //Country Handler will handle the CountryTextfield
    func countryDDFunc(){
        let tapCity = UITapGestureRecognizer(target: self, action: #selector(self.handleCountryDD(_:)))
        countryTextfield.addGestureRecognizer(tapCity)
        countryDropDown.anchorView = countryTextfield
        countryDropDown.dataSource = arraySignupCountries
    }
    @objc func handleCountryDD(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        countryDropDown.show()
        countryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.countryTextfield.text = item
            self.selectedCountryIndex = index
            self.regionDDFunc()
        }
    }
    func regionDDFunc(){
        let tapCity = UITapGestureRecognizer(target: self, action: #selector(self.handleRegionDD(_:)))
        stateTextfield.addGestureRecognizer(tapCity)
        regionDropDowwn.anchorView = countryTextfield
        regionDropDowwn.dataSource = arrayRegions[selectedCountryIndex]
    }
    @objc func handleRegionDD(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        regionDropDowwn.show()
        regionDropDowwn.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.stateTextfield.text = item
        }
    }
    
    //This function will get the total countries for the country dropdown
    func getCountries(){
        Alamofire.request("https://www.dev.conektr.com/index.php/rest/V1/directory/countries", method: .get).responseData { response in
            switch response.result{
            case.success(let value):
                let json = JSON(value).arrayValue
                //self.arraySignupCountries.removeAll()
                for var i in (0..<Int(json.count)) {
                    
                    let jsonObject = json[i]
                    self.arraySignupCountries.append(jsonObject["full_name_english"].string!)
                    
                    let availableRegion = jsonObject["available_regions"].arrayValue
                    self.regions.removeAll()
                    for i in availableRegion{
                        self.regions.append(i["name"].stringValue)
                    }
                    self.arrayRegions.append(self.regions)
                }
                self.countryDDFunc()
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    

    
    // MARK:- BUTTONS
    

    
    @IBAction func back(_ sender: Any) {
        print("back")
    }
    
    var acceptTerm = false
    @IBAction func AcceptContitions(_ sender: UIButton) {

        if sender.currentImage == UIImage(named: "checktrue") {
            sender.setImage(UIImage(named: "checkfalse"), for: .normal)
            acceptTerm = false
        }
        else{
            sender.setImage(UIImage(named: "checktrue"), for: .normal)
            acceptTerm = true
        }
    }
    
    var msg = ""
    func validationErr()->Bool{
        var ret = true
        
        if acceptTerm == false {
            msg = "Accept Term & Condition"
            ret = true
        }
        else{
            if shopname.text!.isEmpty || firstname.text!.isEmpty || lastname.text!.isEmpty || email.text!.isEmpty || password.text!.isEmpty || confirmpassword.text!.isEmpty || countryTextfield.text!.isEmpty || stateTextfield.text!.isEmpty || cityTextfield.text!.isEmpty || streetTextfield.text!.isEmpty || mobileNo.text!.isEmpty || postalCode.text!.isEmpty || latitude.text!.isEmpty || longitude.text!.isEmpty || telephoneNo.text!.isEmpty || landmark.text!.isEmpty || licenseNo.text!.isEmpty || VATTRNnoTextfield.text!.isEmpty {
                msg = "TextField Should not be Empty!"
                ret = true
            }
            else{
                if password.text != confirmpassword.text {
                    msg = "Password not matched!"
                    ret = true
                }
                else{
                    ret = false
                }
            }
        }
        return ret
    }
    // MARK:- Sign up API
    @IBAction func createAccount(_ sender: Any) {
        getCountryandRegion(runAfer: {
            self.signupAPI()
        })
        
    }
    
    func alamoSuccess(data:Data){
        let d = JSON(data)
        if d["message"].stringValue.isEmpty  {
                    showAlert(title: "", text: "Successfully created!")
        }
        else{
            showAlert(title: "Error", text: d["message"].stringValue)
        }
    }
    
    
    func signupAPI(){
        if validationErr() {
            showAlert(title: "Error", text: msg)
        }
        else{
            print("result: \(CountryandRegionListobj.filter{$0.name == countryTextfield.text!}.first!.regions.filter{$0.name == stateTextfield.text!}.first!.code)")
            /*----------------------------*/
            let param:Parameters = [
                "customer": [
                    "email": email.text!,
                    "firstname": firstname.text!,
                    "lastname": lastname.text!,
                    "addresses": [[
                        "defaultShipping": true,
                        "defaultBilling": true,
                        "firstname": firstname.text!,
                        "lastname": lastname.text!,
                        "region": [
                            "regionCode": CountryandRegionListobj.filter{$0.name == countryTextfield.text!}.first!.regions.filter{$0.name == stateTextfield.text!}.first!.code,
                            "region": stateTextfield.text!,
                            "regionId":CountryandRegionListobj.filter{$0.name == countryTextfield.text!}.first!.regions.filter{$0.name == stateTextfield.text!}.first!.id
                        ],
                        "postcode": postalCode.text!,
                        "street": [streetTextfield.text!],
                        "city": cityTextfield.text!,
                        "telephone": telephoneNo.text!,
                        "countryId": CountryandRegionListobj.filter{$0.name == countryTextfield.text!}.first!.code,
                        "company": shopname.text!
                        ]],
                    "custom_attributes": [
                        [
                            "attribute_code": "retailer_latitude",
                            "value": latitude.text!
                        ],
                        [
                            "attribute_code": "retailer_longitude",
                            "value": longitude.text!
                        ],
                        [
                            "attribute_code": "contact_no_land_retailer",
                            "value": mobileNo.text!
                        ],
                        [
                            "attribute_code": "nearest_landmark_retailer",
                            "value": landmark.text!
                        ],
                        [
                            "attribute_code": "promoter_code",
                            "value": ""
                        ],
                        [
                            "attribute_code": "promoter_vdcode",
                            "value": ""
                        ],
                        [
                            "attribute_code": "trade_license_number_retailer",
                            "value": licenseNo.text!
                        ],
                        [
                            "attribute_code": "trn_no_retailer",
                            "value": VATTRNnoTextfield.text!
                        ]
                    ]
                ],
                "password": password.text!
            ]
            
            let header = [
                "Authorization":"Bearer vnr9k3f3xjly2kpsra4gf56zgsodpzee",
                "Content-Type":"application/json"
            ]
            Alamofire.request("https://www.dev.conektr.com/index.php/rest/V1/customers",
                              method: .post,
                              parameters: param,
                              encoding: JSONEncoding.default,
                              headers: header).responseData { response in
                                switch response.result {
                                    
                                    
                                case .success(let data):
                                    self.alamoSuccess(data: data)
                                    
                                    
                                    
                                case .failure(let err):
                                    print("fail")
                                    print(err.localizedDescription)
                                }
            }
            
            /*----------------------------*/
        }
    }
    
    
    
    
    
    // Mark:- get country and region
    
    func getCountryandRegion(runAfer:@escaping () -> Void) {
        Alamofire.request("https://www.dev.conektr.com/index.php/rest/V1/directory/countries",
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: ["Accept":"application/json"]).responseData { response in
                            switch response.result {
                            case .success(let data):
                                
                                CountryandRegionListobj.removeAll()
                                
                                let d = JSON(data)
                                for obj in d.arrayValue {
                                    let o = countrylist()
                                    o.id = obj["id"].stringValue
                                    o.code = obj["two_letter_abbreviation"].stringValue
                                    o.name = obj["full_name_english"].stringValue
                                    for obj2 in obj["available_regions"].arrayValue {
                                        let r = regionlist()
                                        r.id = obj2["id"].stringValue
                                        r.code = obj2["code"].stringValue
                                        r.name = obj2["name"].stringValue
                                        o.regions.append(r)
                                    }
                                    CountryandRegionListobj.append(o)
                                }
                                runAfer()
                            case .failure(let err):
                                print("signup: \(err.localizedDescription)")
                            }
        }
    }
    
}






// MARK:- Country & Region

var CountryandRegionListobj:[countrylist] = []
class countrylist{
    var id = String()
    var code = String()
    var name = String()
    var regions:[regionlist] = []
}
class regionlist{
    var id = String()
    var code = String()
    var name = String()
}
