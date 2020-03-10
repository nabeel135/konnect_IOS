//
//  quotelistcell.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/13/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class quotelistcell: UIView {

    @IBOutlet weak var quoteno: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var quotetotal: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var expirydata: UILabel!
    @IBOutlet weak var action: UIButton!
    
    
    func Input(quoteNo:String,date:String,quotetotal:Double,status:String,expiryDate:String,any:Any,action:Selector,actionTag:Int){
        self.quoteno.text = quoteNo
        self.date.text = date
        self.quotetotal.text = "\((quotetotal/100)*100)"
        self.status.text = status
        self.expirydata.text = expiryDate
        self.action.tag = actionTag
        self.action.addTarget(any, action: action, for: .touchUpInside)
    }
}
