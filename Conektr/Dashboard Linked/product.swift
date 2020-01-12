//
//  product.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/19/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let product = p()
class p: UIView {
    
    
    
    /*--------------------------------------------------------------*/

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
    @objc func productimageClicked(){
        print("image clicked")
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func favouriteButton(){
        print("Favourite")
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func addtoCartButton(){
        
        
        
       print("add to Cart")
        
        let vc = AddtoCartAPIVC()
                    var item = CartDatum()
                    item.sku = productdetail.sku
                    item.quoteID =  UserDefaults.standard.string(forKey: "quote_id")
                    item.qty = Int(product.quantity.txtfield.text ?? "1")
                    vc.item = item
                vc.AddItemToCart()
        
        
//        let item  = productobj.filter{$0.id == tag}
//        var nsArray = [[String:Any]]()
//            var dictionary = [String:Any]()
//            dictionary["sku"] = item?.sku
//            dictionary["quote_id"] = item?.id
//            dictionary["qty"] = product.quantity.txtfield.text
//        nsArray.append(dictionary)
//        let parameters:[String:Any] = ["cartItem":nsArray]
//        print(parameters)
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func addtoQuoteButton(){
                print("add to quote")
        
        let addtoquote = AddtoQuoteAPIVC()
        var item = CartDatum()
        item.sku = productdetail.sku
        item.quoteID =  ""
        item.qty = Int(product.quantity.txtfield.text ?? "1")
        addtoquote.item = item
        let quote_id = UserDefaults.standard.value(forKey: "quoteToken") as? String
        if(quote_id == nil || quote_id == "")
        {
            addtoquote.CreateQuote1()
        }
        else
        {
            addtoquote.requestser = addtoquote.manager.requestSerializer
            addtoquote.quoteId = quote_id!
            addtoquote.GetItemIdForQuote()
        }
        
        
    }
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// BUTTON
    //////////////////////////////////////////
    @objc func submitReviewButton(){
        print("submit Review")
    }
    
    
    ///////////////////////////////////////////
    //////////////////////////////////////////
    //////////////////// UPDATE QUOTE BUTTON
    //////////////////////////////////////////
    @objc func updateQuoteButton(){
        print("update quote")
    }
    
    /*--------------------------------------------------------------*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var parentbody = UIScrollView()
    let body = UI()
    // for body
    let productimg = UI()
    let distributor = [UI(),UI()]
    let stock = UI()
    let sku = [UI(),UI()]
    let discount = UI()
    var Discount:Double = 0.0
    let price = UI()
    var Price:Double = 0.0
    
    let variantscroll = UI()
    var variantlist:[UI] = []
    
    let clistTitle = [UI(),UI(),UI(),UI()]
    let clistscroll = UI()
    var cname:[UI] = []
    var cprice:[UI] = []
    var ctotal:[UI] = []
    var cqty:[UI] = []
    
    let quantity = UI()
    let inc = UI()
    let dec = UI()
    let favouriteicon = UI()
    let addtoCartbtn = UI()
    let addtoQuotebtn = UI()
    let updateQuotebtn = UI()
    
    let detail = UI()
    let detailbody = UI()
    
    let moreinfo = UI()
    let moreinfobody = UI()
    let productconfig = [UI(),UI()]
    let varient = [UI(),UI()]
    let pricing = [UI(),UI()]
    
    let review = UI()
    let reviewbody = UI()
    let reviewtitle = [UI(),UI()]
    let nickname = UI()
    let summary = UI()
    let reviewi = UI()
    
    let note = UI()
    /////////////////
    
    func create(updateQuote:Bool,view:UIScrollView) {
        
        
        
        product.parentbody = view
        product.body.Label(x: 10, y: 0, width: x-50, height: 50, txt: productdetail.title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view)
        product.body.clickableimage(x: x-40, y: 0, width: 30, height: 40, image: UIImage(named: "quote")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(quoteButton(_:)), any: product, view: view)
        product.body.View(x: 0, y: product.body.label.frame.maxY, width: view.frame.size.width, height: 200, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        product.body.view.layer.shadowRadius = 2
        product.body.view.layer.shadowOpacity = 1
        product.body.view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        product.body.view.layer.shadowOffset = .zero
        /*----------------------*/
        //PRODUCT IMAGE
        product.productimg.View(x: 10, y: 10, width: x-20, height: x-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.4416470462), view: product.body.view)
        product.productimg.Image(x: 10, y: 10, width: x-20, height: x-100, mode: .scaleAspectFit, src: productdetail.imag, view: product.body.view)

        product.productimg.view.addGestureRecognizer(UITapGestureRecognizer(target: product, action: #selector(productimageClicked)))
        
        //DISTRIBUTOR
        product.distributor[0].AutoSizeLabel(x: 10, y: product.productimg.imag.frame.maxY+10, height: 40, txt: "Distributor:", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.body.view)
        product.distributor[1].AutoSizeLabel(x: product.distributor[0].autoSizelabel.frame.maxX+5, y: product.productimg.imag.frame.maxY+10, height: 40, txt: productdetail.distributorName, fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .center, view: product.body.view)
        
        //STOCK
        product.stock.AutoSizeLabel(x: 10, y: product.distributor[0].autoSizelabel.frame.maxY+10, height: 40, txt: "IN STOCK", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.body.view)
        
        //SKU
        product.sku[0].AutoSizeLabel(x: 10, y: product.stock.autoSizelabel.frame.maxY+10, height: 40, txt: "SKU", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .center, view: product.body.view)
        
        product.sku[1].Label(x: product.sku[0].autoSizelabel.frame.maxX+5, y: product.stock.autoSizelabel.frame.maxY+10, width: x-20-product.sku[0].autoSizelabel.frame.size.width, height: 40, txt: productdetail.sku, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: product.body.view)
        
        
        //PRICE
        
        if productdetail.typeId == "simple" {
            product.discount.label.isHidden = false
            product.variantscroll.label.isHidden = true
            product.variantscroll.scrollview.isHidden = true
            product.clistTitle[0].label.isHidden = true
            product.clistTitle[1].label.isHidden = true
            product.clistTitle[2].label.isHidden = true
            product.clistTitle[3].label.isHidden = true
            product.clistscroll.scrollview.isHidden = true
            
            product.Discount = productdetail.discount
            product.Price = productdetail.price
            product.discount.Label(x: 10, y: product.sku[0].autoSizelabel.frame.maxY+10, width: 100, height: 40, txt: "AED\(product.Discount)", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: product.body.view)
            product.discount.View(x: 10, y: 20, width: product.discount.label.frame.size.width, height: 1, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: product.discount.label)
            product.price.Label(x: 110, y: product.sku[0].autoSizelabel.frame.maxY+10, width: x-130, height: 40, txt: "AED\(product.Price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), view: product.body.view)
        }
        else{
            
            product.discount.label.isHidden = true
            product.variantscroll.label.isHidden = false
            product.variantscroll.scrollview.isHidden = false
            product.clistTitle[0].label.isHidden = false
            product.clistTitle[1].label.isHidden = false
            product.clistTitle[2].label.isHidden = false
            product.clistTitle[3].label.isHidden = false
            product.clistscroll.scrollview.isHidden = false
            // start to end price
            product.price.Label(x: 10, y: product.sku[0].autoSizelabel.frame.maxY+10, width: x-20, height: 40, txt: "From 'AED\(productdetail.startprice)' to 'AED\(productdetail.endprice)'", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: product.body.view)
            
            // VARIANT LIST
            
            product.variantlistview()
            
            // PRODUCT CONFIG LIST
            
            product.configlistCellview()
            
        }
        
        
        //QUANTITY
        var qy = CGFloat()
        if product.discount.label.isHidden {
            qy = product.clistscroll.scrollview.frame.maxY+10
        }
        else{
            qy = product.price.label.frame.maxY+10
        }
        product.quantity.AutoSizeLabel(x: 10, y: qy, height: 30, txt: "Total Qty", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.body.view)
        product.quantity.Textfield(x: product.quantity.autoSizelabel.frame.maxX+5, y: qy, width: 40, height: 30, placeholder: "", border: 1, borderRadius: 0, txtAlign: .center, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: .clear, view: product.body.view)
        product.quantity.txtfield.text = "\(productdetail.quantity)"
//            product.inc.clickableimage(x: product.quantity.txtfield.frame.maxX+2, y: qy+5, width: 25, height: 25, image: #imageLiteral(resourceName: "inc.png"), cornerRadius: 15, borderWidth: 0, borderColor: .clear, function: #selector(incquantitybtn(_:)), any: self, view: product.body.view)
//                product.dec.clickableimage(x: inc.clickableimg.frame.maxX+2, y: qy+5, width: 25, height: 25, image: #imageLiteral(resourceName: "dec"), cornerRadius: 15, borderWidth: 0, borderColor: .clear, function: #selector(decquantitybtn(_:)), any: self, view: product.body.view)
        product.favouriteicon.CheckBox(x: product.quantity.txtfield.frame.maxX+5, y: qy, width: 30, height: 30, trueImage: UIImage(named: "hearttrue")!, falseImage: UIImage(named: "heartfalse")!, isTrue: false, view: product.body.view) {
            product.favouriteButton()
        }
        
        //BUTTONS
        if updateQuote {
            product.updateQuotebtn.button.isHidden = false
            product.addtoCartbtn.button.isHidden = true
            product.addtoQuotebtn.button.isHidden = true
            
            product.updateQuotebtn.Button(x: 10, y: product.quantity.autoSizelabel.frame.maxY+20, width: x-20, height: 40, title: "UPDATE QUOTE", fontsize: 12, any: product, function: #selector(product.updateQuoteButton), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4269987643, green: 0.2234997749, blue: 0.5975795984, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: product.body.view)
        }
        else{
            product.updateQuotebtn.button.isHidden = true
            product.addtoCartbtn.button.isHidden = false
            product.addtoQuotebtn.button.isHidden = false
            
            product.addtoCartbtn.Button(x: 10, y: product.quantity.autoSizelabel.frame.maxY+20, width: (x-30)/2, height: 40, title: "ADD TO CART", fontsize: 12, any: product, function: #selector(product.addtoCartButton), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4269987643, green: 0.2234997749, blue: 0.5975795984, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: product.body.view)
            
            product.addtoQuotebtn.Button(x: product.addtoCartbtn.button.frame.maxX+10, y: product.quantity.autoSizelabel.frame.maxY+20, width: (x-30)/2, height: 40, title: "ADD TO QUOTE", fontsize: 12, any: product, function: #selector(product.addtoQuoteButton), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4269987643, green: 0.2234997749, blue: 0.5975795984, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: product.body.view)
        }
        
        
        var dy:CGFloat = product.addtoCartbtn.button.frame.maxY+50
        if updateQuote {
            dy = product.updateQuotebtn.button.frame.maxY+50
        }
        
        //////////////////////////////////////////////// DETAIL
        product.detail.View(x: 10, y: dy, width: x-20, height: 50, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), view: product.body.view)
        product.detail.Label(x: 20, y: 0, width: 150, height: 50, txt: "DETIALS", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: product.detail.view)
        product.detail.Image(x: product.detail.view.frame.size.width-40, y: 15, width: 20, height: 20, mode: .scaleAspectFit, src: UIImage(named: "+")!, view: product.detail.view)
        product.detail.view.addGestureRecognizer(UITapGestureRecognizer(target: product, action: #selector(product.detailClick)))
        
        product.detailbody.Label(x: 10, y: product.detail.view.frame.maxY+10, width: x-20, height: 50, txt: productdetail.description, fontsize: 16, bold: false, cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), alignment: .center, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: product.body.view)
        product.detailbody.label.isHidden = true
        /*------------------------------------------*/
        /////////////////////////////////////////// MORE INFO
        var morey = product.detailbody.label.frame.maxY+10
        if product.detailbody.label.isHidden {
            morey = product.detail.view.frame.maxY+10
        }
        
        product.moreinfo.View(x: 10, y: morey, width: x-20, height: 50, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), view: product.body.view)
        product.moreinfo.Label(x: 20, y: 0, width: 250, height: 50, txt: "MORE INFORMATION", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: product.moreinfo.view)
        product.moreinfo.Image(x: product.moreinfo.view.frame.size.width-40, y: 15, width: 20, height: 20, mode: .scaleAspectFit, src: UIImage(named: "+")!, view: product.moreinfo.view)
        product.moreinfo.view.addGestureRecognizer(UITapGestureRecognizer(target: product, action: #selector(moreInfoClick)))

        product.moreinfobody.View(x: 10, y: product.moreinfo.view.frame.maxY+10, width: x-20, height: 50, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), view: product.body.view)
        
        // PRODUCT CONFIG
        product.productconfig[0].AutoSizeLabel(x: 20, y: 0, height: 40, txt: "Product Config:", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 1, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.moreinfobody.view)
        product.productconfig[1].AutoSizeLabel(x: product.productconfig[0].autoSizelabel.frame.maxX+5, y: 0, height: 40, txt: productdetail.config, fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.moreinfobody.view)
        
        // VARIENT
        product.varient[0].AutoSizeLabel(x: 20, y: product.productconfig[0].autoSizelabel.frame.maxY, height: 40, txt: "Varient:", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.moreinfobody.view)
        product.varient[1].AutoSizeLabel(x: product.varient[0].autoSizelabel.frame.maxX+5, y: product.productconfig[0].autoSizelabel.frame.maxY, height: 40, txt: productdetail.variant, fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.moreinfobody.view)
        
        // PRICING
        product.pricing[0].AutoSizeLabel(x: 20, y: product.varient[0].autoSizelabel.frame.maxY, height: 40, txt: "Pricing:", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.moreinfobody.view)
        product.pricing[1].AutoSizeLabel(x: product.pricing[0].autoSizelabel.frame.maxX+5, y: product.varient[0].autoSizelabel.frame.maxY, height: 40, txt: productdetail.pricing, fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.moreinfobody.view)
        
        product.moreinfobody.view.frame.size.height = product.pricing[0].autoSizelabel.frame.maxY+50
        product.moreinfobody.view.isHidden = true
        /*------------------------------------------*/
        ///////////////////////////////////////////////// REVIEW
        var reviewy = product.moreinfobody.view.frame.maxY+10
        if product.moreinfobody.view.isHidden {
             reviewy = product.moreinfo.view.frame.maxY+10
        }
        product.review.View(x: 10, y: reviewy, width: x-20, height: 50, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), view: product.body.view)
        product.review.Label(x: 20, y: 0, width: 150, height: 50, txt: "REVIEWS", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: product.review.view)
        product.review.Image(x: product.review.view.frame.size.width-40, y: 15, width: 20, height: 20, mode: .scaleAspectFit, src: UIImage(named: "+")!, view: product.review.view)
        product.review.view.addGestureRecognizer(UITapGestureRecognizer(target: product, action: #selector(product.reviewClick)))

        product.reviewbody.View(x: 10, y: product.review.view.frame.maxY+10, width: x-20, height: 100, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), view: product.body.view)
        
        // REVIEWTITLE
        product.reviewtitle[0].AutoSizeLabel(x: 20, y: 20, height: 40, txt: "You're reviewing:", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.reviewbody.view)
        product.reviewtitle[1].Label(x: 20, y: product.reviewtitle[0].autoSizelabel.frame.maxY, width: product.reviewbody.view.frame.size.width-40, height: 60, txt: productdetail.title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: product.reviewbody.view)
        
        // NICKNAME
        product.nickname.AutoSizeLabel(x: 20, y: product.reviewtitle[1].label.frame.maxY+20, height: 30, txt: "Nickname", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.reviewbody.view)
        product.nickname.Image(x: product.nickname.autoSizelabel.frame.maxX+5, y: product.reviewtitle[1].label.frame.maxY+30, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: product.reviewbody.view)
        product.nickname.Textfield(x: 20, y: product.nickname.autoSizelabel.frame.maxY, width: product.reviewbody.view.frame.size.width-40, height: 40, placeholder: "nickname", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: product.reviewbody.view)
        
        // SUMMARY
        product.summary.AutoSizeLabel(x: 20, y: product.nickname.txtfield.frame.maxY+20, height: 30, txt: "Summary", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.reviewbody.view)
        product.summary.Image(x: product.summary.autoSizelabel.frame.maxX+5, y: product.nickname.txtfield.frame.maxY+30, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: product.reviewbody.view)
        product.summary.Textfield(x: 20, y: product.summary.autoSizelabel.frame.maxY, width: product.reviewbody.view.frame.size.width-40, height: 40, placeholder: "summary", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: .clear, view: product.reviewbody.view)
        
        // REVIEWi
        product.reviewi.AutoSizeLabel(x: 20, y: product.summary.txtfield.frame.maxY+20, height: 30, txt: "Review", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 1, borderColor: .clear, cornerRadius: 0, alignment: .left, view: product.reviewbody.view)
        product.reviewi.Image(x: product.reviewi.autoSizelabel.frame.maxX+5, y: product.summary.txtfield.frame.maxY+30, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: product.reviewbody.view)
        product.reviewi.TextView(x: 20, y: product.reviewi.autoSizelabel.frame.maxY, width: product.reviewbody.view.frame.size.width-40, height: 100, border: 1, text: "type here", cornerRadius: 5, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), size: 18, weight: .regular, bkColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), textColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), align: .left, view: product.reviewbody.view)
        product.reviewi.Button(x: 20, y: product.reviewi.txtview.frame.maxY+40, width: product.reviewbody.view.frame.size.width-40, height: 40, title: "SUBMIT REVIEW", fontsize: 14, any: product, function: #selector(submitReviewButton), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: product.reviewbody.view)
        product.reviewbody.view.frame.size.height = product.reviewi.button.frame.maxY+20
        product.reviewbody.view.isHidden = true
        /*----------------------*/
        var Y = product.reviewbody.view.frame.maxY+10
        if product.reviewbody.view.isHidden {
            Y = product.review.view.frame.maxY+10
        }

        product.body.view.frame.size.height = Y
        view.contentSize.height = product.body.view.frame.maxY
        Appear()
        product.detailClick()
    }
    
    
    // MARK:- Variant List
    func variantlistview() {
        product.variantscroll.label.isHidden = false
        product.variantscroll.scrollview.isHidden = false
        product.variantscroll.Label(x: 10, y: product.price.label.frame.maxY+10, width: x-20, height: 40, txt: "Variant", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), view: product.body.view)
        product.variantscroll.ScrollView(x: 0, y: product.variantscroll.label.frame.maxY, width: x, height: 60, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), contentwidth: x, contentheight: 50, view: product.body.view)
        
        
        
        for obj in product.variantlist {obj.button.removeFromSuperview()}
        product.variantlist.removeAll()
        var vx:CGFloat = 10
        for obj in productdetail.variantlist {
            product.variantlist.append(UI())
            if product.variantlist.count == 1 {
                var a = obj
                a.isSelected = true
                product.variantlist[product.variantlist.count-1].Button(x: vx, y: 10, width: 100, height: 40, title: obj.name, fontsize: 14, any: self, function: #selector(product.selectVariant(_:)), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.4235294118, green: 0.2235294118, blue: 0.5921568627, alpha: 1), bkcolor: #colorLiteral(red: 0.4235294118, green: 0.2235294118, blue: 0.5921568627, alpha: 1), txtcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), view: product.variantscroll.scrollview)
            }
            else{
                product.variantlist[product.variantlist.count-1].Button(x: vx, y: 10, width: 100, height: 40, title: obj.name, fontsize: 14, any: self, function: #selector(product.selectVariant(_:)), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.4235294118, green: 0.2235294118, blue: 0.5921568627, alpha: 1), bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), view: product.variantscroll.scrollview)
            }
            product.variantlist[product.variantlist.count-1].button.tag = obj.id
            product.variantscroll.scrollview.contentSize.width = product.variantlist[product.variantlist.count-1].button.frame.maxX+10
            
            vx+=110
        }
    }
    @objc func selectVariant(_ btn:UIButton){
        print("selectvariant: \(btn.tag)")
        for i in 0..<productdetail.variantlist.count {
            if productdetail.variantlist[i].id == btn.tag {
                productdetail.variantlist[i].isSelected = true
                btn.backgroundColor = #colorLiteral(red: 0.4235294118, green: 0.2235294118, blue: 0.5921568627, alpha: 1)
                btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                productdetail.variantlist[i].isSelected = false
                product.variantlist[i].button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                product.variantlist[i].button.tintColor = #colorLiteral(red: 0.4235294118, green: 0.2235294118, blue: 0.5921568627, alpha: 1)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    // MARK:- Config List
    func configlistCellview() {
        product.clistTitle[0].label.isHidden = false
        product.clistTitle[1].label.isHidden = false
        product.clistTitle[2].label.isHidden = false
        product.clistTitle[3].label.isHidden = false
        product.clistscroll.scrollview.isHidden = false
        // header of table
        let hy = product.variantscroll.scrollview.frame.maxY+10
        product.clistTitle[0].Label(x: 0, y: hy, width: (x/100)*30, height: 50, txt: "Prouct Config", fontsize: 16, bold: false, cornerRadius: 2, border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), alignment: .center, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: product.body.view)
        product.clistTitle[1].Label(x: product.clistTitle[0].label.frame.maxX, y: hy, width: (x/100)*25, height: 50, txt: "Unit Price", fontsize: 16, bold: false, cornerRadius: 2, border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), alignment: .center, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: product.body.view)
        product.clistTitle[2].Label(x: product.clistTitle[1].label.frame.maxX, y: hy, width: (x/100)*25, height: 50, txt: "Subtotal", fontsize: 16, bold: false, cornerRadius: 2, border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), alignment: .center, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: product.body.view)
        product.clistTitle[3].Label(x: product.clistTitle[2].label.frame.maxX, y: hy, width: (x/100)*20, height: 50, txt: "Qty", fontsize: 16, bold: false, cornerRadius: 2, border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), alignment: .center, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: product.body.view)
        
        // clist scroll
        product.clistscroll.ScrollView(x: 0, y: product.clistTitle[0].label.frame.maxY, width: x, height: 100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: 100, view: product.body.view)
        
        for obj in product.cname {obj.button.removeFromSuperview()}
        for obj in product.cprice {obj.label.removeFromSuperview()}
        for obj in product.ctotal {obj.label.removeFromSuperview()}
        for obj in product.cqty {obj.txtfield.removeFromSuperview()}
        product.cname.removeAll()
        product.cprice.removeAll()
        product.ctotal.removeAll()
        product.cqty.removeAll()
        
        var top:CGFloat = 10
        for i in 0..<productdetail.configlist.count {
            let scroll = product.clistscroll.scrollview
            let n = UI()
            let p = UI()
            let t = UI()
            let q = UI()
            let price = (productdetail.configlist[i].price*100)/100
            n.Button(x: 10, y: top, width: ((x/100)*30)-15, height: 40, title: productdetail.configlist[i].title, fontsize: 14, any: self, function: #selector(product.selectConfig(_:)), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), view: scroll)
            n.button.tag = productdetail.configlist[i].id
            p.Label(x: n.button.frame.maxX+10, y: top, width: ((x/100)*25)-10, height: 40, txt: "AED\(price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll)
            t.Label(x: p.label.frame.maxX+10, y: top, width: ((x/100)*25)-10, height: 40, txt: "AED\(0.0)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll)
            t.label.tag = productdetail.configlist[i].id
            q.Textfield(x: t.label.frame.maxX+10, y: top, width: 40, height: 40, placeholder: "0", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: scroll)
            q.txtfield.text = "0"
            q.txtfield.tag = productdetail.configlist[i].id
            q.txtfield.addTarget(self, action: #selector(product.configqtyEditChange(_:)), for: .editingChanged)
            
            top+=60
            scroll.contentSize.height = top
            scroll.frame.size.height = top
            product.cname.append(n)
            product.cprice.append(p)
            product.ctotal.append(t)
            product.cqty.append(q)
        }
        
    }
    
    @objc func selectConfig(_ btn:UIButton){
        for i in 0..<productdetail.configlist.count {
            if btn.tag == productdetail.configlist[i].id {
                productdetail.configlist[i].isSelected = true
                btn.backgroundColor = #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1)
                btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                productdetail.configlist[i].isSelected = false
                product.cname[i].button.backgroundColor
                 = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                product.cname[i].button.tintColor = #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1)
            }
        }
    }
    
    @objc func configqtyEditChange(_ field:UITextField){
        for i in 0..<productdetail.configlist.count {
            if field.tag == productdetail.configlist[i].id {
                if product.ctotal[i].txtfield.text == "" {
                    product.ctotal[i].txtfield.text = "0"
                }
                let price = productdetail.configlist[i].price
                let qty = Double(field.text!) ?? 0
                let total = (price*qty*100)/100
                product.ctotal[i].label.text = "AED\(total)"
                
            }
        }
    }
    
    
    
    
    
    
    
    
    
    func Appear() {
        product.parentbody.isHidden = false
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
    }
    
    func disAppear() {
        product.parentbody.isHidden = true
    }
    
    @objc func incquantitybtn(_ btn:UIButton){
        product.quantity.txtfield.text=String((Int(product.quantity.txtfield.text!) ?? 1)+1)
    }
    @objc func decquantitybtn(_ btn:UIButton){
        if Int(product.quantity.txtfield.text!) ?? 1 > 1  {
            product.quantity.txtfield.text=String((Int(product.quantity.txtfield.text!) ?? 1)-1)
        }
    }
    
    @objc func detailClick(){
        product.detail.imag.image = UIImage(named: "-")
        product.moreinfo.imag.image = UIImage(named: "+")
        product.review.imag.image = UIImage(named: "+")
        product.detailbody.label.isHidden = false
        product.moreinfobody.view.isHidden = true
        product.reviewbody.view.isHidden = true
        product.layoutUpdate()
    }
    @objc func moreInfoClick(){
        product.detail.imag.image = UIImage(named: "+")
        product.moreinfo.imag.image = UIImage(named: "-")
        product.review.imag.image = UIImage(named: "+")
        product.detailbody.label.isHidden = true
        product.moreinfobody.view.isHidden = false
        product.reviewbody.view.isHidden = true
        product.layoutUpdate()
    }
    @objc func reviewClick(){
        product.detail.imag.image = UIImage(named: "+")
        product.moreinfo.imag.image = UIImage(named: "+")
        product.review.imag.image = UIImage(named: "-")
        product.detailbody.label.isHidden = true
        product.moreinfobody.view.isHidden = true
        product.reviewbody.view.isHidden = false
        product.layoutUpdate()
    }
    
    func layoutUpdate() {
        var morey = product.detailbody.label.frame.maxY+10
        if product.detailbody.label.isHidden {morey = product.detail.view.frame.maxY+10}
        product.moreinfo.view.frame.origin.y = morey
        
        var reviewy = product.moreinfobody.view.frame.maxY+10
        if product.moreinfobody.view.isHidden {reviewy = product.moreinfo.view.frame.maxY+10}
        product.review.view.frame.origin.y = reviewy
        
        var noteY = product.reviewbody.view.frame.maxY+10
        if product.reviewbody.view.isHidden {noteY = product.review.view.frame.maxY+10}
        product.note.label.frame.origin.y = noteY
        product.body.view.frame.size.height = product.note.label.frame.maxY
        product.parentbody.contentSize.height = product.body.view.frame.maxY
    }
    
}
