////
////  AllCategories.swift
////  Conektr
////
////  Created by Mr. Nabeel on 12/19/19.
////  Copyright © 2019 Mr. Nabeel. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//let AllCategories = ac()
//class ac: UIView {
//
//    // variables
//    var parentbody = UIScrollView()
//    var heading = UI()
//    var image:[UI] = []
//
//    func Create(images:[UIImage],titles:[String],view:UIScrollView) {
//        AllCategories.parentbody = view
//        AllCategories.heading.AutoSizeLabel(x: 20, y: 0, height: 50, txt: "ALL CATEGORIES", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
//        //////////////////////////////// create dynamic
//        let cx = x/3
//        var index = 0
//
//        let _x:CGFloat = 25
//        let _y:CGFloat = 5
//        let _width:CGFloat = cx-45
//        var top = AllCategories.heading.autoSizelabel.frame.maxY
//        for i in 0..<images.count {
//            AllCategories.image.append(UI())
//            if i>2 {
//                index = i%3
//                top = AllCategories.image[i-3].view.frame.maxY
//            }
//            else{index=i}
//            AllCategories.image[i].View(x: cx*CGFloat(index), y: top, width: x/3, height: x/3, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: view)
//            AllCategories.image[i].Image(x: _x, y: _y, width: _width, height: _width, mode: .scaleToFill, src: images[i], view: AllCategories.image[i].view, imageUrl: nil)
//            AllCategories.image[i].Label(x: 0, y: AllCategories.image[i].imag.frame.maxY, width: cx, height: 40, txt: titles[i], fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: AllCategories.image[i].view)
//            AllCategories.image[i].view.tag = i
//            AllCategories.image[i].imag.tag = i
//            AllCategories.image[i].label.tag = i
//            AllCategories.image[i].view.addGestureRecognizer(UITapGestureRecognizer(target: AllCategories, action: #selector(AllCategories.categorieButton(_:))))
//            view.contentSize.height = AllCategories.image[i].view.frame.maxY
//        }
//
//        AllCategories.Appear()
//    }
//
//    func Appear() {
//        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
//        AllCategories.parentbody.isHidden = false
//    }
//    func disAppear() {
//        AllCategories.parentbody.isHidden = true
//
//    }
//
//
//    @objc func categorieButton(_ tap:UITapGestureRecognizer){
//        print("categorie: \(tap.view!.tag)")
//    }
//}

//
//  AllCategories.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/19/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let AllCategories = ac()
class ac: UIView {
    
    // variables
    var parentbody = UIScrollView()
    var heading = UI()
    var image:[UI] = []
    let imagesarr = [
        UIImage(named: "static_Beverages"),
        UIImage(named: "static_Biscuits"),
        UIImage(named: "static_Confectionery"),
        UIImage(named: "static_Oil"),
        UIImage(named: "static_Tobacco")]
    
