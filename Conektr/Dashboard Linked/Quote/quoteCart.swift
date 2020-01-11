//
//  quoteCart.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/10/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class quoteCartVC: UIViewController {
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Variables
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var headerline: UIView!
    @IBOutlet weak var htitle: UILabel!
    @IBOutlet weak var qb: UIButton!
    @IBOutlet weak var body: UIScrollView!
    
    
    
    
    // MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // body
        body.frame = CGRect(x: 0, y: 0, width: x, height: y-70)
        body.contentSize.height = y
        body.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //
        headerFramming()
        //        quotelistobj.append(ps())
        //        quotelistobj[quotelistobj.count-1].id = 1
        //        quotelistobj[quotelistobj.count-1].imag = #imageLiteral(resourceName: "pro")
        //        quotelistobj[quotelistobj.count-1].title = "my first product "
        //        quotelistobj[quotelistobj.count-1].price = 12.21
        //        quotelistobj[quotelistobj.count-1].quantity = 3
        //
        //        quotelistobj.append(ps())
        //        quotelistobj[quotelistobj.count-1].id = 2
        //        quotelistobj[quotelistobj.count-1].imag = #imageLiteral(resourceName: "pro")
        //        quotelistobj[quotelistobj.count-1].title = "my first product 2"
        //        quotelistobj[quotelistobj.count-1].price = 123.21
        //        quotelistobj[quotelistobj.count-1].quantity = 4
        quotelistUI()
        
    }
    
    
    
    
    
    
    //Quote list TABLEVIEW
    let quotelist = UI()
    func quotelistUI() {
        quotelist.Label(x: 10, y: header.frame.maxY+20, width: x-20, height: 30, txt: "Item", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: body)
        quotelist.TableView(x: 0, y: quotelist.label.frame.maxY, width: x, height: 200, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), border: 1, borderColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), separatorColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), Rows: quotelistobj.count, editing: true, cellheight: 260, CellHeight: {
        }, Cellview: {
            self.cellView()
        }, onDelete: {
            self.ondelcell()
        }, view: body)
        container(top: quotelist.table.frame.maxY)
    }
    
    
    
    func cellView() {
        let view = UI()
        let imag = UI()
        let title = UI()
        let line = UI()
        let price = UI()
        let qty = UI()
        let totallabel = UI()
        let total = UI()
        let editbtn = UI()
        let delete = UI()
        
        let delegate = quotelist.tableDelegate
        let cell = quotelist.tableDelegate.cell
        quotelist.tableDelegate.cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.View(x: 10, y: 10, width: cell.frame.size.width-20, height: cell.frame.size.height-20, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 2, border: 0, borderColor: .clear, view: cell)
        view.view.tag = quotelistobj[delegate.index].id
        view.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openProductBUTTON(_:))))
        
        imag.Image(x: 10, y: 10, width: 100, height: 80, mode: .scaleAspectFit, src: quotelistobj[delegate.index].imag, view: view.view)
        title.Label(x: imag.imag.frame.maxX+5, y: 20, width: cell.frame.size.width-135, height: 50, txt: quotelistobj[delegate.index].title, fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view.view)
        line.View(x: 0, y: 100, width: cell.frame.size.width-20, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view.view)
        
        // price
        let p = quotelistobj[delegate.index].price
        let q = quotelistobj[delegate.index].quantity
        let t = ((p*Double(q))*100)/100
        price.Image(x: 10, y: 110, width: 100, height: 25, mode: .scaleToFill, src: UIImage(), view: view.view)
        price.imag.loadGif(name: "askprice")
        price.Textfield(x: 20, y: 140, width: 80, height: 30, placeholder: "0", border: 1, borderRadius: 0, txtAlign: .center, bordercolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: view.view)
        price.txtfield.text = "\((p*100)/100)"
        //quantity
        qty.Label(x: (cell.frame.size.width/2)-50, y: 110, width: 100, height: 30, txt: "Qty:", fontsize: 12, bold: true, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view.view)
        qty.Textfield(x: (cell.frame.size.width/2)-20, y: qty.label.frame.maxY, width: 40, height: 30, placeholder: "0", border: 1, borderRadius: 0, txtAlign: .center, bordercolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: view.view)
        qty.txtfield.text = "\(q)"
        //sub total
        
        totallabel.Label(x: view.view.frame.size.width-110, y: 110, width: 100, height: 30, txt: "SubTotal:", fontsize: 12, bold: true, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view.view)
        total.Label(x: view.view.frame.size.width-160, y: totallabel.label.frame.maxY, width: 150, height: 30, txt: "AED\(t)", fontsize: 12, bold: true, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: view.view)
        // line
        price.View(x: 0, y: price.txtfield.frame.maxY+10, width: cell.frame.size.width-20, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view.view)
        
        // buttons
        editbtn.Button(x: (view.view.frame.size.width/2)-50, y: price.view.frame.maxY+10, width: 100, height: 35, title: "EDIT", fontsize: 14, any: self, function: #selector(self.editBUTTON(_:)), cornerRadius: 2, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: view.view)
        editbtn.button.tag = quotelistobj[delegate.index].id
        delete.Label(x: cell.frame.size.width-100, y: price.view.frame.maxY+20, width: 100, height: 30, txt: "<< remove", fontsize: 12, bold: false, cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.4431372549, green: 0.2745098039, blue: 0.6352941176, alpha: 1), alignment: .center, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.4431372549, green: 0.2745098039, blue: 0.6352941176, alpha: 1), view: cell)
        
        
        quotelist.table.frame.size.height = cell.frame.maxY
        container(top: quotelist.table.frame.maxY)
    }
    func ondelcell(){
        quotelistobj.remove(at:quotelist.tableDelegate.index)
        quotelistUI()
        quotelist.table.reloadData()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func container(top:CGFloat) {
        buttoncontainerFramming(top: top)
        summaryFramming(top: buttonContiner.frame.maxY)
    }
    
    // MARK:- HEADER
    func headerFramming() {
        // header
        header.frame = CGRect(x: 0, y: 0, width: x, height: 50)
        htitle.frame = CGRect(x: 10, y: 0, width: 200, height: 50)
        qb.frame = CGRect(x: x-50, y: 0, width: 30, height: 40)
        headerline.frame = CGRect(x: 0, y: 50, width: x, height: 1)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- Buttons Container
    
    @IBOutlet weak var buttonContiner: UIView!
    @IBOutlet weak var conshopbtn: UIButton!
    @IBOutlet weak var clearquotebtn: UIButton!
    @IBOutlet weak var updatequotebtn: UIButton!
    
    func buttoncontainerFramming(top:CGFloat) {
        buttonContiner.frame = CGRect(x: 10, y: top, width: x-20, height: 100)
        conshopbtn.frame = CGRect(x: 10, y: 10, width: ((x-50)/2), height: 35)
        clearquotebtn.frame = CGRect(x: (x/2), y: 10, width: ((x-50)/2), height: 35)
        updatequotebtn.frame = CGRect(x: (x/2)-(((x/2)-20)/2), y: 55, width: (x/2)-20, height: 35)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- Summary Frame
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var qstitle: UILabel!
    @IBOutlet weak var line1: UIView!
    
    @IBOutlet weak var st: UILabel!
    @IBOutlet weak var subtotal: UILabel!
    @IBOutlet weak var line2: UIView!
    
    @IBOutlet weak var t: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var line3: UIView!
    
    @IBOutlet weak var qt: UILabel!
    @IBOutlet weak var quotetotal: UILabel!
    @IBOutlet weak var line4: UIView!
    
    
    
    @IBOutlet weak var enterdetail: UILabel!
    @IBOutlet weak var line5: UIView!
    @IBOutlet weak var remark: UILabel!
    @IBOutlet weak var remarktext: UITextView!
    @IBOutlet weak var submitquoteBUTTON: UIButton!
    
    func summaryFramming(top:CGFloat) {
        //container
        container.frame = CGRect(x: 10, y: top, width: x-20, height: 400)
        qstitle.frame = CGRect(x: 10, y: 10, width: x-40, height: 40)
        line1.frame = CGRect(x: 10, y: qstitle.frame.maxY, width: x-40, height: 1)
        
        st.frame = CGRect(x: 10, y: line1.frame.maxY, width: x-40, height: 30)
        // SUB TOTAL
        subtotal.frame = CGRect(x: x-(x/2)-30, y: line1.frame.maxY, width: x/2, height: 30)
        subtotal.text = "AED0.0"
        line2.frame = CGRect(x: 10, y: subtotal.frame.maxY, width: x-40, height: 1)
        
        t.frame = CGRect(x: 10, y: line2.frame.maxY+10, width: x/2, height: 30)
        // TAX
        tax.frame = CGRect(x: x-(x/2)-30, y: line2.frame.maxY+10, width: x/2, height: 30)
        tax.text = "AED0.0"
        line3.frame = CGRect(x: 10, y: tax.frame.maxY, width: x-40, height: 1)
        
        qt.frame = CGRect(x: 10, y: line3.frame.maxY+10, width: x/2, height: 30)
        // QUOTE TOTAL
        quotetotal.frame = CGRect(x: x-(x/2)-30, y: line3.frame.maxY+10, width: x/2, height: 30)
        quotetotal.text = "AED0.0"
        line4.frame = CGRect(x: 10, y: quotetotal.frame.maxY, width: x-40, height: 1)
        
        enterdetail.frame = CGRect(x: 40, y: line4.frame.maxY, width: x/2, height: 40)
        line5.frame = CGRect(x: 40, y: enterdetail.frame.maxY, width: x-100, height: 1)
        
        remark.frame = CGRect(x: 40, y: line5.frame.maxY+20, width: x/2, height: 30)
        remarktext.frame = CGRect(x: 40, y: remark.frame.maxY, width: x-100, height: 100)
        submitquoteBUTTON.frame = CGRect(x: (x/2)-150, y: remarktext.frame.maxY+20, width: 300, height: 35)
        
        container.frame.size.height = submitquoteBUTTON.frame.maxY+20
        
        body.contentSize.height = container.frame.maxY+10
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- BUTTONS
    @IBAction func quoteBUTTON(_ sender: UIButton) {
        quotepop.create(quotebtn: sender, inview: self.view)
    }
    
    @IBAction func submitQuoteBUTTON(_ sender: Any) {
        quotepop.disAppear()
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.disAppear()
        Distributor.disAppear()
        promotion.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = true
        bodyfor.submitquote.scrollview.isHidden = false
    }
    
    @IBAction func continueShoppingBUTTON(_ sender: UIButton) {
        quotepop.disAppear()
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.disAppear()
        Distributor.disAppear()
        promotion.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = true
        bodyfor.submitquote.scrollview.isHidden = true

    }
    
    @IBAction func ClearQuoteBUTTON(_ sender: UIButton) {
        print("clear quote")
        quotelistobj.removeAll()
        quotelistUI()
        quotelist.table.frame.size.height = 10
        container(top: quotelist.table.frame.maxY)
        quotelist.table.reloadData()
    }
    
    @IBAction func UpdateQuoteBUTTON(_ sender: UIButton) {
        print("update quote")
        
        print("update quote \(sender.tag)")
        
    }
    
    
    
    @objc func editBUTTON(_ productid:UIButton){
        print("edit quote \(productid.tag)")
        
        
        for i in 0..<quotelistobj.count {
            if productid.tag == quotelistobj[i].id {
                productdetail.isSelected = quotelistobj[i].isSelected
                //                productdetail.distributorID = quotelistobj[i].distributorID
                //                productdetail.distributorName = quotelistobj[i].distributorName
                productdetail.id = quotelistobj[i].id
                productdetail.imag = quotelistobj[i].imag
                productdetail.imagUrl = quotelistobj[i].imagUrl
                productdetail.title = quotelistobj[i].title
                productdetail.sku = quotelistobj[i].sku
                //                productdetail.typeId = quotelistobj[i].typeId
                productdetail.price = quotelistobj[i].price
                productdetail.discount = quotelistobj[i].discount
                productdetail.quantity = quotelistobj[i].quantity
                productdetail.description = quotelistobj[i].description
                productdetail.config = quotelistobj[i].config
                productdetail.variant = quotelistobj[i].variant
                productdetail.pricing = quotelistobj[i].pricing
                
                
                if productdetail.typeId == "configurable" {
                    let prodetailop = ProductOptionAPIVC()
                    prodetailop.GetProductOptions(sku: productdetail.sku)
                }
            }
        }
        
        
        quotepop.disAppear()
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.create(updateQuote: true, view: bodyfor.product.scrollview)
        Distributor.disAppear()
        promotion.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = true
        bodyfor.submitquote.scrollview.isHidden = true

        
    }
    @objc func openProductBUTTON(_ productid:UITapGestureRecognizer){
        print("open product detail \(productid.view!.tag)")
        
        for i in 0..<quotelistobj.count {
            if productid.view!.tag == quotelistobj[i].id {
                productdetail.isSelected = quotelistobj[i].isSelected
                //                productdetail.distributorID = quotelistobj[i].distributorID
                //                productdetail.distributorName = quotelistobj[i].distributorName
                productdetail.id = quotelistobj[i].id
                productdetail.imag = quotelistobj[i].imag
                productdetail.imagUrl = quotelistobj[i].imagUrl
                productdetail.title = quotelistobj[i].title
                productdetail.sku = quotelistobj[i].sku
                //                productdetail.typeId = quotelistobj[i].typeId
                productdetail.price = quotelistobj[i].price
                productdetail.discount = quotelistobj[i].discount
                productdetail.quantity = quotelistobj[i].quantity
                productdetail.description = quotelistobj[i].description
                productdetail.config = quotelistobj[i].config
                productdetail.variant = quotelistobj[i].variant
                productdetail.pricing = quotelistobj[i].pricing
                
                
                if productdetail.typeId == "configurable" {
                    let prodetailop = ProductOptionAPIVC()
                    prodetailop.GetProductOptions(sku: productdetail.sku)
                }
            }
        }
        
        quotepop.disAppear()
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.create(updateQuote: false, view: bodyfor.product.scrollview)
        Distributor.disAppear()
        promotion.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = true
        bodyfor.submitquote.scrollview.isHidden = true

    }
    
    
}
