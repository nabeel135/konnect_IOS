//
//  quoteDetailcell.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/14/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class quoteDetailcell: UIView {

    @IBOutlet weak var productname: UILabel!
    @IBOutlet weak var variant: UILabel!
    @IBOutlet weak var config: UILabel!
    @IBOutlet weak var sku: UILabel!
    
    @IBOutlet weak var origionalprice: UILabel!
    @IBOutlet weak var requestedprice: UILabel!
    @IBOutlet weak var approvedprice: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var discountamount: UILabel!
    @IBOutlet weak var subtotal: UILabel!
    
    
    func Input(productname:String,variant:String,config:String,sku:String,origionalprice:Double,approvedprice:Double,requestedprice:Double,qty:Int,discountamount:Double,subtotal:Double){
        self.productname.text = productname
        self.variant.text = variant
        self.config.text = config
        self.sku.text = sku
        self.origionalprice.text = String((origionalprice/100)*100)
        self.requestedprice.text = String((requestedprice/100)*100)
        self.approvedprice.text = String((approvedprice/100)*100)
        self.qty.text = String(qty)
        self.discountamount.text = String((discountamount/100)*100)
        self.subtotal.text = String((subtotal/100)*100)
    }

}
