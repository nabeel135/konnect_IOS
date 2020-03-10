//
//  reordercell.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/14/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class reordercell: UIView {

    @IBOutlet weak var action: UIButton!
    @IBOutlet weak var productimag: UIImageView!
    @IBOutlet weak var productname: UILabel!
    @IBOutlet weak var vendor: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var qty: UITextField!
    @IBOutlet weak var orderedqty: UILabel!
    @IBOutlet weak var addtocart: UIButton!
    @IBOutlet weak var addtowishlist: UIButton!
    
    func Input(any:Any,actiontag:Int,action:Selector,productimag:UIImage,productname:String,vendor:String,price:Double,qty:Int,orderedqty:Int,addtocart:Selector,addtowishlist:Selector){
        self.action.isHidden = true
        self.action.tag = actiontag
        self.action.addTarget(any, action: action, for: .touchUpInside)
        self.productimag.image = productimag
        self.productname.text = productname
        self.vendor.text = vendor
        self.price.text = "AED "+String((price/100)*100)
        self.qty.text = String(qty)
        self.orderedqty.text = String(orderedqty)
        self.addtocart.tag = actiontag
        self.addtowishlist.tag = actiontag
        self.addtocart.addTarget(any, action: addtocart, for: .touchUpInside)
        self.addtowishlist.addTarget(any, action: addtowishlist, for: .touchUpInside)
    }
    
    
    
    
}
