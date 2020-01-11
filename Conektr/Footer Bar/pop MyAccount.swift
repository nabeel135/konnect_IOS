//
//  Search.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/18/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let myAccountpop = map()
class map: UIView {
    var parentview = UIView()
    let body = UI()
    let obj = UI()
    
    // variable without login
    let signInbtn = UI()
    let email = UI()
    let pass = UI()
    let newAccountbtn = UI()
    let forgotpassbtn = UI()
    
    
    // variable with login
    let acc = UI()
    let accinfo = UI()
    let addressbook = UI()
    let orders = UI()
    let shoplist = UI()
    let reorder = UI()
    let distributors = UI()
    let whatsapp = UI()
    let myquote = UI()
    let signout = UI()
    
    func Create(islogedin:Bool,any:Any,signinBtn:Selector,createAccountBtn:Selector,forgotpassBtn:Selector,withinview:UIView) {
        myAccountpop.parentview = withinview
        myAccountpop.body.View(x: 0, y: withinview.frame.minY, width: withinview.frame.size.width, height: 100, bkcolor: UIColor(red: 242/255, green: 237/255, blue: 247/255, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: withinview)
        myAccountpop.obj.Label(x: 10, y: 0, width: 200, height: 50, txt: "MY ACCOUNT", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.body.view)
        myAccountpop.obj.clickableimage(x: x-40, y: 10, width: 30, height: 30, image: UIImage(named: "cross")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(myAccountpop.crossButton), any: myAccountpop, view: myAccountpop.body.view)
        myAccountpop.obj.View(x: 0, y: myAccountpop.obj.label.frame.maxY, width: withinview.frame.size.width, height: 200, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 0, borderColor: .clear, view: myAccountpop.body.view)
        
        /*----------------------*/
        
        if islogedin == false {
            // without loged in
            myAccountpop.signInbtn.label.isHidden = false
            myAccountpop.email.txtfield.isHidden = false
            myAccountpop.pass.txtfield.isHidden = false
            myAccountpop.signInbtn.button.isHidden = false
            myAccountpop.newAccountbtn.label.isHidden = false
            myAccountpop.newAccountbtn.button.isHidden = false
            myAccountpop.forgotpassbtn.button.isHidden = false
            myAccountpop.signInbtn.Label(x: 0, y: 40, width: x, height: 40, txt: "Sign In", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.email.Textfield(x: 20, y: myAccountpop.signInbtn.label.frame.maxY+10, width: x-40, height: 40, placeholder: "Enter Your Email Address", border: 1, borderRadius: 20, txtAlign: .center, bordercolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: myAccountpop.obj.view)
            myAccountpop.pass.Textfield(x: 20, y: myAccountpop.email.txtfield.frame.maxY+10, width: x-40, height: 40, placeholder: "Password", border: 1, borderRadius: 20, txtAlign: .center, bordercolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: myAccountpop.obj.view)
            myAccountpop.signInbtn.Button(x: 20, y: myAccountpop.pass.txtfield.frame.maxY+10, width: x-40, height: 40, title: "SIGN IN", fontsize: 14, any: any, function: signinBtn, cornerRadius: 20, bordercolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), bkcolor: #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: myAccountpop.obj.view)
            myAccountpop.newAccountbtn.Label(x: 0, y: myAccountpop.signInbtn.button.frame.maxY+10, width: x, height: 50, txt: "or", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.newAccountbtn.Button(x: 20, y: myAccountpop.newAccountbtn.label.frame.maxY+10, width: x-40, height: 40, title: "CREATE AN ACCOUNT", fontsize: 14, any: any, function: createAccountBtn, cornerRadius: 20, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: myAccountpop.obj.view)
            myAccountpop.forgotpassbtn.Button(x: 20, y: myAccountpop.newAccountbtn.button.frame.maxY+10, width: x-20, height: 40, title: "Forgot Your Password?", fontsize: 14, any: any, function: forgotpassBtn, cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), view: myAccountpop.obj.view)
            
            myAccountpop.obj.view.frame.size.height = myAccountpop.forgotpassbtn.button.frame.maxY+40
        }
        if islogedin {
            ///with loged in
            myAccountpop.acc.button.isHidden = false
            myAccountpop.accinfo.button.isHidden = false
            myAccountpop.addressbook.button.isHidden = false
            myAccountpop.orders.button.isHidden = false
            myAccountpop.shoplist.button.isHidden = false
            myAccountpop.reorder.button.isHidden = false
            myAccountpop.distributors.button.isHidden = false
            myAccountpop.whatsapp.button.isHidden = false
            myAccountpop.myquote.button.isHidden = false
            myAccountpop.signout.button.isHidden = false
            
            myAccountpop.acc.Button(x: 0, y: 0, width: x, height: 50, title: "MY ACCOUNT", fontsize: 14, any: self, function: #selector(myaccountbtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.acc.button.contentHorizontalAlignment = .left
            myAccountpop.acc.button.contentEdgeInsets.left = 20
            
            myAccountpop.accinfo.Button(x: 0, y: 50, width: x, height: 50, title: "MY ACCOUNT INFO", fontsize: 14, any: self, function: #selector(accountInFobtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.accinfo.button.contentHorizontalAlignment = .left
            myAccountpop.accinfo.button.contentEdgeInsets.left = 20

            myAccountpop.addressbook.Button(x: 0, y: 100, width: x, height: 50, title: "MY ADDRESS BOOK", fontsize: 14, any: self, function: #selector(addressbookbtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.addressbook.button.contentHorizontalAlignment = .left
            myAccountpop.addressbook.button.contentEdgeInsets.left = 20

            myAccountpop.orders.Button(x: 0, y: 150, width: x, height: 50, title: "MY ORDERS", fontsize: 14, any: self, function: #selector(myordersbtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.orders.button.contentHorizontalAlignment = .left
            myAccountpop.orders.button.contentEdgeInsets.left = 20

            myAccountpop.shoplist.Button(x: 0, y: 200, width: x, height: 50, title: "MY SHOP LIST", fontsize: 14, any: self, function: #selector(myshoplistbtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.shoplist.button.contentHorizontalAlignment = .left
            myAccountpop.shoplist.button.contentEdgeInsets.left = 20

            myAccountpop.reorder.Button(x: 0, y: 250, width: x, height: 50, title: "REORDER PRODUCT", fontsize: 14, any: self, function: #selector(reorderbtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.reorder.button.contentHorizontalAlignment = .left
            myAccountpop.reorder.button.contentEdgeInsets.left = 20
            
            myAccountpop.distributors.Button(x: 0, y: 300, width: x, height: 50, title: "DISRIBUTORS", fontsize: 14, any: self, function: #selector(distributorbtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.distributors.button.contentHorizontalAlignment = .left
            myAccountpop.distributors.button.contentEdgeInsets.left = 20

            myAccountpop.whatsapp.Button(x: 0, y: 350, width: x, height: 50, title: "VERIFY WHATSAPP NUMBER", fontsize: 14, any: self, function: #selector(whatsappbtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.whatsapp.button.contentHorizontalAlignment = .left
            myAccountpop.whatsapp.button.contentEdgeInsets.left = 20

            myAccountpop.myquote.Button(x: 0, y: 400, width: x, height: 50, title: "MY QUOTE", fontsize: 14, any: self, function: #selector(myquotebtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.myquote.button.contentHorizontalAlignment = .left
            myAccountpop.myquote.button.contentEdgeInsets.left = 20

            myAccountpop.signout.Button(x: 0, y: 450, width: x, height: 50, title: "SIGN OUT", fontsize: 14, any: self, function: #selector(signoutbtn(_:)), cornerRadius: 0, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myAccountpop.obj.view)
            myAccountpop.signout.button.contentHorizontalAlignment = .left
            myAccountpop.signout.button.contentEdgeInsets.left = 50
            myAccountpop.signout.Image(x: 10, y: 455, width: 30, height: 30, mode: .scaleToFill, src: UIImage(named: "signout")!, view: myAccountpop.obj.view)
            
            myAccountpop.obj.view.frame.size.height = 500
        }
        /*----------------------*/
                
        
        myAccountpop.body.view.frame.size.height = myAccountpop.obj.view.frame.maxY
        myAccountpop.body.view.frame.origin.y = y-70
        myAccountpop.Appear()
    }
    
    @objc func crossButton(){
        myAccountpop.disAppear()
    }
    
    func Appear() {
        Searchpop.body.view.frame.origin.y = y-70
        FooterMenu.searchButton(clicked: false)
        myCartpop.body.scrollview.frame.origin.y = y-70
        FooterMenu.myCartButton(clicked: false)
        menupop.body.view.frame.origin.y = y-70
        FooterMenu.menuButton(clicked: false)
        
        
        myAccountpop.parentview.isHidden = false
        UIView.animate(withDuration: 0.2) {
            myAccountpop.body.view.frame.origin.y = y-70-myAccountpop.body.view.frame.size.height
        }
    }
    func disAppear() {
        // without loged in
        myAccountpop.signInbtn.label.isHidden = true
        myAccountpop.email.txtfield.isHidden = true
        myAccountpop.pass.txtfield.isHidden = true
        myAccountpop.signInbtn.button.isHidden = true
        myAccountpop.newAccountbtn.label.isHidden = true
        myAccountpop.newAccountbtn.button.isHidden = true
        myAccountpop.forgotpassbtn.button.isHidden = true
        ///with loged in
        myAccountpop.acc.button.isHidden = true
        myAccountpop.accinfo.button.isHidden = true
        myAccountpop.addressbook.button.isHidden = true
        myAccountpop.orders.button.isHidden = true
        myAccountpop.shoplist.button.isHidden = true
        myAccountpop.reorder.button.isHidden = true
        myAccountpop.distributors.button.isHidden = true
        myAccountpop.whatsapp.button.isHidden = true
        myAccountpop.myquote.button.isHidden = true
        myAccountpop.signout.button.isHidden = true
        
        UIView.animate(withDuration: 0.2, animations: {
            myAccountpop.body.view.frame.origin.y = y-70
        }) { (true) in
            myAccountpop.parentview.isHidden = true
            FooterMenu.myAccountButton(clicked: false)
        }
    }
    
    
    // MARK: - buttons
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON MY ACCOUNT
    /////////////////////////////////////////////
    @objc func myaccountbtn(_ btn:UIButton){
        myAccountpop.disAppear()
        addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: MYAccount(), view: bodyfor.myaccount.scrollview)

        bodyfor.myaccount.scrollview.isHidden = false
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.shoplist.scrollview.isHidden = true


    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON MY ACCOUNT INFO
    /////////////////////////////////////////////
    @objc func accountInFobtn(_ btn:UIButton){
        myAccountpop.disAppear()
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = false
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.shoplist.scrollview.isHidden = true


    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON ADDRESS BOOK
    /////////////////////////////////////////////
    @objc func addressbookbtn(_ btn:UIButton){
        myAccountpop.disAppear()
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = false
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.shoplist.scrollview.isHidden = true


    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON ORDERS
    /////////////////////////////////////////////
    @objc func myordersbtn(_ btn:UIButton){
        myAccountpop.disAppear()
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.orderlist.scrollview.isHidden = false
        bodyfor.shoplist.scrollview.isHidden = true

    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON MY SHOP LIST
    /////////////////////////////////////////////
    @objc func myshoplistbtn(_ btn:UIButton){
        myAccountpop.disAppear()
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.shoplist.scrollview.isHidden = false
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON reorder product
    /////////////////////////////////////////////
    @objc func reorderbtn(_ btn:UIButton){
        print("re order")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON distributor
    /////////////////////////////////////////////
    @objc func distributorbtn(_ btn:UIButton){
        print("distributor")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON verify whatsapp number
    /////////////////////////////////////////////
    @objc func whatsappbtn(_ btn:UIButton){
        print("whatsapp btn")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON MY quote
    /////////////////////////////////////////////
    @objc func myquotebtn(_ btn:UIButton){
        print("my quote")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////// BUTTON signout
    /////////////////////////////////////////////
    @objc func signoutbtn(_ btn:UIButton){
        UserDefaults.standard.set(false, forKey: "IsLogined")
        myAccountpop.disAppear()
        NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!.RefreshProduct()
        NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!.updateframe()
    }
}
