//
//  Edit Account.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/15/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class myaccountVC: UIViewController {
    
    //MARK:- API
    func getcustomerDetail(){
        
        let header = [
            "Authorization":"Bearer \(UserDefaults.standard.string(forKey: "Token")!)",
            "Content-Type":"application/json"
            ]
            Alamofire.request("https://www.dev.conektr.com/index.php/rest/V1/customers/me",
                              method: .get,
                              parameters: nil,
                              headers: header).responseData { response in
        
        
                                        switch response.result {
        
        
                                        case .success(let data):
                                            self.alamoSuccess(data: data)
        
        
        
                                        case .failure(let err):
                                            showAlert(title: "Error", text: err.localizedDescription)
                                        }
                }
    }
    
    func alamoSuccess(data:Data){
        let d = JSON(data).dictionaryValue
        
        customerDetailobj.id = d["id"]!.intValue
        customerDetailobj.group_id = d["group_id"]!.intValue
        customerDetailobj.default_billing = d["default_billing"]!.stringValue
        customerDetailobj.default_shipping = d["default_shipping"]!.stringValue
        customerDetailobj.created_at = d["created_at"]!.stringValue
        customerDetailobj.updated_at = d["updated_at"]!.stringValue
        customerDetailobj.created_in = d["created_in"]!.stringValue
        customerDetailobj.email = d["email"]!.stringValue
        customerDetailobj.firstname = d["firstname"]!.stringValue
        customerDetailobj.lastname = d["lastname"]!.stringValue
        customerDetailobj.gender = d["gender"]!.stringValue
        customerDetailobj.store_id = d["store_id"]!.intValue
        customerDetailobj.taxvat = d["taxvat"]!.stringValue
        customerDetailobj.website_id = d["website_id"]!.intValue
//            customerDetailobj.addresses.append(<#T##newElement: custaddr##custaddr#>)
//
        customerDetailobj.disable_auto_group_change = d["disable_auto_group_change"]!.intValue
        customerDetailobj.is_subscribed = d["extension_attributes"]!.dictionary!["is_subscribed"]!.boolValue
//
//        //custom attribute
        
        d["custom_attributes"]!.arrayValue.map{
            if $0["attribute_code"].stringValue == "route"{
                customerDetailobj.route = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "retailer_channel"{
                customerDetailobj.retailer_channel = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "promoter_vdcode"{
                        customerDetailobj.promoter_vdcode = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "mobilenumber"{
                customerDetailobj.mobilenumber = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "trade_license_number_retailer"{
                customerDetailobj.trade_license_number_retailer = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "legal_entity_name_retailer"{
                customerDetailobj.legal_entity_name_retailer = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "contact_no_land_retailer"{
                customerDetailobj.contact_no_land_retailer = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "nearest_landmark_retailer"{
                customerDetailobj.nearest_landmark_retailer = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "trn_no_retailer"{
                customerDetailobj.trn_no_retailer = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "retailer_latitude"{
                customerDetailobj.retailer_latitude = $0["value"].stringValue
            }
            if $0["attribute_code"].stringValue == "retailer_longitude"{
                customerDetailobj.retailer_longitude = $0["value"].stringValue
            }
//            print($0["value"].stringValue)
        }
//        customerDetailobj.b2b_activasion_status =
        
    }
    
    
    
    
    
    
    //MARK:- IBoutlet
    
    @IBOutlet weak var body: UIScrollView!
    @IBOutlet var bodyview: UIView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var billingline1: UILabel!
    @IBOutlet weak var billingline2: UILabel!
    @IBOutlet weak var billingline3: UILabel!
    @IBOutlet weak var billingline4: UILabel!
    @IBOutlet weak var billingline5: UILabel!
    

    
    
    
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        body.frame = CGRect(x: 0, y: 0, width: x, height: y-70)
        body.addSubview(bodyview)
        bodyview.frame = CGRect(x: 0, y: 0, width: x, height: 1065)
        body.contentSize.height = bodyview.frame.maxY
        
        
        getcustomerDetail()
        
    }
    
    
    
    //MARK:- BUTTONS
    @IBAction func editBUTTON(_ sender: Any) {
        // footerBar linked pages
        search.disAppear()
        
        shoppingCart.disAppear()
        Checkout.disAppear()
        
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        bodyfor.forgotPassword.scrollview.isHidden = true
        
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.changepass.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = false
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addaddress.scrollview.isHidden = true
        
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.orderdetail.scrollview.isHidden = true
        
        bodyfor.shoplist.scrollview.isHidden = true
        bodyfor.reorder.scrollview.isHidden = true
        
        bodyfor.quotelist.scrollview.isHidden = true
        bodyfor.quotedetial.scrollview.isHidden = true
        
        addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: EditAccountInformationVC(), view: bodyfor.Editaccount.scrollview)
        
        /*------------- code form here --------------*/
    }
    
    @IBAction func changepasswordBUTTON(_ sender: Any) {
        // footerBar linked pages
        search.disAppear()
        
        shoppingCart.disAppear()
        Checkout.disAppear()
        
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        bodyfor.forgotPassword.scrollview.isHidden = true
        
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.changepass.scrollview.isHidden = false
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addaddress.scrollview.isHidden = true
        
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.orderdetail.scrollview.isHidden = true
        
        bodyfor.shoplist.scrollview.isHidden = true
        bodyfor.reorder.scrollview.isHidden = true
        
        bodyfor.quotelist.scrollview.isHidden = true
        bodyfor.quotedetial.scrollview.isHidden = true

        addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: storyboardView(boardName: "main", pageID: "changepasswordVC"), view: bodyfor.changepass.scrollview)
        /*-------------- code from here -----------------*/

        
    }
    
    @IBAction func manageAddressBUTTON(_ sender: Any) {
        // footerBar linked pages
        search.disAppear()
        
        shoppingCart.disAppear()
        Checkout.disAppear()
        
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        bodyfor.forgotPassword.scrollview.isHidden = true
        
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.changepass.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = false
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addaddress.scrollview.isHidden = true
        
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.orderdetail.scrollview.isHidden = true
        
        bodyfor.shoplist.scrollview.isHidden = true
        bodyfor.reorder.scrollview.isHidden = true
        
        bodyfor.quotelist.scrollview.isHidden = true
        bodyfor.quotedetial.scrollview.isHidden = true

        addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: AddressBookVC(), view: bodyfor.addressbook.scrollview)
        /*-------------- code from here -----------------*/

        
    }
    
    @IBAction func editBillingaddressBUTTON(_ sender: Any) {
        // footerBar linked pages
        search.disAppear()
        
        shoppingCart.disAppear()
        Checkout.disAppear()
        
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        bodyfor.forgotPassword.scrollview.isHidden = true
        
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.changepass.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = false
        bodyfor.addaddress.scrollview.isHidden = true
        
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.orderdetail.scrollview.isHidden = true
        
        bodyfor.shoplist.scrollview.isHidden = true
        bodyfor.reorder.scrollview.isHidden = true
        
        bodyfor.quotelist.scrollview.isHidden = true
        bodyfor.quotedetial.scrollview.isHidden = true

        addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: EditAddressVC(), view: bodyfor.Editaddress.scrollview)
        /*-------------- code from here -----------------*/

        
    }
    
    @IBAction func shipaddressBUTTON(_ sender: Any) {
        // footerBar linked pages
        search.disAppear()
        
        shoppingCart.disAppear()
        Checkout.disAppear()
        
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        bodyfor.forgotPassword.scrollview.isHidden = true
        
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.changepass.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = false
        bodyfor.addaddress.scrollview.isHidden = true
        
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.orderdetail.scrollview.isHidden = true
        
        bodyfor.shoplist.scrollview.isHidden = true
        bodyfor.reorder.scrollview.isHidden = true
        
        bodyfor.quotelist.scrollview.isHidden = true
        bodyfor.quotedetial.scrollview.isHidden = true

        addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: EditAddressVC(), view: bodyfor.Editaddress.scrollview)
        /*-------------- code from here -----------------*/
    }
    
    @IBAction func allOrderBUTTON(_ sender: Any) {
        // footerBar linked pages
        search.disAppear()
        
        shoppingCart.disAppear()
        Checkout.disAppear()
        
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        bodyfor.forgotPassword.scrollview.isHidden = true
        
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.changepass.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addaddress.scrollview.isHidden = true
        
        bodyfor.orderlist.scrollview.isHidden = false
        bodyfor.orderdetail.scrollview.isHidden = true
        
        bodyfor.shoplist.scrollview.isHidden = true
        bodyfor.reorder.scrollview.isHidden = true
        
        bodyfor.quotelist.scrollview.isHidden = true
        bodyfor.quotedetial.scrollview.isHidden = true

        addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: orderlistVC(), view: bodyfor.orderlist.scrollview)
        /*-------------- code from here -----------------*/
    }
    
    @IBAction func vieworderBUTTON(_ sender: Any) {
        // footerBar linked pages
        search.disAppear()
        
        shoppingCart.disAppear()
        Checkout.disAppear()
        
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        bodyfor.forgotPassword.scrollview.isHidden = true
        
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.changepass.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addaddress.scrollview.isHidden = true
        
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.orderdetail.scrollview.isHidden = false
        
        bodyfor.shoplist.scrollview.isHidden = true
        bodyfor.reorder.scrollview.isHidden = true
        
        bodyfor.quotelist.scrollview.isHidden = true
        bodyfor.quotedetial.scrollview.isHidden = true

        addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: storyboardView(boardName: "orderDetail", pageID: "orderDetailVC"), view: bodyfor.orderdetail.scrollview)
        /*-------------- code from here -----------------*/
    }
    
    @IBAction func reorderBUTTON(_ sender: Any) {
        print("reorder")
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
