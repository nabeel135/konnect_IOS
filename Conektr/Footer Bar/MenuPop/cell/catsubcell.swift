//
//  catsubcell.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/16/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class catsubcell: UIView {

    @IBOutlet weak var child: UIButton!
    
    
    func Input(any:Any,cateid:Int,childCategory:String,chooseCategory:Selector){
        self.child.tag = cateid
        self.child.addTarget(any, action: chooseCategory, for: .touchUpInside)
        self.child.setTitle(childCategory, for: .normal)
        TranslateText(button: self.child)
        
    }

}
