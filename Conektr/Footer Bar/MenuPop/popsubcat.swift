//
//  popsubcat.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/15/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit




var popsubcatview = popsubcat()
class popsubcat: UIView {
    let list = UI()
    
    @IBOutlet weak var dataview: UIView!
    
    
    
    
    
    var parentCat = String()
    
    
    var any:Any!
    var choosecategory:Selector!
    
    func showSubCate(ofcat:String,any:Any,chooseCategory:Selector){
        self.parentCat = ofcat
        self.any = any
        self.choosecategory = chooseCategory
        
        let cat = AllCategoriesAPIVC()
        cat.GetAllCategories()
        /*-----response---------*/
        var sectionCount = Int()
        menuCateobj.map{
            // Parent > Sub
            if ofcat == $0.name {
                sectionCount = $0.sub.count
            }}
        /*----------------------*/
        list.TableView(x: 0, y: 0, width: self.dataview.frame.size.width, height: self.dataview.frame.size.height, bkcolor: .white, border: 0, borderColor: .clear, separatorColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), Sections: sectionCount, SectionHeight: 40, SectionHEIGHT: {
        }, sectionView: {
            self.sectionview()
        }, rows: 0, Rows: {
            self.rows()
        }, editing: false, cellheight: 40, CellHeight: {
        }, Cellview: {
            self.cellview()
        }, onDelete: {
        }, view: self.dataview)
        list.table.reloadData()
    }
    
    
    func sectionview(){
        let sectionview = list.tableDelegate.sectionview
        let section = list.tableDelegate.section
        
        sectionview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let header = nibView(fileName: "catparentcell", ownerClass: self) as! catparentcell
        header.frame = sectionview.frame
        sectionview.addSubview(header)
        let obj = menuCateobj.filter{$0.name == parentCat}.first!
        
        
        header.Input(subid: obj.sub[section].id,
                     subCategory: obj.sub[section].name,
                     parentCategory: parentCat,
                     any: self.any as Any,
                     selectedcategory: self.choosecategory,
                     isSelected: obj.sub[section].isSelected,
                     any2: self,
                     openChild: #selector(openChildofsub(_:)))
    }
    func rows(){
        let section = list.tableDelegate.section
        let delegate = list.tableDelegate
        let obj = menuCateobj.filter{$0.name == parentCat}.first!
        if obj.sub[section].isSelected {
            delegate.numberOFrows = obj.sub[section].sub.count
        }
        else{
            delegate.numberOFrows = 0
        }
    }
    func cellview() {
        let cell = list.tableDelegate.cell
        let section = list.tableDelegate.section
        let index = list.tableDelegate.index
        
        let view = nibView(fileName: "catsubcell", ownerClass: self) as! catsubcell
        view.frame = CGRect(x: 0, y: 0, width: list.table.frame.size.width, height: 40)
        cell.addSubview(view)
        
        
        let obj = menuCateobj.filter{$0.name == parentCat}.first!
        view.Input(any: self.any as Any,
                   cateid: obj.sub[section].sub[index].id,
                   childCategory: obj.sub[section].sub[index].name,
                   chooseCategory: self.choosecategory)
        
    }
    
    
    
    
    
    //MARK:- BUTTONS
    @IBAction func cancel(_ sender: Any) {
        popsubcatview.isHidden = true
    }
    
    func disAppear(){
        popsubcatview.isHidden = true
    }
    
    @objc func openChildofsub(_ btn:UIButton){
        for i in 0..<menuCateobj.count {
            if menuCateobj[i].name == parentCat {
                for j in 0..<menuCateobj[i].sub.count{
                    if menuCateobj[i].sub[j].id == btn.tag{
                        if menuCateobj[i].sub[j].isSelected == false {
                            menuCateobj[i].sub[j].isSelected = true
                            btn.setImage(UIImage(named: "blackup"), for: .normal)
                        }else{
                            menuCateobj[i].sub[j].isSelected = false
                            btn.setImage(UIImage(named: "blackdown"), for: .normal)
                        }
                    }}
            }}
        ///////////////////
        list.table.reloadData()
        
        
        
    }
    
    
    
    
    
    
}
