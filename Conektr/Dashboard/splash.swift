//
//  splash.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/20/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit

class splashVC: UIViewController {
    
    
    
    let slider = ["splash1",
                  "splash2",
                  "splash3",
                  "splash4",
                  "splash5",
                  "splash6",
                  "splash7"]
    
    
    let bk = SplashScreen()
    let skip = UI()
    let nextSplash = UI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "isSplashOpened")
        UserDefaults.standard.synchronize()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        bk.ImageSlider(x: 0, y: 0, width: x, height: y, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), controllerColor: #colorLiteral(red: 0.4431372549, green: 0.2745098039, blue: 0.6352941176, alpha: 1), controllerRadius: 10, images: ["splash1","splash2","splash3","splash4","splash5","splash6","splash7"], view: view)
        
        skip.View(x: 0, y: y-51, width: x, height: 1, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        skip.Button(x: 0, y: y-50, width: 100, height: 50, title: "SKIP", fontsize: 12, any: self, function: #selector(skip(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.4431372549, green: 0.2745098039, blue: 0.6352941176, alpha: 1), view: view)
        
        nextSplash.Button(x: x-100, y: y-50, width: 100, height: 50, title: "NEXT", fontsize: 12, any: self, function: #selector(next(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.4431372549, green: 0.2745098039, blue: 0.6352941176, alpha: 1), view: view)
        
    }
    
    var index = 0
    @objc func next(_ btn: UIButton){
        if index < 6 {
            bk.move(currentindex: index, images: ["splash1","splash2","splash3","splash4","splash5","splash6","splash7"], controllerColor: #colorLiteral(red: 0.4431372549, green: 0.2745098039, blue: 0.6352941176, alpha: 1))
            if index == 5 {
                nextSplash.button.setTitle("GOT IT", for: .normal)
                skip.button.isHidden = true
            }
        }else{
            self.skip(UIButton())
        }
        
        index+=1
    }
    
    
    
    
    

    
    @objc func skip(_ btn: UIButton){
        setrootView(viewController: Dashboard())
    }
    
    
    
    
}






/////////////////////////////////////
/////////////////////////////////////
//////  Slider
/////////////////////////////////////
/////////////////////////////////////

class SplashScreen: UIView {
    
    let imageSlider = UIScrollView()
    let defaultimg = UI()
    let helperimg = UI()
    let imageslidercontroller = UIView()
    var imagesliderview:[UIView] = []
    
   func ImageSlider(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat, bkcolor:UIColor,controllerColor:UIColor,controllerRadius:CGFloat,images:[String], view:UIView) {
       imageSlider.frame = CGRect(x: x, y: y, width: width, height: height)
       imageSlider.backgroundColor = bkcolor
       imageSlider.contentSize.width = width
       imageSlider.contentSize.height = height
       view.addSubview(imageSlider)
       
       // slider image
       defaultimg.Image(x: 0, y: 0, width: width, height: height, mode: .scaleToFill, src: UIImage(named: images[0])!, view: imageSlider)
       helperimg.Image(x: width, y: 0, width: width, height: height, mode: .scaleToFill, src: UIImage(named: images[0])!, view: imageSlider)
       
       // helper slider controller
       imageslidercontroller.frame = CGRect(x: 0, y: height-40, width: 5, height: 40)
    imageslidercontroller.backgroundColor = .clear
       imageSlider.addSubview(imageslidercontroller)
       var xs:CGFloat = 5
       for _ in images {
           imagesliderview.append(UIView())
           imagesliderview[imagesliderview.count-1].frame = CGRect(x: xs, y: 10, width: controllerRadius, height: controllerRadius)
           imagesliderview[imagesliderview.count-1].layer.cornerRadius = controllerRadius
           imagesliderview[imagesliderview.count-1].backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
           imageslidercontroller.addSubview(imagesliderview[imagesliderview.count-1])
           xs += controllerRadius+5
           imageslidercontroller.frame.size.width = xs
           imageslidercontroller.frame.origin.x = (imageSlider.frame.size.width/2)-(xs/2)
       }
       
       
       
   }
    
    func move(currentindex:Int,images:[String],controllerColor:UIColor) {
        var i = currentindex+1
        if currentindex == (images.count-1) {i = 0}
        self.defaultimg.imag.image = UIImage(named: images[currentindex])
        self.helperimg.imag.image = UIImage(named: images[i])
        self.defaultimg.imag.frame.origin.x = 0
        self.helperimg.imag.frame.origin.x = self.imageSlider.frame.size.width
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 01, options: [], animations: {
            self.defaultimg.imag.frame.origin.x = -self.imageSlider.frame.size.width
            self.helperimg.imag.frame.origin.x = 0
        })
        for j in 0..<images.count {
            if j == i
            {self.imagesliderview[j].backgroundColor = controllerColor}
            else{self.imagesliderview[j].backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)}
        }

    }
    
    
    
}






