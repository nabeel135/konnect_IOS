//
//  FooterMenu.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/18/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let FooterMenu = fm()
class fm: UIView {
    let home = UI()
    let search = UI()
    let mycart = UI()
    let myAccount = UI()
    let menu = UI()
    
    func Create(any:Any,homeBtn:Selector,searchBtn:Selector,myCartBtn:Selector,myAccountBtn:Selector,menuBtn:Selector,withinView:UIView) {
        let bw = (withinView.frame.size.width-20) / 5
        let bh = withinView.frame.size.height
        
        withinView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        withinView.layer.shadowOffset = .zero
        withinView.layer.shadowOpacity = 1
        withinView.layer.shadowRadius = 2
        //HOME
        FooterMenu.home.View(x: 10, y: 0, width: bw, height: bh, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: withinView)
        FooterMenu.home.Image(x: FooterMenu.home.view.frame.size.width/2 - 10, y: 10, width: 15, height: 15, mode: .scaleToFill, src: UIImage(named: "homefalse")!, view: FooterMenu.home.view, imageUrl: nil)
        FooterMenu.home.Label(x: 0, y: FooterMenu.home.imag.frame.maxY, width: bw, height: 30, txt: "Home", fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.6084945798, green: 0.3483039141, blue: 0.7122580409, alpha: 1), view: FooterMenu.home.view)
        //FOOTER
        FooterMenu.search.View(x: home.view.frame.maxX, y: 0, width: bw, height: bh, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: withinView)
        FooterMenu.search.Image(x: FooterMenu.search.view.frame.size.width/2 - 10, y: 10, width: 15, height: 15, mode: .scaleToFill, src: UIImage(named: "searchfalse")!, view: FooterMenu.search.view, imageUrl: nil)
        FooterMenu.search.Label(x: 0, y: FooterMenu.search.imag.frame.maxY, width: bw, height: 30, txt: "Search", fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.6084945798, green: 0.3483039141, blue: 0.7122580409, alpha: 1), view: FooterMenu.search.view)
        //MYCART
        FooterMenu.mycart.View(x: search.view.frame.maxX, y: 0, width: bw, height: bh, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: withinView)
        FooterMenu.mycart.Image(x: FooterMenu.mycart.view.frame.size.width/2 - 10, y: 10, width: 15, height: 15, mode: .scaleToFill, src: UIImage(named: "mycartfalse")!, view: FooterMenu.mycart.view, imageUrl: nil)
        FooterMenu.mycart.Label(x: 0, y: FooterMenu.mycart.imag.frame.maxY, width: bw, height: 30, txt: "MyCart", fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.6084945798, green: 0.3483039141, blue: 0.7122580409, alpha: 1), view: FooterMenu.mycart.view)
        //MYACCOUNT
        FooterMenu.myAccount.View(x: mycart.view.frame.maxX, y: 0, width: bw, height: bh, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: withinView)
        FooterMenu.myAccount.Image(x: FooterMenu.myAccount.view.frame.size.width/2 - 10, y: 10, width: 15, height: 15, mode: .scaleToFill, src: UIImage(named: "myaccountfalse")!, view: FooterMenu.myAccount.view, imageUrl: nil)
        FooterMenu.myAccount.Label(x: 0, y: FooterMenu.myAccount.imag.frame.maxY, width: bw, height: 30, txt: "MyAccount", fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.6084945798, green: 0.3483039141, blue: 0.7122580409, alpha: 1), view: FooterMenu.myAccount.view)
        //MENU
        FooterMenu.menu.View(x: myAccount.view.frame.maxX, y: 0, width: bw, height: bh, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: withinView)
        FooterMenu.menu.Image(x: FooterMenu.menu.view.frame.size.width/2 - 15, y: 10, width: 25, height: 15, mode: .scaleToFill, src: UIImage(named: "menufalse")!, view: FooterMenu.menu.view, imageUrl: nil)
        FooterMenu.menu.Label(x: 0, y: FooterMenu.menu.imag.frame.maxY, width: bw, height: 30, txt: "Menu", fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.6084945798, green: 0.3483039141, blue: 0.7122580409, alpha: 1), view: FooterMenu.menu.view)


        
        FooterMenu.home.view.addGestureRecognizer(UITapGestureRecognizer(target: any, action: homeBtn))
        FooterMenu.search.view.addGestureRecognizer(UITapGestureRecognizer(target: any, action: searchBtn))
        FooterMenu.mycart.view.addGestureRecognizer(UITapGestureRecognizer(target: any, action: myCartBtn))
        FooterMenu.myAccount.view.addGestureRecognizer(UITapGestureRecognizer(target: any, action: myAccountBtn))
        FooterMenu.menu.view.addGestureRecognizer(UITapGestureRecognizer(target: any, action: menuBtn))
    }
    
    func ButtonClicked(home:Bool,search:Bool,myCart:Bool,myAccount:Bool,menu:Bool) {
        FooterMenu.homeButton(clicked: home)
        FooterMenu.searchButton(clicked: search)
        FooterMenu.myCartButton(clicked: myCart)
        FooterMenu.myAccountButton(clicked: myAccount)
        FooterMenu.menuButton(clicked: menu)
    }
    
    func homeButton(clicked:Bool) {
        if clicked {
            FooterMenu.home.imag.image = UIImage(named: "hometrue")
            FooterMenu.home.label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            FooterMenu.home.view.backgroundColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
        }else{
            FooterMenu.home.imag.image = UIImage(named: "homefalse")
            FooterMenu.home.label.textColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
            FooterMenu.home.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    func searchButton(clicked:Bool) {
        if clicked {
            FooterMenu.search.imag.image = UIImage(named: "searchtrue")
            FooterMenu.search.label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            FooterMenu.search.view.backgroundColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
        }else{
            FooterMenu.search.imag.image = UIImage(named: "searchfalse")
            FooterMenu.search.label.textColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
            FooterMenu.search.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    func myCartButton(clicked:Bool) {
        if clicked {
            FooterMenu.mycart.imag.image = UIImage(named: "mycarttrue")
            FooterMenu.mycart.label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            FooterMenu.mycart.view.backgroundColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
        }else{
            FooterMenu.mycart.imag.image = UIImage(named: "mycartfalse")
            FooterMenu.mycart.label.textColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
            FooterMenu.mycart.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    func myAccountButton(clicked:Bool) {
        if clicked {
            FooterMenu.myAccount.imag.image = UIImage(named: "myaccounttrue")
            FooterMenu.myAccount.label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            FooterMenu.myAccount.view.backgroundColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
        }else{
            FooterMenu.myAccount.imag.image = UIImage(named: "myaccountfalse")
            FooterMenu.myAccount.label.textColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
            FooterMenu.myAccount.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    func menuButton(clicked:Bool) {
        if clicked {
            FooterMenu.menu.imag.image = UIImage(named: "menutrue")
            FooterMenu.menu.label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            FooterMenu.menu.view.backgroundColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
        }else{
            FooterMenu.menu.imag.image = UIImage(named: "menufalse")
            FooterMenu.menu.label.textColor = #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1)
            FooterMenu.menu.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}
