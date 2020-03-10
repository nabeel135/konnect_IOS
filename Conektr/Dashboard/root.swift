//
//  root.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/21/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class root: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        reloadDashboard()
        addchildview(parent: self, child: Dashboard(), view: view)

    }
}
let rootview = root()
func reloadDashboard(){
    addchildview(parent: rootview, child: Dashboard(), view: rootview.view)
}
