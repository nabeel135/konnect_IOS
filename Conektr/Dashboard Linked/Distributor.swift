//
//  Distributor.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

let Distributor = d()
class d: UIView {
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var parentbody = UIScrollView()
    let header = UI()
    
    
    
    
    func create(view:UIScrollView) {
        Distributor.parentbody = view
        
        //HEADER
        Distributor.header.Label(x: 10, y: 0, width: x-50, height: 50, txt: "Distributor", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view)
        Distributor.header.clickableimage(x: x-40, y: 0, width: 30, height: 40, image: UIImage(named: "quote")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Distributor.quoteButton(_:)), any: Distributor, view: view)
        Distributor.header.View(x: 0, y: Distributor.header.label.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        
        
        
        
        Alamofire.request(URL(string: "http://www.dev.conektr.com/distributors.php/")!,
                          method: .get,
                          parameters: nil,
                          headers: ["Accept":"application/json"]).responseData { (response) in
                            switch response.result{
                            case .success(let data):
                                let result = JSON(data)
                                distributorObj.removeAll()
                                
                                let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                                weak var weakSelf = dashboard
                                AlertHelper.showLoadingAlert(WithTitle: "Loading...", OnView: weakSelf!.view, Animated: false)
                                
                                for obj in result["data"].arrayValue {
                                    if obj["status"].stringValue == "approved" {
                                        let o = distdata()
                                        o.id = obj["entity_id"].intValue
                                        o.imagurl = "https://www.dev.conektr.com/pub/media/catalog/product/cache/135x135/logo/"+obj["company_logo"].stringValue
                                        o.title = obj["public_name"].stringValue
                                        o.contact_person = obj["contact_person"].stringValue
                                        o.email = obj["email"].stringValue
                                        o.region = obj["region"].stringValue
                                        o.city = obj["city"].stringValue
                                        o.address = obj["address"].stringValue
                                        o.status = obj["status"].stringValue
                                        distributorObj.append(o)
                                    }
                                    
                                }
                                time.delay(sec: 2) {
                                    AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
                                }
                                // LAYOUT CHANGER
                                self.layoutChanger()
                            case .failure(let err):
                                print(err.localizedDescription)
                            }
        }
        
        
        
        
        Distributor.Appear()
    }
    
    func Appear(){
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
        Distributor.parentbody.isHidden = false
    }
    func disAppear() {
        Distributor.parentbody.isHidden = true
    }
    
    
    let layout = UI()
    let grid = UI()
    let list = UI()
    let sort = UI()
    
