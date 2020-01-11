//
//  Sign In.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/19/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let SignIn = si()
class si: UIView {
    
    
    // variable
    var parentbody = UIScrollView()
    let header = UI()
    let registered = UI()
    let rlabel = UI()
    let email = UI()
    let pass = UI()
    let signinbtn = UI()
    let forgotbtn = UI()
    
    let newAcc = UI()
    let newAcclabel = [UI(),UI(),UI(),UI(),UI(),UI(),UI(),UI(),UI(),UI(),UI()]
    
    let note = UI()
///////////////////
    
    func Create(view:UIScrollView){
        SignIn.parentbody = view
        
        // header
        SignIn.header.AutoSizeLabel(x: 10, y: 0, height: 50, txt: "RETAILR LOGIN", fontsize: 16, bkcolor: .clear, txtcolor: .black, border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        SignIn.header.View(x: 0, y: SignIn.header.autoSizelabel.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        
        // registered
        SignIn.registered.AutoSizeLabel(x: 10, y: SignIn.header.view.frame.maxY+40, height: 40, txt: "Registered Retailers", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.4269987643, green: 0.2234997749, blue: 0.5975795984, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        SignIn.registered.View(x: 10, y: SignIn.registered.autoSizelabel.frame.maxY, width: x-20, height: 100, bkcolor: #colorLiteral(red: 0.972464025, green: 0.9726033807, blue: 0.9724336267, alpha: 1), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), view: view)
        rlabel.Label(x: 20, y: 20, width: x-20-40, height: 50, txt: "If you have an account, Signin in with your email address", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.registered.view)
        
        // email
        SignIn.email.AutoSizeLabel(x: 20, y: SignIn.rlabel.label.frame.maxY+20, height: 30, txt: "Email", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: SignIn.registered.view)
        SignIn.email.Image(x: SignIn.email.autoSizelabel.frame.maxX, y: SignIn.rlabel.label.frame.maxY+30, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: SignIn.registered.view, imageUrl: nil)
        SignIn.email.Textfield(x: 20, y: SignIn.email.autoSizelabel.frame.maxY, width: x-20-40, height: 40, placeholder: " Email", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: SignIn.registered.view)
        
        // pass
        SignIn.pass.AutoSizeLabel(x: 20, y: SignIn.email.txtfield.frame.maxY+20, height: 30, txt: "Password", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: SignIn.registered.view)
        SignIn.pass.Image(x: SignIn.pass.autoSizelabel.frame.maxX, y: SignIn.email.txtfield.frame.maxY+30, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: SignIn.registered.view, imageUrl: nil)
        SignIn.pass.Textfield(x: 20, y: SignIn.pass.autoSizelabel.frame.maxY, width: x-20-40, height: 40, placeholder: " Password", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: SignIn.registered.view)
        
        // sign in button
        SignIn.signinbtn.Button(x: 20, y: SignIn.pass.txtfield.frame.maxY+20, width: x-60, height: 40, title: "SIGN IN", fontsize: 14, any: SignIn, function: #selector(SignIn.signinBUTTON), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: SignIn.registered.view)
        
        // forgot password button
        SignIn.forgotbtn.Button(x: 20, y: SignIn.signinbtn.button.frame.maxY+20, width: x-60, height: 40, title: "Forgot Your Password?", fontsize: 14, any: SignIn, function: #selector(SignIn.forgotpasswordBUTTON), cornerRadius: 5, bordercolor: .clear, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), view: SignIn.registered.view)
        
        SignIn.registered.view.frame.size.height = SignIn.forgotbtn.button.frame.maxY+20
        ////////////////////////////////////////////////////
        // New Retailer
        SignIn.newAcc.AutoSizeLabel(x: 10, y: SignIn.registered.view.frame.maxY+40, height: 40, txt: "New Retailer", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.4269987643, green: 0.2234997749, blue: 0.5975795984, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        SignIn.newAcc.View(x: 10, y: SignIn.newAcc.autoSizelabel.frame.maxY, width: x-20, height: 100, bkcolor: #colorLiteral(red: 0.972464025, green: 0.9726033807, blue: 0.9724336267, alpha: 1), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), view: view)
        
        SignIn.newAcclabel[0].Label(x: 20, y: 20, width: x-20-40, height: 50, txt: "Creating an account has many benefits", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        ////////////////////////////////////////////
        SignIn.newAcclabel[1].Label(x: 50, y: SignIn.newAcclabel[0].label.frame.maxY, width: 20, height: 30, txt: "1.", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        SignIn.newAcclabel[2].Label(x: SignIn.newAcclabel[1].label.frame.maxX, y: SignIn.newAcclabel[0].label.frame.maxY, width: x-110, height: 50, txt: "Free Consumer App and Home delivery Solution- Worth of AED25000 !!", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        
        ////////////////////////////////////////////
        SignIn.newAcclabel[3].Label(x: 50, y: SignIn.newAcclabel[2].label.frame.maxY, width: 20, height: 30, txt: "2.", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        SignIn.newAcclabel[4].Label(x: SignIn.newAcclabel[3].label.frame.maxX, y: SignIn.newAcclabel[2].label.frame.maxY, width: x-110, height: 50, txt: "Want to compete with Hypermarkets and On-line groceries? Register with US!!", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        
        ////////////////////////////////////////////
        SignIn.newAcclabel[5].Label(x: 50, y: SignIn.newAcclabel[4].label.frame.maxY, width: 20, height: 30, txt: "3.", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        SignIn.newAcclabel[6].Label(x: SignIn.newAcclabel[5].label.frame.maxX, y: SignIn.newAcclabel[4].label.frame.maxY, width: x-110, height: 50, txt: "Hurry Up! Tag your customers before your neighbour retailer does!", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        
        ////////////////////////////////////////////
        SignIn.newAcclabel[7].Label(x: 50, y: SignIn.newAcclabel[6].label.frame.maxY, width: 20, height: 30, txt: "4.", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        SignIn.newAcclabel[8].Label(x: SignIn.newAcclabel[7].label.frame.maxX, y: SignIn.newAcclabel[6].label.frame.maxY, width: x-110, height: 70, txt: "Pocket Sales man! No more waiting for Sales man! Order at your own convenience - Anytime .. Anywhere!", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        
        ////////////////////////////////////////////
        SignIn.newAcclabel[9].Label(x: 50, y: SignIn.newAcclabel[8].label.frame.maxY, width: 20, height: 30, txt: "5.", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        SignIn.newAcclabel[10].Label(x: SignIn.newAcclabel[9].label.frame.maxX, y: SignIn.newAcclabel[8].label.frame.maxY, width: x-110, height: 50, txt: "Increase your sales! Improve your Gross Margins!! Avail great promotions!!!", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: SignIn.newAcc.view)
        
        
        SignIn.newAcc.Button(x: 20, y: SignIn.newAcclabel[10].label.frame.maxY+20, width: x-60, height: 40, title: "CREATE RETAILER ACCOUNT", fontsize: 14, any: SignIn, function: #selector(SignIn.createAccountBUTTON), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: SignIn.newAcc.view)
        SignIn.newAcc.view.frame.size.height = SignIn.newAcc.button.frame.maxY+20
        // note
        SignIn.note.Label(x: 0, y: SignIn.newAcc.view.frame.maxY+20, width: x, height: 70, txt: "Conektr Tech FZCO,G069C. © 2019 All Rights Reserved.", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view)
        
        view.contentSize.height = SignIn.note.label.frame.maxY
        SignIn.Appear()
    }
    func Appear() {
        SignIn.parentbody.isHidden = false
    }
    func disAppear() {
        SignIn.parentbody.isHidden = true
    }
    
    
    /////////////////////////////////////////////////////
    ////////////////////////////////////////////////////
    ///////////////// BUTTON
    ///////////////////////////////////////////////////
    @objc func signinBUTTON(){
        let controller = CustomerLoginAPIVC()
        controller.signinBUTTON(username: SignIn.email.txtfield.text!, password: SignIn.pass.txtfield.text!)
    }
    
    /////////////////////////////////////////////////////
    ////////////////////////////////////////////////////
    ///////////////// BUTTON
    ///////////////////////////////////////////////////
    @objc func forgotpasswordBUTTON(){
        // footerBar
        myAccountpop.disAppear()
               
        // footerBar linked pages
        searchResult.disAppear()
        shoppingCart.disAppear()
        Checkout.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        
        forgotpassword.Create(view: bodyfor.forgotPassword.scrollview)
    }
    
    /////////////////////////////////////////////////////
    ////////////////////////////////////////////////////
    ///////////////// BUTTON
    ///////////////////////////////////////////////////
    @objc func createAccountBUTTON(){
        // footerBar
        myAccountpop.disAppear()
               
        // footerBar linked pages
        searchResult.disAppear()
        shoppingCart.disAppear()
        Checkout.disAppear()
        SignIn.disAppear()
        
        bodyfor.CreateAccount.scrollview.isHidden = false
    }
    
}
