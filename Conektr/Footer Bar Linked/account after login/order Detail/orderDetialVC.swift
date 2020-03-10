//
//  orderDetialVC.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/14/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class orderDetailVC: UIViewController {
    
    //MARK:- IBoutlets
    @IBOutlet weak var body: UIScrollView!
    @IBOutlet var topview: UIView!
    @IBOutlet var bottomeview: UIView!
    
    @IBOutlet weak var orderno: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var orderdate: UILabel!
    
    @IBOutlet weak var subtotal: UILabel!
    @IBOutlet weak var shipping_handling: UILabel!
    @IBOutlet weak var grandtotalExcl: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var grandtotal_incl: UILabel!
    
    //ship address
    @IBOutlet weak var shipline1: UILabel!
    @IBOutlet weak var shipline2: UILabel!
    @IBOutlet weak var shipline3: UILabel!
    @IBOutlet weak var shipline4: UILabel!
    @IBOutlet weak var shipline5: UILabel!
    
    @IBOutlet weak var shippingmethod: UILabel!
    
    //billing addresss
    @IBOutlet weak var billingline1: UILabel!
    @IBOutlet weak var billingline2: UILabel!
    @IBOutlet weak var billingline3: UILabel!
    @IBOutlet weak var billingline4: UILabel!
    @IBOutlet weak var billineline5: UILabel!
    
    @IBOutlet weak var paymentmethod: UILabel!
    
    
    
    
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*--------- FAKE DATA --------*/
        let o = odpl()
        o.distributorid = 1
        o.distributorName = "one"
        orderdetailproductlistobj.append(o)
        let p = odprod()
        p.canceled = 2
        p.ordered = 3
        p.price = 231
        p.productname = "my prod"
        p.sku = "my sku name"
        p.subtotal = 213
        p.vendor = "my ven"
        orderdetailproductlistobj[0].product.append(p)

        
        
        let b = odpl()
        b.distributorid = 2
        b.distributorName = "two"
        orderdetailproductlistobj.append(b)
        orderdetailproductlistobj[1].product.append(p)
        orderdetailproductlistobj[1].product.append(p)


        /*-----------------------------*/
        
        topView()
        productList()
        bottomView(top: list.table.frame.maxY)

    }
    func topView(){
        topview.frame = CGRect(x: 0, y: 0, width: x, height: 230)
        body.addSubview(topview)
    }
    
    func bottomView(top:CGFloat){
        
        bottomeview.frame = CGRect(x: 0, y: top, width: x, height: 660)
        body.addSubview(bottomeview)
        body.contentSize.height = bottomeview.frame.maxY
        
    }
    
    
    
    
    
    
    
    
    //MARK:- Product list TableView
    let list = UI()
    func productList(){
        list.TableView(x: 0, y: topview.frame.maxY, width: x, height: 500, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), border: 0, borderColor: .clear, separatorColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), Sections: orderdetailproductlistobj.count, SectionHeight: 120, SectionHEIGHT: {
            
        }, sectionView: {
            self.sectionView()
        }, rows: 0, Rows: {
            self.rows()
        }, editing: false, cellheight: 270, CellHeight: {
            
        }, Cellview: {
            self.cellview()
        }, onDelete: {
            
        }, view: body)
    }
    func sectionView(){
        let sectionview = list.tableDelegate.sectionview
        let delegate = list.tableDelegate
        
        let header = nibView(fileName: "cartheader", ownerClass: self) as! cartheaderview
        header.frame = sectionview.frame
        header.layer.borderWidth = 1
        header.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        sectionview.addSubview(header)
        
        let obj = orderdetailproductlistobj[delegate.section]
        header.Input(distributor: obj.distributorName,
                     grandtotal: grandTotal(section: delegate.section),
                     any: self,
                     button: #selector(SectionHeaderBUTTON(_:)),
                     buttonTag: delegate.section)
        
    }
    func rows(){
        let delegate = list.tableDelegate
        
        if orderdetailproductlistobj[delegate.section].isSelected {
            delegate.numberOFrows = orderdetailproductlistobj[delegate.section].product.count
        }
        else{
            delegate.numberOFrows = 0
        }
        
    }
    func cellview(){
        let cell = list.tableDelegate.cell
        let section = list.tableDelegate.section
        let index = list.tableDelegate.index
        
        let view = nibView(fileName: "orderdetailcell", ownerClass: self) as! orderdetailcell
        view.frame = CGRect(x: 10, y: 10, width: cell.frame.size.width-20, height: cell.frame.size.height-20)
        cell.addSubview(view)
        
        let obj = orderdetailproductlistobj[section].product[index]
        view.Input(productname: obj.productname,
                   vendor: obj.vendor,
                   sku: obj.sku,
                   subtotal: obj.subtotal,
                   price: obj.price,
                   ordered: obj.ordered,
                   canceled: obj.canceled)
        
    }
    
    
    func grandTotal(section:Int)->Double{
        var total = Double()
        for obj in orderdetailproductlistobj[section].product {
            total+=obj.price
        }
        return (total/100)*100
    }
    
    
    
    
    
    
    
    // MARK:- BUTTONS
    
    @IBAction func quoteBUTTON(_ sender: Any) {
        print("quote button")
    }
    
    @IBAction func reorderBUTTON(_ sender: Any) {
        print("reorder")
    }
    
    @IBAction func backBUTTON(_ sender: Any) {
        print("back")
    }
    
    ////////////////////////////////////////
    /////////   section Header arrow button
    //////////////////////////////////////
    @objc func SectionHeaderBUTTON(_ btn:UIButton){
        print("tag: \(btn.tag)  \(btn.currentTitle!)")
        
        for i in 0..<orderdetailproductlistobj.count {
            if i == btn.tag {
                orderdetailproductlistobj[i].isSelected = true
            }
            else{
                orderdetailproductlistobj[i].isSelected = false
            }
        }
        list.table.reloadData()
    }
    
    
    
}
