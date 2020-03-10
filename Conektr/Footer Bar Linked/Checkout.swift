        //
    //  Cashout.swift
    //  Conektr
    //
    //  Created by Mr. Nabeel on 12/19/19.
    //  Copyright © 2019 Mr. Nabeel. All rights reserved.
    //
    import Foundation
    import UIKit
    //var shippingAddress:[sa] = []
    //struct sa {
    //    var isselected = false
    //    var l1 = ""
    //    var l2 = ""
    //    var l3 = ""
    //    var l4 = ""
    //    var l5 = ""
    //}
    var billingAddress = ba()
    struct ba {
        var l1 = ""
        var l2 = ""
        var l3 = ""
        var l4 = ""
        var l5 = ""
    }
    let Checkout = c()
    class c: UIView {
            
            
            
            
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
        @objc func applyDiscountButton(_ btn:UIButton){
            print("apply discount")
        }
        ///////////////////////////////////////////
        //////////////////////////////////////////
        //////////////////// BUTTON
        //////////////////////////////////////////
        @objc func placeOrderButton(_ btn:UIButton){
            //print("place order")
                
            let id = shippingAddress.filter {$0.isselected == true}.first?.id
            let shipaddresdata = billingAddObj.filter{$0.id == id}.first!
                
            var billingaddress:[String:Any] = [String:Any]()
            var shipingaddressaray = ["region": shipaddresdata.region!.region!,
                                      "region_id": shipaddresdata.regionID!,
                                      "country_id": shipaddresdata.countryID!,
                                      "street": shipaddresdata.street!,
                                      "company": shipaddresdata.company!,
                                      "telephone": shipaddresdata.telephone!,
                                      "postcode": shipaddresdata.postcode!,
                                      "city": shipaddresdata.city!,
                                      "firstname": shipaddresdata.firstname!,
                                      "lastname": shipaddresdata.lastname!,
                                      "email": custDetailModel?.email ?? "",
                                      "prefix": "address_",
                                      "region_code": shipaddresdata.region!.regionCode!,
                                      "sameAsBilling": Checkout.review.isCheckBoxChecked ? 1 : 0] as [String : Any]
                
            if(Checkout.review.isCheckBoxChecked)
            {
                billingaddress = ["region": shipaddresdata.region!.region!,
                "region_id": shipaddresdata.regionID!,
                "country_id": shipaddresdata.countryID!,
                "street": shipaddresdata.street!,
                "company": shipaddresdata.company!,
                "telephone": shipaddresdata.telephone!,
                "postcode": shipaddresdata.postcode!,
                "city": shipaddresdata.city!,
                "firstname": shipaddresdata.firstname!,
                "lastname": shipaddresdata.lastname!,
                "email": custDetailModel?.email ?? "",
                "prefix": "address_",
                "region_code": shipaddresdata.region!.regionCode!] as [String : Any]
            }
            else
            {
                billingaddress = ["region": SelectedBillingAddress.region!.region!,
                                  "region_id": SelectedBillingAddress.regionID!,
                                  "country_id": SelectedBillingAddress.countryID!,
                                  "street": SelectedBillingAddress.street!,
                                  "company": SelectedBillingAddress.company!,
                                  "telephone": SelectedBillingAddress.telephone!,
                                  "postcode": SelectedBillingAddress.postcode!,
                                  "city": SelectedBillingAddress.city!,
                                  "firstname": SelectedBillingAddress.firstname!,
                                  "lastname": SelectedBillingAddress.lastname!,
                "email": customer.email!,
                "prefix": "address_",
                "region_code": SelectedBillingAddress.region!.regionCode!] as [String : Any]
            }
                
            var dictionary = Dictionary<String,Any>()
            dictionary["method"] = selectedpaymentmethod
            let parameters:[String:Any] = ["paymentMethod": dictionary,"addressInformation":["shippingAddress":shipingaddressaray,"billingAddress":billingaddress,"shipping_method_code": "freeshipping",
            "shipping_carrier_code": "freeshipping"]]
            
            
            let shipparameters:[String:Any] = ["addressInformation":["shippingAddress":shipingaddressaray,"billingAddress":billingaddress,"shipping_method_code": "freeshipping",
            "shipping_carrier_code": "freeshipping"]]
            print(parameters)
                
            let createordervc = CreateOrderAPIVC()
                
    //        createordervc.CreateOrder(parameters: parameters)
            createordervc.CreateShiping(ShipingParameters: shipparameters, CreateorderParameters: parameters)
        }
        /*--------------------------------------------------------------*/
            
            
            
            
            
            
            
        // variable
        var parentbody = UIScrollView()
            
        let header = UI()
        let left = UI()
        let right = UI()
        var total:Double = 0.0
        let title = UI()
        ///////// SHIPPING
        let shiptitle = UI()
        var shipping:[UI] = []
        let newaddressbtn = UI()
        let shipmethod = UI()
        let shipmethodsub = [UI(),UI()]
        /////////// REVIEW & PAYMENTS
        let paymenttitle = UI()
        let distributorterm = UI()
        let cash = UI()
        let card = UI()
        let carddesc = UI()
        let apply = UI()
        //////////REVIEW
        let review = UI()
        let reviewaddress = UI()
        let reviewinst = UI()
        let reviewoption = UI()
        var reviewoptionpop:[UI] = []
            
        func create(view:UIScrollView) {
            Checkout.parentbody = view
                
                
            ////// HEADER
            Checkout.header.Image(x: 10, y: 10, width: 150, height: 25, mode: .scaleToFill, src: UIImage(named: "logo")!, view: view, imageUrl: nil)
            Checkout.header.View(x: 0, y: header.imag.frame.maxY+10, width: x, height: 1, bkcolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
            Checkout.header.clickableimage(x: x-40, y: 0, width: 30, height: 40, image: UIImage(named: "quote")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Checkout.quoteButton(_:)), any: Checkout, view: view)
                
                
            ////// ONE TWO PAGE IDENTIFIER
            let lx = ((x-20)/2)/2+10
            let ly = Checkout.header.view.frame.maxY+50
            let lw = (x-20)/2
            Checkout.left.Arc(x: lx, y: ly, startAngle: 0, endAngle: 360, radius: 30, fillcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: view)
            Checkout.left.line(p1: CGPoint(x: 10, y: ly), p2: CGPoint(x: x/2, y: ly), lineWidth: 5, color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: view)
            Checkout.left.Image(x: lx-25, y: ly-25, width: 50, height: 50, mode: .scaleToFill, src: UIImage(named: "tickwhite")!, view: view, imageUrl: nil)
            Checkout.left.Label(x: 10, y: ly+30, width: lw, height: 30, txt: "Shipping", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), view: view)
                
                
            Checkout.right.Arc(x: lx+(x/2)-10, y: ly, startAngle: 0, endAngle: 360, radius: 30, fillcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: view)
            Checkout.right.line(p1: CGPoint(x: x/2, y: ly), p2: CGPoint(x: x-10, y: ly), lineWidth: 5, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: view)
            Checkout.right.Image(x: lx+(x/2)-35, y: ly-25, width: 50, height: 50, mode: .scaleToFill, src: UIImage(named: "2")!, view: view, imageUrl: nil)
            Checkout.right.Label(x: x/2, y: ly+30, width: lw, height: 30, txt: "Review & Payments", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), view: view)
                
                
            Checkout.title.Label(x: 10, y: Checkout.left.label.frame.maxY+20, width: x-20, height: 40, txt: "Estimated Total AED\(Checkout.total)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view)
            Checkout.title.View(x: 10, y: Checkout.title.label.frame.maxY+10, width: x-20, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
                
                
            Checkout.left.View(x: 0, y: Checkout.title.view.frame.maxY+10, width: x, height: 100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
                
                
                
                
                
                
                
                
                
            //////////////////////////////////////////////////////
            /////////////////////////////////////////////////////
            /////////// SHIPPING BODY
            /////////////////////////////////////////////////////
                
                
                
            Checkout.shiptitle.Label(x: 10, y: 10, width: x-20, height: 40, txt: "Shipping Address", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), view: Checkout.left.view)
            var top:CGFloat = 50
            for i in 0..<shippingAddress.count {
                Checkout.shipping.append(UI())
                Checkout.shipping[i].View(x: 10, y: top, width: x-20, height: 400, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 2, borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), view: Checkout.left.view)
                Checkout.shipping[i].Label(x: 10, y: 10, width: Checkout.shipping[i].view.frame.size.width-20, height: 200, txt: "\(shippingAddress[i].l1)\n\n\(shippingAddress[i].l2)\n\n\(shippingAddress[i].l3)\n\n\(shippingAddress[i].l4)\n\n\(shippingAddress[i].l5)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.shipping[i].view)
                    
                if shippingAddress[i].isselected {
                    Checkout.shipping[i].view.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    Checkout.shipping[i].Image(x: Checkout.shipping[i].view.frame.maxX-40, y: 0, width: 30, height: 30, mode: .scaleToFill, src: UIImage(named: "tickorange")!, view: Checkout.shipping[i].view, imageUrl: nil)
                    Checkout.shipping[i].view.frame.size.height = Checkout.shipping[i].label.frame.maxY+10
                }
                else{
                    Checkout.shipping[i].Button(x: 10, y: Checkout.shipping[i].label.frame.maxY+10, width: x-40, height: 30, title: "ShipHere", fontsize: 14, any: Checkout, function: #selector(Checkout.shiphereButton(_:)), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 0.4431372549, green: 0.2784313725, blue: 0.6156862745, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.shipping[i].view)
                    Checkout.shipping[i].button.tag = i
                    Checkout.shipping[i].line(p1: CGPoint(x: 0, y: Checkout.shipping[i].button.frame.maxY+10),
                                              p2: CGPoint(x: x-20, y: Checkout.shipping[i].button.frame.maxY+10),
                                              lineWidth: 2, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), view: Checkout.shipping[i].view)
                    Checkout.shipping[i].view.frame.size.height = Checkout.shipping[i].button.frame.maxY+10
                }
                    
                top+=Checkout.shipping[i].view.frame.size.height+10
                Checkout.left.view.frame.size.height = top
                    
            }
                
                
            Checkout.newaddressbtn.Button(x: 10, y: top, width: x-20, height: 35, title: "+ NEW ADDRESS", fontsize: 14, any: Checkout, function: #selector(Checkout.newAddressButton(_:)), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 0.4431372549, green: 0.2784313725, blue: 0.6156862745, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.left.view)
            Checkout.shipmethod.Label(x: 10, y: Checkout.newaddressbtn.button.frame.maxY+50, width: x-20, height: 40, txt: "Shipping Method", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), view: Checkout.left.view)
            Checkout.shipmethodsub[0].Label(x: 10, y: Checkout.shipmethod.label.frame.maxY, width: x-20, height: 30, txt: "Main Website", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.left.view)
            Checkout.shipmethod.CheckBox(x: 10, y: Checkout.shipmethodsub[0].label.frame.maxY+10, width: 20, height: 20, trueImage: UIImage(named: "radiotrue")!, falseImage: UIImage(named: "radiofalse")!, isTrue: false, view: Checkout.left.view) {
                print("radio: \(Checkout.shipmethod.isCheckBoxChecked)")
            }
            Checkout.shipmethodsub[1].Label(x: 35, y: Checkout.shipmethodsub[0].label.frame.maxY, width: 150, height: 40, txt: "Fee AUD0.00", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.left.view)
                
            Checkout.left.Button(x: 10, y: Checkout.shipmethodsub[1].label.frame.maxY+20, width: x-20, height: 50, title: "NEXT", fontsize: 14, any: Checkout, function: #selector(Checkout.nextButton(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4431372549, green: 0.2784313725, blue: 0.6156862745, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.left.view)
            Checkout.left.view.frame.size.height = Checkout.left.button.frame.maxY+50
            Checkout.left.view.isHidden = false
                
                
                
                
                
                
                
                
                
                
                
                
            //////////////////////////////////////////////////////
            /////////////////////////////////////////////////////
            /////////// Review & Payment method
            /////////////////////////////////////////////////////
            Checkout.right.View(x: 0, y: Checkout.title.view.frame.maxY+10, width: x, height: 500, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
            Checkout.right.view.isHidden = true
                
                
            Checkout.paymenttitle.Label(x: 10, y: 10, width: x-20, height: 40, txt: "Payment Method:", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), view: Checkout.right.view)
                
            // distributor term
            Checkout.distributorterm.clickableimage(x: 10, y: Checkout.paymenttitle.label.frame.maxY+10, width: 20, height: 20, image: UIImage(named: "radiofalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Checkout.paymentradioButton(_:)), any: Checkout, view: Checkout.right.view)
            Checkout.distributorterm.clickableimg.tag = 1
            Checkout.distributorterm.Label(x: Checkout.distributorterm.clickableimg.frame.maxX+5, y: Checkout.paymenttitle.label.frame.maxY, width: 200, height: 40, txt: "As per Distributor Terms", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.right.view)
            Checkout.distributorterm.View(x: 10, y: Checkout.distributorterm.label.frame.maxY, width: x-20, height: 1, bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: Checkout.right.view)
                
            // cash
            Checkout.cash.clickableimage(x: 10, y: Checkout.distributorterm.view.frame.maxY+10, width: 20, height: 20, image: UIImage(named: "radiofalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Checkout.paymentradioButton(_:)), any: Checkout, view: Checkout.right.view)
            Checkout.cash.clickableimg.tag = 2
            Checkout.cash.Label(x: Checkout.cash.clickableimg.frame.maxX+5, y: Checkout.distributorterm.view.frame.maxY, width: 200, height: 40, txt: "Cash On Delivery", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.right.view)
            Checkout.cash.View(x: 10, y: Checkout.cash.label.frame.maxY, width: x-20, height: 1, bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: Checkout.right.view)
                
            // card
            Checkout.card.clickableimage(x: 10, y: Checkout.cash.view.frame.maxY+10, width: 20, height: 20, image: UIImage(named: "radiofalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Checkout.paymentradioButton(_:)), any: Checkout, view: Checkout.right.view)
            Checkout.card.clickableimg.tag = 3
            Checkout.card.Label(x: Checkout.distributorterm.clickableimg.frame.maxX+5, y: Checkout.cash.view.frame.maxY, width: 250, height: 40, txt: "Pay By Credit/Debit Card", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.right.view)
            Checkout.carddesc.Label(x: 55, y: Checkout.card.label.frame.maxY, width: x-65, height: 50, txt: "You will be redirected to CCavenuepay website", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.right.view)
            Checkout.card.View(x: 10, y: Checkout.carddesc.label.frame.maxY, width: x-20, height: 1, bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: Checkout.right.view)
                
            Checkout.apply.Label(x: 10, y: Checkout.card.view.frame.maxY, width: 200, height: 40, txt: "Apply Discount Code", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), view: Checkout.right.view)
            Checkout.apply.CheckBox(x: Checkout.apply.label.frame.maxX, y: Checkout.card.view.frame.maxY+15, width: 20, height: 10, trueImage: UIImage(named: "blackup")!, falseImage: UIImage(named: "blackdown")!, isTrue: false, view: Checkout.right.view) {
                if (Checkout.apply.isCheckBoxChecked){
                    Checkout.apply.txtfield.isHidden = false
                    Checkout.apply.button.isHidden = false
                    if Checkout.distributorterm.clickableimg.currentBackgroundImage == UIImage(named: "radiotrue") {
                        Checkout.updaterightframe(paymentRadio: 1)
                    }
                    else if Checkout.cash.clickableimg.currentBackgroundImage == UIImage(named: "radiotrue") {
                        Checkout.updaterightframe(paymentRadio: 2)
                    }
                    else if Checkout.card.clickableimg.currentBackgroundImage == UIImage(named: "radiotrue") {
                        Checkout.updaterightframe(paymentRadio: 3)
                    }
                    else{Checkout.updaterightframe(paymentRadio: 0)}
                }
                else{
                    Checkout.apply.txtfield.isHidden = true
                    Checkout.apply.button.isHidden = true
                    if Checkout.distributorterm.clickableimg.currentBackgroundImage == UIImage(named: "radiotrue") {
                        Checkout.updaterightframe(paymentRadio: 1)
                    }
                    else if Checkout.cash.clickableimg.currentBackgroundImage == UIImage(named: "radiotrue") {
                        Checkout.updaterightframe(paymentRadio: 2)
                    }
                    else if Checkout.card.clickableimg.currentBackgroundImage == UIImage(named: "radiotrue") {
                        Checkout.updaterightframe(paymentRadio: 3)
                    }
                    else{
                        Checkout.updaterightframe(paymentRadio: 0)
                            
                    }
                }
            }
            Checkout.apply.Textfield(x: 10, y:  Checkout.apply.label.frame.maxY, width: x-20, height: 40, placeholder: "Enter discount Code", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.right.view)
            Checkout.apply.Button(x: 10, y: Checkout.apply.txtfield.frame.maxY+20, width: x-20, height: 50, title: "APPLY DISCOUNT", fontsize: 14, any: Checkout, function: #selector(Checkout.applyDiscountButton(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4431372549, green: 0.2784313725, blue: 0.6156862745, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.right.view)
            Checkout.apply.txtfield.isHidden = true
            Checkout.apply.button.isHidden = true
                
                
            Checkout.reviewUI()
            if Checkout.right.view.isHidden {
                Checkout.updateleftframe()
            }
            else{
                updaterightframe(paymentRadio: 0)
                    
            }
                
                
                
                
            Checkout.right.view.frame.size.height = Checkout.review.view.frame.maxY+500
            ////////////////////////////////
            Checkout.Appear()
        }
            
        @objc func paymentradioButton(_ btn:UIButton){
            for i in 0..<shippingAddress.count {
                if shippingAddress[i].isselected {
                    Checkout.reviewaddress.label.text = "\(shippingAddress[i].l1)\n\n\(shippingAddress[i].l2)\n\n\(shippingAddress[i].l3)\n\n\(shippingAddress[i].l4)\n\n\(shippingAddress[i].l5)"
                    Checkout.reviewoption.label.text = "\(shippingAddress[i].l1), \(shippingAddress[i].l2), \(shippingAddress[i].l3), \(shippingAddress[i].l4), \(shippingAddress[i].l5)"
                }
            }
            Checkout.updaterightframe(paymentRadio: btn.tag)
        }
            
            
            
            
        func Appear() {
            Checkout.parentbody.isHidden = false
        }
        func disAppear() {
            Checkout.parentbody.isHidden = true
        }
            
            
        func reviewUI() {
            Checkout.review.View(x: 0, y: Checkout.apply.label.frame.maxY+10, width: x, height: 300, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: Checkout.right.view)
            Checkout.review.view.isHidden = true
                
            Checkout.review.CheckBox(x: 10, y: 10, width: 20, height: 20, trueImage: UIImage(named: "checktrue")!, falseImage: UIImage(named: "checkfalse")!, isTrue: true, view: Checkout.review.view) {
                if(Checkout.review.isCheckBoxChecked){
                    if Checkout.reviewoption.view.isHidden {
                        for i in 0..<shippingAddress.count {
                            if shippingAddress[i].isselected {
                                Checkout.reviewaddress.label.text = "\(shippingAddress[i].l1)\n\n\(shippingAddress[i].l2)\n\n\(shippingAddress[i].l3)\n\n\(shippingAddress[i].l4)\n\n\(shippingAddress[i].l5)"
                            }
                        }
                    }
                    else{
                        Checkout.reviewoption.view.isHidden = true
                        Checkout.reviewoption.view.frame.size.height = Checkout.review.view.frame.size.height-40
                    }
                }
                else{
                    if Checkout.reviewoption.view.isHidden {
                        Checkout.reviewoption.view.isHidden = false
                        Checkout.reviewoption.view.frame.size.height = Checkout.review.view.frame.size.height-40
                    }
                    else{
                        Checkout.reviewoption.view.isHidden = true
                        Checkout.reviewoption.view.frame.size.height = Checkout.review.view.frame.size.height-40
                    }
                }
            }
            Checkout.review.Label(x: Checkout.review.checkBox.frame.maxX+5, y: 0, width: x-45, height: 40, txt: "My billing and Shipping address are the same", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.review.view)
            Checkout.reviewaddress.Label(x: Checkout.review.label.frame.minX, y: Checkout.review.label.frame.maxY, width: x-45, height: 200, txt: "", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.review.view)
            Checkout.reviewaddress.View(x: 10, y: Checkout.reviewaddress.label.frame.maxY, width: x-20, height: 1, bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: Checkout.review.view)
            /// review instruction
                
                
            Checkout.reviewinst.Label(x: 10, y: Checkout.reviewaddress.view.frame.maxY+10, width: 280, height: 40, txt: "Special instructions for Delivery", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), view: Checkout.review.view)
            Checkout.reviewinst.CheckBox(x: Checkout.reviewinst.label.frame.maxX, y: Checkout.reviewaddress.view.frame.maxY+25, width: 20, height: 10, trueImage: UIImage(named: "blackup")!, falseImage: UIImage(named: "blackdown")!, isTrue: false, view: Checkout.review.view) {
                if (Checkout.reviewinst.isCheckBoxChecked){
                    Checkout.reviewinst.txtview.isHidden = false
                    Checkout.reviewinst.button.frame.origin.y = Checkout.reviewinst.txtview.frame.maxY+20
                    Checkout.reviewinst.view.frame.origin.y = Checkout.reviewinst.button.frame.maxY+10
                    Checkout.review.view.frame.size.height = Checkout.reviewinst.view.frame.maxY
                }
                else{
                    Checkout.reviewinst.txtview.isHidden = true
                    Checkout.reviewinst.button.frame.origin.y = Checkout.reviewinst.label.frame.maxY+20
                    Checkout.reviewinst.view.frame.origin.y = Checkout.reviewinst.button.frame.maxY+10
                    Checkout.review.view.frame.size.height = Checkout.reviewinst.view.frame.maxY
                }
                if Checkout.distributorterm.clickableimg.currentBackgroundImage == UIImage(named: "radiotrue") {
                    Checkout.updaterightframe(paymentRadio: 1)
                }
                if Checkout.cash.clickableimg.currentBackgroundImage == UIImage(named: "radiotrue") {
                    Checkout.updaterightframe(paymentRadio: 2)
                }
                if Checkout.card.clickableimg.currentBackgroundImage == UIImage(named: "radiotrue") {
                    Checkout.updaterightframe(paymentRadio: 3)
                }
            }
            Checkout.reviewinst.TextView(x: 10, y: Checkout.reviewinst.label.frame.maxY, width: x-20, height: 100, border: 1, text: "Enter Your note ...", cornerRadius: 5, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), size: 20, weight: .light, bkColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), align: .left, view: Checkout.review.view)
            Checkout.reviewinst.Button(x: 10, y: Checkout.reviewinst.label.frame.maxY+20, width: x-20, height: 50, title: "PLACE ORDER", fontsize: 14, any: Checkout, function: #selector(Checkout.placeOrderButton(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4431372549, green: 0.2784313725, blue: 0.6156862745, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.review.view)
            Checkout.reviewinst.txtview.isHidden = true
            Checkout.reviewinst.View(x: 10, y: Checkout.reviewinst.button.frame.maxY+10, width: x-20, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: Checkout.review.view)
            Checkout.review.view.frame.size.height = Checkout.reviewinst.view.frame.maxY
                
            // chose address
            Checkout.reviewoption.View(x: 0, y: 40, width: x, height: Checkout.review.view.frame.height-40, bkcolor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8), cornerRadius: 0, border: 0, borderColor: .clear, view: Checkout.review.view)
            Checkout.reviewoption.view.isHidden = true
            Checkout.reviewoption.ScrollView(x: 35, y: 35,width: x-45, height: 50, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), contentwidth: x-45, contentheight: 50, view: Checkout.reviewoption.view)
            Checkout.reviewoption.scrollview.layer.borderWidth = 1
            Checkout.reviewoption.scrollview.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            Checkout.reviewoption.Label(x: 0, y: 0, width: Checkout.reviewoption.scrollview.frame.size.width+30, height: 50, txt: "Address", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.reviewoption.scrollview)
            Checkout.reviewoption.label.numberOfLines = 1
            Checkout.reviewoption.Image(x: Checkout.reviewoption.scrollview.frame.size.width-20, y: 0, width: 20, height: 50, mode: .scaleAspectFit, src: UIImage(named: "blackdown")!, view: Checkout.reviewoption.scrollview, imageUrl: nil)
            Checkout.reviewoption.imag.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            Checkout.reviewoption.scrollview.addGestureRecognizer(UITapGestureRecognizer(target: Checkout, action: #selector(Checkout.addressoptionbtn)))
        }
            
            
        @objc func shiphereButton(_ btn:UIButton){
            for i in 0..<shippingAddress.count {
                if i == btn.tag {shippingAddress[i].isselected = true}
                else{shippingAddress[i].isselected = false}
            }
            refreshAllAddress()
        }
            
        @objc func addressoptionbtn(){
            bodyfor.checkoutpop.scrollview.isHidden = false
            Checkout.reviewoptionpop.removeAll()
                
            var top:CGFloat = 300
            for i in 0..<shippingAddress.count {
                Checkout.reviewoptionpop.append(UI())
                Checkout.reviewoptionpop[i].Button(x: 20, y: top, width: x-40, height: 70, title: "", fontsize: 14, any: Checkout, function: #selector(Checkout.addresspopbutton(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: .clear, view: bodyfor.checkoutpop.scrollview)
                Checkout.reviewoptionpop[i].button.tag = i
                Checkout.reviewoptionpop[i].Label(x: 20, y: top, width: x-60, height: 70, txt: "\(shippingAddress[i].l1), \(shippingAddress[i].l2), \(shippingAddress[i].l3), \(shippingAddress[i].l4), \(shippingAddress[i].l5)", fontsize: 16, bold: false, cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), alignment: .left, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: bodyfor.checkoutpop.scrollview)
                Checkout.reviewoptionpop[i].clickableimage(x: Checkout.reviewoptionpop[i].label.frame.maxX, y: top+20, width: 20, height: 20, image: UIImage(named: "radiofalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Checkout.addresspopbutton(_:)), any: Checkout, view: bodyfor.checkoutpop.scrollview)
                Checkout.reviewoptionpop[i].clickableimg.tag = i
                bodyfor.checkoutpop.scrollview.contentSize.height = Checkout.reviewoptionpop[i].label.frame.maxY
                top+=70
            }
        }
        @objc func addresspopbutton(_ btn:UIButton){
            for i in 0..<shippingAddress.count {
                if i == btn.tag {
                    SelectedBillingAddress = billingAddObj[i]
                    billingAddress.l1 = shippingAddress[i].l1
                    billingAddress.l2 = shippingAddress[i].l2
                    billingAddress.l3 = shippingAddress[i].l3
                    billingAddress.l4 = shippingAddress[i].l4
                    billingAddress.l5 = shippingAddress[i].l5
                    Checkout.reviewoptionpop[i].clickableimg.setImage(UIImage(named: "radiotrue"), for: .normal)
                    Checkout.reviewaddress.label.text = "\(shippingAddress[i].l1)\n\n\(shippingAddress[i].l2)\n\n\(shippingAddress[i].l3)\n\n\(shippingAddress[i].l4)\n\n\(shippingAddress[i].l5)"
                    Checkout.reviewoption.label.text = "\(shippingAddress[i].l1), \(shippingAddress[i].l2), \(shippingAddress[i].l3), \(shippingAddress[i].l4), \(shippingAddress[i].l5)"
                    bodyfor.checkoutpop.scrollview.isHidden = true
                    Checkout.reviewoption.view.isHidden = true
                    Checkout.review.checkBox.setBackgroundImage(UIImage(named: "checkfalse"), for: .normal)
                    Checkout.review.isCheckBoxChecked = false
                }
                else{Checkout.reviewoptionpop[i].clickableimg.setImage(UIImage(named: "radiofalse"), for: .normal)}
            }
        }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        func refreshAllAddress() {
            for i in Checkout.shipping {
                i.view.removeFromSuperview()
                i.label.removeFromSuperview()
                i.button.removeFromSuperview()
                i.line.removeFromSuperlayer()
            }
            Checkout.shipping.removeAll()
                
            var top:CGFloat = 50
            for i in 0..<shippingAddress.count {
                Checkout.shipping.append(UI())
                Checkout.shipping[i].View(x: 10, y: top, width: x-20, height: 400, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 2, borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), view: Checkout.left.view)
                Checkout.shipping[i].Label(x: 10, y: 10, width: Checkout.shipping[i].view.frame.size.width-20, height: 200, txt: "\(shippingAddress[i].l1)\n\n\(shippingAddress[i].l2)\n\n\(shippingAddress[i].l3)\n\n\(shippingAddress[i].l4)\n\n\(shippingAddress[i].l5)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Checkout.shipping[i].view)
                    
                if shippingAddress[i].isselected {
                    Checkout.shipping[i].view.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    Checkout.shipping[i].Image(x: Checkout.shipping[i].view.frame.maxX-40, y: 0, width: 30, height: 30, mode: .scaleToFill, src: UIImage(named: "tickorange")!, view: Checkout.shipping[i].view, imageUrl: nil)
                    Checkout.shipping[i].view.frame.size.height = Checkout.shipping[i].label.frame.maxY+10
                }
                else{
                    Checkout.shipping[i].Button(x: 10, y: Checkout.shipping[i].label.frame.maxY+10, width: x-40, height: 30, title: "ShipHere", fontsize: 14, any: Checkout, function: #selector(Checkout.shiphereButton(_:)), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 0.4431372549, green: 0.2784313725, blue: 0.6156862745, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.shipping[i].view)
                    Checkout.shipping[i].button.tag = i
                    Checkout.shipping[i].line(p1: CGPoint(x: 0, y: Checkout.shipping[i].button.frame.maxY+10),
                                              p2: CGPoint(x: x-20, y: Checkout.shipping[i].button.frame.maxY+10),
                                              lineWidth: 2, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), view: Checkout.shipping[i].view)
                    Checkout.shipping[i].view.frame.size.height = Checkout.shipping[i].button.frame.maxY+10
                }
                    
                top+=Checkout.shipping[i].view.frame.size.height+10
                Checkout.newaddressbtn.button.frame.origin.y = top
                    
            }
            Checkout.updateleftframe()
        }
            
            
            
            
            
            
            
            
            
            
            
            
        var selectedpaymentmethod:String = ""
            
            
            
        func updaterightframe(paymentRadio:Int) {
            if paymentRadio ==  1 {
                Checkout.distributorterm.clickableimg.setBackgroundImage(UIImage(named: "radiotrue"), for: .normal)
                Checkout.cash.clickableimg.setBackgroundImage(UIImage(named: "radiofalse"), for: .normal)
                Checkout.card.clickableimg.setBackgroundImage(UIImage(named: "radiofalse"), for: .normal)
                selectedpaymentmethod = PaymentsMethods?.filter{$0.title == Checkout.distributorterm.label.text}.first?.code ?? ""
    //            selectedpaymentmethod = ""
                Checkout.review.view.isHidden = false
                Checkout.review.view.frame.origin.y = Checkout.distributorterm.view.frame.maxY
                Checkout.cash.clickableimg.frame.origin.y = Checkout.review.view.frame.maxY+10
                Checkout.cash.label.frame.origin.y = Checkout.review.view.frame.maxY
                Checkout.card.clickableimg.frame.origin.y = Checkout.cash.label.frame.maxY+10
                Checkout.card.label.frame.origin.y = Checkout.cash.label.frame.maxY
                Checkout.apply.label.frame.origin.y = Checkout.card.label.frame.maxY
                Checkout.apply.checkBox.frame.origin.y = Checkout.card.label.frame.maxY+15
            }
            if paymentRadio == 2 {
                Checkout.distributorterm.clickableimg.setBackgroundImage(UIImage(named: "radiofalse"), for: .normal)
                Checkout.cash.clickableimg.setBackgroundImage(UIImage(named: "radiotrue"), for: .normal)
                Checkout.card.clickableimg.setBackgroundImage(UIImage(named: "radiofalse"), for: .normal)
                selectedpaymentmethod = PaymentsMethods?.filter{$0.title == Checkout.cash.label.text}.first?.code ?? ""
                Checkout.review.view.isHidden = false
                Checkout.review.view.frame.origin.y = Checkout.cash.view.frame.maxY
                Checkout.cash.clickableimg.frame.origin.y = Checkout.distributorterm.label.frame.maxY+10
                Checkout.cash.label.frame.origin.y = Checkout.distributorterm.label.frame.maxY
                Checkout.card.clickableimg.frame.origin.y = Checkout.review.view.frame.maxY+10
                Checkout.card.label.frame.origin.y = Checkout.review.view.frame.maxY
                Checkout.apply.label.frame.origin.y = Checkout.card.label.frame.maxY
                Checkout.apply.checkBox.frame.origin.y = Checkout.card.label.frame.maxY+15
            }
            if paymentRadio == 3 {
                Checkout.distributorterm.clickableimg.setBackgroundImage(UIImage(named: "radiofalse"), for: .normal)
                Checkout.cash.clickableimg.setBackgroundImage(UIImage(named: "radiofalse"), for: .normal)
                Checkout.card.clickableimg.setBackgroundImage(UIImage(named: "radiotrue"), for: .normal)
                selectedpaymentmethod = PaymentsMethods?.filter{$0.title == Checkout.card.label.text}.first?.code ?? ""
                Checkout.review.view.isHidden = false
                Checkout.review.view.frame.origin.y = Checkout.card.view.frame.maxY
                Checkout.cash.clickableimg.frame.origin.y = Checkout.distributorterm.view.frame.maxY+10
                Checkout.cash.label.frame.origin.y = Checkout.distributorterm.view.frame.maxY
                Checkout.card.clickableimg.frame.origin.y = Checkout.cash.view.frame.maxY+10
                Checkout.card.label.frame.origin.y = Checkout.cash.view.frame.maxY
                Checkout.apply.label.frame.origin.y = Checkout.review.view.frame.maxY
                Checkout.apply.checkBox.frame.origin.y = Checkout.review.view.frame.maxY+15
            }
            if paymentRadio == 0 {
                Checkout.distributorterm.clickableimg.setBackgroundImage(UIImage(named: "radiofalse"), for: .normal)
                Checkout.cash.clickableimg.setBackgroundImage(UIImage(named: "radiofalse"), for: .normal)
                Checkout.card.clickableimg.setBackgroundImage(UIImage(named: "radiofalse"), for: .normal)
                selectedpaymentmethod = ""
                Checkout.review.view.isHidden = true
                Checkout.review.view.frame.origin.y = Checkout.card.view.frame.maxY
                Checkout.cash.clickableimg.frame.origin.y = Checkout.distributorterm.view.frame.maxY+10
                Checkout.cash.label.frame.origin.y = Checkout.distributorterm.view.frame.maxY
                Checkout.card.clickableimg.frame.origin.y = Checkout.cash.view.frame.maxY+10
                Checkout.card.label.frame.origin.y = Checkout.cash.view.frame.maxY
                Checkout.apply.label.frame.origin.y = Checkout.card.view.frame.maxY
                Checkout.apply.checkBox.frame.origin.y = Checkout.card.view.frame.maxY+15
            }
            Checkout.apply.txtfield.frame.origin.y = apply.label.frame.maxY
            Checkout.apply.button.frame.origin.y = Checkout.apply.txtfield.frame.maxY+20
            Checkout.right.view.frame.size.height = Checkout.apply.button.frame.maxY+50
            Checkout.parentbody.contentSize.height = Checkout.right.view.frame.maxY
        }
            
            
            
        func updateleftframe() {
            Checkout.shipmethod.label.frame.origin.y = Checkout.newaddressbtn.button.frame.maxY+50
            Checkout.shipmethodsub[0].label.frame.origin.y = Checkout.shipmethod.label.frame.maxY
            Checkout.shipmethod.checkBox.frame.origin.y = Checkout.shipmethodsub[0].label.frame.maxY+10
            Checkout.shipmethodsub[1].label.frame.origin.y = Checkout.shipmethodsub[0].label.frame.maxY
            Checkout.left.button.frame.origin.y = Checkout.shipmethodsub[1].label.frame.maxY+50
            Checkout.left.view.frame.size.height = Checkout.left.button.frame.maxY+50
            Checkout.parentbody.contentSize.height = Checkout.left.view.frame.maxY
        }
            
        let newaddressScroll = UI()
        let firstname = UI()
        let lastname = UI()
        let company = UI()
        let address = UI()
        let city = UI()
        let state = UI()
        let zipcode = UI()
        let country = UI()
        let number = UI()
        let saveaddressbtn = UI()
        let canclebtn = UI()
        @objc func newAddressButton(_ btn:UIButton){
            bodyfor.checkoutnewAddress.scrollview.isHidden = false
        }
        func newAddressUI() {
            Checkout.newaddressScroll.ScrollView(x: 50, y: 0, width: x-60, height: y, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), contentwidth: x-60, contentheight: y, view: bodyfor.checkoutnewAddress.scrollview)
            Checkout.newaddressScroll.View(x: 0, y: 0, width: x-60, height: 70, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: Checkout.newaddressScroll.scrollview)
            Checkout.newaddressScroll.Label(x: 10, y: 30, width: 200, height: 40, txt: "Shipping Address", fontsize: 22, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: newaddressScroll.scrollview)
            Checkout.newaddressScroll.clickableimage(x: x-100, y: 35, width: 30, height: 30, image: UIImage(named: "cross")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Checkout.crossbtn), any: Checkout, view: Checkout.newaddressScroll.scrollview)
            //first name
            Checkout.firstname.AutoSizeLabel(x: 10, y: Checkout.newaddressScroll.view.frame.maxY+10, height: 30, txt: "First Name", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
            Checkout.firstname.Image(x: Checkout.firstname.autoSizelabel.frame.maxX+10, y: Checkout.newaddressScroll.view.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.firstname.Textfield(x: 10, y: Checkout.firstname.autoSizelabel.frame.maxY, width: x-80, height: 40, placeholder: "first name", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
                
            //last name
            Checkout.lastname.AutoSizeLabel(x: 10, y: Checkout.firstname.txtfield.frame.maxY+10, height: 30, txt: "Last Name", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
            Checkout.lastname.Image(x: Checkout.lastname.autoSizelabel.frame.maxX+10, y: Checkout.firstname.txtfield.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.lastname.Textfield(x: 10, y: Checkout.lastname.autoSizelabel.frame.maxY, width: x-80, height: 40, placeholder: "last name", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
                
            //company
            Checkout.company.AutoSizeLabel(x: 10, y: Checkout.lastname.txtfield.frame.maxY+10, height: 30, txt: "Company", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
            Checkout.company.Image(x: Checkout.company.autoSizelabel.frame.maxX+10, y: Checkout.lastname.txtfield.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.company.Textfield(x: 10, y: Checkout.company.autoSizelabel.frame.maxY, width: x-80, height: 40, placeholder: "", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
                
            //company
            Checkout.company.AutoSizeLabel(x: 10, y: Checkout.lastname.txtfield.frame.maxY+10, height: 30, txt: "Company", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
            Checkout.company.Image(x: Checkout.company.autoSizelabel.frame.maxX+10, y: Checkout.lastname.txtfield.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.company.Textfield(x: 10, y: Checkout.company.autoSizelabel.frame.maxY, width: x-80, height: 40, placeholder: "", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
                
            //address
            Checkout.address.AutoSizeLabel(x: 10, y: Checkout.company.txtfield.frame.maxY+10, height: 30, txt: "Address", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
            Checkout.address.Image(x: Checkout.address.autoSizelabel.frame.maxX+10, y: Checkout.company.txtfield.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.address.Textfield(x: 10, y: Checkout.address.autoSizelabel.frame.maxY, width: x-80, height: 40, placeholder: "", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
                
            //City
            Checkout.city.AutoSizeLabel(x: 10, y: Checkout.address.txtfield.frame.maxY+10, height: 30, txt: "City", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
            Checkout.city.Image(x: Checkout.city.autoSizelabel.frame.maxX+10, y: Checkout.address.txtfield.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.city.Textfield(x: 10, y: Checkout.city.autoSizelabel.frame.maxY, width: x-80, height: 40, placeholder: "", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
                
            //state/province
            Checkout.state.AutoSizeLabel(x: 10, y: Checkout.city.txtfield.frame.maxY+10, height: 30, txt: "State/Province", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
            Checkout.state.Image(x: Checkout.state.autoSizelabel.frame.maxX+10, y: Checkout.city.txtfield.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.state.ComboBox(["Abudhabi","Ajman","Dubai","Fujairah","Ras Al Khaimah","Sharjah","Umm Al Qaiwain"], 0, x: 10, y: Checkout.state.autoSizelabel.frame.maxY, width: x-80, height: 40, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cornerRadius: 5, editable: false, placeholder: "", fontsize: 16, iconColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), listbkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), listTextcolor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), view: Checkout.newaddressScroll.scrollview) {
            }
                
                
            //zip/postal code
            Checkout.zipcode.AutoSizeLabel(x: 10, y: Checkout.state.comboBox.frame.maxY+10, height: 30, txt: "Zip/Postal Code", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
            Checkout.zipcode.Image(x: Checkout.zipcode.autoSizelabel.frame.maxX+10, y: Checkout.state.comboBox.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.zipcode.Textfield(x: 10, y: Checkout.zipcode.autoSizelabel.frame.maxY, width: x-80, height: 40, placeholder: "", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
            Checkout.newaddressScroll.scrollview.bringSubviewToFront(Checkout.state.comboBox)
                
            //country
            Checkout.country.AutoSizeLabel(x: 10, y: Checkout.zipcode.txtfield.frame.maxY+10, height: 30, txt: "Country", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
            Checkout.country.Image(x: Checkout.country.autoSizelabel.frame.maxX+10, y: Checkout.zipcode.txtfield.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.country.ComboBox(["United Arab Emirates"], 0, x: 10, y: Checkout.country.autoSizelabel.frame.maxY, width: x-80, height: 40, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cornerRadius: 5, editable: false, placeholder: "", fontsize: 16, iconColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), listbkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), listTextcolor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), view: Checkout.newaddressScroll.scrollview) {
            }
                
                
            //number
            Checkout.number.AutoSizeLabel(x: 10, y: Checkout.country.comboBox.frame.maxY+10, height: 30, txt: "Phone Number", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: Checkout.newaddressScroll.scrollview)
                
            Checkout.number.Image(x: Checkout.number.autoSizelabel.frame.maxX+10, y: Checkout.country.comboBox.frame.maxY+15, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
                
            Checkout.number.Textfield(x: 10, y: Checkout.number.autoSizelabel.frame.maxY, width: x-130, height: 40, placeholder: "", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
            Checkout.number.Image(x: Checkout.number.txtfield.frame.maxX+5, y: Checkout.number.autoSizelabel.frame.maxY, width: 40, height: 40, mode: .scaleToFill, src: UIImage(named: "?")!, view: Checkout.newaddressScroll.scrollview, imageUrl: nil)
            Checkout.newaddressScroll.scrollview.bringSubviewToFront(Checkout.country.comboBox)
            Checkout.number.Label(x: 10, y: Checkout.number.txtfield.frame.maxY, width: x-80, height: 50, txt: "Enter WhatsApp Number With Country Code & without any Sign.", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: Checkout.newaddressScroll.scrollview)
                
                
            //// buttons
            Checkout.saveaddressbtn.Button(x: 40, y: Checkout.number.label.frame.maxY+10, width: 100, height: 40, title: "Save", fontsize: 14, any: Checkout, function: #selector(Checkout.savenewAddressButton), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4431372549, green: 0.2784313725, blue: 0.6156862745, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
            Checkout.canclebtn.Button(x: Checkout.saveaddressbtn.button.frame.maxX+10, y: Checkout.number.label.frame.maxY+10, width: 100, height: 40, title: "Cancel", fontsize: 14, any: Checkout, function: #selector(Checkout.crossbtn), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4431372549, green: 0.2784313725, blue: 0.6156862745, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Checkout.newaddressScroll.scrollview)
            Checkout.newaddressScroll.scrollview.contentSize.height = Checkout.canclebtn.button.frame.maxY+20
        }
            
            
            
        @objc func crossbtn(){
            bodyfor.checkoutnewAddress.scrollview.isHidden = true
        }
        @objc func savenewAddressButton(){
            shippingAddress.append(sa())
            for i in 0..<shippingAddress.count {
                if i == (shippingAddress.count-1) {
                    shippingAddress[shippingAddress.count-1].isselected = true
                }
                else{
                    shippingAddress[i].isselected = false
                }
            }
                
            shippingAddress[shippingAddress.count-1].l1 =  Checkout.firstname.txtfield.text!+" "+Checkout.lastname.txtfield.text!
            shippingAddress[shippingAddress.count-1].l2 = Checkout.address.txtfield.text!
            shippingAddress[shippingAddress.count-1].l3 = Checkout.city.txtfield.text!+","+Checkout.state.comboBox.text_comboBox()+" "+Checkout.zipcode.txtfield.text!
            shippingAddress[shippingAddress.count-1].l4 = Checkout.country.comboBox.text_comboBox()
            shippingAddress[shippingAddress.count-1].l5 = Checkout.number.txtfield.text!
            Checkout.crossbtn()
            Checkout.refreshAllAddress()
        }
            
            
        @objc func nextButton(_ btn:UIButton){
            Checkout.left.arc.fillColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            Checkout.left.line.strokeColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            Checkout.left.view.isHidden = true
                
            Checkout.right.imag.image = UIImage(named: "tickwhite")
            Checkout.right.arc.fillColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            Checkout.right.line.strokeColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            Checkout.right.view.isHidden = false
            Checkout.updaterightframe(paymentRadio: 0)
        }
            
            
            
    }
