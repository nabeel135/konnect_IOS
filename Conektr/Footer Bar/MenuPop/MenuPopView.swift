//
//  MenuPopView.swift
//  Conektr
//
//  Created by Mahad on 1/6/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class MenuPopView: UIView {

    @IBOutlet weak var cross: UIButton!
    @IBOutlet weak var food: UIButton!
    @IBOutlet weak var nonfood: UIButton!
    @IBOutlet weak var promotionoffer: UIButton!
   
    @IBOutlet weak var openfood: UIButton!
    
    @IBOutlet weak var opennonfood: UIButton!
    
    
    
    //////
    var any:Any!
    var choosecategory:Selector!
    
    func Input(any:Any,chooseCategory:Selector,promotion:Selector,cross:Selector){
        self.any = any
        self.choosecategory = chooseCategory
        self.food.addTarget(any, action: chooseCategory, for: .touchUpInside)
        self.nonfood.addTarget(any, action: chooseCategory, for: .touchUpInside)
        self.promotionoffer.addTarget(any, action: promotion, for: .touchUpInside)
        self.food.tag = 33
        self.nonfood.tag = 35
        self.promotionoffer.tag = 12
        self.openfood.addTarget(self, action: #selector(openFoodBUTTON(_:)), for: .touchUpInside)
        self.opennonfood.addTarget(self, action: #selector(opennonFoodBUTTON(_:)), for: .touchUpInside)
        self.cross.addTarget(any, action: cross, for: .touchUpInside)
        TranslateText(button: food)
        TranslateText(button: nonfood)
        TranslateText(button: promotionoffer)


    }
    
    
    @objc func openFoodBUTTON(_ btn:UIButton){
        btn.setImage(UIImage(named: "blackup"), for: .normal)
        time.delay(sec: 2) {btn.setImage(UIImage(named: "blackdown"), for: .normal)}
        
        popsubcatview = nibView(fileName: "popsubcat", ownerClass: self) as! popsubcat
                popsubcatview.frame = menupop.parentview.frame
                menupop.parentview.addSubview(popsubcatview)
        popsubcatview.showSubCate(ofcat: "Food", any: self.any!, chooseCategory: self.choosecategory)
    }
    @objc func opennonFoodBUTTON(_ btn:UIButton){
        btn.setImage(UIImage(named: "blackup"), for: .normal)
        time.delay(sec: 2) {btn.setImage(UIImage(named: "blackdown"), for: .normal)}
        
        popsubcatview = nibView(fileName: "popsubcat", ownerClass: self) as! popsubcat
                popsubcatview.frame = menupop.parentview.frame
                menupop.parentview.addSubview(popsubcatview)
        popsubcatview.showSubCate(ofcat: "Non-Food", any: self.any!, chooseCategory: self.choosecategory)
    }
    
    
    
    
    
    
}
