/////// MyOrder list.swift

//
//  MyOrder list.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/4/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class orderlistVC: UIViewController {
    
    
    let body = UI()
    
    let header  = UI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        body.ScrollView(x: 0, y: 0, width: x, height: y-70, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y, view: view)
        
        // header
        // header
        header.AutoSizeLabel(x: 10, y: 0, height: 50, txt: "MY ORDERS", fontsize: 16, bkcolor: .clear, txtcolor: .black, border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: body.scrollview)
        header.View(x: 0, y: header.autoSizelabel.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: body.scrollview)
        
        /*--------FAKE DATA-----------*/
        for i in 0...32 {
            orderListobj.append(orderModel())
            orderListobj[i].id = i
            orderListobj[i].orderno = i+2000
            orderListobj[i].date = "21/12/1996"
            orderListobj[i].shipto = "Nimila jose"
            orderListobj[i].total = 23.0
            orderListobj[i].status = "Canceled"
        }
        /*-----------------------------*/
        orderListUI(currentpage: 1)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /////////////////////////////////////////////////
    // MARK:- ORDER LIST
    
    
    var orderview:[UI] = []
    var orderno:[UI] = []
    var date:[UI] = []
    var shipto:[UI] = []
    var total:[UI] = []
    var status:[UI] = []
    var Action:[UI] = []
    var vieworder:[UI] = []
    var reorder:[UI] = []
    
    
    func orderListUI(currentpage: Int){
        var top = header.view.frame.maxY
        var si:Int = 0
        var ei:Int = 0
        
        if (orderListobj.count/10)>=currentpage  {
            si = (10*currentpage)-10
            ei = si+9
        }
        else if currentpage>(orderListobj.count/10) {
            si = orderListobj.count-(orderListobj.count % 10)
            ei = orderListobj.count-1
        }
        
        for obj in orderview {obj.view.removeFromSuperview()}
        orderview.removeAll()
        orderno.removeAll()
        date.removeAll()
        shipto.removeAll()
        total.removeAll()
        status.removeAll()
        Action.removeAll()
        vieworder.removeAll()
        reorder.removeAll()
        
        for i in si...ei {
            orderview.append(UI())
            orderno.append(UI())
            date.append(UI())
            shipto.append(UI())
            total.append(UI())
            status.append(UI())
            vieworder.append(UI())
            reorder.append(UI())
            
            orderview[orderview.count-1].View(x: 0, y: top, width: x, height: 100, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: body.scrollview)
            let v = orderview[orderview.count-1].view
            // ORDER NO
            orderno[orderview.count-1].AutoSizeLabel(x: 10, y: 10, height: 40, txt: "ORDER #: ", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: v)
            orderno[orderview.count-1].Label(x: orderno[orderview.count-1].autoSizelabel.frame.maxX, y: 10, width: x-10-orderno[orderview.count-1].autoSizelabel.frame.size.width, height: 40, txt: "\(orderListobj[i].orderno)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: v)
            
            // DATE
            date[date.count-1].AutoSizeLabel(x: 10, y: 50, height: 40, txt: "DATE: ", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: v)
            date[date.count-1].Label(x: date[orderview.count-1].autoSizelabel.frame.maxX, y: 50, width: x-10-date[orderview.count-1].autoSizelabel.frame.size.width, height: 40, txt: "\(orderListobj[i].date)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: v)
            
            // SHIP TO
            shipto[shipto.count-1].AutoSizeLabel(x: 10, y: 90, height: 40, txt: "SHIP TO: ", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: v)
            shipto[shipto.count-1].Label(x: shipto[orderview.count-1].autoSizelabel.frame.maxX, y: 90, width: x-10-shipto[orderview.count-1].autoSizelabel.frame.size.width, height: 40, txt: "\(orderListobj[i].shipto)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: v)
            
            // ORDER TOTAL
            total[total.count-1].AutoSizeLabel(x: 10, y: 130, height: 40, txt: "ORDER TOTAL: ", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: v)
            total[total.count-1].Label(x: total[orderview.count-1].autoSizelabel.frame.maxX, y: 130, width: x-10-total[orderview.count-1].autoSizelabel.frame.size.width, height: 40, txt: "AED\(orderListobj[i].total)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: v)
            
            // STATUS
            status[status.count-1].AutoSizeLabel(x: 10, y: 170, height: 40, txt: "STATUS: ", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: v)
            status[status.count-1].Label(x: status[orderview.count-1].autoSizelabel.frame.maxX, y: 170, width: x-10-status[orderview.count-1].autoSizelabel.frame.size.width, height: 40, txt: "\(orderListobj[i].shipto)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: v)
            
            // ACTION
            vieworder[vieworder.count-1].Button(x: 0, y: 210, width: x/2, height: 40, title: "VIEW ORDER", fontsize: 14, any: self, function: #selector(vieworderButton(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: .blue, view: v)
            vieworder[vieworder.count-1].button.tag = orderListobj[i].id
            reorder[reorder.count-1].Button(x: x/2, y: 210, width: x/2, height: 40, title: "REORDER", fontsize: 14, any: self, function: #selector(reorderButton(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: .blue, view: v)
            reorder[reorder.count-1].button.tag = orderListobj[i].id

            v.frame.size.height = 260
            top = orderview[orderview.count-1].view.frame.maxY
        }
        
        pageshifter(top: top, currentpage: currentpage)
    }
    
    
    
    
    
    
    @objc func vieworderButton(_ btn:UIButton){
        print("view order: \(btn.tag)")
    }
    @objc func reorderButton(_ btn:UIButton){
        print("Re order: \(btn.tag)")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    /////////////////////////////////////////////////
    // MARK:- PageShifter
    
    let pageshifter = UI()
    var pagebtn:[UI] = []
    func pageshifter(top:CGFloat, currentpage:Int) {
        // find how many pages
        let n = orderListobj.count
        var pagecount:Int = n/10
        if n%10 > 0 {pagecount+=1}
        
        // backgound scroll
        pageshifter.ScrollView(x: 0, y: top, width: x, height: 100, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), contentwidth: x, contentheight: 100, view: body.scrollview)
        
        for obj in pagebtn {obj.button.removeFromSuperview()}
        pagebtn.removeAll()
        var bx:CGFloat = 30
        for i in 0..<pagecount {
            pagebtn.append(UI())
            pagebtn[i].Button(x: bx, y: 30, width: 40, height: 40, title: "\(i+1)", fontsize: 14, any: self, function: #selector(pageshifterButton(_:)), cornerRadius: 20, bordercolor: #colorLiteral(red: 0.4509803922, green: 0.2941176471, blue: 0.6196078431, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.4509803922, green: 0.2941176471, blue: 0.6196078431, alpha: 1), view: pageshifter.scrollview)
            pagebtn[i].button.tag = i+1
            bx+=50
            if i == currentpage-1 {
                pagebtn[i].button.backgroundColor = #colorLiteral(red: 0.4509803922, green: 0.2941176471, blue: 0.6196078431, alpha: 1)
                pagebtn[i].button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            pageshifter.scrollview.contentSize.width = bx
        }
        body.scrollview.contentSize.height = top+200
        
    }
    
    
    @objc func pageshifterButton(_ btn:UIButton){
        orderListUI(currentpage: btn.tag)
    }
    
    
}



