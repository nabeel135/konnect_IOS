//
//  shopCartButtons.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/13/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class shopCartButtons: UIView {

    @IBOutlet weak var updateCart: UIButton!
    @IBOutlet weak var movetoSHoplIST: UIButton!
    @IBOutlet weak var removeitem: UIButton!
    
    func Input(any:Any,updateShoppingCart:Selector,moveToShopList:Selector,removeitem:Selector,tag:Int){
        self.updateCart.tag = tag
        self.movetoSHoplIST.tag = tag
        self.removeitem.tag = tag
        self.updateCart.addTarget(any, action: updateShoppingCart, for: .touchUpInside)
        self.movetoSHoplIST.addTarget(any, action: moveToShopList, for: .touchUpInside)
        self.removeitem.addTarget(any, action: removeitem, for: .touchUpInside)
    }
    
    
    
    
    
}