    func layoutChanger() {
        Distributor.layout.View(x: 10, y: Distributor.header.view.frame.maxY+10, width: x-20, height: 50, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 5, border: 0, borderColor: .clear, view: Distributor.parentbody)
        
        Distributor.grid.clickableimage(x: 20, y: Distributor.header.view.frame.maxY+20, width: 30, height: 30, image: UIImage(named: "gridtrue")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Distributor.layoutChangeButton(_:)), any: Distributor, view: Distributor.parentbody)
        Distributor.list.clickableimage(x: 60, y: Distributor.header.view.frame.maxY+20, width: 30, height: 30, image: UIImage(named: "listfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Distributor.layoutChangeButton(_:)), any: Distributor, view: Distributor.parentbody)
        Distributor.addDistributors(gird: true)
    }
    @objc func layoutChangeButton(_ btn:UIButton){
        if btn.currentBackgroundImage == UIImage(named: "gridfalse") {
            Distributor.grid.clickableimg.setBackgroundImage(UIImage(named: "gridtrue")!, for: .normal)
            Distributor.list.clickableimg.setBackgroundImage(UIImage(named: "listfalse"), for: .normal)
            /*-------------*/
            Distributor.addDistributors(gird: true)
        }
        else if (btn.currentBackgroundImage == UIImage(named: "listfalse")){
            Distributor.grid.clickableimg.setBackgroundImage(UIImage(named: "gridfalse")!, for: .normal)
            Distributor.list.clickableimg.setBackgroundImage(UIImage(named: "listtrue"), for: .normal)
            /*-------------*/
            Distributor.addDistributors(gird: false)
        }
    }
    
    
    
    
    
    
    var dview:[UI] = []
    var dimag:[UI] = []
    var dtitle:[UI] = []
    func addDistributors(gird:Bool) {
        for obj in Distributor.dview {obj.view.removeFromSuperview()}
        for obj in Distributor.dimag {obj.imag.removeFromSuperview()}
        for obj in Distributor.dtitle {obj.label.removeFromSuperview()}
        Distributor.dview.removeAll()
        Distributor.dimag.removeAll()
        Distributor.dtitle.removeAll()
        if gird {
            //////////////////////////////// create dynamic grid
            let cx = x/2
            var index = 0
            var top = Distributor.layout.view.frame.maxY+10
            
            for i in 0..<distributorObj.count {
                Distributor.dview.append(UI())
                Distributor.dimag.append(UI())
                Distributor.dtitle.append(UI())
                
                if i>1 {
                    index = i%2
                    top = Distributor.dview[i-2].view.frame.maxY
                }
                else{index=i}
                
                Distributor.dview[i].View(x: cx*CGFloat(index), y: top, width: x/2, height: x/2, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: Distributor.parentbody)
                Distributor.dview[i].view.tag = distributorObj[i].id
                Distributor.dimag[i].Image(x: 20, y: 0, width: (x/2)-40, height: (x/2)-40, mode: .scaleAspectFit, src: UIImage(), view: Distributor.dview[i].view, imageUrl: distributorObj[i].imagurl)
                Distributor.dtitle[i].Label(x: 0, y: (x/2)-40, width: x/2, height: 40, txt: distributorObj[i].title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center
                    , bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Distributor.dview[i].view)
                Distributor.dview[i].view.addGestureRecognizer(UITapGestureRecognizer(target: Distributor, action: #selector(Distributor.clickonDistButton(_:))))
                Distributor.parentbody.contentSize.height = Distributor.dview[i].view.frame.maxY + 10
            }
        }
        else{
            //////////////////////////////// create dynamic list
            var top = Distributor.layout.view.frame.maxY+10
            
            for i in 0..<distributorObj.count {
                Distributor.dview.append(UI())
                Distributor.dimag.append(UI())
                Distributor.dtitle.append(UI())
                Distributor.dview[i].View(x: 0, y: top, width: x, height: 140, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: Distributor.parentbody)
                Distributor.dview[i].view.tag = distributorObj[i].id
                Distributor.dimag[i].Image(x: 10, y: 10, width: 120, height: 120, mode: .scaleAspectFit, src: UIImage(), view: Distributor.dview[i].view, imageUrl: distributorObj[i].imagurl)
                Distributor.dtitle[i].Label(x: 140, y: 10, width: x-150, height: 50, txt: distributorObj[i].title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Distributor.dview[i].view)
                Distributor.dview[i].view.addGestureRecognizer(UITapGestureRecognizer(target: Distributor, action: #selector(Distributor.clickonDistButton(_:))))
                top = Distributor.dview[i].view.frame.maxY
                Distributor.parentbody.contentSize.height = top+10
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- BUTTONS
    
    /*--------------------------------------------------------------*/
    
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func quoteButton(_ btn:UIButton){
        quotepop.create(quotebtn: btn, inview: Distributor.parentbody)
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func clickonDistButton(_ tap:UITapGestureRecognizer){
        print("tap \(tap.view!.tag)  \(distributorObj.filter{$0.id == tap.view!.tag}.first!.title)")
        
        openSearchpage(heading: distributorObj.filter{$0.id == tap.view!.tag}.first!.title)
        loaderStart()
        Alamofire.request("http://dev.conektr.com/dist_prods.php?distributor_id=\(tap.view!.tag)",
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
                    self.openSearchpage(heading: distributorObj.filter{$0.id == tap.view!.tag}.first!.title)
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
    /*--------------------------------------------------------------*/
    
    
    
    
    
}
