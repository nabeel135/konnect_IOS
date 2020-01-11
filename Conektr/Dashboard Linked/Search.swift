//
//  Search.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit


let search = s()
class s: UIView {
    
    
    
    
    
    var parentbody = UIScrollView()
    let header = UI()
    var issignin = false
    
    
    
    
    
    
    // MARK:- CREATE
    func create(login:Bool,view:UIScrollView){
        search.parentbody = view
        search.issignin = login
        //HEADER
        search.header.Label(x: 10, y: 0, width: x-50, height: 50, txt: "Search", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view)
        search.header.clickableimage(x: x-40, y: 0, width: 30, height: 40, image: UIImage(named: "quote")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.quoteButton(_:)), any: search, view: view)
        search.header.View(x: 0, y: search.header.label.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        
        
        
//        searchProductobj.append(ss())
//        searchProductobj[searchProductobj.count-1].id = searchProductobj.count-1
//        searchProductobj[searchProductobj.count-1].imag = UIImage(named: "pro")!
//        searchProductobj[searchProductobj.count-1].isSelected = false
//        searchProductobj[searchProductobj.count-1].price = Double(searchProductobj.count-1)
//        searchProductobj[searchProductobj.count-1].quantity = searchProductobj.count-1
//        searchProductobj[searchProductobj.count-1].title = "title \(searchProductobj.count-1)"
        
        
        // LAYOUT CHANGER
        search.layoutChanger()
        search.CreateCheck1()
        
        // ADD PRODUCTS
        search.addProduct(grid: true, isSignedin: search.issignin)
        
        
        
        
        
        search.Appear()
    }
    
    func Appear(){
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
        search.parentbody.isHidden = false
    }
    func disAppear() {
        search.parentbody.isHidden = true
    }
    
    
    
    
    
    
    
    
    
    
    
