//
//  Promotion.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit


let promotion = po()
class po: UIView {
    
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
    @objc func ClickOnproductButton(_ tap:UITapGestureRecognizer){
        print("tapon product \(tap.view!.tag)")
    }
    /*--------------------------------------------------------------*/
    
    
    
    var parentbody = UIScrollView()
    let header = UI()
    var issignin = false
    
    
    
    
    
    
    
    func create(login:Bool,view:UIScrollView){
        promotion.parentbody = view
        promotion.issignin = login
        //HEADER
        promotion.header.Label(x: 10, y: 0, width: x-50, height: 50, txt: "Promotion Offers", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view)
        promotion.header.clickableimage(x: x-40, y: 0, width: 30, height: 40, image: UIImage(named: "quote")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.quoteButton(_:)), any: promotion, view: view)
        promotion.header.View(x: 0, y: promotion.header.label.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        
        
        
        promotionProductobj.append(pps())
        promotionProductobj[promotionProductobj.count-1].id = promotionProductobj.count-1
        promotionProductobj[promotionProductobj.count-1].imag = UIImage(named: "pro")!
        promotionProductobj[promotionProductobj.count-1].isSelected = false
        promotionProductobj[promotionProductobj.count-1].price = Double(promotionProductobj.count-1)
        promotionProductobj[promotionProductobj.count-1].quantity = promotionProductobj.count-1
        promotionProductobj[promotionProductobj.count-1].title = "title \(promotionProductobj.count-1)"
        
        
        // LAYOUT CHANGER
        promotion.layoutChanger()
        promotion.CreateCheck1()
        
        // ADD PRODUCTS
        promotion.addProduct(grid: true, isSignedin: promotion.issignin)
        
        
        
        
        
        promotion.Appear()
    }
    
    func Appear(){
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
        promotion.parentbody.isHidden = false
    }
    func disAppear() {
        promotion.parentbody.isHidden = true
    }
    
    
    
    
    
    
    
    
    
    
    
