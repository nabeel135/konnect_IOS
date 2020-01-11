//
//  Forgot Password.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/19/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let forgotpassword = fp()
class fp: UIView {
    
    // variable
    var parentbody = UIScrollView()
    let header = UI()
    let l = UI()
    let email = UI()
    let resetpassbtn = UI()
    ////////////////////
    func Create(view:UIScrollView) {
        forgotpassword.parentbody = view
        // header
        forgotpassword.header.AutoSizeLabel(x: 10, y: 0, height: 50, txt: "RETAILR LOGIN", fontsize: 18, bkcolor: .clear, txtcolor: .black, border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        forgotpassword.header.View(x: 0, y: forgotpassword.header.autoSizelabel.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        /////////////
        l.Label(x: 10, y: forgotpassword.header.view.frame.maxY+20, width: x-20, height: 50, txt: "Please enter your email below to receive a password reset link.", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view)
        
        
        // email
        forgotpassword.email.AutoSizeLabel(x: 10, y: forgotpassword.l.label.frame.maxY+20, height: 30, txt: "Email", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        forgotpassword.email.Image(x: forgotpassword.email.autoSizelabel.frame.maxX, y: forgotpassword.l.label.frame.maxY+30, width: 10, height: 10, mode: .scaleToFill, src: UIImage(named: "*")!, view: view, imageUrl: nil)
        forgotpassword.email.Textfield(x: 10, y: forgotpassword.email.autoSizelabel.frame.maxY, width: x-20, height: 40, placeholder: " Email", border: 1, borderRadius: 5, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: view)
        
        // recovery button
        forgotpassword.resetpassbtn.Button(x: 20, y: forgotpassword.email.txtfield.frame.maxY+20, width: x-60, height: 40, title: "RESET MY PASSWORD", fontsize: 14, any: SignIn, function: #selector(forgotpassword.resetpasswordButton), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: view)
        
        forgotpassword.Appear()
    }
    
    func Appear(){
        forgotpassword.parentbody.isHidden = false
    }
    
    func disAppear() {
        forgotpassword.parentbody.isHidden = true
    }
    
    @objc func resetpasswordButton(){
        print("password reset")
    }
}
