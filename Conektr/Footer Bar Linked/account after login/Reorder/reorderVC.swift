//
//  reorderVC.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/14/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class reorderVC: UIViewController {
    
    @IBOutlet weak var body: UIScrollView!
    @IBOutlet weak var header: UIView!
    
    // MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*---------- FAKE DATA -------------*/
        let o = rop()
        o.distributorname = "one"
        reorderproductlistobj.append(o)
        
        let p = ropl()
        p.productid = 23
        p.image = #imageLiteral(resourceName: "pro")
        p.orderedqty = 3
        p.price = 123
        p.productname = "my product"
        p.qty = 3
        p.vendor = "vendddd"
        reorderproductlistobj[0].product.append(p)
        
        
        let b = rop()
        b.distributorname = "two"
        reorderproductlistobj.append(b)
        let a = ropl()
        a.productid = 53
        a.image = #imageLiteral(resourceName: "link2")
        a.orderedqty = 3
        a.price = 1543
        a.productname = "my kkoop"
        a.qty = 34
        a.vendor = "kjh"
        reorderproductlistobj[1].product.append(a)
        /*----------------------------------*/
        
        
        Productlist()
    }
    
    
    
    //MARK:- Product List
    let list = UI()
    func Productlist(){
        list.TableView(x: 0, y: header.frame.maxY, width: x, height: y-130, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), border: 0, borderColor: .clear, separatorColor: #colorLiteral(red: 0.4431372549, green: 0.2745098039, blue: 0.6352941176, alpha: 1), Sections: reorderproductlistobj.count, SectionHeight: 120, SectionHEIGHT: {
        }, sectionView: {
            self.sectionview()
        }, rows: reorderproductlistobj.count, Rows: {
            self.rows()
        }, editing: false, cellheight: 400, CellHeight: {
        }, Cellview: {
            self.cellview()
        }, onDelete: {
        }, view: body)
    }
    func rows(){
        let delegate = list.tableDelegate
        delegate.numberOFrows = reorderproductlistobj[delegate.section].product.count
    }
    func sectionview(){
        let sectionview = list.tableDelegate.sectionview
        let section = list.tableDelegate.section
        
        let header = nibView(fileName: "reorderheader", ownerClass: self) as! reorderheader
        header.frame = sectionview.frame
        sectionview.addSubview(header)
        
        header.Input(distributor: reorderproductlistobj[section].distributorname)
    }
    
    func cellview(){
        let cell = list.tableDelegate.cell
        let section = list.tableDelegate.section
        let index = list.tableDelegate.index
        
        let view = nibView(fileName: "reordercell", ownerClass: self) as! reordercell
        view.frame = CGRect(x: 0, y: 0, width: 605, height: cell.frame.size.height-20)
        
        list.tableDelegate.Model = view
        
        let scroll = UI()
        scroll.ScrollView(x: 10, y: 10, width: cell.frame.size.width-20, height: cell.frame.size.height-20, bkcolor: .clear, contentwidth: view.frame.size.width, contentheight: view.frame.size.height, view: cell)
        
        scroll.scrollview.addSubview(view)
        let obj = reorderproductlistobj[section].product[index]
        view.Input(any: self,
                   actiontag: obj.productid,
                   action: #selector(actionBUTTON(_:)),
                   productimag: obj.image,
                   productname: obj.productname,
                   vendor: obj.vendor,
                   price: obj.price,
                   qty: obj.qty,
                   orderedqty: obj.orderedqty,
                   addtocart: #selector(addtocartBUTTON(_:)),
                   addtowishlist: #selector(addtowishlistBUTTON(_:)))
    }
    
    
    
    
    // MARK:- BUTTONs
    @IBAction func quoteBUTTON(_ sender: Any) {
        print("quote button")
    }
    
    @objc func actionBUTTON(_ productid:UIButton){
        print("action button \(productid.tag)")
        
        print("image: \(productid.currentImage!)")
//        print("bkimage: \(productid.currentBackgroundImage ?? UIImage())")
        
        productid.setImage(UIImage(named: "checktrue"), for: .normal)
//        productid.setBackgroundImage(UIImage(named: "checkfalse"), for: .normal)
        
        print("--image: \(productid.currentImage!)")
//        print("--bkimage: \(productid.currentBackgroundImage!)")
    }
    
    @objc func addtocartBUTTON(_ productid:UIButton){
        print("add to cart \(productid.tag)")
    }
    
    @objc func addtowishlistBUTTON(_ productid:UIButton){
        print("add to wishlist \(productid.tag)")
    }
    
}
