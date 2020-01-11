//
//  Search.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/18/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let menupop = mp()
class mp: UIView {
    var parentview = UIView()
    let body = UI()
    let obj = UI()
    let FoodCat = UI()
    let viewcartbtn = UI()
    let checkoutbtn = UI()
    func Create(withinview:UIView) {
        
        menupop.parentview = withinview
        
        menupop.body.View(x: 0, y: withinview.frame.minY, width: withinview.frame.size.width, height: 100, bkcolor: UIColor(red: 242/255, green: 237/255, blue: 247/255, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: withinview)
        
        menupop.obj.Label(x: 10, y: 0, width: 200, height: 50, txt: "MENU", fontsize: 18, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: menupop.body.view)
        
        menupop.obj.clickableimage(x: x-40, y: 10, width: 30, height: 30, image: UIImage(named: "cross")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(menupop.crossButton), any: menupop, view: menupop.body.view)
        
        menupop.obj.View(x: 0, y: menupop.obj.label.frame.maxY, width: withinview.frame.size.width, height: 200, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 0, borderColor: .clear, view: menupop.body.view)
        
        
        
        
        menupop.FoodCat.Label(x: 10, y: 20, width: x-60, height: 45, txt: "Food", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: .black, view: menupop.obj.view)
        
        menupop.FoodCat.clickableimage(x: x-60, y: 30, width: 35, height: 10, image: UIImage(systemName: "arrowtriangle.down.fill")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(DropDown(_:)), any: self, view: menupop.obj.view)
        menupop.FoodCat.clickableimg.tintColor = UIColor.black
        
//        menupop.FoodCat.ComboBox(["United Arab Emirates","ABC"], 0, x: 10, y: shoppingCart.country.autoSizelabel.frame.maxY, width: x-80, height: 40, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cornerRadius: 5, editable: false, placeholder: "", fontsize: 18, iconColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), listbkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), listTextcolor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), view: menupop.obj.view) {
//        }
        
        
        /*----------------------*/
        
        /*----------------------*/
                
//        menupop.obj.view.frame.size.height = menupop.viewcartbtn.button.frame.maxY+45
        menupop.body.view.frame.size.height = menupop.obj.view.frame.maxY
        menupop.body.view.frame.origin.y = y-70
        menupop.Appear()
    }
    
     @objc func DropDown(_ btn:UIButton){
            
            
            let searchresultAPi = SearchProductAPIVC()
            let str = "%" + Searchpop.search.txtfield.text! + "%"
            searchresultAPi.GetSearchResult(str: str)
    //        // footerBar
    //        Searchpop.disAppear()
    //
    //        // footerBar linked pages
    //        shoppingCart.disAppear()
    //        Checkout.disAppear()
    //        SignIn.disAppear()
    //        createAccount.disAppear()
    //        forgotpassword.disAppear()
            
            
    //        searchResult.Create(view: bodyfor.SearchResult.scrollview)
    //        search.create(login: UserDefaults.standard.bool(forKey: "IsLogined"), view: bodyfor.SearchResult.scrollview)
        }
    
    
    @objc func crossButton(){
        menupop.disAppear()
    }
    
    func Appear() {
        Searchpop.body.view.frame.origin.y = y-70
        FooterMenu.searchButton(clicked: false)
        myCartpop.body.scrollview.frame.origin.y = y-70
        FooterMenu.myCartButton(clicked: false)
        myAccountpop.body.view.frame.origin.y = y-70
        FooterMenu.myAccountButton(clicked: false)
        
        
        menupop.parentview.isHidden = false
        UIView.animate(withDuration: 0.2) {
            menupop.body.view.frame.origin.y = y-70-menupop.body.view.frame.size.height
        }
    }
    func disAppear() {
        UIView.animate(withDuration: 0.2, animations: {
            menupop.body.view.frame.origin.y = y-70
        }) { (true) in
            menupop.parentview.isHidden = true
            FooterMenu.menuButton(clicked: false)
        }
    }
}
