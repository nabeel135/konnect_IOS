//
//  Shopping Cart.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/19/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let allBrands = ab()
class ab: UIView {
    var heading = UI()
    var image:[UI] = []
    
    // variable
    var parentbody = UIScrollView()
    
    func Create(images:[UIImage],view:UIScrollView,imgUrl:[String]) {
        allBrands.parentbody = view
        
        
        allBrands.parentbody = view
        allBrands.heading.AutoSizeLabel(x: 20, y: 0, height: 50, txt: "ALL BRANDS", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        
        //////////////////////////////// create dynamic
        let cx = x/3
        var index = 0
        var top = allBrands.heading.autoSizelabel.frame.maxY
        for i in 0..<images.count {
            allBrands.image.append(UI())
            if i>2 {
                index = i%3
                top = allBrands.image[i-3].view.frame.maxY
            }
            else{index=i}
            allBrands.image[i].View(x: cx*CGFloat(index), y: top, width: cx, height: (cx/100)*75, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), view: view)
            allBrands.image[i].Image(x: 0, y: 0, width: cx, height: (cx/100)*75, mode: .scaleToFill, src: images[i], view: allBrands.image[i].view, imageUrl: imgUrl[i])
            allBrands.image[i].view.tag = i
            allBrands.image[i].imag.tag = i
            allBrands.image[i].view.addGestureRecognizer(UITapGestureRecognizer(target: allBrands, action: #selector(allBrands.brandButton(_:))))
            view.contentSize.height = allBrands.image[i].view.frame.maxY
        }
        
        
        
        allBrands.Appear()
    }
    
    func Appear(){
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: false)
        allBrands.parentbody.isHidden = false
    }
    func disAppear() {
        allBrands.parentbody.isHidden = true
    }
    
    
    @objc func brandButton(_ tap:UITapGestureRecognizer){
        print("brand: \(tap.view!.tag)")
    }
    
    
}
