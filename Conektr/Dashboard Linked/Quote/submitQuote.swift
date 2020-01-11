//
//  submitQuote.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/10/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class submitquoteVC: UIViewController {
    
    @IBOutlet weak var quoteID: UILabel!
    
    @IBOutlet weak var continueShopBUTTON: UIButton!
    @IBAction func continueShopBUTTON(_ sender: UIButton) {
        print("continue shope")
    }
    
    @IBAction func quoteBUTTON(_ sender: UIButton) {
        print("quote button")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // button
        continueShopBUTTON.layer.masksToBounds = true
        continueShopBUTTON.layer.cornerRadius = 5
    }
    
    
}
