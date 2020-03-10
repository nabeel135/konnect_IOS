//
//  reorderheader.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/14/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class reorderheader: UIView {
    
    @IBOutlet weak var distributor: UILabel!
    
    func Input(distributor:String){
        self.distributor.text = distributor
    }
    
}
