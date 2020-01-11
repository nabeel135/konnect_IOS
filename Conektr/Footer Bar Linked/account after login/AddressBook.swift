//
//  AddressBookVC.swift
//  MyAccountScreens
//
//  Created by Waqas on 26/12/2019.
//  Copyright © 2019 Waqas. All rights reserved.
//

import UIKit





class AddressBookVC: UIViewController {


    let scroll = UI()
       
       let x = UIScreen.main.bounds.size.width
       let y = UIScreen.main.bounds.size.height
    
    /////////////////// TOP HEADER ///////////////////////////////
    let TopHeaderView = UI()
    let BottomTabBar = UI()
    let AddressBook = UI()
    
    
    //////////////  DEFAULT ADDRESSES LABEL /////////////////////
    let DefaultAddresses = UILabel()
        ////////////// ADDRESS BOOK LABELS /////////////////////
       let DefaultBillingAddress = UILabel()
           var DBName = UILabel()
           var DBConektr = UILabel()
           var DBCity = UILabel()
           var DBAddress2 = UILabel()
           var DBContry = UILabel()
           var DBNumber = UILabel()
       ////////////// DEFAULT SHIPPING ADDRESS /////////////////////
       let DefaultShippingAddress = UILabel()
           var DSName = UILabel()
           var DSConektr = UILabel()
           var DSCity = UILabel()
           var DSAddress = UILabel()
           var DSContry = UILabel()
           var DSNumber = UILabel()
    let AdditionalAddressEntries = UILabel()
            var ADEName = UILabel()
            var ADEaddress = UILabel()
            var ADECity = UILabel()
            var ADEAddress2 = UILabel()
            var ADEContry = UILabel()
            var ADENumber = UILabel()
    
    
    /////////////////   BUTTONS ///////////////////////////////////
    let ChangeBillingAddress1 = UIButton()
    let ChangeBillingAddress2 = UIButton()
    let BackButton = UIButton()
    let AddNewRecords = UI()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scroll.ScrollView(x: 0, y: 0, width: x, height: y-70, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y+50, view: view)
        
