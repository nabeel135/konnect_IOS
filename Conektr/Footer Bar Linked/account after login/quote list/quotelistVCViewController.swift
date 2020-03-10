//
//  quotelistVCViewController.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/13/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class quotelistVCViewController: UIViewController {
    
    
    //MARK:- IBoutlets
    @IBOutlet weak var body: UIScrollView!
    @IBOutlet var header: UIView!
    
    
    
    //MARK:- VIW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView()
        quotelisttable()
    }
    func headerView() {
        header.frame = CGRect(x: 0, y: 0, width: x, height: 60)
        body.addSubview(header)
    }
    

    
    
    //MARK:- quote list table view
    let list = UI()
    
    
    func quotelisttable(){
        
        for _ in 0...13 {
            let o = qhl()
            o.date = "my date"
            o.expirydate = "exp"
            o.quoteno = "####"
            o.quoteTotal = 1234
            o.status = "pending"
            
            quoteHistorylistobj.append(o)
        }
        
        list.TableView(x: 0, y: header.frame.maxY, width: x, height: y-60-70, bkcolor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), separatorColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), Sections: 1, SectionHeight: 0, SectionHEIGHT: {
        }, sectionView: {
        }, rows: quoteHistorylistobj.count, Rows: {
        }, editing: true, cellheight: 300, CellHeight: {
        }, Cellview: {
            self.cellView()
        }, onDelete: {
        }, view: body)
        
    }
    
    func cellView(){
        let cell = list.tableDelegate.cell
        let delegate = list.tableDelegate
        
        let view = nibView(fileName: "quotelistcell", ownerClass: self) as! quotelistcell
        view.frame = CGRect(x: 10, y: 10, width: cell.frame.size.width-20, height: cell.frame.size.height-20)
        cell.addSubview(view)
        
        view.Input(quoteNo: quoteHistorylistobj[delegate.index].quoteno,
                   date: quoteHistorylistobj[delegate.index].date,
                   quotetotal: (quoteHistorylistobj[delegate.index].quoteTotal/100)*100,
                   status: quoteHistorylistobj[delegate.index].status,
                   expiryDate: quoteHistorylistobj[delegate.index].expirydate,
                   any: self,
                   action: #selector(self.actionBUTTON(_:)),
                   actionTag: delegate.index)
        
        
    }
    
    
    
    
    
    
    //MARK:- BUTTONS
    @IBAction func quoteBUTTON(_ sender: Any) {
        print("quote button")
    }
    
    @objc func actionBUTTON(_ btn:UIButton){
        print("tag: \(btn.tag)")
    }
    
    
    
}
