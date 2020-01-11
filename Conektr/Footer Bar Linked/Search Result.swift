//
//  File.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/19/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

let searchResult = sr()
class sr: UIView {
    //variable
    var parentbody = UIScrollView()
    //////////////////
    var heading = UI()
    func Create(view:UIScrollView){
        searchResult.parentbody = view
        AllCategories.heading.AutoSizeLabel(x: 20, y: 0, height: 50, txt: "ALL CATEGORIES", fontsize: 16, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .left, view: view)
        
        searchResult.Appear()
    }
    
    func Appear(){
        searchResult.parentbody.isHidden = false
    }
    
    func disAppear(){
        searchResult.parentbody.isHidden = true
    }
}