    let layout = UI()
    let grid = UI()
    let list = UI()
    let sort = UI()
    func layoutChanger() {
        promotion.layout.View(x: 10, y: promotion.header.view.frame.maxY+10, width: x-20, height: 50, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 5, border: 0, borderColor: .clear, view: promotion.parentbody)
        
        promotion.grid.clickableimage(x: 20, y: promotion.header.view.frame.maxY+20, width: 30, height: 30, image: UIImage(named: "gridtrue")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.layoutChangeButton(_:)), any: promotion, view: promotion.parentbody)
        promotion.list.clickableimage(x: 60, y: promotion.header.view.frame.maxY+20, width: 30, height: 30, image: UIImage(named: "listfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.layoutChangeButton(_:)), any: promotion, view: promotion.parentbody)
        
    }
    @objc func layoutChangeButton(_ btn:UIButton){
        if btn.currentBackgroundImage == UIImage(named: "gridfalse") {
            promotion.grid.clickableimg.setBackgroundImage(UIImage(named: "gridtrue")!, for: .normal)
            promotion.list.clickableimg.setBackgroundImage(UIImage(named: "listfalse"), for: .normal)
            /*-------------*/
            promotion.addProduct(grid: true, isSignedin: promotion.issignin)
        }
        else if (btn.currentBackgroundImage == UIImage(named: "listfalse")){
            promotion.grid.clickableimg.setBackgroundImage(UIImage(named: "gridfalse")!, for: .normal)
            promotion.list.clickableimg.setBackgroundImage(UIImage(named: "listtrue"), for: .normal)
            /*-------------*/
            promotion.addProduct(grid: false, isSignedin: promotion.issignin)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    let check = [UI(),UI()]
    func CreateCheck1() {
        //////////////////////////////////////////////// CHECK 1 / 2
        promotion.check[0].CheckBox(x: 10, y: promotion.layout.view.frame.maxY+30, width: 20, height: 20, trueImage: UIImage(named: "checktrue")!, falseImage: UIImage(named: "checkfalse")!, isTrue: false, view: promotion.parentbody) {
            promotion.checkAllProductCheckBox()
        }
        promotion.check[0].Label(x: promotion.check[0].checkBox.frame.maxX+5, y: promotion.layout.view.frame.maxY+10, width: 80, height: 60, txt: "Check All", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: promotion.parentbody)
        promotion.check[0].Button(x: promotion.check[0].label.frame.maxX, y: promotion.layout.view.frame.maxY+10, width: 230, height: 60, title: "ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: 0)", fontsize: 14, any: self, function: #selector(promotion.AddAllCheckedProduct), cornerRadius: 10, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4375680685, green: 0.2701445818, blue: 0.6246482134, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: promotion.parentbody)
        promotion.check[0].button.titleLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
    }
    
    func CreateCheck2(top:CGFloat){
        //////////////////////////////////////////////// CHECK 2 / 2
        promotion.check[1].CheckBox(x: 10, y: top+30, width: 20, height: 20, trueImage: UIImage(named: "checktrue")!, falseImage: UIImage(named: "checkfalse")!, isTrue: false, view: promotion.parentbody) {
            promotion.checkAllProductCheckBox()
        }
        promotion.check[1].Label(x: check[1].checkBox.frame.maxX+5, y: top+10, width: 80, height: 60, txt: "Check All", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: promotion.parentbody)
        promotion.check[1].Button(x: check[1].label.frame.maxX, y: top+10, width: 230, height: 60, title: "ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: 0)", fontsize: 14, any: self, function: #selector(promotion.AddAllCheckedProduct), cornerRadius: 10, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4375680685, green: 0.2701445818, blue: 0.6246482134, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: promotion.parentbody)
        promotion.check[1].button.titleLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
        promotion.parentbody.contentSize.height = promotion.check[1].button.frame.maxY+10
        
        
    }
    /////////////// PRODUCT CHECKBOX  BUTTON
    func productCheckBox(){}
    
    
    func checkAllProductCheckBox() {}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
        for obj in promotion.pview {obj.view.removeFromSuperview()}
        for obj in promotion.pimag {obj.imag.removeFromSuperview()}
        for obj in promotion.ptitle {obj.label.removeFromSuperview()}
        for obj in promotion.ppricelabel {obj.label.removeFromSuperview()}
        for obj in promotion.pprice {obj.label.removeFromSuperview()}
        for obj in promotion.pfavbtn {obj.clickableimg.removeFromSuperview()}
        for obj in promotion.pbarbtn {obj.clickableimg.removeFromSuperview()}
        for obj in promotion.pcheck {obj.clickableimg.removeFromSuperview()}
        for obj in promotion.pquantity {obj.txtfield.removeFromSuperview()}
        for obj in promotion.pstorebtn {obj.clickableimg.removeFromSuperview()}
        
        promotion.pview.removeAll()
        promotion.pimag.removeAll()
        promotion.ptitle.removeAll()
        promotion.ppricelabel.removeAll()
        promotion.pprice.removeAll()
        promotion.pfavbtn.removeAll()
        promotion.pbarbtn.removeAll()
        promotion.pcheck.removeAll()
        promotion.pquantity.removeAll()
        promotion.pstorebtn.removeAll()
        
        if grid {
            let cx = x/2
            var index = 0
            var topforcheck:CGFloat = 0
            var top = promotion.check[0].button.frame.maxY+10
            for i in 0..<promotionProductobj.count {
                promotion.pview.append(UI())
                promotion.pimag.append(UI())
                promotion.ptitle.append(UI())
                promotion.ppricelabel.append(UI())
                promotion.pprice.append(UI())
                promotion.pfavbtn.append(UI())
                promotion.pbarbtn.append(UI())
                promotion.pcheck.append(UI())
                promotion.pquantity.append(UI())
                promotion.pstorebtn.append(UI())
                
                if i>1 {
                    index = i%2
                    top = promotion.pview[i-2].view.frame.maxY
                }
                else{index=i}
                
                //view
                promotion.pview[i].View(x: cx*CGFloat(index), y: top, width: cx, height: 400, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: promotion.parentbody)
                promotion.pview[i].view.tag = promotionProductobj[i].id
                promotion.pview[i].view.addGestureRecognizer(UITapGestureRecognizer(target: promotion, action: #selector(promotion.ClickOnproductButton(_:))))
                
                //image
                promotion.pimag[i].Image(x: 10, y: 10, width: (x/2)-20, height: (x/2), mode: .scaleAspectFit, src: promotionProductobj[i].imag, view: promotion.pview[i].view, imageUrl: nil)
                promotion.ptitle[i].Label(x: 10, y: promotion.pimag[i].imag.frame.maxY, width: (x/2)-20, height: 70, txt: promotionProductobj[i].title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: promotion.pview[i].view)
                // PRICE
                if isSignedin {
                    promotion.ppricelabel[i].Label(x: 10, y: promotion.ptitle[i].label.frame.maxY, width: ((x/2)-20)/2, height: 40, txt: "Starting at", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: promotion.pview[i].view)
                    promotion.pprice[i].Label(x: promotion.ppricelabel[i].label.frame.maxX, y: promotion.ptitle[i].label.frame.maxY, width: ((x/2)-20)/2, height: 40, txt: "AUD\(promotionProductobj[i].price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), view: promotion.pview[i].view)
                }
                else{
                    promotion.ppricelabel[i].Label(x: 10, y: promotion.ptitle[i].label.frame.maxY, width: (x/2)-20, height: 40, txt: "Login for price", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: promotion.pview[i].view)
                }
                
                //favourite btn
                promotion.pfavbtn[i].clickableimage(x: (x/4)-32, y: promotion.ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "heartfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.productRadioHeartButton(_:)), any: promotion, view: promotion.pview[i].view)
                promotion.pfavbtn[i].clickableimg.tag = promotionProductobj[i].id
                
                promotion.pbarbtn[i].clickableimage(x: (x/4)+2, y: promotion.ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "barfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.productRadioBarButton(_:)), any: promotion, view: promotion.pview[i].view)
                promotion.pbarbtn[i].clickableimg.tag = promotionProductobj[i].id
                
                // CHECK
                promotion.pcheck[i].clickableimage(x: (x/4)-50, y: promotion.pbarbtn[i].clickableimg.frame.maxY+10, width: 20, height: 20, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.productCheckboxButton(_:)), any: promotion, view: promotion.pview[i].view)
                promotion.pcheck[i].clickableimg.tag = promotionProductobj[i].id
                
                promotion.pquantity[i].Textfield(x: promotion.pcheck[i].clickableimg.frame.maxX+5, y: promotion.pbarbtn[i].clickableimg.frame.maxY+5, width: 40, height: 30, placeholder: "", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: promotion.pview[i].view)
                promotion.pquantity[i].txtfield.text = "\(promotionProductobj[i].quantity)"
                if isSignedin {
                    promotion.pstorebtn[i].clickableimage(x: promotion.pquantity[i].txtfield.frame.maxX+5, y: promotion.pbarbtn[i].clickableimg.frame.maxY+5, width: 30, height: 30, image: UIImage(named: "shoppingfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.productStoreButton(_:)), any: promotion, view: promotion.pview[i].view)
                    promotion.pstorebtn[i].clickableimg.tag = promotionProductobj[i].id
                }
                
                promotion.pview[i].view.frame.size.height = promotion.pquantity[i].txtfield.frame.maxY+10
                if i>1 {top = promotion.pview[i-2].view.frame.maxY}
                topforcheck = promotion.pview[i].view.frame.maxY

            }
            promotion.CreateCheck2(top: topforcheck)
        }
        else{
            var top = promotion.check[0].button.frame.maxY+10
            for i in 0..<promotionProductobj.count {
                promotion.pview.append(UI())
                promotion.pimag.append(UI())
                promotion.ptitle.append(UI())
                promotion.ppricelabel.append(UI())
                promotion.pprice.append(UI())
                promotion.pfavbtn.append(UI())
                promotion.pbarbtn.append(UI())
                promotion.pcheck.append(UI())
                promotion.pquantity.append(UI())
                promotion.pstorebtn.append(UI())
                
                
                
                //view
                promotion.pview[i].View(x: 0, y: top, width: x, height: 400, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: promotion.parentbody)
                promotion.pview[i].view.tag = promotionProductobj[i].id
                promotion.pview[i].view.addGestureRecognizer(UITapGestureRecognizer(target: promotion, action: #selector(promotion.ClickOnproductButton(_:))))
                top = promotion.pview[i].view.frame.maxY
                
                //image
                promotion.pimag[i].Image(x: 10, y: 10, width: (x/2)-20, height: (x/2), mode: .scaleAspectFit, src: promotionProductobj[i].imag, view: promotion.pview[i].view, imageUrl: nil)
                //title
                promotion.ptitle[i].Label(x: x/2, y: 0, width: (x/2)-20, height: 80, txt: promotionProductobj[i].title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: promotion.pview[i].view)
                // PRICE
                if isSignedin {
                    promotion.ppricelabel[i].Label(x: x/2, y: promotion.ptitle[i].label.frame.maxY, width: ((x/2)-20)/2, height: 40, txt: "Starting at", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: promotion.pview[i].view)
                    promotion.pprice[i].Label(x: promotion.ppricelabel[i].label.frame.maxX, y: promotion.ptitle[i].label.frame.maxY, width: ((x/2)-20)/2, height: 40, txt: "AUD\(promotionProductobj[i].price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), view: promotion.pview[i].view)
                }
                else{
                    promotion.ppricelabel[i].Label(x: x/2, y: promotion.ptitle[i].label.frame.maxY, width: (x/2)-20, height: 40, txt: "Login for price", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: promotion.pview[i].view)
                }
                
                //favourite btn
                promotion.pfavbtn[i].clickableimage(x: x/2, y: promotion.ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "heartfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.productRadioHeartButton(_:)), any: promotion, view: promotion.pview[i].view)
                promotion.pfavbtn[i].clickableimg.tag = promotionProductobj[i].id
                
                promotion.pbarbtn[i].clickableimage(x: promotion.pfavbtn[i].clickableimg.frame.maxX+10, y: promotion.ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "barfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.productRadioBarButton(_:)), any: promotion, view: promotion.pview[i].view)
                promotion.pbarbtn[i].clickableimg.tag = promotionProductobj[i].id
                
                // CHECK
                promotion.pcheck[i].clickableimage(x: x/2, y: promotion.pbarbtn[i].clickableimg.frame.maxY+10, width: 20, height: 20, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.productCheckboxButton(_:)), any: promotion, view: promotion.pview[i].view)
                promotion.pcheck[i].clickableimg.tag = promotionProductobj[i].id
                
                promotion.pquantity[i].Textfield(x: promotion.pcheck[i].clickableimg.frame.maxX+10, y: promotion.pbarbtn[i].clickableimg.frame.maxY+5, width: 40, height: 30, placeholder: "", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: promotion.pview[i].view)
                promotion.pquantity[i].txtfield.text = "\(promotionProductobj[i].quantity)"
                if isSignedin {
                    promotion.pstorebtn[i].clickableimage(x: promotion.pquantity[i].txtfield.frame.maxX+10, y: promotion.pbarbtn[i].clickableimg.frame.maxY+5, width: 30, height: 30, image: UIImage(named: "shoppingfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotion.productStoreButton(_:)), any: promotion, view: promotion.pview[i].view)
                    promotion.pstorebtn[i].clickableimg.tag = promotionProductobj[i].id
                }
                
                if promotion.pimag[i].imag.frame.maxY > promotion.pquantity[i].txtfield.frame.maxY {
                    promotion.pview[i].view.frame.size.height = promotion.pimag[i].imag.frame.maxY+10
                }
                else{
                    promotion.pview[i].view.frame.size.height = promotion.pquantity[i].txtfield.frame.maxY+10
                }
                top = promotion.pview[i].view.frame.maxY
                
            }
            promotion.CreateCheck2(top: top)
        }
    }
    
    
    
}
    
