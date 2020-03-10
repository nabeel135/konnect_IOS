//
//  shoppingCartCell.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/13/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit


class shoppingCartCell: UIView {

    @IBOutlet weak var actionlabel: UILabel!
    @IBOutlet weak var action: UIButton!
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var producttitle: UILabel!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var subtotal: UILabel!
    
    
    func Input(any:Any,action:Selector,actionTag:Int,imageURL:String,productTitle:String,Qty:Int,price:Double,subtotal:Double){
        self.action.tag = actionTag
        self.action.addTarget(any, action: action, for: .touchUpInside)
        self.actionlabel.isHidden = true
        self.action.isHidden = true
        self.productimage.load(url: URL(string: imageURL)!)
        self.producttitle.text = productTitle
        self.price.text = "AED \((price/100)*100)"
        self.quantity.text = Qty.tostring()
        self.subtotal.text = "AED \(subtotal/100)*100"
    }
    

}


