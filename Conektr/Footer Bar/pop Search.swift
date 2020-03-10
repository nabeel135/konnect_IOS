//
//  Search.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/18/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import Speech
import MTBBarcodeScanner

let Searchpop = sp()
class sp: UIView {
    var parentview = UIView()
    let body = UI()
    let obj = UI()
    let search = UI()
    let barcode = UI()
    var scanner: MTBBarcodeScanner?
    
    
    
    
    //MARK:- CREATE
    func Create(any:Any,searchBtn:Selector,withinview:UIView) {
        Searchpop.parentview = withinview
        Searchpop.body.View(x: 0, y: withinview.frame.minY, width: withinview.frame.size.width, height: 100, bkcolor: UIColor(red: 242/255, green: 237/255, blue: 247/255, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: withinview)
        Searchpop.obj.Label(x: 10, y: 0, width: 150, height: 50, txt: "SEARCH BOX", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: Searchpop.body.view)
        Searchpop.obj.clickableimage(x: x-40, y: 10, width: 30, height: 30, image: UIImage(named: "cross")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(Searchpop.crossButton), any: Searchpop, view: Searchpop.body.view)
        Searchpop.obj.View(x: 0, y: Searchpop.obj.label.frame.maxY, width: withinview.frame.size.width, height: 200, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 0, borderColor: .clear, view: Searchpop.body.view)
        
        /*----------------------*/
        Searchpop.search.Textfield(x: 10, y: 45, width: x-20, height: 45, placeholder: "Enter keywords to search...", border: 1, borderRadius: 20, txtAlign: .center, bordercolor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Searchpop.obj.view)
        Searchpop.search.clickableimage(x: x-45, y: 50, width: 20, height: 30, image: UIImage(named: "search")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(voicesearchbtn), any: self, view: Searchpop.obj.view)
        
        Searchpop.barcode.LButton(x: 10, y: 120, width: x-20, height: 45, title: "Search Product With Bbarcode Scanner", fontSize: 12, any: self, tapfunction: #selector(barcodebtn(_:)), cornerRadius: 20, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: .white, txtcolor: #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1), view: Searchpop.obj.view)
        Searchpop.barcode.Image(x: x-45, y: 130, width: 25, height: 20, mode: .scaleToFill, src: UIImage(named: "barcode")!, view: Searchpop.obj.view)
        
        
        Searchpop.obj.Button(x: 40, y: 200, width: x-80, height: 40, title: "SEARCH", fontsize: 12, any: any, function: searchBtn, cornerRadius: 20, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4388002753, green: 0.2797730267, blue: 0.6211301684, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: Searchpop.obj.view)
        /*----------------------*/

        Searchpop.obj.view.frame.size.height = Searchpop.obj.button.frame.maxY+45
        Searchpop.body.view.frame.size.height = Searchpop.obj.view.frame.maxY
        Searchpop.body.view.frame.origin.y = y-70
        scanner = MTBBarcodeScanner(previewView: Searchpop.obj.view)
        Searchpop.Appear()
    }
    
    @objc func crossButton(){
        Searchpop.disAppear()
    }
    
    func Appear() {
        myCartpop.body.scrollview.frame.origin.y = y-70
        FooterMenu.myCartButton(clicked: false)
        myAccountpop.body.view.frame.origin.y = y-70
        FooterMenu.myAccountButton(clicked: false)
        menupop.body.view.frame.origin.y = y-70
        FooterMenu.menuButton(clicked: false)
        
        Searchpop.parentview.isHidden = false
        UIView.animate(withDuration: 0.2) {
            Searchpop.body.view.frame.origin.y = y-70-Searchpop.body.view.frame.size.height
        }
    }
    func disAppear() {
        Searchpop.search.txtfield.isHidden = false
        Searchpop.obj.button.isHidden = false
        Searchpop.barcode.Lbutton.isHidden = false
        Searchpop.barcode.imag.isHidden = false
        Searchpop.search.clickableimg.isHidden = false
        self.scanner?.stopScanning()
        UIView.animate(withDuration: 0.2, animations: {
            Searchpop.body.view.frame.origin.y = y-70
        }) { (true) in
            Searchpop.parentview.isHidden = true
            FooterMenu.searchButton(clicked: false)
        }
    }
    
    
    
    
    
    // MARK:- BUTTONS
    
    /////////////////////////////////////////////////////
    ////////////////////////////////////////////////////
    //////////////// Bar code
    @objc func barcodebtn(_ tap:UITapGestureRecognizer){
        print("barcode scanner")
        MTBBarcodeScanner.requestCameraPermission(success: { success in
                        if success {
                            do {
 
                                // Start scanning with the back camera
                                Searchpop.search.txtfield.isHidden = true
                                Searchpop.obj.button.isHidden = true
                                Searchpop.barcode.Lbutton.isHidden = true
                                Searchpop.barcode.imag.isHidden = true
                                Searchpop.search.clickableimg.isHidden = true
                                try self.scanner?.startScanning(with: .back,
                                                                resultBlock:
                                    { codes in
                                        if let codes = codes {
                                            for code in codes {
                                                let stringValue = code.stringValue!
                                                print("Found code: \(stringValue)")
                                                Searchpop.search.txtfield.text = stringValue
                                                
                                                self.scanner?.stopScanning()
                                                
                                                let searchresultAPi = SearchProductAPIVC()
                                                let str = "%" + Searchpop.search.txtfield.text! + "%"
                                                searchresultAPi.GetSearchResult(str: str)
                                                
                                            }
                                        }
                                })
                            } catch {
                                NSLog("Unable to start scanning")
                            }
                        } else {
                            let alertController = UIAlertController(title: "Scanning Unavailable", message: "This app does not have permission to access the camera", preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            //                self.present(alertController, animated: true, completion: nil)
                        }
                    })
    }
    
    
    /////////////////////////////////////////////////////
    ////////////////////////////////////////////////////
    //////////////// Bar code
    @objc func voicesearchbtn(){
        print("voice search")
    }
    
    
    
}

