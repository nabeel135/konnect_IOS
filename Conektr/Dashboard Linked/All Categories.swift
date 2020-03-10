////
////  AllCategories.swift
////  Conektr
////
////  Created by Mr. Nabeel on 12/19/19.
////  Copyright © 2019 Mr. Nabeel. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//let AllCategories = ac()
//class ac: UIView {
//
//    // variables
//    var parentbody = UIScrollView()
//    var heading = UI()
//    var image:[UI] = []
//
//    func Create(images:[UIImage],titles:[String],view:UIScrollView) {
//        AllCategories.parentbody = view
//        AllCategories.heading.AutoSizeLabel(x: 20, y: 0, height: 50, txt: "ALL CATEGORIES", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
//        //////////////////////////////// create dynamic
//        let cx = x/3
//        var index = 0
//
//        let _x:CGFloat = 25
//        let _y:CGFloat = 5
//        let _width:CGFloat = cx-45
//        var top = AllCategories.heading.autoSizelabel.frame.maxY
//        for i in 0..<images.count {
//            AllCategories.image.append(UI())
//            if i>2 {
//                index = i%3
//                top = AllCategories.image[i-3].view.frame.maxY
//            }
//            else{index=i}
//            AllCategories.image[i].View(x: cx*CGFloat(index), y: top, width: x/3, height: x/3, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: view)
//            AllCategories.image[i].Image(x: _x, y: _y, width: _width, height: _width, mode: .scaleToFill, src: images[i], view: AllCategories.image[i].view, imageUrl: nil)
//            AllCategories.image[i].Label(x: 0, y: AllCategories.image[i].imag.frame.maxY, width: cx, height: 40, txt: titles[i], fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: AllCategories.image[i].view)
//            AllCategories.image[i].view.tag = i
//            AllCategories.image[i].imag.tag = i
//            AllCategories.image[i].label.tag = i
//            AllCategories.image[i].view.addGestureRecognizer(UITapGestureRecognizer(target: AllCategories, action: #selector(AllCategories.categorieButton(_:))))
//            view.contentSize.height = AllCategories.image[i].view.frame.maxY
//        }
//
//        AllCategories.Appear()
//    }
//
//    func Appear() {
//        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
//        AllCategories.parentbody.isHidden = false
//    }
//    func disAppear() {
//        AllCategories.parentbody.isHidden = true
//
//    }
//
//
//    @objc func categorieButton(_ tap:UITapGestureRecognizer){
//        print("categorie: \(tap.view!.tag)")
//    }
//}

//
//  AllCategories.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/19/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


let AllCategories = ac()

var rawcatlist:[catlist] = []
class catlist{
    var id = Int()
//    var imag = UIImage()
    var name = String()
}

class ac: UIView {
    
    // variables
    var parentbody = UIScrollView()
    var heading = UI()
    var image:[UI] = []
    let imagesarr = [
        UIImage(named: "static_Beverages"),
        UIImage(named: "static_Biscuits"),
        UIImage(named: "static_Confectionery"),
        UIImage(named: "static_Oil"),
        UIImage(named: "static_Tobacco")]
    
    
    
    func _listincrement() {
        rawcatlist.removeAll()
        menuCateobj.map{
            if($0.name != "Promotion Offer"){
                //level 1
                let a = catlist()
                a.id = $0.id
                a.name = $0.name
                rawcatlist.append(a)
            }
            
            $0.sub.map{
                //level 2
                let b = catlist()
                b.id = $0.id
                b.name = $0.name
                rawcatlist.append(b)
                
                $0.sub.map{
                    //level 3
                    let c = catlist()
                    c.id = $0.id
                    c.name = $0.name
                    rawcatlist.append(c)
                }
            }
        }
        
        
    }
    
    
    
    //MARK:- CREATE
    func Create(images:[UIImage],titles:[String],view:UIScrollView) {
        AllCategories._listincrement()
        AllCategories.parentbody = view
        AllCategories.heading.AutoSizeLabel(x: 20, y: 0, height: 50, txt: "ALL CATEGORIES", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        ////////////////////////////// create dynamic
        let cx = x/3
        var index = 0
        
        let _x:CGFloat = 25
        let _y:CGFloat = 5
        let _width:CGFloat = cx-45
        var top = AllCategories.heading.autoSizelabel.frame.maxY
        for i in 0..<rawcatlist.count {
            AllCategories.image.append(UI())
            if i>2 {
                index = i%3
                top = AllCategories.image[i-3].view.frame.maxY
            }
            else{index=i}
            AllCategories.image[i].View(x: cx*CGFloat(index), y: top, width: x/3, height: x/3, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: view)
            AllCategories.image[i].Image(x: _x, y: _y, width: _width, height: _width, mode: .scaleToFill, src: UIImage(named: rawcatlist[i].name) ?? UIImage(), view: AllCategories.image[i].view)
            AllCategories.image[i].Label(x: 0, y: AllCategories.image[i].imag.frame.maxY, width: cx, height: 40, txt: rawcatlist[i].name, fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: AllCategories.image[i].view)
            AllCategories.image[i].view.tag = rawcatlist[i].id
            AllCategories.image[i].imag.tag = rawcatlist[i].id
            AllCategories.image[i].label.tag = rawcatlist[i].id
            AllCategories.image[i].view.addGestureRecognizer(UITapGestureRecognizer(target: AllCategories, action: #selector(AllCategories.categorieButton(_:))))
            view.contentSize.height = AllCategories.image[i].view.frame.maxY
        }
        
        
        
        
        AllCategories.Appear()
    }
    
    func Appear() {
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
        AllCategories.parentbody.isHidden = false
    }
    func disAppear() {
        AllCategories.parentbody.isHidden = true
        
    }
    
    
    @objc func categorieButton(_ tap:UITapGestureRecognizer){
        print("categorie: \(tap.view!.tag)")
        openSearchpage()
        loaderStart()
        Alamofire.request("https://www.dev.conektr.com/search_by_category.php?category_id=\(tap.view!.tag)",
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
                                self.openSearchpage()
                                loaderEnd()
                            case .failure(let err):
                                print(err.localizedDescription)
                            }
        }
        
        
        
    }
    
    
    func openSearchpage(){
        search.create(heading: "", login: UserDefaults.standard.bool(forKey: "IsLogined"), view: bodyfor.SearchResult.scrollview)
        
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.disAppear()
        Distributor.disAppear()
//        search.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = true
        bodyfor.submitquote.scrollview.isHidden = true
        
//        // footerBar
//        Searchpop.disAppear()
//        myCartpop.disAppear()
//        myAccountpop.disAppear()
//        menupop.disAppear()
        
        

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
