//
//  orderdetailcell.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/14/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class orderdetailcell: UIView {

    @IBOutlet weak var productname: UILabel!
    @IBOutlet weak var vendor: UILabel!
    @IBOutlet weak var sku: UILabel!
    
    @IBOutlet weak var subtotal: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var ordered: UILabel!
    @IBOutlet weak var canceled: UILabel!
    
    func Input(productname:String,vendor:String,sku:String,subtotal:Double,price:Double,ordered:Int,canceled:Int){
        self.productname.text = productname
        self.vendor.text = vendor
        self.sku.text = sku
        self.subtotal.text = "AED "+String((subtotal/100)*100)
        self.price.text = "AED "+String((price/100)*100)
        self.ordered.text = String(ordered)
        self.canceled.text = String(canceled)
    }
    
}
