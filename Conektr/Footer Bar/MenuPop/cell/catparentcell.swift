//
//  catparentcell.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/16/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class catparentcell: UIView {

    @IBOutlet weak var parentCategory: UIButton!
    
    @IBOutlet weak var openbutton: UIButton!
    
    
    func Input(subid:Int,subCategory:String,parentCategory:String,any:Any,selectedcategory:Selector,isSelected:Bool,any2:Any,openChild:Selector){
        self.parentCategory.tag = subid
        self.parentCategory.setTitle(subCategory, for: .normal)
        self.parentCategory.addTarget(any, action: selectedcategory, for: .touchUpInside)
        self.openbutton.tag = subid
        self.openbutton.addTarget(any2, action: openChild, for: .touchUpInside)
        if isSelected {
            self.openbutton.setImage(UIImage(named: "blackup"), for: .normal)
        }
        else{
            self.openbutton.setImage(UIImage(named: "blackdown"), for: .normal)
        }
        TranslateText(button: self.parentCategory)
 
    }
    
    
    
    
    
}
