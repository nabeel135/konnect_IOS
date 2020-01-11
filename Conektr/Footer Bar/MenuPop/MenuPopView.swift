//
//  MenuPopView.swift
//  Conektr
//
//  Created by Mahad on 1/6/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class MenuPopView: UIView {

    @IBOutlet var mainview: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBAction func ClossMenu(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            self.frame.origin.y = y-70
               }) { (true) in
                    bodyfor.pop.scrollview.isHidden = true
                 bodyfor.pop.scrollview.subviews.last?.removeFromSuperview()
                   FooterMenu.menuButton(clicked: false)
               }
    }
    
    func AddItemsInTableView() {
//        let arr = AllCatArray?.childrenData!.filter{$0.isActive == true}.filter{$0.name == "Food"}
//        print(arr!.count)
    }
//let arr = Array.childrenData!.filter{$0.isActive == true}
}
