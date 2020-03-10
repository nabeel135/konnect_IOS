//
//  Search.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/18/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


let menupop = mp()
class mp: UIView {
    var parentview = UIView()
    let body = UI()
    var popcate = MenuPopView()
    var language = UI()
    
    func Create(withinview:UIView) {
        
        menupop.parentview = withinview
        
        menupop.body.View(x: 0, y: withinview.frame.minY, width: withinview.frame.size.width, height: 200, bkcolor: UIColor(red: 242/255, green: 237/255, blue: 247/255, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: withinview)
        /*---------*/
        menupop.popcate = nibView(fileName: "MenuPopView", ownerClass: self) as! MenuPopView
        menupop.body.view.addSubview(menupop.popcate)
        menupop.popcate.frame = menupop.body.view.frame
        
        
        
        
        
        let l = UI()
        //        ,"Hindi","Bengali","Malayalam","Tamil","Urdu"
        l.ComboBox(["Choose Language","English","Arabic"], 0, x: 0, y: 5, width: 150, height: 40, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: .blue, cornerRadius: 0, editable: false, placeholder: "Choose Language", fontsize: 12, iconColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), listbkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), listTextcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: menupop.popcate) {
            menupop.Language()
        }
        menupop.language = l
        
        
        
        menupop.popcate.Input(any: self,
                              chooseCategory: #selector(menupop.Category(_:)),
                              promotion: #selector(menupop.promotionOffer),
                              cross: #selector(menupop.crossButton))
        /*---------*/
        
        menupop.body.view.frame.origin.y = y-70
        menupop.Appear()
    }
    
    
    
    
    @objc func crossButton(){
        menupop.disAppear()
    }
    
    func Appear() {
        Searchpop.body.view.frame.origin.y = y-70
        FooterMenu.searchButton(clicked: false)
        myCartpop.body.scrollview.frame.origin.y = y-70
        FooterMenu.myCartButton(clicked: false)
        myAccountpop.body.view.frame.origin.y = y-70
        FooterMenu.myAccountButton(clicked: false)
        
        
        menupop.parentview.isHidden = false
        UIView.animate(withDuration: 0.2) {
            menupop.body.view.frame.origin.y = y-70-menupop.body.view.frame.size.height
        }
    }
    func disAppear() {
        popsubcatview.disAppear()

        UIView.animate(withDuration: 0.2, animations: {
            menupop.body.view.frame.origin.y = y-70
        }) { (true) in
            menupop.parentview.isHidden = true
            FooterMenu.menuButton(clicked: false)
        }
    }
    
    
    
    
    
    //MARK:- BUTTONS
    
    // LANGUAGE
    func Language() {
        if menupop.language.comboBox.text_comboBox() == "Choose Language" {
            mylanguage = "en"
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController?.viewDidLoad()
            
        }
        else if menupop.language.comboBox.text_comboBox() == "English"{
            mylanguage = "en"
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController?.viewDidLoad()
        }
        else if menupop.language.comboBox.text_comboBox() == "Arabic"{
            mylanguage = "ar"
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController?.viewDidLoad()
        }
        else if menupop.language.comboBox.text_comboBox() == "Hindi"{
            mylanguage = "hi"
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController?.viewDidLoad()
        }
        else if menupop.language.comboBox.text_comboBox() == "Bengali"{
            mylanguage = "bn"
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController?.viewDidLoad()
        }
        else if menupop.language.comboBox.text_comboBox() == "Malayalam"{
            mylanguage = "ml"
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController?.viewDidLoad()
        }
        else if menupop.language.comboBox.text_comboBox() == "Tamil"{
            mylanguage = "ta"
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController?.viewDidLoad()
        }
        else if menupop.language.comboBox.text_comboBox() == "Urdu"{
            mylanguage = "ur"
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController?.viewDidLoad()
        }
        
        
    }
    
    
    
