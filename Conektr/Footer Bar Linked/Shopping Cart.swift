//
//  Shopping Cart.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/19/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let shoppingCart = sc()
class sc: UIView {
    
    
    
    
    
    /*--------------------------------------------------------------*/
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func updateShoppingCartButton(_ btn:UIButton){
        print("update shoppingcart")
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func movetoShopListButton(_ btn:UIButton){
        print("move to Shop List")
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func removeItembtnButton(_ btn:UIButton){
        print("remove item")
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func quoteButton(_ btn:UIButton){
        print("quote button")
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func checkoutButton(_ btn:UIButton){
        print("checkout button")
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func requestquoteButton(_ btn:UIButton){
        print("request quote button")
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func discountButton(_ btn:UIButton){
        print("add discount button")
    }
    
    /*--------------------------------------------------------------*/
    
    
    
    
    
    
    
    
    // variable3
    var isCreated = false
    var parentbody = UIScrollView()
    let header = UI()
    
    let productlist = UI()
    let productlistprice = UI()
    
    let summary = UI()
    let shipping = UI()
    
    let summarydetail = UI()
    let subtotal = UI()
    let tax = UI()
    let incltax = UI()
    let excltax = UI()
    
    let discount = UI()
    
    let checkoutbtn = UI()
    let requestquotebtn = UI()
    
    func Create(view:UIScrollView) {
        shoppingCart.parentbody = view
        ///////////////////////////////////////////////////////
        //HEADER
        shoppingCart.header.Label(x: 10, y: 0, width: x-50, height: 50, txt: "SHOPPING CART", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view)
        shoppingCart.header.clickableimage(x: x-40, y: 0, width: 30, height: 40, image: UIImage(named: "quote")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(shoppingCart.quoteButton(_:)), any: shoppingCart, view: view)
        shoppingCart.header.View(x: 0, y: shoppingCart.header.label.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        
        //PRODUCT LIST
        shoppingCart.productlist.View(x: 10, y: shoppingCart.header.view.frame.maxY+30, width: x-20, height: 70, bkcolor: #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        shoppingCart.productlist.line(p1: CGPoint(x: 10, y: shoppingCart.productlist.view.frame.maxY), p2: CGPoint(x: x-10, y: shoppingCart.productlist.view.frame.maxY), lineWidth: 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: view)
        shoppingCart.productlist.Label(x: 10, y: 0, width: 150, height: 70, txt: "PRODUCTS", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: shoppingCart.productlist.view)
        shoppingCart.productlistprice.Label(x: shoppingCart.productlist.label.frame.maxX, y: 0, width: 150, height: 70, txt: "Grandtotal \nAED\(0.0)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: shoppingCart.productlist.view)
        shoppingCart.productlist.CheckBox(x: x-50, y: 30, width: 20, height: 10, trueImage: UIImage(named: "redup")!, falseImage: UIImage(named: "reddown")!, isTrue: false, view: shoppingCart.productlist.view) {
            if(shoppingCart.productlist.isCheckBoxChecked){
                shoppingCart.productbody.view.isHidden = false
                shoppingCart.updateframe()
            }
            else{
                shoppingCart.productbody.view.isHidden = true
                shoppingCart.updateframe()
            }
        }
        shoppingCart.productlistUI()
        
        
        
        
        
        /// SUMMARY
        shoppingCart.summary.View(x: 10, y: shoppingCart.productlist.view.frame.maxY+30, width: x-20, height: 500, bkcolor: #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        shoppingCart.summary.Label(x: 10, y: 0, width: 150, height: 40, txt: "Summary", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: shoppingCart.summary.view)
        shoppingCart.summary.line(p1: CGPoint(x: 10, y: shoppingCart.summary.label.frame.maxY), p2: CGPoint(x: x-30, y: shoppingCart.summary.label.frame.maxY), lineWidth: 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: shoppingCart.summary.view)
        
        shoppingCart.shipping.Label(x: 10, y: shoppingCart.summary.label.frame.maxY, width: x-40, height: 40, txt: "Estimate Shipping and Tax", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: shoppingCart.summary.view)
        shoppingCart.shipping.CheckBox(x: x-60, y: shoppingCart.summary.label.frame.maxY+15, width: 20, height: 10, trueImage: UIImage(named: "blackup")!, falseImage: UIImage(named: "blackdown")!, isTrue: false, view: shoppingCart.summary.view) {
            if(shoppingCart.shipping.isCheckBoxChecked){
                shoppingCart.shipping.view.isHidden = false
                shoppingCart.updateframe()
            }
            else{
                shoppingCart.shipping.view.isHidden = true
                shoppingCart.updateframe()
            }
        }
        shoppingCart.shippingUI()
        
        

        
        //Summary detail
        shoppingCart.summarydetail.View(x: 10, y: shoppingCart.shipping.label.frame.maxY, width: x-40, height: 200, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 0, borderColor: .clear, view: shoppingCart.summary.view)
        
        shoppingCart.subtotal.AutoSizeLabel(x: 0, y: 0, height: 40, txt: "Subtotal", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: shoppingCart.summarydetail.view)
        shoppingCart.subtotal.Label(x: x-190, y: 0, width: 150, height: 40, txt: "AED\(0.0)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right
            , bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: shoppingCart.summarydetail.view)
        shoppingCart.subtotal.View(x: 0, y: shoppingCart.subtotal.label.frame.maxY, width: x-40, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: shoppingCart.summarydetail.view)
        
        shoppingCart.tax.AutoSizeLabel(x: 0, y: shoppingCart.subtotal.label.frame.maxY, height: 40, txt: "Tax", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: shoppingCart.summarydetail.view)
        shoppingCart.tax.Label(x: x-190, y: shoppingCart.subtotal.label.frame.maxY, width: 150, height: 40, txt: "AED\(0.0)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right
            , bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: shoppingCart.summarydetail.view)
        shoppingCart.tax.View(x: 0, y: shoppingCart.tax.label.frame.maxY, width: x-40, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: shoppingCart.summarydetail.view)
        
        shoppingCart.incltax.AutoSizeLabel(x: 0, y: shoppingCart.tax.label.frame.maxY, height: 40, txt: "Order Total Incl. Tax", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: shoppingCart.summarydetail.view)
        shoppingCart.incltax.Label(x: x-190, y: shoppingCart.tax.label.frame.maxY, width: 150, height: 40, txt: "AED\(0.0)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right
            , bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: shoppingCart.summarydetail.view)
        shoppingCart.incltax.View(x: 0, y: shoppingCart.incltax.label.frame.maxY, width: x-40, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: shoppingCart.summarydetail.view)
        
        shoppingCart.excltax.AutoSizeLabel(x: 0, y: shoppingCart.incltax.label.frame.maxY, height: 40, txt: "Order Total Excl. Tax", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: shoppingCart.summarydetail.view)
        shoppingCart.excltax.Label(x: x-190, y: shoppingCart.incltax.label.frame.maxY, width: 150, height: 40, txt: "AED\(0.0)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right
            , bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: shoppingCart.summarydetail.view)
        shoppingCart.excltax.View(x: 0, y: shoppingCart.excltax.label.frame.maxY, width: x-40, height: 2, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: shoppingCart.summarydetail.view)
        shoppingCart.summarydetail.view.frame.size.height = shoppingCart.excltax.view.frame.maxY
        
        //DSCOUNT
        shoppingCart.discount.Label(x: 10, y: shoppingCart.summarydetail.view.frame.maxY, width: x-40, height: 40, txt: "Apply Discount Code", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: shoppingCart.summary.view)
        shoppingCart.discount.CheckBox(x: x-60, y: shoppingCart.summarydetail.view.frame.maxY+15, width: 20, height: 10, trueImage: UIImage(named: "blackup")!, falseImage: UIImage(named: "blackdown")!, isTrue: false, view: shoppingCart.summary.view) {
            if(shoppingCart.discount.isCheckBoxChecked){
                shoppingCart.discount.view.isHidden = false
                shoppingCart.updateframe()
            }
            else{
                shoppingCart.discount.view.isHidden = true
                shoppingCart.updateframe()
            }
        }
        shoppingCart.discountUI()
        
        //Buttons
        shoppingCart.checkoutbtn.Button(x: 10, y: shoppingCart.discount.label.frame.maxY+30, width: x-40, height: 40, title: "PROCEED TO CHECKOUT", fontsize: 14, any: shoppingCart, function: #selector(shoppingCart.checkoutButton(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: shoppingCart.summary.view)
        shoppingCart.requestquotebtn.Button(x: 10, y: shoppingCart.checkoutbtn.button.frame.maxY+30, width: x-40, height: 40, title: "Request A Quote", fontsize: 14, any: shoppingCart, function: #selector(shoppingCart.requestquoteButton(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: shoppingCart.summary.view)
        shoppingCart.summary.view.frame.size.height = shoppingCart.requestquotebtn.button.frame.maxY+40
        ///////////////////////////////////////////////////////
        shoppingCart.Appear()
        shoppingCart.updateframe()
        shoppingCart.isCreated = true
    }
    
    func Appear(){
        shoppingCart.parentbody.isHidden = false
    }
    func disAppear() {
        shoppingCart.parentbody.isHidden = true
    }
    
    
    
    
    
    // PRODUCT LIST VIEW
    let productbody = UI()
    var pview:[UI] = []
    var pdistname:[UI] = []
    var paction:[UI] = []
    var pimag:[UI] = []
    var ptitle:[UI] = []
    var ppricelabel:[UI] = []
    var pprice:[UI] = []
    var pquantity:[UI] = []
    var psubtotallabel:[UI] = []
    var psubtotal:[UI] = []
    var updateShoppingCartbtn = UI()
    var movetoShopListbtn = UI()
    var removeItembtn = UI()
    
    func productlistUI() {
        shoppingCart.productbody.View(x: 10, y: shoppingCart.productlist.view.frame.maxY, width: x-20, height: 10, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), view: shoppingCart.parentbody)
        shoppingCart.productbody.view.isHidden = true
        
        let pv = shoppingCart.productbody.view
        
        for obj in shoppingCart.pview {obj.view.removeFromSuperview()}
        for obj in shoppingCart.pdistname {obj.label.removeFromSuperview()}
        for obj in shoppingCart.paction {obj.label.removeFromSuperview();obj.clickableimg.removeFromSuperview()}
        for obj in shoppingCart.pimag {obj.imag.removeFromSuperview()}
        for obj in shoppingCart.ptitle {obj.label.removeFromSuperview()}
        for obj in shoppingCart.ppricelabel {obj.label.removeFromSuperview()}
        for obj in shoppingCart.pprice {obj.label.removeFromSuperview()}
        for obj in shoppingCart.pquantity {obj.label.removeFromSuperview();obj.txtfield.removeFromSuperview()}
        for obj in shoppingCart.psubtotallabel {obj.label.removeFromSuperview()}
        for obj in shoppingCart.psubtotal {obj.label.removeFromSuperview()}
        shoppingCart.pview.removeAll()
        shoppingCart.pdistname.removeAll()
        shoppingCart.paction.removeAll()
        shoppingCart.pimag.removeAll()
        shoppingCart.ptitle.removeAll()
        shoppingCart.ppricelabel.removeAll()
        shoppingCart.pprice.removeAll()
        shoppingCart.pquantity.removeAll()
        shoppingCart.psubtotallabel.removeAll()
        shoppingCart.psubtotal.removeAll()
        
        var total:Double = 0.0
        var top:CGFloat = 10
        for obj in cartobj {
            shoppingCart.pview.append(UI())
            shoppingCart.pdistname.append(UI())
            shoppingCart.paction.append(UI())
            shoppingCart.pimag.append(UI())
            shoppingCart.ptitle.append(UI())
            shoppingCart.ppricelabel.append(UI())
            shoppingCart.pprice.append(UI())
            shoppingCart.pquantity.append(UI())
            shoppingCart.psubtotallabel.append(UI())
            shoppingCart.psubtotal.append(UI())

            shoppingCart.pview[shoppingCart.pview.count-1].View(x: 10, y: top, width: pv.frame.size.width-20, height: 220, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: pv)
            let v = shoppingCart.pview[shoppingCart.pview.count-1].view
            
            //distributor name
            shoppingCart.pdistname[shoppingCart.pdistname.count-1].Label(x: 10, y: 0, width: v.frame.size.width-20, height: 40, txt: "Distributor: \(obj.distributorName)", fontsize: 16, bold: false, cornerRadius: 3, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), view: v)
            
            //action
            shoppingCart.paction[shoppingCart.paction.count-1].Label(x: 10, y: 40, width: 50, height: 50, txt: "Action", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: v)
            shoppingCart.paction[shoppingCart.paction.count-1].clickableimage(x: 20, y: shoppingCart.paction[shoppingCart.paction.count-1].label.frame.maxY, width: 20, height: 20, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(shoppingCart.pactionButton(_:)), any: shoppingCart, view: v)
            shoppingCart.paction[shoppingCart.paction.count-1].clickableimg.tag = obj.id
            
            //image
            shoppingCart.pimag[shoppingCart.paction.count-1].Image(x: 70, y: 40, width: 100, height: 100, mode: .scaleAspectFit, src: obj.imag, view: v, imageUrl: nil)
            
            //title
            shoppingCart.ptitle[shoppingCart.ptitle.count-1].Label(x: shoppingCart.pimag[shoppingCart.paction.count-1].imag.frame.maxX, y: 40, width: v.frame.size.width-80-shoppingCart.pimag[shoppingCart.paction.count-1].imag.frame.size.width, height: 100, txt: obj.title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: v)
            shoppingCart.pprice[shoppingCart.pprice.count-1].View(x: 10, y: 140, width: v.frame.size.width-20, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: v)
            
            //price
            shoppingCart.ppricelabel[shoppingCart.ppricelabel.count-1].Label(x: 10, y: 142, width: v.frame.size.width/3, height: 30, txt: "Price:", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: v)
            shoppingCart.pprice[shoppingCart.pprice.count-1].Label(x: 10, y: 172, width: v.frame.size.width/3, height: 30, txt: "AUD\(obj.price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), view: v)
            
            
            //quantity
            shoppingCart.pquantity[shoppingCart.pquantity.count-1].Label(x: (v.frame.size.width/2)-30, y: 142, width: 60, height: 30, txt: "Qty:", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: v)
            shoppingCart.pquantity[shoppingCart.pquantity.count-1].Textfield(x: (v.frame.size.width/2)-20, y: 172, width: 40, height: 30, placeholder: "", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: v)
            shoppingCart.pquantity[shoppingCart.pquantity.count-1].txtfield.text = "\(obj.quantity)"
            
            //sub total
            shoppingCart.psubtotallabel[shoppingCart.psubtotallabel.count-1].Label(x: v.frame.size.width-90, y: 142, width: 80, height: 30, txt: "Subtotal", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: v)
            shoppingCart.psubtotal[shoppingCart.psubtotal.count-1].Label(x: v.frame.size.width-90, y: 172, width: 80, height: 30, txt: "AED\(obj.price*Double(obj.quantity))", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), view: v)
            total+=obj.price*Double(obj.quantity)
            shoppingCart.productlistprice.label.text = "Grandtotal \nAED\(total)"
            top = v.frame.maxY + 10
                        
        }
        shoppingCart.updateShoppingCartbtn.Button(x: (x/2)-100, y: top+10, width: 200, height: 40, title: "Update Shopping Cart", fontsize: 14, any: shoppingCart, function: #selector(shoppingCart.updateShoppingCartButton(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4392156863, green: 0.2784313725, blue: 0.6196078431, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: pv)
        shoppingCart.movetoShopListbtn.Button(x: (x/2)-100, y: top+60, width: 200, height: 40, title:"Update Shopping Cart", fontsize: 14 , any: shoppingCart, function: #selector(shoppingCart.movetoShopListButton(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4392156863, green: 0.2784313725, blue: 0.6196078431, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: pv)
        shoppingCart.removeItembtn.Button(x: (x/2)-100, y: top+110, width: 200, height: 40, title:"Update Shopping Cart", fontsize: 14 , any: shoppingCart, function: #selector(shoppingCart.removeItembtnButton(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4392156863, green: 0.2784313725, blue: 0.6196078431, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: pv)
        pv.frame.size.height = top+150
        
    }
    
    
    @objc func pactionButton(_ btn:UIButton){
        if btn.currentBackgroundImage == UIImage(named: "checkfalse") {
            btn.setBackgroundImage(UIImage(named: "checktrue")!, for: .normal)
        }
        else{btn.setBackgroundImage(UIImage(named: "checkfalse")!, for: .normal)}
    }
    
    
    
    // SHIPPING VIEW
    let shippingtitle = UI()
    let country = UI()
    let state = UI()
    let zipcode = UI()
    let shipmethod = UI()
    let shipmethodcheck = UI()
    
    func shippingUI() {
        shoppingCart.shipping.View(x: 10, y: shoppingCart.shipping.label.frame.maxY, width: x-40, height: 400, bkcolor: .clear, cornerRadius: 0, border: 0, borderColor: .clear, view: shoppingCart.summary.view)
        shoppingCart.shipping.view.isHidden = true
        shoppingCart.shippingtitle.Label(x: 10, y: 10, width: x-60, height: 50, txt: "Enter your destination to get a shipping estimate.", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: shoppingCart.shipping.view)
        
        //country
        shoppingCart.country.AutoSizeLabel(x: 10, y: shoppingCart.shippingtitle.label.frame.maxY+10, height: 30, txt: "Country", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: shoppingCart.shipping.view)
        if shoppingCart.isCreated == false {
            shoppingCart.country.ComboBox(["United Arab Emirates"], 0, x: 10, y: shoppingCart.country.autoSizelabel.frame.maxY, width: x-80, height: 40, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cornerRadius: 5, editable: false, placeholder: "", fontsize: 16, iconColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), listbkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), listTextcolor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), view: shoppingCart.shipping.view) {
            }
        }
        
        
        
        //state/province
        shoppingCart.state.AutoSizeLabel(x: 10, y: shoppingCart.country.comboBox.frame.maxY+10, height: 30, txt: "State/Province", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: shoppingCart.shipping.view)
        if shoppingCart.isCreated == false {
            shoppingCart.state.ComboBox(["Abudhabi","Ajman","Dubai","Fujairah","Ras Al Khaimah","Sharjah","Umm Al Qaiwain"], 0, x: 10, y: shoppingCart.state.autoSizelabel.frame.maxY, width: x-80, height: 40, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cornerRadius: 5, editable: false, placeholder: "", fontsize: 16, iconColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), listbkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), listTextcolor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), view: shoppingCart.shipping.view) {
            }
        }
        
        shoppingCart.shipping.view.bringSubviewToFront(shoppingCart.country.comboBox)
        
        
        //zip/postal code
        shoppingCart.zipcode.AutoSizeLabel(x: 10, y: shoppingCart.state.comboBox.frame.maxY+10, height: 30, txt: "Zip/Postal Code", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: shoppingCart.shipping.view)
        shoppingCart.zipcode.Textfield(x: 10, y: shoppingCart.zipcode.autoSizelabel.frame.maxY, width: x-80, height: 40, placeholder: "", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: shoppingCart.shipping.view)
        shoppingCart.shipping.view.bringSubviewToFront(shoppingCart.state.comboBox)
        
        
        shoppingCart.shipmethod.Label(x: 10, y: shoppingCart.zipcode.txtfield.frame.maxY+20, width: x-20, height: 30, txt: "Main Website", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: shoppingCart.shipping.view)
        shoppingCart.shipmethodcheck.CheckBox(x: 10, y: shoppingCart.shipmethod.label.frame.maxY+10, width: 20, height: 20, trueImage: UIImage(named: "radiotrue")!, falseImage: UIImage(named: "radiofalse")!, isTrue: false, view: shoppingCart.shipping.view) {
            print("radio: \(shoppingCart.shipmethodcheck.isCheckBoxChecked)")
        }
        shoppingCart.shipmethodcheck.Label(x: 35, y: shoppingCart.shipmethod.label.frame.maxY, width: 150, height: 40, txt: "Fee AUD0.00", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: shoppingCart.shipping.view)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    // DISCOUT VIEW
    let discountcode = UI()
    func discountUI() {
        shoppingCart.discount.View(x: 10, y: shoppingCart.discount.label.frame.maxY, width: x-40, height: 100, bkcolor: .clear, cornerRadius: 0, border: 0, borderColor: .clear, view: shoppingCart.summary.view)
        shoppingCart.discount.view.isHidden = true
        shoppingCart.discountcode.Label(x: 10, y: 30, width: x-60, height: 30, txt: "Enter Discount Code", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: shoppingCart.discount.view)
        shoppingCart.discountcode.Textfield(x: 10, y: shoppingCart.discountcode.label.frame.maxY, width: x-60, height: 40, placeholder: "Enter Discount Code", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: shoppingCart.discount.view)
        shoppingCart.discountcode.Button(x: 10, y: shoppingCart.discountcode.txtfield.frame.maxY+30, width: x-60, height: 40, title: "ADD DISCOUNT", fontsize: 14, any: shoppingCart, function: #selector(shoppingCart.discountButton(_:)), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: shoppingCart.discount.view)
        shoppingCart.discount.view.frame.size.height = shoppingCart.discountcode.button.frame.maxY+30
        
    }
    
    
    
    
    // Update frame
    func updateframe() {
        if shoppingCart.productbody.view.isHidden {
            shoppingCart.summary.view.frame.origin.y = shoppingCart.productlist.view.frame.maxY+30}
        else{shoppingCart.summary.view.frame.origin.y = shoppingCart.productbody.view.frame.maxY+30}
        
        if shoppingCart.shipping.view.isHidden {
            shoppingCart.summarydetail.view.frame.origin.y = shoppingCart.shipping.label.frame.maxY}
        else{shoppingCart.summarydetail.view.frame.origin.y = shoppingCart.shipping.view.frame.maxY}
        
        shoppingCart.discount.label.frame.origin.y = shoppingCart.summarydetail.view.frame.maxY
        shoppingCart.discount.checkBox.frame.origin.y = shoppingCart.summarydetail.view.frame.maxY+15
        shoppingCart.discount.view.frame.origin.y = shoppingCart.discount.label.frame.maxY

        if shoppingCart.discount.view.isHidden {
            shoppingCart.checkoutbtn.button.frame.origin.y = shoppingCart.discount.label.frame.maxY+30}
        else{shoppingCart.checkoutbtn.button.frame.origin.y = shoppingCart.discount.view.frame.maxY+30}
        
        shoppingCart.requestquotebtn.button.frame.origin.y = shoppingCart.checkoutbtn.button.frame.maxY+30
        shoppingCart.summary.view.frame.size.height = shoppingCart.requestquotebtn.button.frame.maxY+40
        shoppingCart.parentbody.contentSize.height = shoppingCart.summary.view.frame.maxY+50
    }
}