    let layout = UI()
    let grid = UI()
    let list = UI()
    let sort = UI()
    func layoutChanger() {
        search.layout.View(x: 10, y: search.header.view.frame.maxY+10, width: x-20, height: 50, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 5, border: 0, borderColor: .clear, view: search.parentbody)
        
        search.grid.clickableimage(x: 20, y: search.header.view.frame.maxY+20, width: 30, height: 30, image: UIImage(named: "gridtrue")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.layoutChangeButton(_:)), any: search, view: search.parentbody)
        search.list.clickableimage(x: 60, y: search.header.view.frame.maxY+20, width: 30, height: 30, image: UIImage(named: "listfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.layoutChangeButton(_:)), any: search, view: search.parentbody)
        
    }
    @objc func layoutChangeButton(_ btn:UIButton){
        if btn.currentBackgroundImage == UIImage(named: "gridfalse") {
            search.grid.clickableimg.setBackgroundImage(UIImage(named: "gridtrue")!, for: .normal)
            search.list.clickableimg.setBackgroundImage(UIImage(named: "listfalse"), for: .normal)
            /*-------------*/
            search.addProduct(grid: true, isSignedin: search.issignin)
        }
        else if (btn.currentBackgroundImage == UIImage(named: "listfalse")){
            search.grid.clickableimg.setBackgroundImage(UIImage(named: "gridfalse")!, for: .normal)
            search.list.clickableimg.setBackgroundImage(UIImage(named: "listtrue"), for: .normal)
            /*-------------*/
            search.addProduct(grid: false, isSignedin: search.issignin)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    let check = [UI(),UI()]
    func CreateCheck1() {
        //////////////////////////////////////////////// CHECK 1 / 2
        search.check[0].CheckBox(x: 10, y: search.layout.view.frame.maxY+30, width: 20, height: 20, trueImage: UIImage(named: "checktrue")!, falseImage: UIImage(named: "checkfalse")!, isTrue: false, view: search.parentbody) {
            search.checkAllProductCheckBox()
        }
        search.check[0].Label(x: search.check[0].checkBox.frame.maxX+5, y: search.layout.view.frame.maxY+10, width: 80, height: 60, txt: "Check All", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: search.parentbody)
        search.check[0].Button(x: search.check[0].label.frame.maxX, y: search.layout.view.frame.maxY+10, width: 230, height: 60, title: "ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: 0)", fontsize: 14, any: self, function: #selector(search.AddAllCheckedProduct), cornerRadius: 10, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4375680685, green: 0.2701445818, blue: 0.6246482134, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: search.parentbody)
        search.check[0].button.titleLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
        
        if searchProductobj.count == 0 {
            search.check[0].checkBox.isHidden = true
            search.check[0].label.isHidden = true
            search.check[0].button.isHidden = true
        }
        else{
            search.check[0].checkBox.isHidden = false
            search.check[0].label.isHidden = false
            search.check[0].button.isHidden = false
        }
    }
    
    func CreateCheck2(top:CGFloat){
        //////////////////////////////////////////////// CHECK 2 / 2
        search.check[1].CheckBox(x: 10, y: top+30, width: 20, height: 20, trueImage: UIImage(named: "checktrue")!, falseImage: UIImage(named: "checkfalse")!, isTrue: false, view: search.parentbody) {
            search.checkAllProductCheckBox()
        }
        search.check[1].Label(x: check[1].checkBox.frame.maxX+5, y: top+10, width: 80, height: 60, txt: "Check All", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: search.parentbody)
        search.check[1].Button(x: check[1].label.frame.maxX, y: top+10, width: 230, height: 60, title: "ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: 0)", fontsize: 14, any: self, function: #selector(search.AddAllCheckedProduct), cornerRadius: 10, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4375680685, green: 0.2701445818, blue: 0.6246482134, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: search.parentbody)
        search.check[1].button.titleLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
        search.parentbody.contentSize.height = search.check[1].button.frame.maxY+10
        
        
        let msg = UI()
        msg.Label(x: 10, y: 150, width: x-20, height: 50, txt: "Search Not Found", fontsize: 18, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: search.parentbody)
        
        
        if searchProductobj.count == 0 {
            msg.label.isHidden = false
            search.check[1].checkBox.isHidden = true
            search.check[1].label.isHidden = true
            search.check[1].button.isHidden = true
        }
        else{
            msg.label.isHidden = false
            search.check[1].checkBox.isHidden = false
            search.check[1].label.isHidden = false
            search.check[1].button.isHidden = false
        }
    }
    /////////////// PRODUCT CHECKBOX  BUTTON
    @objc func productCheckBox(){}
    
    
    @objc func checkAllProductCheckBox() {}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK:- ADD Product List
    /////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////// Add Promotion Offer Product
    var pview:[UI] = []
    var pimag:[UI] = []
    var ptitle:[UI] = []
    var ppricelabel:[UI] = []
    var pprice:[UI] = []
    var pfavbtn:[UI] = []
    var pbarbtn:[UI] = []
    var pcheck:[UI] = []
    var pquantity:[UI] = []
    var pstorebtn:[UI] = []
    
    func addProduct(grid:Bool,isSignedin:Bool){
        for obj in search.pview {obj.view.removeFromSuperview()}
        for obj in search.pimag {obj.imag.removeFromSuperview()}
        for obj in search.ptitle {obj.label.removeFromSuperview()}
        for obj in search.ppricelabel {obj.label.removeFromSuperview()}
        for obj in search.pprice {obj.label.removeFromSuperview()}
        for obj in search.pfavbtn {obj.clickableimg.removeFromSuperview()}
        for obj in search.pbarbtn {obj.clickableimg.removeFromSuperview()}
        for obj in search.pcheck {obj.clickableimg.removeFromSuperview()}
        for obj in search.pquantity {obj.txtfield.removeFromSuperview()}
        for obj in search.pstorebtn {obj.clickableimg.removeFromSuperview()}
        
        search.pview.removeAll()
        search.pimag.removeAll()
        search.ptitle.removeAll()
        search.ppricelabel.removeAll()
        search.pprice.removeAll()
        search.pfavbtn.removeAll()
        search.pbarbtn.removeAll()
        search.pcheck.removeAll()
        search.pquantity.removeAll()
        search.pstorebtn.removeAll()
        
        if grid {
            let cx = x/2
            var index = 0
            var topforcheck:CGFloat = 0
            var top = search.check[0].button.frame.maxY+10
            for i in 0..<searchProductobj.count {
                
                search.pview.append(UI())
                search.pimag.append(UI())
                search.ptitle.append(UI())
                search.ppricelabel.append(UI())
                search.pprice.append(UI())
                search.pfavbtn.append(UI())
                search.pbarbtn.append(UI())
                search.pcheck.append(UI())
                search.pquantity.append(UI())
                search.pstorebtn.append(UI())
                
                if i>1 {
                    index = i%2
                    top = search.pview[i-2].view.frame.maxY
                }
                else{index=i}
                
                //view
                search.pview[i].View(x: cx*CGFloat(index), y: top, width: cx, height: 400, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: search.parentbody)
                search.pview[i].view.tag = searchProductobj[i].id
                search.pview[i].view.addGestureRecognizer(UITapGestureRecognizer(target: search, action: #selector(search.ClickOnproductButton(_:))))
                
                //image
                search.pimag[i].Image(x: 10, y: 10, width: (x/2)-20, height: (x/2), mode: .scaleAspectFit, src: searchProductobj[i].imag, view: search.pview[i].view,imageUrl: searchProductobj[i].imagUrl)
                search.ptitle[i].Label(x: 10, y: search.pimag[i].imag.frame.maxY, width: (x/2)-20, height: 70, txt: searchProductobj[i].title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: search.pview[i].view)
                // PRICE
                if isSignedin {
                    search.ppricelabel[i].Label(x: 10, y: search.ptitle[i].label.frame.maxY, width: ((x/2)-20)/2, height: 40, txt: "Starting at", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: search.pview[i].view)
                    search.pprice[i].Label(x: search.ppricelabel[i].label.frame.maxX, y: search.ptitle[i].label.frame.maxY, width: ((x/2)-20)/2, height: 40, txt: "AUD\(searchProductobj[i].price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), view: search.pview[i].view)
                }
                else{
                    search.ppricelabel[i].Label(x: 10, y: search.ptitle[i].label.frame.maxY, width: (x/2)-20, height: 40, txt: "Login for price", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: search.pview[i].view)
                }
                
                //favourite btn
                search.pfavbtn[i].clickableimage(x: (x/4)-32, y: search.ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "heartfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.productRadioHeartButton(_:)), any: search, view: search.pview[i].view)
                search.pfavbtn[i].clickableimg.tag = searchProductobj[i].id
                
                search.pbarbtn[i].clickableimage(x: (x/4)+2, y: search.ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "barfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.productRadioBarButton(_:)), any: search, view: search.pview[i].view)
                search.pbarbtn[i].clickableimg.tag = searchProductobj[i].id
                
                // CHECK
                search.pcheck[i].clickableimage(x: (x/4)-50, y: search.pbarbtn[i].clickableimg.frame.maxY+10, width: 20, height: 20, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.productCheckboxButton(_:)), any: search, view: search.pview[i].view)
                search.pcheck[i].clickableimg.tag = searchProductobj[i].id
                
                search.pquantity[i].Textfield(x: search.pcheck[i].clickableimg.frame.maxX+5, y: search.pbarbtn[i].clickableimg.frame.maxY+5, width: 40, height: 30, placeholder: "", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: search.pview[i].view)
                search.pquantity[i].txtfield.text = "\(searchProductobj[i].quantity)"
                if isSignedin {
                    search.pstorebtn[i].clickableimage(x: search.pquantity[i].txtfield.frame.maxX+5, y: search.pbarbtn[i].clickableimg.frame.maxY+5, width: 30, height: 30, image: UIImage(named: "shoppingfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.productStoreButton(_:)), any: search, view: search.pview[i].view)
                    search.pstorebtn[i].clickableimg.tag = searchProductobj[i].id
                }
                
                search.pview[i].view.frame.size.height = search.pquantity[i].txtfield.frame.maxY+10
                if i>1 {top = search.pview[i-2].view.frame.maxY}
                topforcheck = search.pview[i].view.frame.maxY

            }
            search.CreateCheck2(top: topforcheck)
        }
        else{
            var top = search.check[0].button.frame.maxY+10
            for i in 0..<searchProductobj.count {
                search.pview.append(UI())
                search.pimag.append(UI())
                search.ptitle.append(UI())
                search.ppricelabel.append(UI())
                search.pprice.append(UI())
                search.pfavbtn.append(UI())
                search.pbarbtn.append(UI())
                search.pcheck.append(UI())
                search.pquantity.append(UI())
                search.pstorebtn.append(UI())
                
                
                
                //view
                search.pview[i].View(x: 0, y: top, width: x, height: 400, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: search.parentbody)
                search.pview[i].view.tag = searchProductobj[i].id
                search.pview[i].view.addGestureRecognizer(UITapGestureRecognizer(target: search, action: #selector(search.ClickOnproductButton(_:))))
                top = search.pview[i].view.frame.maxY
                
                //image
                search.pimag[i].Image(x: 10, y: 10, width: (x/2)-20, height: (x/2), mode: .scaleAspectFit, src: searchProductobj[i].imag, view: search.pview[i].view,imageUrl: searchProductobj[i].imagUrl)
                //title
                search.ptitle[i].Label(x: x/2, y: 0, width: (x/2)-20, height: 80, txt: searchProductobj[i].title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: search.pview[i].view)
                // PRICE
                if isSignedin {
                    search.ppricelabel[i].Label(x: x/2, y: search.ptitle[i].label.frame.maxY, width: ((x/2)-20)/2, height: 40, txt: "Starting at", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: search.pview[i].view)
                    search.pprice[i].Label(x: search.ppricelabel[i].label.frame.maxX, y: search.ptitle[i].label.frame.maxY, width: ((x/2)-20)/2, height: 40, txt: "AUD\(searchProductobj[i].price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), view: search.pview[i].view)
                }
                else{
                    search.ppricelabel[i].Label(x: x/2, y: search.ptitle[i].label.frame.maxY, width: (x/2)-20, height: 40, txt: "Login for price", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: search.pview[i].view)
                }
                
                //favourite btn
                search.pfavbtn[i].clickableimage(x: x/2, y: search.ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "heartfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.productRadioHeartButton(_:)), any: search, view: search.pview[i].view)
                search.pfavbtn[i].clickableimg.tag = searchProductobj[i].id
                
                search.pbarbtn[i].clickableimage(x: search.pfavbtn[i].clickableimg.frame.maxX+10, y: search.ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "barfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.productRadioBarButton(_:)), any: search, view: search.pview[i].view)
                search.pbarbtn[i].clickableimg.tag = searchProductobj[i].id
                
                // CHECK
                search.pcheck[i].clickableimage(x: x/2, y: search.pbarbtn[i].clickableimg.frame.maxY+10, width: 20, height: 20, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.productCheckboxButton(_:)), any: search, view: search.pview[i].view)
                search.pcheck[i].clickableimg.tag = searchProductobj[i].id
                
                search.pquantity[i].Textfield(x: search.pcheck[i].clickableimg.frame.maxX+10, y: search.pbarbtn[i].clickableimg.frame.maxY+5, width: 40, height: 30, placeholder: "", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: search.pview[i].view)
                search.pquantity[i].txtfield.text = "\(searchProductobj[i].quantity)"
                if isSignedin {
                    search.pstorebtn[i].clickableimage(x: search.pquantity[i].txtfield.frame.maxX+10, y: search.pbarbtn[i].clickableimg.frame.maxY+5, width: 30, height: 30, image: UIImage(named: "shoppingfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(search.productStoreButton(_:)), any: search, view: search.pview[i].view)
                    search.pstorebtn[i].clickableimg.tag = searchProductobj[i].id
                }
                
                if search.pimag[i].imag.frame.maxY > search.pquantity[i].txtfield.frame.maxY {
                    search.pview[i].view.frame.size.height = search.pimag[i].imag.frame.maxY+10
                }
                else{
                    search.pview[i].view.frame.size.height = search.pquantity[i].txtfield.frame.maxY+10
                }
                top = search.pview[i].view.frame.maxY
                
            }
            search.CreateCheck2(top: top)
        }
    }
    
    
    
    
    
    
    
    
    //MARK:- BUTTONS
    /*--------------------------------------------------------------*/
    
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func quoteButton(_ btn:UIButton){
        print("quote button")
    }
    
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PROUCT ADD TO CART BUTTON
    //////////////////////////////////////////////
    @objc func AddAllCheckedProduct(){
        print("check added")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PRODUCT FAVOURITE BUTTON
    //////////////////////////////////////////////
    @objc func productRadioHeartButton(_ btn:UIButton){
        print("heart btn")
    }
    
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PRODUCT BAR BUTTON
    //////////////////////////////////////////////
    @objc func productRadioBarButton(_ btn:UIButton){
        print("bar button")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PRODUCT CHECKBOX BUTTON
    //////////////////////////////////////////////
    @objc func productCheckboxButton(_ btn:UIButton){
        print("check button")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PRODUCT Shopping BUTTON
    //////////////////////////////////////////////
    @objc func productStoreButton(_ btn:UIButton){
        print("shopping button")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// click on product BUTTON
    //////////////////////////////////////////////
    @objc func ClickOnproductButton(_ productid:UITapGestureRecognizer){
        print("tapon product \(productid.view!.tag)")
        for i in 0..<searchProductobj.count {
            if productid.view!.tag == searchProductobj[i].id {
                productdetail.isSelected = searchProductobj[i].isSelected
//                productdetail.distributorID = searchProductobj[i].distributorID
//                productdetail.distributorName = searchProductobj[i].distributorName
                productdetail.id = searchProductobj[i].id
                productdetail.imag = self.pimag[i].imag.image ?? UIImage()
                productdetail.imagUrl = searchProductobj[i].imagUrl
                productdetail.title = searchProductobj[i].title
                productdetail.sku = searchProductobj[i].sku
//                productdetail.typeId = searchProductobj[i].typeId
                productdetail.price = searchProductobj[i].price
                productdetail.discount = searchProductobj[i].discount
                productdetail.quantity = searchProductobj[i].quantity
                productdetail.description = searchProductobj[i].description
                productdetail.config = searchProductobj[i].config
                productdetail.variant = searchProductobj[i].variant
                productdetail.pricing = searchProductobj[i].pricing
                
                
                if productdetail.typeId == "configurable" {
                    let prodetailop = ProductOptionAPIVC()
                    prodetailop.GetProductOptions(sku: productdetail.sku)
                }
            }
        }
        product.create(updateQuote: false, view: bodyfor.product.scrollview)
        search.disAppear()
    }
    /*--------------------------------------------------------------*/
}
    
