//
//  mainpop.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/10/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit


let quotepop = qp()
class qp: UIView {
    
    var body = UIView()
    var scroll = UI()
    let quotecartbtn = UI()
    let cross = UI()
    
    let header = UI()
    let countlabel = UI()
    var count = 0
    
    let totallable = UI()
    let total = UI()
    var totalprice:Double = 0.0
    let list = UI()
    
    
    // MARK:-  CREATE
    func create(quotebtn:UIButton,inview:UIView) {
        quotepop.scroll.ScrollView(x: x-((x/100)*85)-10, y: quotebtn.frame.maxY, width: (x/100)*85, height: 400, bkcolor: .clear, contentwidth: (x/100)*85, contentheight: quotebtn.frame.maxY, view: inview)
        /*------------------*/
        let triangle = UI()
        triangle.drawTriangle(
            CGPoint(x: scroll.scrollview.frame.size.width-30, y: 0),
            CGPoint(x: scroll.scrollview.frame.size.width-40, y: 15),
            CGPoint(x: scroll.scrollview.frame.size.width-20, y: 15),
            bkcolor: #colorLiteral(red: 0.4431372549, green: 0.2745098039, blue: 0.6352941176, alpha: 1), borderColor: .clear, view: quotepop.scroll.scrollview)
        quotepop.header.View(x: 0, y: 15, width: quotepop.scroll.scrollview.frame.size.width, height: 150, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 1, border: 0, borderColor: .clear, view: quotepop.scroll.scrollview)
        quotepop.cross.clickableimage(x: quotepop.scroll.scrollview.frame.size.width-25, y: 10, width: 25, height: 25, image: #imageLiteral(resourceName: "x"), cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(quotepop.disAppear), any: quotepop, view: scroll.scrollview)
        quotepop.countlabel.Label(x: 10, y: 40, width: (scroll.scrollview.frame.size.width-20)/2, height: 20, txt: "\(count) items in Cart", fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: quotepop.scroll.scrollview)
        quotepop.totallable.Label(x: quotepop.countlabel.label.frame.maxX, y: 40, width: (scroll.scrollview.frame.size.width-20)/2, height: 20, txt: "Cart SubTotal:", fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: quotepop.scroll.scrollview)
        quotepop.total.Label(x: quotepop.countlabel.label.frame.maxX, y: 60, width: (scroll.scrollview.frame.size.width-20)/2, height: 40, txt: "AED\(totalprice)", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .right, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: quotepop.scroll.scrollview)
        quotepop.quotecartbtn.Button(x: 10, y: 100, width: quotepop.scroll.scrollview.frame.size.width-20, height: 40, title: "MY QUOTE CART", fontsize: 12, any: quotepop, function: #selector(quotepop.myquoteCartBUTTON), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: quotepop.scroll.scrollview)
        
        quotepop.quoteList()
        
        let quoteVC = AddtoQuoteAPIVC()
        quoteVC.GetQuoteList()
        /*------------------*/
        quotepop.Appear()
    }
    
    func Appear(){
        quotepop.scroll.scrollview.isHidden = false
    }
    
    @objc func disAppear(){
        quotepop.scroll.scrollview.isHidden = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- QUOTE list TableView
    func quoteList() {
//        quotelistobj.append(ps())
//        quotelistobj[quotelistobj.count-1].id = quotelistobj.count
//        quotelistobj[quotelistobj.count-1].imag = #imageLiteral(resourceName: "pro")
//        quotelistobj[quotelistobj.count-1].title = "my product title is long one so maske u"
//        quotelistobj[quotelistobj.count-1].price = 12.213+Double(quotelistobj.count)
//        quotelistobj[quotelistobj.count-1].quantity = 4+quotelistobj.count
        
        quotepop.list.TableView(x: 0, y: quotepop.header.view.frame.maxY, width: quotepop.scroll.scrollview.frame.size.width, height: quotepop.scroll.scrollview.frame.size.height-quotepop.header.view.frame.maxY, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), separatorColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), Sections: 1, SectionHeight: 0, SectionHEIGHT: {}, sectionView: {}, rows: quotelistobj.count, Rows: {}, editing: true, cellheight: 130, CellHeight: {
            
        }, Cellview: {
            quotepop.cellView()
        }, onDelete: {
            quotepop.ondelcell()
        }, view: quotepop.scroll.scrollview)
        
        quotepop.list.table.reloadData()
    }
    
    
    func cellView(){
        let cell = quotepop.list.tableDelegate.cell
        let delegate = quotepop.list.tableDelegate
        
        let view = UI()
        let imag = UI()
        let title = UI()
        let price = UI()
        let qty = UI()
        let setting = UI()
        let del = UI()
        
        cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.View(x: 10, y: 10, width: cell.frame.size.width-20, height: cell.frame.size.height-20, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 2, border: 0, borderColor: .clear, view: cell)
        view.view.tag = quotelistobj[delegate.index].id
        view.view.addGestureRecognizer(UITapGestureRecognizer(target: quotepop, action: #selector(quotepop.openProductBUTTON(_:))))
        
        imag.Image(x: 10, y: 10, width: 100, height: cell.frame.size.height-20, mode: .scaleAspectFit, src: quotelistobj[delegate.index].imag, view: view.view)
        title.Label(x: 120, y: 10, width: view.view.frame.size.width-120, height: 40, txt: quotelistobj[delegate.index].title, fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: .blue, view: view.view)
        price.Label(x: 120, y: title.label.frame.maxY, width: view.view.frame.size.width-120, height: 25, txt: "AED \((quotelistobj[delegate.index].price/100)*100)", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: view.view)
        qty.Label(x: 120, y: price.label.frame.maxY, width: view.view.frame.size.width-120, height: 25, txt: "Qty: \(quotelistobj[delegate.index].quantity)", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view.view)
        setting.clickableimage(x: view.view.frame.size.width-70, y: view.view.frame.maxY-40, width: 30, height: 30, image: UIImage(named: "setting")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(quotepop.editBUTTON(_:)), any: quotepop, view: view.view)
        setting.clickableimg.tag = quotelistobj[delegate.index].id
        
        del.clickableimage(x: view.view.frame.size.width-30, y: view.view.frame.maxY-40, width: 20, height: 30, image: UIImage(named: "del")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(quotepop.delBUTTON(_:)), any: quotepop, view: view.view)
        del.clickableimg.tag = delegate.index
        
        //        quotepop.list.table.frame.size.height = cell.frame.maxY
    }
    
    func ondelcell(){
        
        let addtoQuote = AddtoQuoteAPIVC()
        addtoQuote.DeleteQuoteItem(id: quotelistobj[quotepop.list.tableDelegate.index].id)
//        quotelistobj.remove(at: quotepop.list.tableDelegate.index)
//        quotepop.list.tableDelegate.numberOFrows = quotelistobj.count
//        quotepop.list.table.reloadData()
        
    }
    
    
    
    
    
    // Mark:- BUTTONS
    @objc func myquoteCartBUTTON(){
        quotepop.disAppear()
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.disAppear()
        Distributor.disAppear()
        search.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = false
        bodyfor.submitquote.scrollview.isHidden = true

        addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: storyboardView(boardName: "main", pageID: "quoteCartVC"), view: bodyfor.quotecart.scrollview)
    }
    @objc func crossBUTTON(){
        quotepop.disAppear()
    }
    @objc func delBUTTON(_ cellindex:UIButton){
        
        let addtoQuote = AddtoQuoteAPIVC()
        addtoQuote.DeleteQuoteItem(id: quotelistobj[cellindex.tag].id)
        
//        quotelistobj.remove(at: cellindex.tag)
//        quotepop.list.tableDelegate.numberOFrows = quotelistobj.count
//        quotepop.list.table.reloadData()
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
//                    prodetailop.GetProductOptions(sku: productdetail.sku)
                    prodetailop.GetProductandConfigOptions(sku: productdetail.sku)
                }
            }
        }
        
        
        quotepop.disAppear()
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.create(updateQuote: true, view: bodyfor.product.scrollview)
        Distributor.disAppear()
        search.disAppear()
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
//                            prodetailop.GetProductOptions(sku: productdetail.sku)
                            prodetailop.GetProductandConfigOptions(sku: productdetail.sku)
                        }
                    }
                }
        
        quotepop.disAppear()
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.create(updateQuote: false, view: bodyfor.product.scrollview)
        Distributor.disAppear()
        search.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = true
        bodyfor.submitquote.scrollview.isHidden = true

    }
}
