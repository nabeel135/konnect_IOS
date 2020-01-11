        //
        //  ViewController.swift
        //  MyAccountScreens
        //
        //  Created by Waqas on 25/12/2019.
        //  Copyright © 2019 Waqas. All rights reserved.
        //

        import UIKit

        let yTotal = UIScreen.main.bounds.size.height

        class MYAccount: UIViewController {
            
            
            ////////////// MY ACCOUNT LABEL /////////////////////
            let MyAccountLabel = UILabel()
            /////////////// ACCOUNT INFORMATION LABELS ///////////////
            let AccountInformation = UILabel()
            let ContactInformation = UILabel()
            var CIName = UILabel()
            var Email = UILabel()
            let OrLable = UILabel()
            ////////////// ADDRESS BOOK LABELS /////////////////////
            let AddressBook = UILabel()
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
            ////////////// RECENT ORDERS /////////////////////
            let RecentOrder = UILabel()
            let Order = UILabel()
            let Date = UILabel()
            let ShipTo = UILabel()
            let OrderTotal = UILabel()
            let Status = UILabel()
            let Action = UILabel()
            ///////// SELECTED ORDER /////////////////////
            var OrderNo = UILabel()
            var SelectedDate = UILabel()
            var ShipToAdd = UILabel()
            var OrderTotalID = UILabel()
            var StatusValue = UILabel()
            
            /////////////////////// BUTTONS /////////////////////////////
            let EditBtn = UIButton()
            let ChangePasswordBtn = UIButton()
            let ManageAddressBtn = UIButton()
            let EditAddressBtn1 = UIButton()
            let EditAddressBtn2 = UIButton()
            let ViewAllBtn = UIButton()
            let ViewOrderBtn = UIButton()
            let ReorderBtn = UIButton()
            
            
            //////////////////////////////////////////////////  DEFINING SCROLLVIEW //////////////////////////////////////////////////
            let scrollView = UI()
            
            
            let scroll = UI()
            
            
            override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view.
                view.addSubview(scrollView)
                
                /////////////////// SCROLL VIEW /////////////////////////
                scrollView.ScrollView(x: 0, y: 0, width: x, height: y-70, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y, view: view)
                
                SetUpLabels()
                SetupButtons()
            }
            
            //    override func viewWillAppear(_ animated: Bool) {
            //
            //    }
            
            
            func SetUpLabels() {
                
                let defaultbillingaddress = custDetailModel?.addresses?.filter{$0.defaultBilling == true}.first
                let defaultshipingaddress = custDetailModel?.addresses?.filter{$0.defaultShipping == true}.first
                
                ///////////////// MY ACCOUNT LABEL /////////////////////////
                SubTitle(xPos: 25.0, yPos: 10.0, width: 130.0, height: 20, lblText: "MY ACCOUNT", lblTextSize: 18.0, BoldSize: 13.0,TextColor: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1),Label: MyAccountLabel)
                ////////////////// ACCOUNT INFORMATION LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 30, width: 240, height: 80, lblText: "Account Information", lblTextSize: 24, TextColor: UIColor(displayP3Red: 113/255, green: 71/255, blue: 157/255, alpha: 1), Label: AccountInformation)
                ////////////////// CONTACT INFORMATION LABEL ///////////////////////////
                SubTitle(xPos: 25.0, yPos: 90, width: 180.0, height: 20, lblText: "Contact Information", lblTextSize: 18.0, BoldSize: 13.0,TextColor: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1),Label: ContactInformation    )
                ////////////////// CONTACT INFORMATION NAME LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 120, width: 240, height: 20, lblText: ((custDetailModel?.firstname ?? "") + " " + (custDetailModel?.lastname ?? "")), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: CIName)
                ////////////////// CONTACT INFORMATION EMAIL LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 140, width: 240, height: 20, lblText: custDetailModel?.email ?? "N/A", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: Email)
                
                ////////////////// ADDRESS BOOK LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 170, width: 240, height: 80, lblText: "Address Book", lblTextSize: 24, TextColor: UIColor(displayP3Red: 113/255, green: 71/255, blue: 157/255, alpha: 1), Label: AddressBook)
                ////////////////// DEfAULT BILLING ADDRESS LABEL ///////////////////////////
                SubTitle(xPos: 25.0, yPos: 230, width: 230.0, height: 25, lblText: "Default Billing Address", lblTextSize: 18.0, BoldSize: 12.0,TextColor: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1),Label: DefaultBillingAddress)
                ////////////////// DEfAULT BILLING ADDRESS USER NAME LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 260, width: 240, height: 25, lblText: ((defaultbillingaddress?.firstname ?? "") + (defaultbillingaddress?.lastname ?? "")), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBName)
                ////////////////// DEfAULT BILLING ADDRESS CONEKTR LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 280, width: 240, height: 25, lblText: defaultbillingaddress?.company! ?? "N/A", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBConektr)
                ////////////////// DEfAULT BILLING ADDRESS CITY LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 300, width: 240, height: 25, lblText: defaultbillingaddress?.city ?? "N/A", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBCity)
                ////////////////// DEfAULT BILLING ADDRESS ADDRESS LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 320, width: 240, height: 25, lblText: "\(defaultbillingaddress?.city ?? ""), \(defaultbillingaddress?.region?.region ?? ""), \(defaultbillingaddress?.postcode ?? "")", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBAddress2)
                ////////////////// DEfAULT BILLING ADDRESS COUNTRY LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 340, width: 240, height: 25, lblText: "United Arab Emirates", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBContry)
                ////////////////// DEfAULT BILLING ADDRESS PHONE NUMBER LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 360, width: 240, height: 25, lblText: defaultbillingaddress?.telephone ?? "N/A", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DBNumber)
                
                
                ////////////////// DEfAULT SHIPPING ADDRESS USER NAME LABEL ///////////////////////////
                SubTitle(xPos: 25.0, yPos: 410, width: 230.0, height: 20, lblText: "Default Shipping Address", lblTextSize: 18.0, BoldSize: 12.0,TextColor: UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1),Label: DefaultShippingAddress)
                ////////////////// DEfAULT SHIPPING ADDRESS USER NAME LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 440, width: 240, height: 25, lblText: ((defaultshipingaddress?.firstname ?? "") + " " + (defaultshipingaddress?.lastname ?? "")), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSName)
                ////////////////// DEfAULT SHIPPING ADDRESS CONEKTR LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 460, width: 240, height: 25, lblText: (defaultshipingaddress?.company! ?? "N/A"), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSConektr)
                ////////////////// DEfAULT SHIPPING ADDRESS CITY LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 480, width: 240, height: 25, lblText: (defaultshipingaddress?.city ?? "N/A"), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSCity)
                ////////////////// DEfAULT SHIPPING ADDRESS ADDRESS LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 500, width: 240, height: 25, lblText: "\(defaultshipingaddress?.city ?? ""), \(defaultshipingaddress?.region?.region ?? ""), \(defaultshipingaddress?.postcode ?? "")", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSAddress)
                ////////////////// DEfAULT SHIPPING ADDRESS COUNTRY LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 520, width: 240, height: 25, lblText: "United Arab Emirates", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSContry)
                ////////////////// DEfAULT SHIPPING ADDRESS PHONE NUMBER LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 540, width: 240, height: 25, lblText: (defaultbillingaddress?.telephone ?? "N/A"), lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: DSNumber)
                
                
                ////////////////// ACCOUNT INFORMATION LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 600, width: 240, height: 80, lblText: "Recent Orders", lblTextSize: 24, TextColor: UIColor(displayP3Red: 113/255, green: 71/255, blue: 157/255, alpha: 1), Label: RecentOrder)
                ////////////////// DEfAULT SHIPPING ADDRESS USER NAME LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 680, width: 240, height: 20, lblText: "Order #:", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: Order)
                ////////////////// DEfAULT SHIPPING ADDRESS CONEKTR LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 700, width: 240, height: 20, lblText: "Date:", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: Date)
                ////////////////// DEfAULT SHIPPING ADDRESS CITY LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 720, width: 240, height: 20, lblText: "Ship To:", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: ShipTo)
                ////////////////// DEfAULT SHIPPING ADDRESS ADDRESS LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 740, width: 240, height: 20, lblText: "Order Total:", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: OrderTotal)
                ////////////////// DEfAULT SHIPPING ADDRESS COUNTRY LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 760, width: 240, height: 20, lblText: "Status:", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: Status)
                ////////////////// DEfAULT SHIPPING ADDRESS PHONE NUMBER LABEL ///////////////////////////
                Title(xPos: 25.0, yPos: 780, width: 240, height: 20, lblText: "Action:", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: Action)
                
                
                ////////////////// EDITABLE RECENT ORDER LABELS //////////////////////////
                ////////////////// RECENT ORDER ID LABEL ///////////////////////////
                Title(xPos: 90, yPos: 680, width: 240, height: 20, lblText: "000009133", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: OrderNo)
                ////////////////// RECENT ORDER DATE LABEL ///////////////////////////
                Title(xPos: 70, yPos: 700, width: 240, height: 20, lblText: "12/19/19", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: SelectedDate)
                ////////////////// RECENT ORDER SHIP TO LABEL ///////////////////////////
                Title(xPos: 90, yPos: 720, width: 240, height: 20, lblText: "Retailer2 Gati", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: ShipToAdd)
                ////////////////// RECENT ORDER TOTAL LABEL ///////////////////////////
                Title(xPos: 110, yPos: 740, width: 240, height: 20, lblText: "AED192.52", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: OrderTotalID)
                ////////////////// RECENT ORDER STATUS LABEL ///////////////////////////
                Title(xPos: 80, yPos: 760, width: 240, height: 20, lblText: "Canceled:", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: StatusValue)
                
                
                SetupButtons()
                AddTargetsOfButton()
            }
            
            ////////////////// SET BUTTON ON SCROLL VIEW //////////////////////////
            func SetupButtons() {
                buttons(xPos: 25.0, yPos: 160.0, width: 30, height: 20, BtnText: "Edit",btnSize: 16, button: EditBtn)
                
                Title(xPos: 60.0, yPos: 160.0, width: 20, height: 20, lblText: "or", lblTextSize: 14, TextColor: UIColor(displayP3Red: 1/255, green: 1/255, blue: 1/255, alpha: 0.7), Label: OrLable)
                
                buttons(xPos: 70.0, yPos: 160.0, width: 170, height: 20, BtnText: "Change Password",btnSize: 16, button: ChangePasswordBtn)
                
                buttons(xPos: 190.0, yPos: 202.0, width: 170, height: 20, BtnText: "Manage Addresses",btnSize: 16, button: ManageAddressBtn)
                
                buttons(xPos: 25.0, yPos: 385, width: 100, height: 20, BtnText: "Edit Address",btnSize: 16, button: EditAddressBtn1)
                
                buttons(xPos: 25.0, yPos: 565, width: 100, height: 20, BtnText: "Edit Address",btnSize: 16, button: EditAddressBtn2)
                
                buttons(xPos: 190, yPos: 635, width: 100, height: 20, BtnText: "View All",btnSize: 16, button: ViewAllBtn)
                
                buttons(xPos: 100, yPos: 780, width: 100, height: 20, BtnText: "View Order",btnSize: 16, button: ViewOrderBtn)
                
                buttons(xPos: 200, yPos: 780, width: 100, height: 20, BtnText: "Reorder",btnSize: 16, button: ReorderBtn)
                
            }
            
            
            
            
            func AddTargetsOfButton() {
                EditBtn.addTarget(self, action: #selector(EditButtonTarget(_:)) , for: .touchUpInside)
                ChangePasswordBtn.addTarget(self, action: #selector(ChangePasswordTarget(_:)) , for: .touchUpInside)
                ManageAddressBtn.addTarget(self, action: #selector(ManageAddressTarget(_:)) , for: .touchUpInside)
                EditAddressBtn1.addTarget(self, action: #selector(EditAddress1Target1(_:)) , for: .touchUpInside)
                EditAddressBtn2.addTarget(self, action: #selector(EditAddress1Target2(_:)) , for: .touchUpInside)
                ViewAllBtn.addTarget(self, action: #selector(ViewAllTarget(_:)) , for: .touchUpInside)
                ViewOrderBtn.addTarget(self, action: #selector(ViewOrderTarget(_:)) , for: .touchUpInside)
                ReorderBtn.addTarget(self, action: #selector(ReorderTarget(_:)) , for: .touchUpInside)
                
            }
            
            
            // MARK:- BUTTONS
            //////////////////////////////////  DEFINE BUTTONS TARGET OR METHODS ////////////////////////////////////////
            
            @objc func EditButtonTarget(_ sender: UIButton){
                bodyfor.myaccount.scrollview.isHidden = true
                bodyfor.Editaccount.scrollview.isHidden = false
                bodyfor.Editaddress.scrollview.isHidden = true
                bodyfor.addressbook.scrollview.isHidden = true
            }
            @objc func ChangePasswordTarget(_ sender: UIButton){
                bodyfor.myaccount.scrollview.isHidden = true
                bodyfor.Editaccount.scrollview.isHidden = false
                bodyfor.Editaddress.scrollview.isHidden = true
                bodyfor.addressbook.scrollview.isHidden = true
            }
            @objc func ManageAddressTarget(_ sender: UIButton){
                bodyfor.myaccount.scrollview.isHidden = true
                bodyfor.Editaccount.scrollview.isHidden = true
                bodyfor.Editaddress.scrollview.isHidden = true
                bodyfor.addressbook.scrollview.isHidden = false
                addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: AddressBookVC(), view: bodyfor.addressbook.scrollview)
            }
            @objc func EditAddress1Target1(_ sender: UIButton){
                bodyfor.myaccount.scrollview.isHidden = true
                bodyfor.Editaccount.scrollview.isHidden = true
                addchildview(parent: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!, child: EditAddressVC(), view: bodyfor.Editaddress.scrollview)
                bodyfor.Editaddress.scrollview.isHidden = false
                bodyfor.addressbook.scrollview.isHidden = true
            }
            @objc func EditAddress1Target2(_ sender: UIButton){
                bodyfor.myaccount.scrollview.isHidden = true
                bodyfor.Editaccount.scrollview.isHidden = true
                bodyfor.Editaddress.scrollview.isHidden = false
                bodyfor.addressbook.scrollview.isHidden = true
            }
            @objc func ViewAllTarget(_ sender: UIButton){
                print("ViewAllTarget")
            }
            @objc func ViewOrderTarget(_ sender: UIButton){
                print("ViewOrderTarget")
            }
            @objc func ReorderTarget(_ sender: UIButton){
                print("ReorderTarget")
            }
            
            
            
            
            // 70 , 105 , 150
            //UIColor(displayP3Red: 113, green: 71, blue: 157, alpha: 1)
            
        }










































        extension MYAccount{
            
            ////////////////// SUB HEADING LABEL ///////////////////////////
            
            func SubTitle(xPos:CGFloat,yPos:CGFloat,width:CGFloat,height:CGFloat,lblText:String,lblTextSize:CGFloat,BoldSize:CGFloat,TextColor:UIColor,Label:UILabel) {
                
                Label.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
                Label.text = lblText
                Label.font = UIFont.boldSystemFont(ofSize: BoldSize)
                Label.font = UIFont(name:"HelveticaNeue-Bold", size: lblTextSize)
                Label.textColor = TextColor
                //UIColor(displayP3Red: 113, green: 71, blue: 157, alpha: 1)
                
                scrollView.scrollview.addSubview(Label)
            }
            ////////////////// TITLE LABEL ///////////////////////////
            func Title(xPos:CGFloat,yPos:CGFloat,width:CGFloat,height:CGFloat,lblText:String,lblTextSize:CGFloat,TextColor:UIColor,Label:UILabel) {
                
                Label.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
                Label.text = lblText
                //Label.font = UIFont.boldSystemFont(ofSize: BoldSize)
                Label.font = UIFont(name:"HelveticaNeue-Bold", size: lblTextSize)
                Label.textColor = TextColor
                //UIColor(displayP3Red: 113, green: 71, blue: 157, alpha: 1)
                
                scrollView.scrollview.addSubview(Label)
            }
            //////////////// Buttons //////////////////////////////////
            func buttons(xPos:CGFloat,yPos:CGFloat,width:CGFloat,height:CGFloat,BtnText:String,btnSize:CGFloat,button:UIButton) {
                
                button.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
                button.setTitle(BtnText, for: .normal)
                button.setTitleColor(UIColor(displayP3Red: 70/255, green: 105/255, blue: 150/255, alpha: 1), for: [])
                button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: btnSize)
                scrollView.scrollview.addSubview(button)
                
            }
        }