        BottomTabBar.View(x: 0, y: y-70, width: x, height: 70, bkcolor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), cornerRadius: 0, border: 0.1, borderColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: view)
        BottomTabBar.view.addSubview(BottomTabBar)
        CreatingHeaderView()
        SetupButtons()
        ///////////// DEFINING LABELS //////////////////////////////
         DefiningLabels()
        shippingAddress.append(sa())
        shippingAddress.append(sa())
        self.addressListUI()

    }
    
    func CreatingHeaderView()  {
        TopHeaderView.View(x: 0, y: 0, width: x, height: 60, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0.1, borderColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: TopHeaderView)
        scroll.scrollview.addSubview(TopHeaderView)
        
        //////////////// HEADER LABEL ///////////////////////////////
        AddressBook.Label(x: 25.0, y: 10, width: 150, height: 30, txt: "ADDRESS BOOK", fontsize: 16.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: AddressBook)
        scroll.scrollview.addSubview(AddressBook)
        
        
        
        
        
    }
    
    let defaultbillingaddress = custDetailModel?.addresses?.filter{$0.defaultBilling == true}.first
    let defaultshipingaddress = custDetailModel?.addresses?.filter{$0.defaultShipping == true}.first
    
    func DefiningLabels() {
        
        ////////////////// ADDRESS BOOK LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 30, width: 240, height: 80, lblText: "Address Book", lblTextSize: 24, TextColor: UIColor(displayP3Red: 113/255, green: 71/255, blue: 157/255, alpha: 1), Label: DefaultAddresses)
        ////////////////// DEfAULT BILLING ADDRESS LABEL ///////////////////////////
        SubTitle(xPos: 25.0, yPos: 100, width: 230.0, height: 25, lblText: "Default Billing Address", lblTextSize: 18.0, BoldSize: 12.0,TextColor: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1),Label: DefaultBillingAddress)
        ////////////////// DEfAULT BILLING ADDRESS USER NAME LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 130, width: 240, height: 25, lblText: ((defaultbillingaddress?.firstname ?? "") + " " + (defaultbillingaddress?.lastname ?? "")), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBName)
        ////////////////// DEfAULT BILLING ADDRESS CONEKTR LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 150, width: 240, height: 25, lblText: (defaultbillingaddress?.company! ?? "N/A"), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBConektr)
        ////////////////// DEfAULT BILLING ADDRESS CITY LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 170, width: 240, height: 25, lblText: (defaultbillingaddress?.city ?? "N/A"), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBCity)
        ////////////////// DEfAULT BILLING ADDRESS ADDRESS LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 190, width: 240, height: 25, lblText: "\(defaultbillingaddress?.city ?? ""), \(defaultbillingaddress?.region?.region ?? ""), \(defaultbillingaddress?.postcode ?? "")", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBAddress2)
        ////////////////// DEfAULT BILLING ADDRESS COUNTRY LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 210, width: 240, height: 25, lblText: "United Arab Emirates", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBContry)
        ////////////////// DEfAULT BILLING ADDRESS PHONE NUMBER LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 230, width: 240, height: 25, lblText: (defaultbillingaddress?.telephone ?? "N/A"), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBNumber)


        ////////////////// DEfAULT SHIPPING ADDRESS USER NAME LABEL ///////////////////////////
        SubTitle(xPos: 25.0, yPos: 300, width: 230.0, height: 20, lblText: "Default Shipping Address", lblTextSize: 18.0, BoldSize: 12.0,TextColor: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1),Label: DefaultShippingAddress)
        ////////////////// DEfAULT SHIPPING ADDRESS USER NAME LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 320, width: 240, height: 25, lblText: ((defaultshipingaddress?.firstname ?? "") + " " + (defaultshipingaddress?.lastname ?? "")), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSName)
        ////////////////// DEfAULT SHIPPING ADDRESS CONEKTR LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 340, width: 240, height: 25, lblText: (defaultshipingaddress?.company! ?? "N/A"), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSConektr)
        ////////////////// DEfAULT SHIPPING ADDRESS CITY LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 360, width: 240, height: 25, lblText: (defaultshipingaddress?.city ?? "N/A"), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSCity)
        ////////////////// DEfAULT SHIPPING ADDRESS ADDRESS LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 380, width: 240, height: 25, lblText: "\(defaultshipingaddress?.city ?? ""), \(defaultshipingaddress?.region?.region ?? ""), \(defaultshipingaddress?.postcode ?? "")", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSAddress)
        ////////////////// DEfAULT SHIPPING ADDRESS COUNTRY LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 400, width: 240, height: 25, lblText: "United Arab Emirates", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSContry)
        ////////////////// DEfAULT SHIPPING ADDRESS PHONE NUMBER LABEL ///////////////////////////
        Title(xPos: 25.0, yPos: 420, width: 240, height: 25, lblText: (defaultshipingaddress?.telephone ?? "N/A"), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSNumber)
        
        
        
        
        
        ////////////////// ADDITIONAL ADDRESS ENTRIES LABELS ///////////////////////////
        Title(xPos: 25.0, yPos: 480, width: 330, height: 80, lblText: "Additional Address Entries", lblTextSize: 24, TextColor: UIColor(displayP3Red: 113/255, green: 71/255, blue: 157/255, alpha: 1), Label: AdditionalAddressEntries)
       
        
    }
    
    
    
    
    /////////////////////     CREATE BUTTONS AND SET ON SCROLL VIEW //////////////////
    func SetupButtons() {
           buttons(xPos: 25.0, yPos: 270, width: 178, height: 20, BtnText: "Change Billing Address",btnSize: 16, button: ChangeBillingAddress1)

        buttons(xPos: 25.0, yPos: 460.0, width: 180, height: 20, BtnText: "Change Shipping Address",btnSize: 16, button: ChangeBillingAddress2)

                scroll.scrollview.addSubview(AddNewRecords)
        AddTargetsOfButton()
    }
    
    ///////////////////////  DEFINING TARGETS OF BUTTONS //////////////////////
    
    func AddTargetsOfButton() {
        ChangeBillingAddress1.addTarget(self, action: #selector(ChangeBillingAddress1Target(_:)) , for: .touchUpInside)
        ChangeBillingAddress2.addTarget(self, action: #selector(ChangeBillingAddress2Target(_:)) , for: .touchUpInside)
        BackButton.addTarget(self, action: #selector(BacKTarget(_:)) , for: .touchUpInside)
    }
    
    
    
    
    
    ////// dynamic address list
    ///////////////// ADDITIONAL ADDRESS ENTRIES
    var addlist:[UI] = []
    var EditAddress:[UI] = []
    var DeleteAddress:[UI] = []
    
    func addressListUI() {
        for obj in addlist {
            obj.view.removeFromSuperview()
            obj.label.removeFromSuperview()
        }
        for obj in EditAddress {obj.button.removeFromSuperview()}
        for obj in DeleteAddress {obj.button.removeFromSuperview()}
        addlist.removeAll()
        EditAddress.removeAll()
        DeleteAddress.removeAll()
        
        var top:CGFloat = AdditionalAddressEntries.frame.maxY+10
        
        let addres = custDetailModel?.addresses
        
        for obj1 in addres ?? []
        {
            addlist.append(UI())
            EditAddress.append(UI())
            DeleteAddress.append(UI())
            
            addlist[addlist.count-1].View(x: 10, y: top, width: scroll.scrollview.frame.size.width-20, height: 400, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 5, border: 0, borderColor: .clear, view: scroll.scrollview)
            
            addlist[addlist.count-1].Label(x: 10, y: 10, width: addlist[addlist.count-1].view.frame.size.width-20, height: 270, txt: "\((obj1.firstname ?? "") + " " + (obj1.lastname ?? ""))\n\n\(obj1.company ?? "N/A")\n\n\(obj1.city ?? "N/A")\n\n\(obj1.city ?? "N/A"), \(obj1.region?.region ?? ""), \(obj1.postcode ?? "")\n\nUnited Arab Emirates\n\n\(obj1.telephone ?? "N/A")", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .white, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: addlist[addlist.count-1].view)
            
            EditAddress[EditAddress.count-1].Button(x: 10, y: addlist[addlist.count-1].label.frame.maxY, width: 150, height: 40, title: "Edit Address", fontsize: 14, any: self, function: #selector(EditAddressTarget(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: .blue, view: addlist[addlist.count-1].view)
            EditAddress[EditAddress.count-1].button.tag = obj1.id!
            
            DeleteAddress[DeleteAddress.count-1].Button(x: addlist[addlist.count-1].view.frame.size.width-160, y: addlist[addlist.count-1].label.frame.maxY, width: 150, height: 40, title: "Delete Address", fontsize: 14, any: self, function: #selector(DeleteAddressTarget(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: .blue, view: addlist[addlist.count-1].view)
            DeleteAddress[DeleteAddress.count-1].button.tag = obj1.id!
            
            addlist[addlist.count-1].view.frame.size.height = DeleteAddress[DeleteAddress.count-1].button.frame.maxY+10
            top = addlist[addlist.count-1].view.frame.maxY+10
        }
        
        
        
        
        
//        for obj in shippingAddress {
//            addlist.append(UI())
//            EditAddress.append(UI())
//            DeleteAddress.append(UI())
//
//            addlist[addlist.count-1].View(x: 10, y: top, width: scroll.scrollview.frame.size.width-20, height: 400, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 5, border: 0, borderColor: .clear, view: scroll.scrollview)
//            addlist[addlist.count-1].Label(x: 10, y: 10, width: addlist[addlist.count-1].view.frame.size.width-20, height: 250, txt: "\(obj.l1)\n\n\(obj.l2)\n\n\(obj.l3)\n\n\(obj.l4)\n\n\(obj.l5)", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .white, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: addlist[addlist.count-1].view)
//
//            EditAddress[EditAddress.count-1].Button(x: 10, y: addlist[addlist.count-1].label.frame.maxY, width: 150, height: 40, title: "Edit Address", any: self, function: #selector(EditAddressTarget(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: .blue, view: addlist[addlist.count-1].view)
//            EditAddress[EditAddress.count-1].button.tag = obj.id
//
//            DeleteAddress[DeleteAddress.count-1].Button(x: addlist[addlist.count-1].view.frame.size.width-160, y: addlist[addlist.count-1].label.frame.maxY, width: 150, height: 40, title: "Delete Address", any: self, function: #selector(DeleteAddressTarget(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: .blue, view: addlist[addlist.count-1].view)
//            DeleteAddress[DeleteAddress.count-1].button.tag = obj.id
//
//            addlist[addlist.count-1].view.frame.size.height = DeleteAddress[DeleteAddress.count-1].button.frame.maxY+10
//            top = addlist[addlist.count-1].view.frame.maxY+10
//
//
//        }
        
        AddNewRecords.Button(x: 25.0, y: top, width: x-50, height: 50, title: "Add New Record", fontsize: 14, any: self, function: #selector(AddNewTarget(_:)), cornerRadius: 0.0, bordercolor: UIColor.clear, bkcolor: UIColor.gray, txtcolor: UIColor.white, view: scroll.scrollview)

        
        buttons(xPos: 25.0, yPos: top+70, width: x-50, height: 20, BtnText: "Back",btnSize: 16, button: BackButton)
        

        scroll.scrollview.contentSize.height = top+200
        
    }
    
    
      
    ////////////////// SUB HEADING LABEL ///////////////////////////
     
     func SubTitle(xPos:CGFloat,yPos:CGFloat,width:CGFloat,height:CGFloat,lblText:String,lblTextSize:CGFloat,BoldSize:CGFloat,TextColor:UIColor,Label:UILabel) {
         
            Label.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
            Label.text = lblText
        
         Label.font = UIFont.boldSystemFont(ofSize: BoldSize)
            Label.font = UIFont(name:"HelveticaNeue-Bold", size: lblTextSize)
         Label.textColor = TextColor
         //UIColor(displayP3Red: 113, green: 71, blue: 157, alpha: 1)
            
        scroll.scrollview.addSubview(Label)
        }
      ////////////////// TITLE LABEL ///////////////////////////
     func Title(xPos:CGFloat,yPos:CGFloat,width:CGFloat,height:CGFloat,lblText:String,lblTextSize:CGFloat,TextColor:UIColor,Label:UILabel) {
      
         Label.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
         Label.text = lblText
      //Label.font = UIFont.boldSystemFont(ofSize: BoldSize)
         Label.font = UIFont(name:"HelveticaNeue-Bold", size: lblTextSize)
      Label.textColor = TextColor
      //UIColor(displayP3Red: 113, green: 71, blue: 157, alpha: 1)
         
        scroll.scrollview.addSubview(Label)
     }
     //////////////// Buttons //////////////////////////////////
     func buttons(xPos:CGFloat,yPos:CGFloat,width:CGFloat,height:CGFloat,BtnText:String,btnSize:CGFloat,button:UIButton) {
         
         button.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
         button.setTitle(BtnText, for: .normal)
         button.setTitleColor(UIColor(displayP3Red: 70/255, green: 105/255, blue: 150/255, alpha: 1), for: [])
         button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: btnSize)
        scroll.scrollview.addSubview(button)
         
     }

    
    
    
    
    // MARK:- Buttons
    @objc func ChangeBillingAddress1Target(_ btn: UIButton){
        print("ChangeBillingAddress1Target")
    }
    @objc func ChangeBillingAddress2Target(_ btn: UIButton){
        print("ChangeBillingAddress2Target")
    }
    @objc func EditAddressTarget(_ btn: UIButton){
        print("EditAddressTarget")
    }
    @objc func DeleteAddressTarget(_ btn: UIButton){
        print("DeleteAddressTarget")
    }
    @objc func BacKTarget(_ btn: UIButton){
        print("BacKTarget")
    }
    @objc func AddNewTarget(_ btn: UIButton){
        print("AddNewTarget")
    }
    
    
    
}












































 





