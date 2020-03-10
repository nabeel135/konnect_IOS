//
//  quoteDetail.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/12/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class quotedetailVC: UIViewController {
    
    //MARK:- IBoutlets
    
    @IBOutlet weak var body: UIScrollView!
    @IBOutlet var topview: UIView!
    @IBOutlet var bottomview: UIView!
    
    
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        topView()
        productList()
    }
    
    func topView(){
        topview.frame = CGRect(x: 0, y: 0, width: x, height: 180)
        body.addSubview(topview)
    }
    
    func bottomView(top:CGFloat){
        bottomview.frame = CGRect(x: 0, y: top, width: x, height: 140)
        body.addSubview(bottomview)
        body.contentSize.height = bottomview.frame.maxY
    }
    
    
    
    
    
    
    
    //MARK:- Product LIST
    let list = UI()
    
    func productList(){
        
        
        /*------ fake data ----------*/
        for _ in 0...1 {
            let o = qhpl()
            o.approvedprice = 12
            o.config = "my conf"
            o.discountAmount = 32
            o.origionalprice = 45
            o.productname = "my product"
            o.qty = 3
            o.requestedprice = 123
            quoteHistoryProductListobj.append(o)
        }
        /*---------------------------*/
        
        list.TableView(x: 0, y: topview.frame.maxY, width: x, height: 20, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), border: 0, borderColor: .clear, separatorColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), Sections: 1, SectionHeight: 0, SectionHEIGHT: {
            
        }, sectionView: {
            
        }, rows: quoteHistoryProductListobj.count, Rows: {
            
        }, editing: false, cellheight: 450, CellHeight: {
            
        }, Cellview: {
            self.cellview()
        }, onDelete: {
            
        }, view: body)
    }
    
    
    func cellview(){
        let cell = list.tableDelegate.cell
        let index = list.tableDelegate.index
        
        let view = nibView(fileName: "quoteDetailcell", ownerClass: self) as! quoteDetailcell
        view.frame = CGRect(x: 10, y: 10, width: cell.frame.size.width-20, height: cell.frame.size.height-20)
        cell.addSubview(view)
        
        let obj = quoteHistoryProductListobj[index]
        view.Input(productname: obj.productname,
                   variant: obj.variant,
                   config: obj.config,
                   sku: obj.sku,
                   origionalprice: obj.origionalprice,
                   approvedprice: obj.approvedprice,
                   requestedprice: obj.requestedprice,
                   qty: obj.qty,
                   discountamount: obj.discountAmount,
                   subtotal: obj.subtotal)
        
        list.table.frame.size.height = cell.frame.maxY
        bottomView(top: list.table.frame.maxY)

    }
    
    
    
    
    
    
    
    
    
    // MARK:- BUTTONS
    
    @IBAction func quoteBUTTON(_ sender: Any) {
        print("quote button")
    }
    
    @IBAction func cancelBUTTON(_ sender: Any) {
        print("cancel button")
    }
    
    
    
}
