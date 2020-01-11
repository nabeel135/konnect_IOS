//
//  Search.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/18/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let myCartpop = mcp()
class mcp: UIView {
    var parentview = UIView()
    let body = UI()
    let viewcartbtn = [UI(),UI()]
    let checkoutbtn = [UI(),UI()]
    
    ////
    var pview:[UI] = []
    var pimg:[UI] = []
    var ptitle:[UI] = []
    var pprice:[UI] = []
    var pquantity:[UI] = []
    var psetting:[UI] = []
    var pdel:[UI] = []
    let ptotallabel = UI()
    let ptotal = UI()
    var pany:Any!
    var pviewCarBtn:Selector!
    var pcheckoutBtn:Selector!
    
    func Create(any:Any,viewCartBtn:Selector,checkoutBtn:Selector,view:UIView) {
        
//        let cartApi = GetCartAPIVC()
//        cartApi.GetCart()
        
        myCartpop.parentview = view
        myCartpop.pany = any
        myCartpop.pviewCarBtn = viewCartBtn
        myCartpop.pcheckoutBtn = checkoutBtn
        myCartpop.body.ScrollView(x: 0, y: view.frame.minY, width: view.frame.size.width, height: 120, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), contentwidth: view.frame.size.width, contentheight: 100, view: view)
        
        myCartpop.body.View(x: 0, y: 0, width: view.frame.size.width, height: 50, bkcolor: UIColor(red: 242/255, green: 237/255, blue: 247/255, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: myCartpop.body.scrollview)

        myCartpop.body.Label(x: 10, y: 0, width: 200, height: 50, txt: "SHOPPING CART", fontsize: 18, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myCartpop.body.view)
        myCartpop.body.clickableimage(x: x-40, y: 10, width: 30, height: 30, image: UIImage(named: "cross")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(myCartpop.crossButton), any: myCartpop, view: myCartpop.body.view)
        
        /*----------------------*/
        myCartpop.viewcartbtn[0].Button(x: 20, y: 80, width: (x-60)/2, height: 40, title: "VIEW CART", fontsize: 14, any: any, function: viewCartBtn, cornerRadius: 20, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: myCartpop.body.scrollview)
        myCartpop.checkoutbtn[0].Button(x: myCartpop.viewcartbtn[0].button.frame.maxX+20, y: 80, width: (x-60)/2, height: 40, title: "CHECKOUT", fontsize: 14, any: any, function: checkoutBtn, cornerRadius: 20, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: myCartpop.body.scrollview)
        /*----------------------*/
        
        
        updateCartlist()
        myCartpop.body.scrollview.frame.origin.y = y-70
        
        myCartpop.Appear()
    }
    
    @objc func crossButton(){
        myCartpop.disAppear()
    }
    
    func Appear() {
        Searchpop.body.view.frame.origin.y = y-70
        FooterMenu.searchButton(clicked: false)
        myAccountpop.body.view.frame.origin.y = y-70
        FooterMenu.myAccountButton(clicked: false)
        menupop.body.view.frame.origin.y = y-70
        FooterMenu.menuButton(clicked: false)
        
        myCartpop.parentview.isHidden = false
        UIView.animate(withDuration: 0.2) {
            myCartpop.body.scrollview.frame.origin.y = y-70-myCartpop.body.scrollview.frame.size.height
        }
    }
    func disAppear() {
        UIView.animate(withDuration: 0.2, animations: {
            myCartpop.body.scrollview.frame.origin.y = y-70
        }) { (true) in
            myCartpop.parentview.isHidden = true
            FooterMenu.myCartButton(clicked: false)
        }
    }
    
    
    
    @objc func cartproductButton(_ tap:UITapGestureRecognizer){
        print("ptitle btn: \(tap.view!.tag)")
    }
    let msg = UI()

