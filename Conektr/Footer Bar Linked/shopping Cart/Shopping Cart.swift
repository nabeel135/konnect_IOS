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
    
    
    
    
    
    
    
    
    
    
    
    
    
    // variable3
    var isCreated = false
    var parentbody = UIScrollView()
    let header = UI()
    
    let list = UI()
    
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
    
    //MARK:- CREATE
    
    func Create(view:UIScrollView) {
        shoppingCart.parentbody = view
        ///////////////////////////////////////////////////////
        //HEADER
        shoppingCart.header.Label(x: 10, y: 0, width: x-50, height: 50, txt: "SHOPPING CART", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view)
        shoppingCart.header.clickableimage(x: x-40, y: 0, width: 30, height: 40, image: UIImage(named: "quote")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(shoppingCart.quoteButton(_:)), any: shoppingCart, view: view)
        shoppingCart.header.View(x: 0, y: shoppingCart.header.label.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        //PRODUCT LIST
        
        shoppingCart.productlistUI()
        
        
        
        
        
        /// SUMMARY
        shoppingCart.summary.View(x: 10, y: shoppingCart.list.table.frame.maxY+30, width: x-20, height: 500, bkcolor: #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
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
    
    
    
    //MARK:- Product List
    
    // SHOPPING CART Product LIST
    // PRODUCT LIST VIEW
    
    
    func productlistUI() {
        
        oldCartModel_to_New()
        shoppingCart.list.TableView(x: 10, y: shoppingCart.header.view.frame.maxY, width: x-20, height: 600, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), border: 0, borderColor: .clear, separatorColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), Sections: newcartobj.count, SectionHeight: 120, SectionHEIGHT: {}, sectionView: {
            shoppingCart.sectionView()
        }, rows: 0, Rows: {
            shoppingCart.rows()
        }, editing: false, cellheight: 250, CellHeight: {}, Cellview: {
            shoppingCart.cellview()
        }, onDelete: {
        }, view: shoppingCart.parentbody)
        shoppingCart.list.table.reloadData()
    }
    
    func sectionView(){
        let sectionview = shoppingCart.list.tableDelegate.sectionview
        let delegate = shoppingCart.list.tableDelegate
        
        let header = nibView(fileName: "cartheader", ownerClass: shoppingCart) as! cartheaderview
        header.frame = sectionview.frame
        header.layer.borderWidth = 1
        header.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        sectionview.addSubview(header)
        
        header.Input(distributor: newcartobj[delegate.section].distributorName,
                     grandtotal: grandTotal(section: delegate.section),
                     any: shoppingCart,
                     button: #selector(SectionHeaderBUTTON(_:)),
                     buttonTag: delegate.section)
        
    }
    func rows(){
        let delegate = shoppingCart.list.tableDelegate
        
        if newcartobj[delegate.section].isSelected {
            delegate.numberOFrows = newcartobj[delegate.section].product.count
        }
        else{
            delegate.numberOFrows = 0
        }
        
    }
    func cellview(){
        let cell = shoppingCart.list.tableDelegate.cell
        let delegate = shoppingCart.list.tableDelegate
        
        let view = nibView(fileName: "shoppingCartcell", ownerClass: shoppingCart) as! shoppingCartCell
        view.frame = CGRect(x: 10, y: 10, width: cell.frame.size.width-20, height: cell.frame.size.height-100)
        cell.addSubview(view)
        
        
        let obj = newcartobj[delegate.section].product[delegate.index]
        view.Input(any: shoppingCart,
                   action: #selector(actionBUTTON(_:)),
                   actionTag: delegate.index,
                   imageURL: obj.imgUrl,
                   productTitle: obj.name ?? "n/a",
                   Qty: obj.quantity,
                   price: obj.price,
                   subtotal: 0.0)
        
        let btn = nibView(fileName: "shopcartlistbutton", ownerClass: shoppingCart) as! shopCartButtons
        btn.frame = CGRect(x: 10, y: view.frame.maxY, width: cell.frame.size.width-20, height: 85)
        cell.addSubview(btn)
        btn.Input(any: shoppingCart,
                  updateShoppingCart: #selector(updateShoppingCartButton(_:)),
                  moveToShopList: #selector(movetoShopListButton(_:)),
                  removeitem: #selector(removeItembtnButton(_:)),
                  tag: obj.id)
    }
    
    
    
    
    func grandTotal(section:Int)->Double{
        var total = Double()
        for obj in newcartobj[section].product {
            total+=obj.price
        }
        return (total/100)*100
    }
    
    
    
    
    
    
    //MARK:- SHIPPING
    
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
        shoppingCart.summary.view.frame.origin.y = shoppingCart.list.table.frame.maxY
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
    
    
    
    
    
    
    //MARK:- BUTTONS
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
        let cartitem = cartobj.filter{$0.id == btn.tag}.first
        let alertController:UIAlertController = UIAlertController(title: "Confirmation", message: "Are you sure you would like to remove this item from cart?", preferredStyle: .alert)
        
        let okAction:UIAlertAction = UIAlertAction(title: "Yes", style: .default, handler: {(alert:UIAlertAction) in
            
            let delapi = DeleteCartAPIVC()
            delapi.item = cartitem
            delapi.DeleteCart()
           return
        })
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel", style: .default, handler: {(alert:UIAlertAction) in
            
            return
        })
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!.present(alertController, animated: true, completion: nil)
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
        myCartpop.disAppear()
                      
               // footerBar linked pages
               search.disAppear()
               shoppingCart.disAppear()
               SignIn.disAppear()
               bodyfor.CreateAccount.scrollview.isHidden = true
               bodyfor.forgotPassword.scrollview.isHidden = true
               
               Checkout.create(view: bodyfor.Checkout.scrollview)
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
    
    ////////////////////////////////////////
    /////////   section Header arrow button
    //////////////////////////////////////
    @objc func SectionHeaderBUTTON(_ btn:UIButton){
        print("tag: \(btn.tag)  \(btn.currentTitle!)")
        for i in 0..<newcartobj.count {
            if i == btn.tag {
                newcartobj[i].isSelected = true
            }
            else{
                newcartobj[i].isSelected = false
            }
        }
        shoppingCart.list.table.reloadData()
    }
    
    /////////////////////////// product action button checkbox
    @objc func actionBUTTON(_ btn:UIButton){
        print("btntag: \(btn.tag)")
    }
    /*--------------------------------------------------------------*/
    
    
    
    
}
