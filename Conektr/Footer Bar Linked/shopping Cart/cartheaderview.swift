//
//  cartheaderview.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/13/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class cartheaderview: UIView {

    @IBOutlet weak var distributor: UILabel!
    @IBOutlet weak var grandtotal: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    func Input(distributor:String,grandtotal:Double,any:Any,button:Selector,buttonTag:Int){
        self.distributor.text = distributor
        self.grandtotal.text = "AED \((grandtotal/100)*100)"
        self.button.tag = buttonTag
        self.button.addTarget(any, action: button, for: .touchUpInside)
    }
    
}
