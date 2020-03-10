//
//  Shopping Cart.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/19/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

let allBrands = ab()
class ab: UIView {
    var heading = UI()
    var image:[UI] = []
    
    // variable
    var parentbody = UIScrollView()
    
    func Create(view:UIScrollView) {
        allBrands.parentbody = view
        
        
        allBrands.parentbody = view
        allBrands.heading.AutoSizeLabel(x: 20, y: 0, height: 50, txt: "ALL BRANDS", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        
        //////////////////////////////// create dynamic
        let cx = x/3
        var index = 0
        var top = allBrands.heading.autoSizelabel.frame.maxY
        for i in 0..<allbrandobj.count {
            allBrands.image.append(UI())
            if i>2 {
                index = i%3
                top = allBrands.image[i-3].view.frame.maxY
            }
            else{index=i}
            allBrands.image[i].View(x: cx*CGFloat(index), y: top, width: cx, height: (cx/100)*75, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: view)
            allBrands.image[i].Image(x: 0, y: 0, width: cx, height: (cx/100)*75, mode: .scaleToFill, src: allbrandobj[i].image, view: allBrands.image[i].view, imageUrl: allbrandobj[i].imgurl)
            allBrands.image[i].view.tag = allbrandobj[i].id
            allBrands.image[i].imag.tag = allbrandobj[i].id
            allBrands.image[i].view.addGestureRecognizer(UITapGestureRecognizer(target: allBrands, action: #selector(allBrands.brandButton(_:))))
            view.contentSize.height = allBrands.image[i].view.frame.maxY
        }
        
        
        
        allBrands.Appear()
    }
    
    func Appear(){
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
        allBrands.parentbody.isHidden = false
    }
    func disAppear() {
        allBrands.parentbody.isHidden = true
    }
    
    
    @objc func brandButton(_ tap:UITapGestureRecognizer){
        print("brand: \(tap.view!.tag)")
        openSearchpage(heading: allbrandobj.filter{$0.id == tap.view!.tag}.first!.title)
        loaderStart()
        Alamofire.request("http://www.dev.conektr.com/search_by_brands.php?brand_id=\(tap.view!.tag)",
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
                                self.openSearchpage(heading: allbrandobj.filter{$0.id == tap.view!.tag}.first!.title)
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
        //                search.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = true
        bodyfor.submitquote.scrollview.isHidden = true
        
        // footerBar
        //                Searchpop.disAppear()
        //                myCartpop.disAppear()
        //                myAccountpop.disAppear()
        //                menupop.disAppear()
        
        
        
        
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
