//
//  Compare Prouduct.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/9/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class compareproductVC: UIViewController {
    
    let body = UI()
    
    
    
    // MARK:- View Did Load
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        body.ScrollView(x: 0, y: 0, width: x, height: y-70, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        
        
        
        
        /*---------------*/
        headerUI()
        listUI()
        refreshList()
        /*---------------*/
        
    }
    
    
    
    // MARK:- Header
    let header = UI()
    func headerUI(){
        // header
        header.AutoSizeLabel(x: 10, y: 0, height: 50, txt: "SHOP LIST", fontsize: 16, bkcolor: .clear, txtcolor: .black, border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: body.scrollview)
        header.View(x: 0, y: header.autoSizelabel.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: body.scrollview)
    }
    
    
    
    
    
    
    
    
    // MARK:- Compare List
    let ptitle = UI()
    let psku = UI()
    let pdes = UI()
    
    var cross:[UI] = []
    var name:[UI] = []
    var price:[UI] = []
    var addtocart:[UI] = []
    var fav:[UI] = []
    var sku:[UI] = []
    var des:[UI] = []
    
    func listUI(){
        ptitle.Label(x: 10, y: header.view.frame.maxY+100, width: (x/100)*60, height: (x/100)*60, txt: "Product", fontsize: 16, bold: false, cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), alignment: .center, bkcolor: #colorLiteral(red: 0.4392156863, green: 0.2784313725, blue: 0.6196078431, alpha: 0.1960081336), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: body.scrollview)
        psku.Label(x: 10, y: ptitle.label.frame.maxY, width: (x/100)*60, height: (x/100)*20, txt: "SKU", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), alignment: .left, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: body.scrollview)
        pdes.Label(x: 10, y: psku.label.frame.maxY+5, width: (x/100)*60, height: (x/100)*20, txt: "Description", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), alignment: .left, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: body.scrollview)
        pdes.View(x: 10, y: pdes.label.frame.maxY, width: (x/100)*60, height: 20, bkcolor: #colorLiteral(red: 0.4392156863, green: 0.2784313725, blue: 0.6196078431, alpha: 1), cornerRadius: 10, border: 0, borderColor: .clear, view: body.scrollview)
        body.scrollview.contentSize.height = pdes.view.frame.maxY
                
    }
    
    
    func refreshList() {
        for obj in cross {obj.button.removeFromSuperview()}
        for obj in name {
            obj.label.removeFromSuperview()
            obj.view.removeFromSuperview()
        }
        for obj in price {obj.label.removeFromSuperview()}
        for obj in addtocart {obj.button.removeFromSuperview()}
        for obj in fav {obj.clickableimg.removeFromSuperview()}
        for obj in sku {obj.label.removeFromSuperview()}
        for obj in des {
            obj.label.removeFromSuperview()
            obj.view.removeFromSuperview()
        }
        cross.removeAll()
        name.removeAll()
        price.removeAll()
        addtocart.removeAll()
        fav.removeAll()
        sku.removeAll()
        des.removeAll()
        var px = ((x/100)*60)+10
        let pw = (x/100)*60
        
        for obj in comapareproductobj {
            cross.append(UI())
            name.append(UI())
            price.append(UI())
            addtocart.append(UI())
            fav.append(UI())
            sku.append(UI())
            des.append(UI())
            
            //cross
            cross[cross.count-1].Button(x: px+pw-30, y: header.view.frame.maxY+70, width: 30, height: 30, title: "X", fontsize: 14, any: self, function: #selector(crossBUTTON(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: body.scrollview)
            cross[cross.count-1].button.tag = obj.id
            // view
            name[name.count-1].View(x: px, y: header.view.frame.maxY+100, width: pw, height: pw, bkcolor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 0.3027878853), cornerRadius: 0, border: 0, borderColor: .clear, view: body.scrollview)
            let v = name[name.count-1].view
            name[name.count-1].Label(x: 0, y: 40, width: pw, height: 50, txt: obj.title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: v)
            price[price.count-1].Label(x: 0, y: 100, width: pw, height: 40, txt: "AED\(obj.price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), view: v)
            addtocart[addtocart.count-1].Button(x: pw-210, y: 150, width: 150, height: 40, title: "ADD TO CART", fontsize: 14, any: self, function: #selector(addtocartBUTTON(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: v)
            addtocart[addtocart.count-1].button.tag = obj.id
            fav[fav.count-1].clickableimage(x: pw-50, y: 150, width: 40, height: 40, image: UIImage(named: "heartfalse")!, cornerRadius: 5, borderWidth: 0, borderColor: .clear, function: #selector(addtofavBUTTON(_:)), any: self, view: v)
            fav[fav.count-1].clickableimg.tag = obj.id
            
            // sku
            sku[sku.count-1].Label(x: px, y: ptitle.label.frame.maxY, width: (x/100)*60, height: (x/100)*20, txt: obj.sku, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), alignment: .left, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: body.scrollview)
            
            // description
            des[des.count-1].Label(x: px, y: psku.label.frame.maxY+5, width: (x/100)*60, height: (x/100)*20, txt: obj.description, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), alignment: .left, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: body.scrollview)
            des[des.count-1].View(x: px, y: des[des.count-1].label.frame.maxY, width: (x/100)*60, height: 20, bkcolor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 0.3027878853), cornerRadius: 10, border: 0, borderColor: .clear, view: body.scrollview)
            
            px+=pw
            body.scrollview.contentSize.width = px+10
            
        }
        
        
        
        
    }
    
    
    
    
    
    @objc func addtocartBUTTON(_ productid:UIButton){
        print("addtocart \(productid.tag)")
    }
    
    @objc func addtofavBUTTON(_ productid:UIButton){
        print("fav \(productid.tag)")
    }
    
    @objc func crossBUTTON(_ productid:UIButton){
        var index = Int()
        for i in 0..<comapareproductobj.count {
            if comapareproductobj[i].id == productid.tag {
                print("del id: \(productid.tag)")
                index = i
            }}
        comapareproductobj.remove(at: index)
        refreshList()
    }
    
    
}