    func Create(images:[UIImage],titles:[String],view:UIScrollView) {
        AllCategories.parentbody = view
        AllCategories.heading.AutoSizeLabel(x: 20, y: 0, height: 50, txt: "ALL CATEGORIES", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        //////////////////////////////// create dynamic
        //        let cx = x/3
        //        var index = 0
        //
        //        let _x:CGFloat = 25
        //        let _y:CGFloat = 5
        //        let _width:CGFloat = cx-45
        //        var top = AllCategories.heading.autoSizelabel.frame.maxY
        //        for i in 0..<images.count {
        //            AllCategories.image.append(UI())
        //            if i>2 {
        //                index = i%3
        //                top = AllCategories.image[i-3].view.frame.maxY
        //            }
        //            else{index=i}
        //            AllCategories.image[i].View(x: cx*CGFloat(index), y: top, width: x/3, height: x/3, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: view)
        //            AllCategories.image[i].Image(x: _x, y: _y, width: _width, height: _width, mode: .scaleToFill, src: images[i], view: AllCategories.image[i].view)
        //            AllCategories.image[i].Label(x: 0, y: AllCategories.image[i].imag.frame.maxY, width: cx, height: 40, txt: titles[i], fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: AllCategories.image[i].view)
        //            AllCategories.image[i].view.tag = i
        //            AllCategories.image[i].imag.tag = i
        //            AllCategories.image[i].label.tag = i
        //            AllCategories.image[i].view.addGestureRecognizer(UITapGestureRecognizer(target: AllCategories, action: #selector(AllCategories.categorieButton(_:))))
        //            view.contentSize.height = AllCategories.image[i].view.frame.maxY
        //        }
        GetAllCategories()
        
        
        
        
        //        AllCategories.Appear()
    }
    
    func Appear() {
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
        AllCategories.parentbody.isHidden = false
    }
    func disAppear() {
        AllCategories.parentbody.isHidden = true
        
    }
    
    
    @objc func categorieButton(_ tap:UITapGestureRecognizer){
        print("categorie: \(tap.view!.tag)")
    }
    
    func GetAllCategories() {
        
        let manager = NetworkingHelper.sharedNetworkManager
        manager.GetAllBCategories(withParameters: nil, successBlock: GetSucceeded, failureBlock: GetFailed)
    }
    
    func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
    {
        if responseObject == nil
        {
            return
        }
        
        do{
            let str = String(decoding: responseObject as! Data, as: UTF8.self)
            let decoder = JSONDecoder()
            let Array = try decoder.decode(CategoriesDataModel.self, from: responseObject as! Data)
            AllCatArray = Array
            
//            if (AllCatArray?.childrenData.count)!>0
//            {
//                let childdata:[CategoriesDataModel] = AllCatArray.m
//            }
//            let numbers = [[1,2,3],[4],[5,6,7,8,9]]
//            let flattened = AllCatArray.flatMap { $0 }
            let arr = Array.childrenData!.filter{$0.isActive == true}
//            
//            let flattened = Array1.childrenData.flatMap{$0}.flatMap{$0.childrenData}.flatMap{$0.childrenData}.filter{$0.isActive == true}
            let cx = x/3
            var index = 0
            
            let _x:CGFloat = 25
            let _y:CGFloat = 5
            let _width:CGFloat = cx-45
            var j:Int = 0
            var top = AllCategories.heading.autoSizelabel.frame.maxY
            for i in 0 ..< AllCatArray!.childrenData!.count
            {
                if(j == self.imagesarr.count)
                {
                    j = 0
                }
                AllCategories.image.append(UI())
                if i>2 {
                    index = i%3
                    top = AllCategories.image[i-3].view.frame.maxY
                }
                else{index=i}
                AllCategories.image[i].View(x: cx*CGFloat(index), y: top, width: x/3, height: x/3, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: AllCategories.parentbody)
                AllCategories.image[i].Image(x: _x, y: _y, width: _width, height: _width, mode: .scaleToFill, src: imagesarr[j]!, view: AllCategories.image[i].view)
                AllCategories.image[i].Label(x: 0, y: AllCategories.image[i].imag.frame.maxY, width: cx, height: 40, txt: (AllCatArray?.childrenData![i].name)!, fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: AllCategories.image[i].view)
                AllCategories.image[i].view.tag = i
                AllCategories.image[i].imag.tag = i
                AllCategories.image[i].label.tag = i
                AllCategories.image[i].view.addGestureRecognizer(UITapGestureRecognizer(target: AllCategories, action: #selector(AllCategories.categorieButton(_:))))
                AllCategories.parentbody.contentSize.height = AllCategories.image[i].view.frame.maxY
                j += 1
            }
            Appear()
            
        }
        catch
        {
            
        }
    }
    
    func GetFailed(task:URLSessionDataTask?, error:Error)
    {
        weak var weakSelf = self
    }
    
    
    
}
