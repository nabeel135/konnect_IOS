//
//  ShopList.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/8/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class shoplistVC: UIViewController {
    
    
    //MARK:- BUTTONS
    
    ////////////////////////////////////////
    ////////////////////////////////////////
    /////// ADD TO CART
    ///////////////////////////////////////
    
    @objc func addtocartBUTTON(_ btn:UIButton){
        print("add to cart")
    }
    
    ////////////////////////////////////////
    ////////////////////////////////////////
    /////// EDIT BUTTON
    ///////////////////////////////////////
    
    @objc func editBUTTON(_ btn:UIButton){
        print("edit")
    }
    ////////////////////////////////////////
    ////////////////////////////////////////
    /////// copy BUTTON
    ///////////////////////////////////////
    
    @objc func copyBUTTON(_ btn:UIButton){
        copyAlertAppear(productid: btn.tag)
    }
    
    ////////////////////////////////////////
    ////////////////////////////////////////
    /////// delete BUTTON
    ///////////////////////////////////////
    
    @objc func moveBUTTON(_ btn:UIButton){
        moveAlertAppear(productid: btn.tag)
    }
    
    
    
    /*----------------------------------------*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    let body = UI()
    
    
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        body.ScrollView(x: 0, y: 0, width: x, height: y-70, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y, view: view)

        
        
        
        /*------------------*/
        headerUI()
        ShopListpageButton()
        productlist(obj: pageidentifier())
        /*------------------*/
        
    }
    
    
    
    // MARK:- Header
    let header = UI()
    func headerUI(){
        // header
        header.AutoSizeLabel(x: 10, y: 0, height: 50, txt: "SHOP LIST", fontsize: 16, bkcolor: .clear, txtcolor: .black, border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: body.scrollview)
        header.View(x: 0, y: header.autoSizelabel.frame.maxY, width: x, height: 1, bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: body.scrollview)
    }
    
    
    
    
    
    
    // MARK:- PAGES List
    let new = UI()
    
    func ShopListpageButton() {
        new.Textfield(x: 10, y: header.view.frame.maxY+20, width: x-20, height: 50, placeholder: "Enter List Name", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: body.scrollview)
        new.Button(x: (x/2)-100, y: new.txtfield.frame.maxY, width: 200, height: 50, title: "CREATE SHOP LIST", fontsize: 14, any: self, function: #selector(newlistButton(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4269987643, green: 0.2234997749, blue: 0.5975795984, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: body.scrollview)
        // list
        refreshList()
    }
    
    
    @objc func newlistButton(_ btn:UIButton){
        if new.txtfield.text != "" {
            shoplist.append(sl())
            shoplist[shoplist.count-1].id = shoplist.count-1
            shoplist[shoplist.count-1].title = new.txtfield.text!
            refreshList()
        }
    }
    ///////////////////////////////////////////////
    // Refresh list
    let buttonscroll = UI()
    var shopbuttons:[UI] = []
    func refreshList(){
        buttonscroll.ScrollView(x: 0, y: new.button.frame.maxY+20, width: x, height: 40, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), contentwidth: x, contentheight: 40, view: body.scrollview)
        
        for obj in shopbuttons {obj.view.removeFromSuperview()}
        shopbuttons.removeAll()
        
        var sx:CGFloat = 10
        for obj in shoplist {
            shopbuttons.append(UI())
            shopbuttons[shopbuttons.count-1].View(x: sx, y: 0, width: 100, height: 40, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), view: buttonscroll.scrollview)
            shopbuttons[shopbuttons.count-1].view.tag = obj.id
            
            shopbuttons[shopbuttons.count-1].AutoSizeLabel(x: 10, y: 0, height: 40, txt: obj.title, fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: shopbuttons[shopbuttons.count-1].view)
            shopbuttons[shopbuttons.count-1].view.frame.size.width = shopbuttons[shopbuttons.count-1].autoSizelabel.frame.size.width+20
            
            
            shopbuttons[shopbuttons.count-1].view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPageButton(_:))))
            sx += shopbuttons[shopbuttons.count-1].view.frame.size.width+5
            buttonscroll.scrollview.contentSize.width = sx
        }
        
    }
    
    // Clickon SHope Button
    @objc func openPageButton(_ tap:UITapGestureRecognizer){
        for i in 0..<shoplist.count {
            if shoplist[i].id == tap.view?.tag {
                shoplist[i].isSelected = true
                tap.view?.backgroundColor = #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1)
                shopbuttons[i].autoSizelabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                shoplist[i].isSelected = false
                shopbuttons[i].view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                shopbuttons[i].autoSizelabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }

        /*------------ FALTU CODE --------------------*/
        for i in 0..<shoplist.count {
            if shoplist[i].id == tap.view?.tag {
                shoplist[i].productlist.append(slp())
                shoplist[i].productlist[shoplist[i].productlist.count-1].id = shoplist[i].productlist.count-1
                shoplist[i].productlist[shoplist[i].productlist.count-1].title = "product \(shoplist[i].productlist.count-1)"
            }
            
        }
        /*--------------------------------------------*/
        
        productlist(obj: pageidentifier())
    }
    
    func pageidentifier() -> [slp]  {
        // IDentification of page
        var obj:[slp] = []
        for i in 0..<shoplist.count {
            if shoplist[i].isSelected {
                let o = shoplist[i]
                obj = o.productlist
            }
        }
        return obj
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @objc func removepage(){
        var index = Int()
        for i in 0..<shoplist.count {
            if shoplist[i].isSelected {index=i}
        }
        if shoplist.count>0 {
            shoplist.remove(at: index)
        }
        
        refreshList()
        refreshTable()
        
    }

    
    
    // MARK:- product list
    let product = UI()
    let updatewishlist = UI()
    let sharewishlist = UI()
    let addalltocart = UI()
    func productlist(obj:[slp]){
        if obj.isEmpty {
            print("shoplist:  empty")
        }else{
            let deletepage = UI()
            deletepage.Button(x: x-100, y: buttonscroll.scrollview.frame.maxY, width: 100, height: 30, title: "Remove Page", fontsize: 12, any: self, function: #selector(removepage), cornerRadius: 2, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: body.scrollview)
            
            // TableView
            product.TableView(x: 0, y: buttonscroll.scrollview.frame.maxY+30, width: x, height: 500, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), separatorColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), Sections: 1, SectionHeight: 0, SectionHEIGHT: {}, sectionView: {}, rows: obj.count, Rows: {}, editing: true, cellheight: 500, CellHeight: {
                
            }, Cellview: {
                self.product.tableDelegate.cell.backgroundColor = .clear
                self.cellView()
            }, onDelete: {
                self.onCelldelete()
            }, view: body.scrollview)
            
            
            
        }
        
        refreshTable()
    }
    
    func refreshTable() {
        product.tableDelegate.numberOFrows = pageidentifier().count
        product.table.reloadData()
    }
    
    func cellView(){
        let view = UI()
        let title = UI()
        let price = UI()
        let comment = UI()
        let qty = UI()
        let addtocart = UI()
        let edit = UI()
        let copy = UI()
        let move = UI()
        let delete = UI()
        
        let cell = product.tableDelegate.cell
        let index = product.tableDelegate.index
        view.View(x: 10, y: 10, width: x-20, height: cell.frame.size.height-20, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 5, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: cell)
        title.Label(x: 10, y: 50, width: x-40, height: 50, txt: pageidentifier()[index].title, fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view.view)
        price.Label(x: 10, y: 100, width: x-40, height: 50, txt: "AED\(pageidentifier()[index].price)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), view: view.view)
        comment.TextView(x: 10, y: 150, width: x-40, height: 80, border: 1, text: "comment", cornerRadius: 5, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), size: 18, weight: .light, bkColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), align: .left, view: view.view)
        qty.Label(x: 10, y: comment.txtview.frame.maxY+10, width: 100, height: 40, txt: "Qty", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: view.view)
        qty.Textfield(x: 10, y: qty.label.frame.maxY, width: 50, height: 40, placeholder: "0", border: 1, borderRadius: 5, txtAlign: .center, bordercolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: .clear, view: view.view)
        addtocart.Button(x: 10, y: qty.txtfield.frame.maxY+5, width: 150, height: 50, title: "ADD TO CART", fontsize: 14, any: self, function: #selector(addtocartBUTTON(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: view.view)
        addtocart.button.tag = pageidentifier()[index].id
        edit.Button(x: 10, y: addtocart.button.frame.maxY+10, width: 100, height: 40, title: "EDIT", fontsize: 14, any: self, function: #selector(editBUTTON(_:)), cornerRadius: 5, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: view.view)
        edit.button.tag = pageidentifier()[index].id

        copy.Button(x: edit.button.frame.maxX+10, y: addtocart.button.frame.maxY+10, width: 100, height: 40, title: "COPY", fontsize: 14, any: self, function: #selector(copyBUTTON(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: .blue, view: view.view)
        copy.button.tag = pageidentifier()[index].id

        move.Button(x: copy.button.frame.maxX+10, y: addtocart.button.frame.maxY+10, width: 100, height: 40, title: "MOVE", fontsize: 14, any: self, function: #selector(moveBUTTON(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: .blue, view: view.view)
        move.button.tag = pageidentifier()[index].id
        delete.AutoSizeLabel(x: x-120, y: 0, height: 50, txt: "<< delete", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .center, view: view.view)
        
        product.table.frame.size.height = cell.frame.maxY
        product.table.frame.origin.y = buttonscroll.scrollview.frame.maxY+30
        
        
        ///////////////////////////////////////////////////
        // LAST THREE BUTTONS
        
        updatewishlist.Button(x: (x/2)-100, y: product.table.frame.maxY, width: 200, height: 35, title: "Update Wish List", fontsize: 14, any: self, function: #selector(updateWishListButton), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: body.scrollview)
        sharewishlist.Button(x: (x/2)-100, y: updatewishlist.button.frame.maxY+5, width: 200, height: 35, title: "Share Wish List", fontsize: 14, any: self, function: #selector(updateWishListButton), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: body.scrollview)
        addalltocart.Button(x: (x/2)-100, y: sharewishlist.button.frame.maxY+5, width: 200, height: 35, title: "Add All to Cart", fontsize: 14, any: self, function: #selector(updateWishListButton), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: body.scrollview)
        
        body.scrollview.contentSize.height = addalltocart.button.frame.maxY+10
    }
    
    
    func onCelldelete() {
        for i in 0..<shoplist.count {
            if shoplist[i].isSelected {
                shoplist[i].productlist.remove(at: product.tableDelegate.index)
            }
        }
        
        
        self.refreshTable()
        
    }
    
    
    //MARK:- BUTTONS
    @objc func updateWishListButton(){
        print("update wish list")
    }
    
    @objc func shareWishListButton(){
        print("share wish list")
    }
    @objc func addalltoCartButton(){
        print("addto cart wish list")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- VARIABLES for Extension
    //////////////////// copy pop extension
    var pview:[UI] = []
    var pcheck:[UI] = []
    var plabel:[UI] = []
    let copybtn = UI()
    
    //////////////////// move pop extension
    var mview:[UI] = []
    var mcheck:[UI] = []
    var mlabel:[UI] = []
    let movebtn = UI()
    
}

















 // MARK:-   SHOPLIST COPY PRODUCT
extension shoplistVC{



    func copyAlertAppear(productid:Int) {
        bodyfor.shoplistcopypop.scrollview.isHidden = false
        let cross = UI()
        cross.clickableimage(x: x-50, y: 40, width: 30, height: 30, image: #imageLiteral(resourceName: "x"), cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(crossbtn(_:)), any: self, view: bodyfor.shoplistcopypop.scrollview)

        // list  of pages

        for obj in pview {obj.view.removeFromSuperview()}
        for obj in pcheck {obj.clickableimg.removeFromSuperview()}
        for obj in plabel {obj.label.removeFromSuperview()}
        pview.removeAll()
        pcheck.removeAll()
        plabel.removeAll()

        var top:CGFloat = 100
        for obj in shoplist {
            pview.append(UI())
            pcheck.append(UI())
            plabel.append(UI())

            pview[pview.count-1].View(x: 40, y: top, width: x-80, height: 80, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), cornerRadius: 10, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: bodyfor.shoplistcopypop.scrollview)
            let v = pview[pview.count-1].view
            pcheck[pview.count-1].clickableimage(x: 10, y: 25, width: 30, height: 30, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(selectpage(_:)), any: self, view: v)
            pcheck[pview.count-1].clickableimg.tag = obj.id
            plabel[pview.count-1].Label(x: 50, y: 0, width: x-130, height: 80, txt: "Copy To ( "+obj.title+" )", fontsize: 16, bold: false, cornerRadius: 10, border: 0, borderColor: .clear, alignment: .center, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: v)
            top+=80

        }

        copybtn.Button(x: (x/2)-100, y: top+10, width: 200, height: 50, title: "COPY ITEM", fontsize: 14, any: self, function: #selector(copyto(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: bodyfor.shoplistcopypop.scrollview)
        copybtn.button.tag = productid

    }

    func copyAlertdisAppear() {
        bodyfor.shoplistcopypop.scrollview.isHidden = true
    }




    //// button
    @objc func crossbtn(_ btn:UIButton){
        copyAlertdisAppear()
    }
    @objc func selectpage(_ check:UIButton){
        if check.currentBackgroundImage == UIImage(named: "checkfalse") {
            check.setBackgroundImage(UIImage(named: "checktrue"), for: .normal)
        }
        else{
            check.setBackgroundImage(UIImage(named: "checkfalse"), for: .normal)
        }
    }

    @objc func copyto(_ btn:UIButton){
        for i in 0..<shoplist.count {
            if pcheck[i].clickableimg.currentBackgroundImage == UIImage(named: "checktrue") {

                shoplist[i].productlist.append(slp())
                shoplist[i].productlist[shoplist[i].productlist.count-1].id = pageidentifier()[btn.tag].id
                shoplist[i].productlist[shoplist[i].productlist.count-1].title = pageidentifier()[btn.tag].title
                shoplist[i].productlist[shoplist[i].productlist.count-1].price = pageidentifier()[btn.tag].price
                shoplist[i].productlist[shoplist[i].productlist.count-1].qty = pageidentifier()[btn.tag].qty

            }}
        copyAlertdisAppear()
    }







}




// MARK:- SHOPLIST MOVE PRODUCT
extension shoplistVC{
    
    
    func moveAlertAppear(productid:Int) {
        bodyfor.shoplistmovepop.scrollview.isHidden = false
        let cross = UI()
        cross.clickableimage(x: x-50, y: 40, width: 30, height: 30, image: #imageLiteral(resourceName: "x"), cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(movecrossbtn(_:)), any: self, view: bodyfor.shoplistmovepop.scrollview)
        
        // list  of pages
        
        for obj in mview {obj.view.removeFromSuperview()}
        for obj in mcheck {obj.clickableimg.removeFromSuperview()}
        for obj in mlabel {obj.label.removeFromSuperview()}
        mview.removeAll()
        mcheck.removeAll()
        mlabel.removeAll()
        
        var top:CGFloat = 100
        for obj in shoplist {
            mview.append(UI())
            mcheck.append(UI())
            mlabel.append(UI())
            
            mview[mview.count-1].View(x: 40, y: top, width: x-80, height: 80, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2235294118, blue: 0.5960784314, alpha: 1), cornerRadius: 10, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: bodyfor.shoplistmovepop.scrollview)
            let v = mview[mview.count-1].view
            mcheck[mview.count-1].clickableimage(x: 10, y: 25, width: 30, height: 30, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(moveselectpage(_:)), any: self, view: v)
            mcheck[mview.count-1].clickableimg.tag = obj.id
            mlabel[mview.count-1].Label(x: 50, y: 0, width: x-130, height: 80, txt: "Move To ( "+obj.title+" )", fontsize: 16, bold: false, cornerRadius: 10, border: 0, borderColor: .clear, alignment: .center, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: v)
            top+=80
            
        }
        
        movebtn.Button(x: (x/2)-100, y: top+10, width: 200, height: 50, title: "MOVE ITEM", fontsize: 14, any: self, function: #selector(moveto(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: bodyfor.shoplistmovepop.scrollview)
        movebtn.button.tag = productid
        
    }
    
    func moveAlertdisAppear() {
        bodyfor.shoplistmovepop.scrollview.isHidden = true
    }
    
    
    
    
    //// button
    @objc func movecrossbtn(_ btn:UIButton){
        moveAlertdisAppear()
    }
    @objc func moveselectpage(_ check:UIButton){
        if check.currentBackgroundImage == UIImage(named: "checkfalse") {
            check.setBackgroundImage(UIImage(named: "checktrue"), for: .normal)
        }
        else{
            check.setBackgroundImage(UIImage(named: "checkfalse"), for: .normal)
        }
        
        for obj in mcheck {
            if obj.clickableimg.tag == check.tag {
                check.setBackgroundImage(UIImage(named: "checktrue"), for: .normal)
            }
            else{
                obj.clickableimg.setBackgroundImage(UIImage(named: "checkfalse"), for: .normal)
            }
        }
    }
    
    @objc func moveto(_ btn:UIButton){
        for i in 0..<shoplist.count {
            if mcheck[i].clickableimg.currentBackgroundImage == UIImage(named: "checktrue") {
                
                
                shoplist[i].productlist.append(slp())
                shoplist[i].productlist[shoplist[i].productlist.count-1].id = pageidentifier()[btn.tag].id
                shoplist[i].productlist[shoplist[i].productlist.count-1].title = pageidentifier()[btn.tag].title
                shoplist[i].productlist[shoplist[i].productlist.count-1].price = pageidentifier()[btn.tag].price
                shoplist[i].productlist[shoplist[i].productlist.count-1].qty = pageidentifier()[btn.tag].qty
                
            }}
        
        
        for i in 0..<shoplist.count {
            if shoplist[i].isSelected {
                for j in 0..<shoplist[i].productlist.count {
                    if shoplist[i].productlist[j].id == btn.tag {
                        shoplist[i].productlist.remove(at: j)
                        refreshTable()
                    }}
            }}
        
        moveAlertdisAppear()
    }
    
    
    
    
    
    
    
}