    @objc func cartDelButton(_ btn:UIButton){
//        msg.optionMessagebox(txt: "Are you sure you would like to remove this item from cart?",
//                             any: myCartpop,
//                             okfunction: #selector(myCartpop.deleteproduct(_:)),
//                             cancelfunction: #selector(myCartpop.canceldeleteproduct(_:)), view: myCartpop.parentview)
        
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
//        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    @objc func deleteproduct(_ btn:UIButton){
        msg.msgbox.isHidden = true
        print("product delete")
    }
    @objc func canceldeleteproduct(_ btn:UIButton){
        msg.msgbox.isHidden = true
    }
    
    
    
    
    func updateCartlist(){
        var top = myCartpop.viewcartbtn[0].button.frame.maxY+10
        var total:Double = 0.0
        if cartobj.count<1 {
            myCartpop.body.scrollview.frame.size.height = 150
        }
        else{
            if myCartpop.pview.count>0 {
                for obj in myCartpop.pview {obj.view.removeFromSuperview()}
                for obj in myCartpop.pimg {obj.imag.removeFromSuperview()}
                for obj in myCartpop.ptitle {obj.button.removeFromSuperview()}
                for obj in myCartpop.pquantity {obj.label.removeFromSuperview();obj.txtfield.removeFromSuperview();}
                for obj in myCartpop.psetting {obj.clickableimg.removeFromSuperview()}
                for obj in myCartpop.pdel {obj.clickableimg.removeFromSuperview()}
                myCartpop.pview.removeAll()
                myCartpop.pimg.removeAll()
                myCartpop.ptitle.removeAll()
                myCartpop.pquantity.removeAll()
                myCartpop.psetting.removeAll()
                myCartpop.pdel.removeAll()
            }
            for obj in cartobj {
                myCartpop.pview.append(UI())
                myCartpop.pimg.append(UI())
                myCartpop.ptitle.append(UI())
                myCartpop.pprice.append(UI())
                myCartpop.pquantity.append(UI())
                myCartpop.psetting.append(UI())
                myCartpop.pdel.append(UI())
                
                myCartpop.pview[myCartpop.pview.count-1].View(x: 0, y: top, width: x, height: 140, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: myCartpop.body.scrollview)
                myCartpop.pview[myCartpop.pview.count-1].view.tag = obj.id
                myCartpop.pview[myCartpop.pview.count-1].view.addGestureRecognizer(UITapGestureRecognizer(target: myCartpop, action: #selector(myCartpop.cartproductButton(_:))))
                top+=150
                myCartpop.pimg[myCartpop.pimg.count-1].Image(x: 10, y: 10, width: 120, height: 120, mode: .scaleAspectFit, src: obj.imag, view: myCartpop.pview[myCartpop.pview.count-1].view, imageUrl: nil)
                myCartpop.ptitle[myCartpop.ptitle.count-1].Label(x: myCartpop.pimg[myCartpop.pimg.count-1].imag.frame.maxX, y: 10, width: x-140, height: 50, txt: obj.title, fontsize: 18, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myCartpop.pview[myCartpop.pview.count-1].view)
                myCartpop.pprice[myCartpop.pprice.count-1].Label(x: myCartpop.pimg[myCartpop.pimg.count-1].imag.frame.maxX, y: myCartpop.ptitle[myCartpop.ptitle.count-1].label.frame.maxY, width: 150, height: 30, txt: "AED\(obj.price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), view: myCartpop.pview[myCartpop.pview.count-1].view)
                myCartpop.pquantity[myCartpop.pquantity.count-1].Label(x: myCartpop.pimg[myCartpop.pimg.count-1].imag.frame.maxX, y: myCartpop.pprice[myCartpop.pprice.count-1].label.frame.maxY, width: 150, height: 40, txt: "Qty: \(obj.quantity)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: myCartpop.pview[myCartpop.pview.count-1].view)
                myCartpop.pdel[myCartpop.pdel.count-1].clickableimage(x: x-30, y: 100, width: 20, height: 30, image: UIImage(named: "del")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(myCartpop.cartDelButton(_:)), any: myCartpop, view: myCartpop.pview[myCartpop.pview.count-1].view)
                total += obj.price * Double(obj.quantity)
                myCartpop.pdel[myCartpop.pdel.count-1].clickableimg.tag = obj.id
                myCartpop.body.scrollview.contentSize.height = top
            }
            myCartpop.body.scrollview.frame.size.height = myCartpop.parentview.frame.size.height-30
            /*--------------------------------------*/
            myCartpop.ptotallabel.Label(x: 10, y: top, width: 150, height: 40, txt: "Cart Subtotal", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: myCartpop.body.scrollview)
            myCartpop.ptotal.Label(x: x-160, y: top, width: 150, height: 40, txt: "AED\(total)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: myCartpop.body.scrollview)
            myCartpop.viewcartbtn[1].Button(x: 20, y: top+50, width: (x-60)/2, height: 40, title: "VIEW CART", fontsize: 14, any: myCartpop.pany as Any, function: myCartpop.pviewCarBtn, cornerRadius: 20, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: myCartpop.body.scrollview)
            myCartpop.checkoutbtn[1].Button(x: myCartpop.viewcartbtn[1].button.frame.maxX+20, y: top+50, width: (x-60)/2, height: 40, title: "CHECKOUT", fontsize: 14, any: myCartpop.pany as Any, function: myCartpop.pcheckoutBtn, cornerRadius: 20, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: myCartpop.body.scrollview)
            myCartpop.body.scrollview.contentSize.height = myCartpop.viewcartbtn[1].button.frame.maxY+10
            /*--------------------------------------*/
        }
        
    }
    
    
    
}