    // MARK:- BUTTONS
    
    
    /*---------------------------------------------------*/
    // PROMOTION OFFER
    @objc func promotionOffer(){
        self.disAppear()
        openSearchpage(heading: "Promotion Offers")
        loaderStart()
        Alamofire.request("https://www.dev.conektr.com/search_by_category.php?category_id=12",
                          method: .get,
                          parameters: nil,
                          headers: ["Accept":"application/json"]).responseData { response in
                            switch response.result {
                            case .success(let data):
                                let d = JSON(data)
                                searchProductobj.removeAll()
                                for obj in d["data"].arrayValue {
                                    let o = ss()
                                    o.distributorID = obj["distributor_id"].intValue
                                    o.distributorName = obj["distributor_name"].stringValue
                                    o.id = obj["id"].intValue
                                    o.sku = obj["sku"].stringValue
                                    o.title = obj["name"].stringValue
                                    o.typeId = obj["type_id"].stringValue
                                    
                                    obj["custom_attributes"].arrayValue.filter{ "small_image" == $0["attribute_code"].stringValue}.first.map{
                                        o.imagUrl = "https://www.dev.conektr.com/pub/media/catalog/product"+$0["value"].stringValue
                                    }
                                    obj["custom_attributes"].arrayValue.filter{ "pricing" == $0["attribute_code"].stringValue}.first.map{
                                        o.price = $0["value"].doubleValue
                                        o.pricing = $0["value"].stringValue
                                    }
                                    obj["custom_attributes"].arrayValue.filter{ "quantity_and_stock_status" == $0["attribute_code"].stringValue}.first.map{
                                        o.quantity = $0["value"].intValue
                                    }
                                    searchProductobj.append(o)
                                }
                                self.openSearchpage(heading: "Promotion Offers")
                                loaderEnd()
                            case .failure(let err):
                                print(err.localizedDescription)
                            }
        }
    }
    
    
    
    /*---------------------------------------------------*/
    // Selected Sub Category
    @objc func Category(_ catname:UIButton){
        self.disAppear()
        openSearchpage(heading: "")
        loaderStart()
        Alamofire.request("https://www.dev.conektr.com/search_by_category.php?category_id=\(catname.tag)",
            method: .get,
            parameters: nil,
            headers: ["Accept":"application/json"]).responseData { response in
                switch response.result {
                case .success(let data):
                    let d = JSON(data)
                    searchProductobj.removeAll()
                    for obj in d["data"].arrayValue {
                        let o = ss()
                        o.distributorID = obj["distributor_id"].intValue
                        o.distributorName = obj["distributor_name"].stringValue
                        o.id = obj["id"].intValue
                        o.sku = obj["sku"].stringValue
                        o.title = obj["name"].stringValue
                        o.typeId = obj["type_id"].stringValue
                        
                        obj["custom_attributes"].arrayValue.filter{ "small_image" == $0["attribute_code"].stringValue}.first.map{
                            o.imagUrl = "https://www.dev.conektr.com/pub/media/catalog/product"+$0["value"].stringValue
                        }
                        obj["custom_attributes"].arrayValue.filter{ "pricing" == $0["attribute_code"].stringValue}.first.map{
                            o.price = $0["value"].doubleValue
                            o.pricing = $0["value"].stringValue
                        }
                        obj["custom_attributes"].arrayValue.filter{ "quantity_and_stock_status" == $0["attribute_code"].stringValue}.first.map{
                            o.quantity = $0["value"].intValue
                        }
                        searchProductobj.append(o)
                    }
                    self.openSearchpage(heading: "")
                    loaderEnd()
                case .failure(let err):
                    print(err.localizedDescription)
                }
        }
        
        
        
    }
    
    
    func openSearchpage(heading:String){
        
        
        search.create(heading: heading, login: UserDefaults.standard.bool(forKey: "IsLogined"), view: bodyfor.SearchResult.scrollview)
        
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.disAppear()
        Distributor.disAppear()
        //                    search.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = true
        bodyfor.submitquote.scrollview.isHidden = true
        
        // footerBar
        Searchpop.disAppear()
        myCartpop.disAppear()
        myAccountpop.disAppear()
        menupop.disAppear()
        
        // footerBar linked pages
        
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
        bodyfor.orderdetail.scrollview.isHidden = true
        
        bodyfor.shoplist.scrollview.isHidden = true
        bodyfor.reorder.scrollview.isHidden = true
        
        bodyfor.quotelist.scrollview.isHidden = true
        bodyfor.quotedetial.scrollview.isHidden = true
    }
    
    
}
