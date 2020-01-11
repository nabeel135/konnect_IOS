//
//  ViewController.swift
//  Konnect
//
//  Created by Mr. Nabeel on 12/8/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit
import AFNetworking


class Dashboard: UIViewController {
    //comm
    
    //testing
    
    /*---------------------------------------------------------------*/
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// DISTRIBUTOR BUTTON
    //////////////////////////////////////////////
    @objc func distributorButton(_ btn:UIButton){
        Distributor.create(view: bodyfor.distributor.scrollview)
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PROMOTION BUTTON
    //////////////////////////////////////////////
    @objc func promotionOfferButton(_ btn:UIButton){
        promotion.create(login: true, view: bodyfor.promotion.scrollview)
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// SPECIFIC CATEGORIE BUTTON
    //////////////////////////////////////////////
    @objc func SpecificCategorieButton(_ btn:UIButton){
        print("tag: \(btn.tag)")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// ALL CATEGORIES BUTTON
    //////////////////////////////////////////////
    @objc func AllCategoriesButton(_ btn:UIButton){
        AllCategories.Create(images: categoriesStaticimages as! [UIImage], titles:        categoriesStaticName, view: bodyfor.AllCategories.scrollview)
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// SPECIFIC BRAND BUTTON
    //////////////////////////////////////////////
    @objc func specificBrandButton(_ btn:UIButton){
        print("brands \(btn.tag)")
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// BUTTON  ALL BRANDS
    //////////////////////////////////////////////
//    @objc func ShowAllBrandsButton(_ btn:UIButton){
//        allBrands.Create(images: brandsimg as! [UIImage], view: bodyfor.AllBrands.scrollview)
//    }
    
            @objc func ShowAllBrandsButton(_ btn:UIButton){
    //        allBrands.Create(images: brandsimg as! [UIImage], view: bodyfor.AllBrands.scrollview)
            let imgUrls:[String] = allbrandobj.map {$0.imgurl}
            let images:[UIImage] = allbrandobj.map {$0.image}
            
            allBrands.Create(images: images, view: bodyfor.AllBrands.scrollview, imgUrl: imgUrls)
            
        }
    
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PROUCT ADD TO CART BUTTON
    //////////////////////////////////////////////
    @objc func AddAllCheckedProduct(){
        
//        let items = productobj.filter{$0.isSelected == true}
//        if(items.count == 0)
//        {
//            AlertHelper.showErrorAlert(WithTitle: "Alert", Message: "No Product Selected", Sender: self)
//            return
//        }
//        else{
//        print("check added")
//        let vc = AddtoCartAPIVC()
//            let ItemtoAdd = productobj.filter{$0.isSelected == true}.first
//            var item = CartItem()
//            item.sku = ItemtoAdd?.sku
//            item.quoteID =  UserDefaults.standard.string(forKey: "quote_id")
//            item.qty = ItemtoAdd?.quantity
//            vc.item = item
//            vc.ItemtoAdd = productobj.filter{$0.isSelected == true}
//        vc.AddItemToCart()
//        }
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PRODUCT BUTTON
    //////////////////////////////////////////////
    @objc func openProductpageButton(_ tap:UITapGestureRecognizer){
        UIView.animate(withDuration: 0.1, animations: {
            tap.view?.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            tap.view?.layer.shadowOffset = .zero
            tap.view?.layer.shadowRadius = 1
            tap.view?.layer.shadowOpacity = 0.8
        }) { (true) in
            
            
            for i in 0..<productobj.count {
                if tap.view!.tag == productobj[i].id {
                    productdetail.isSelected = productobj[i].isSelected
                    productdetail.distributorID = productobj[i].distributorID
                    productdetail.distributorName = productobj[i].distributorName
                    productdetail.id = productobj[i].id
                    productdetail.imag = self.pimag[i].imag.image ?? UIImage()
                    productdetail.imagUrl = productobj[i].imagUrl
                    productdetail.title = productobj[i].title
                    productdetail.sku = productobj[i].sku
                    productdetail.typeId = productobj[i].typeId
                    productdetail.price = productobj[i].price
                    productdetail.discount = productobj[i].discount
                    productdetail.quantity = productobj[i].quantity
                    productdetail.description = productobj[i].description
                    productdetail.config = productobj[i].config
                    productdetail.variant = productobj[i].variant
                    productdetail.pricing = productobj[i].pricing
                    
                    
                    if productdetail.typeId == "configurable" {
                                            let prodetailop = ProductOptionAPIVC()
                                            prodetailop.GetProductOptions(sku: productdetail.sku)
                                        }
                    //                    let op = pricingoption.filter{$0.value == obj.pricing}
                    //                    let op1 = variantoption.filter{$0.value == obj.variant}
                    //                    let op2 = productconfigoption.filter{$0.value == obj.config}
                    //                    _ProductConfig = op2.count > 0 ? op2[0].label! : "N/A"
                    //                    _Varient = op1.count > 0 ? op1[0].label! : "N/A"
                    //                    _Pricing = op.count > 0 ? op[0].label! : "N/A"
                }
            }
            product.create(updateQuote: false, view: bodyfor.product.scrollview)
            tap.view?.layer.shadowOpacity = 0
        }
       }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PRODUCT FAVOURITE BUTTON
    //////////////////////////////////////////////
    @objc func productRadioHeartButton(_ btn:UIButton){
        if btn.currentBackgroundImage == UIImage(named: "heartfalse") {
            btn.setBackgroundImage(UIImage(named: "hearttrue")!, for: .normal)
            for obj in pbarbtn {
                if obj.clickableimg.tag == btn.tag {
                obj.clickableimg.setBackgroundImage(UIImage(named: "barfalse")!, for: .normal)
                }
            }
        }
        else{
            btn.setBackgroundImage(UIImage(named: "heartfalse")!, for: .normal)
            
        }
    }
    
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PRODUCT BAR BUTTON
    //////////////////////////////////////////////
    let comparepop = UI()
    @objc func productRadioBarButton(_ btn:UIButton){
        btn.setBackgroundImage(UIImage(named: "bartrue")!, for: .normal)
        time.delay(milliSec: 200) {
            btn.setBackgroundImage(UIImage(named: "barfalse")!, for: .normal)
            self.comparepop.View(x: -x, y: 40, width: x, height: 80, bkcolor: #colorLiteral(red: 0.7773207382, green: 0.8862745166, blue: 0.741358187, alpha: 1), cornerRadius: 5, border: 0, borderColor: .clear, view: self.view)
            self.comparepop.clickableimage(x: x-30, y: 0, width: 30, height: 30, image: #imageLiteral(resourceName: "x"), cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(self.hidecomaparepop(_:)), any: self, view: self.comparepop.view)
            self.comparepop.Image(x: 10, y: 25, width: 30, height: 30, mode: .scaleToFill, src: UIImage(named: "selected")!, view: self.comparepop.view)
            self.comparepop.Label(x: 40,y: 20, width: 150, height: 40, txt: "Product added to", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), view: self.comparepop.view)
            self.comparepop.Button(x: self.comparepop.label.frame.maxX, y: 20, width: 150, height: 40, title: "Comparison list", fontsize: 14, any: self, function: #selector(self.comparisonBUTTON(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: .blue, view: self.comparepop.view)
            self.comparepop.button.tag = btn.tag
            self.view.bringSubviewToFront(self.comparepop.view)
            UIView.animate(withDuration: 0.2) {
                self.comparepop.view.frame.origin.x = 0
            }
        }
        // copy to comparison list
        let obj = productobj.filter{$0.id == btn.tag}.first!
        var add = true
        for cp in comapareproductobj {
            if cp.id == btn.tag {add = false}}
        
        if add {
            let o = ps()
            o.id = obj.id
            o.title = obj.title
            o.price = obj.price
            o.sku = obj.sku
            o.description = obj.description
            comapareproductobj.append(o)
        }
    }
    
    @objc func hidecomaparepop(_ btn:UIButton){
        UIView.animate(withDuration: 0.2) {
            self.comparepop.view.frame.origin.x = -x
        }
    }
    
    @objc func comparisonBUTTON(_ productid:UIButton){
        
        // hide pop
        self.hidecomaparepop(UIButton())
        
        // apper comparison list
        addchildview(parent: self, child: compareproductVC(), view: bodyfor.compare.scrollview)
        bodyfor.compare.scrollview.isHidden = false
        
        
    }
    
    
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PRODUCT SHOPPING BUTTON
    //////////////////////////////////////////////
    @objc func productShoppingButton(_ btn:UIButton){
        print("shopping checked \(btn.tag)")
        self.cartpopUI(id: btn.tag)
        self.addtoCart(id: btn.tag)
        
    }
    
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// PRODUCT CHECKBOX  BUTTON
    //////////////////////////////////////////////
    @objc func productCheckBox(_ btn:UIButton){
        var count = 0
        if btn.currentBackgroundImage == UIImage(named: "checkfalse") {
            btn.setBackgroundImage(UIImage(named: "checktrue")!, for: .normal)
            for i in 0..<pview.count {
                if pview[i].view.tag == btn.tag {
                    productobj[i].isSelected = true
                    pselected[i].imag.isHidden = false
                    pview[i].view.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    pview[i].view.layer.shadowOffset = .zero
                    pview[i].view.layer.shadowRadius = 2
                    pview[i].view.layer.shadowOpacity = 1
                }
                if productobj[i].isSelected == true {count+=1}
            }}
        else{
            btn.setBackgroundImage(UIImage(named: "checkfalse")!, for: .normal)
            for i in 0..<pview.count {
                if pview[i].view.tag == btn.tag {
                    productobj[i].isSelected = false
                    pselected[i].imag.isHidden = true
                    pview[i].view.layer.shadowOpacity = 0
                    check[0].clickableimg.setBackgroundImage(UIImage(named: "checkfalse")!, for: .normal)
                    check[1].clickableimg.setBackgroundImage(UIImage(named: "checkfalse")!, for: .normal)
                }
                if productobj[i].isSelected == true {count+=1}
            }}
        check[0].button.setTitle("ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: \(count)", for: .normal)
        check[1].button.setTitle("ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: \(count)", for: .normal)
        
    }
    
    
    @objc func checkAllProductCheckBox() {
        var count = 0
        if check[0].clickableimg.currentBackgroundImage == UIImage(named: "checkfalse") {
            check[0].clickableimg.setBackgroundImage(UIImage(named: "checktrue")!, for: .normal)
            check[1].clickableimg.setBackgroundImage(UIImage(named: "checktrue")!, for: .normal)
            for i in 0..<productobj.count {
                count+=1
                productobj[i].isSelected = true
                pselected[i].imag.isHidden = false
                pcheck[i].clickableimg.setBackgroundImage(UIImage(named: "checktrue")!, for: .normal)
                pview[i].view.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                pview[i].view.layer.shadowOffset = .zero
                pview[i].view.layer.shadowRadius = 2
                pview[i].view.layer.shadowOpacity = 1}
        }
        else{
            check[0].clickableimg.setBackgroundImage(UIImage(named: "checkfalse")!, for: .normal)
            check[1].clickableimg.setBackgroundImage(UIImage(named: "checkfalse")!, for: .normal)
            for i in 0..<productobj.count {
                productobj[i].isSelected = false
                pselected[i].imag.isHidden = true
                pcheck[i].clickableimg.setBackgroundImage(UIImage(named: "checkfalse")!, for: .normal)
                pview[i].view.layer.shadowOpacity = 0}
        }
        check[0].button.setTitle("ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: \(count)", for: .normal)
        check[1].button.setTitle("ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: \(count)", for: .normal)
    }
    
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// SEARCH RESULT BUTTON
    //////////////////////////////////////////////
    @objc func SearchButton(_ btn:UIButton){
        
        
        let searchresultAPi = SearchProductAPIVC()
        let str = "%" + Searchpop.search.txtfield.text! + "%"
        searchresultAPi.GetSearchResult(str: str)
//        // footerBar
//        Searchpop.disAppear()
//
//        // footerBar linked pages
//        shoppingCart.disAppear()
//        Checkout.disAppear()
//        SignIn.disAppear()
//        createAccount.disAppear()
//        forgotpassword.disAppear()
        
        
//        searchResult.Create(view: bodyfor.SearchResult.scrollview)
//        search.create(login: UserDefaults.standard.bool(forKey: "IsLogined"), view: bodyfor.SearchResult.scrollview)
    }
    
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// SHOPPING CART BUTTON
    //////////////////////////////////////////////
    @objc func myCartViewCartButton(_ btn:UIButton){
               
        // footerBar
        myCartpop.disAppear()
        
        // footerBar linked pages
        search.disAppear() //searchResult.disAppear()
        Checkout.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        forgotpassword.disAppear()
        
        shoppingCart.Create(view: bodyfor.ShoppingCart.scrollview)
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// CHECKOUT BUTTON
    //////////////////////////////////////////////
    @objc func myCartCheckoutButton(_ btn:UIButton){
               
        // footerBar
        myCartpop.disAppear()
               
        // footerBar linked pages
        search.disAppear() //searchResult.disAppear()
        shoppingCart.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        forgotpassword.disAppear()
        
        
        Checkout.create(view: bodyfor.Checkout.scrollview)
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// SIGN IN BUTTON
    //////////////////////////////////////////////
    @objc func signInButton(_ btn:UIButton){
        
        if myAccountpop.email.txtfield.text != "" && myAccountpop.pass.txtfield.text != ""  {
            let controller = CustomerLoginAPIVC()
            controller.signinBUTTON(username: myAccountpop.email.txtfield.text!, password: myAccountpop.pass.txtfield.text!)
        }
        else{
            // footerBar
            myAccountpop.disAppear()
                   
            // footerBar linked pages
            search.disAppear() //searchResult.disAppear()
            shoppingCart.disAppear()
            Checkout.disAppear()
            bodyfor.CreateAccount.scrollview.isHidden = true
            forgotpassword.disAppear()
            
            SignIn.Create(view: bodyfor.Signin.scrollview)
        }
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// CREATE ACCOUNT BUTTON
    //////////////////////////////////////////////
    @objc func createAccountButton(_ btn:UIButton){
        // footerBar
        myAccountpop.disAppear()
        
        // footerBar linked pages
        search.disAppear()//searchResult.disAppear()
        shoppingCart.disAppear()
        Checkout.disAppear()
        SignIn.disAppear()
        forgotpassword.disAppear()
        
        
        bodyfor.CreateAccount.scrollview.isHidden = false
    }
    ///////////////////////////////////////////////
    //////////////////////////////////////////////
    /////////////// FORGOT PASSWORD BUTTON
    //////////////////////////////////////////////
    @objc func forgotpasswordButton(_ btn:UIButton){
        
        // footerBar
        myAccountpop.disAppear()
               
        // footerBar linked pages
        search.disAppear()//searchResult.disAppear()
        shoppingCart.disAppear()
        Checkout.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        
        forgotpassword.Create(view: bodyfor.forgotPassword.scrollview)
    }
    
    ////////////////////////////////////////////////
    ////////////////////////////////////////////////
    ////////// QUOTE BUTTON
    ////////////////////////////////////////////////
    @objc func quotebutton(_btn:UIButton){
        quotepop.create(quotebtn: quotebtn.clickableimg, inview: bodyscroll.scrollview)
        
    }
    /*---------------------------------------------------------------*/

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // for header + body
    let bodyscroll = UI()
    
    
    let logo = UI()
    let headerSlider = Slider()
    let link = [UI(),UI(),UI()]
    let quotebtn = UI()
    
    
    // categories
    let categoriesStaticName = ["All Categories","Beverages","Biscuits","Confectionery","Oil","Tobacco"]
    let categoriesStaticimages = [UIImage(named: "static_All Categories"),
                                  UIImage(named: "static_Beverages"),
                                  UIImage(named: "static_Biscuits"),
                                  UIImage(named: "static_Confectionery"),
                                  UIImage(named: "static_Oil"),
                                  UIImage(named: "static_Tobacco")]
    let categoriesStaticview = UI()
    let categoriesStatic = [UI(),UI(),UI(),UI(),UI(),UI()]
    let categoriesDynamic:[UI] = []
    // brand
    let brand = UI()
    var brandobj:[UI] = []
    /*--------*/
    let brandsimg = [UIImage(named: "banner1"),UIImage(named: "banner2"),
                     UIImage(named: "banner3"),UIImage(named: "banner4"),
                     UIImage(named: "pro"),UIImage(named: "banner2"),
                     UIImage(named: "banner3")]
    /*--------*/
    let poster = UI()
    // product
    let check = [UI(),UI()]
    let productLayout = UI()
    /*--------*/
    let Pimg = [UIImage(named: "pro"),
                UIImage(named: "pro"),
                UIImage(named: "pro"),
                UIImage(named: "pro"),
                UIImage(named: "pro")]
    let Ptitle = ["Coca-Cola Regular 24x330ML","title 2 of this product","title 3 of this product","title 4 of this product","title 5 of this product"]
    let Pprice = [1.0,2.0,3.0,4.0,5.0]
    let Pdiscount = [11.0,22.0,33.0,44.0,55.0]
    /*--------*/
    // for Footer
    let footer = UI()
    
    
    
    
    
    
    
    
    
    
    // MARK:-  VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
        
//        let options = ProductOptionAPIVC()
//        options.GetOptions()
        
        
        let conregion = CountryAndRegionVC()
        conregion.CountriesAndRegion()
        
        //////////////////////////////////////
        //////////////////////////////////////
        ////// Header +Body
        /////////////////////////////////////
        /////////////////////////////////////
        
        bodyscroll.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y, view: view)
        logo.Image(x: 10, y: 0, width: 150, height: 25, mode: .scaleToFill, src: UIImage(named: "logo")!, view: bodyscroll.scrollview)
        quotebtn.clickableimage(x: x-50, y: 0, width: 30, height: 40, image: UIImage(named: "quote")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(quotebutton(_btn:)), any: self, view: bodyscroll.scrollview)
        logo.View(x: 0, y: quotebtn.clickableimg.frame.maxY+10, width: x, height: 1, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: bodyscroll.scrollview)
        
        
        //DASHBOARD LINKED
        bodyfor.AllCategories.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.AllCategories.scrollview.isHidden = true
        
        bodyfor.AllBrands.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.AllBrands.scrollview.isHidden = true
        
        bodyfor.product.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.product.scrollview.isHidden = true
        bodyfor.distributor.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.distributor.scrollview.isHidden = true
        bodyfor.promotion.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.promotion.scrollview.isHidden = true
        bodyfor.compare.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.compare.scrollview.isHidden = true
        addchildview(parent: self, child: compareproductVC(), view: bodyfor.compare.scrollview)
        
        bodyfor.quotecart.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.quotecart.scrollview.isHidden = true
        addchildview(parent: self, child: storyboardView(boardName: "main", pageID: "quoteCartVC"), view: bodyfor.quotecart.scrollview)
        
        
        
        //FOOTER LINKED
        bodyfor.SearchResult.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.SearchResult.scrollview.isHidden = true
        
        bodyfor.ShoppingCart.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.ShoppingCart.scrollview.isHidden = true
        
        bodyfor.Checkout.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.Checkout.scrollview.isHidden = true
        
        bodyfor.Signin.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.Signin.scrollview.isHidden = true
        
        bodyfor.CreateAccount.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.CreateAccount.scrollview.isHidden = true
        addchildview(parent: self, child: storyboardView(boardName: "createAccountVC", pageID: "createAccountVC"), view: bodyfor.CreateAccount.scrollview)
        
        
        bodyfor.forgotPassword.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.forgotPassword.scrollview.isHidden = true
        
        bodyfor.myaccount.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.myaccount.scrollview.isHidden = true
        addchildview(parent: self, child: MYAccount(), view: bodyfor.myaccount.scrollview)
        
        bodyfor.Editaccount.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.Editaccount.scrollview.isHidden = true
        addchildview(parent: self, child: EditAccountInformationVC(), view: bodyfor.Editaccount.scrollview)
        
        bodyfor.addressbook.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.addressbook.scrollview.isHidden = true
        addchildview(parent: self, child: AddressBookVC(), view: bodyfor.addressbook.scrollview)
        
        bodyfor.Editaddress.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.Editaddress.scrollview.isHidden = true
        addchildview(parent: self, child: EditAddressVC(), view: bodyfor.Editaddress.scrollview)
        
        bodyfor.orderlist.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.orderlist.scrollview.isHidden = true
        addchildview(parent: self, child: orderlistVC(), view: bodyfor.orderlist.scrollview)
        bodyfor.shoplist.ScrollView(x: 0, y: 30, width: x, height: y-100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.shoplist.scrollview.isHidden = true
        addchildview(parent: self, child: shoplistVC(), view: bodyfor.shoplist.scrollview)
        
        
        
        
        bodyfor.pop.ScrollView(x: 0, y: 0, width: x, height: y-70, bkcolor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8), contentwidth: x, contentheight: y-70, view: view)
        bodyfor.pop.scrollview.isHidden = true
        
        
        
        
        
        
        
        ///////////////////////////////////////////////////// SLider UI Create
        headerSlider.ImageSlider(x: 0, y: quotebtn.clickableimg.frame.maxY+20, width: x, height: (x/100) * 50, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), controllerColor: #colorLiteral(red: 0.4425700903, green: 0.2794287205, blue: 0.6174944639, alpha: 1), controllerRadius: 10,images: ["banner0","banner1","banner2","banner3","banner4","banner5","banner6","banner7","banner8","banner9","banner10","banner11","banner12","banner13","banner14"],view: bodyscroll.scrollview)
        headerSlider.SecondSlider(x: 10, y: headerSlider.imageSlider.frame.maxY, width: x-20, height: 100, view: bodyscroll.scrollview)
        
        //////////////////////////// TOP LINK
        link[0].Label(x: 10, y: headerSlider.secondslider.frame.maxY+10, width: 150, height: 40, txt: "TOP LINKS", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: UIColor.clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: bodyscroll.scrollview)
        
        link[0].clickableimage(x: 10, y: link[0].label.frame.maxY, width: (x-30)/3, height: (x-30)/3 - 10, image: UIImage(named: "link1")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(distributorButton(_:)), any: self, view: bodyscroll.scrollview)
        link[1].clickableimage(x: (x/2)-(((x-30)/3)/2), y: link[0].label.frame.maxY, width: (x-30)/3, height: (x-30)/3 - 10, image: UIImage(named: "link2")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(promotionOfferButton(_:)), any: self, view: bodyscroll.scrollview)
        
        link[2].clickableimage(x: x-((x-30)/3)-10, y: link[0].label.frame.maxY, width: (x-30)/3, height: (x-30)/3 - 10, image: UIImage(named: "link3")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(myCartViewCartButton(_:)), any: self, view: bodyscroll.scrollview)
        
        
        /////////////////////////////// CATEGORIES
        categoriesStaticview.Label(x: 10, y: link[0].clickableimg.frame.maxY+10, width: 150, height: 40, txt: "CATEGORIES", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: bodyscroll.scrollview)
        categoriesStaticview.View(x: 10, y: categoriesStaticview.label.frame.maxY, width: x-20, height: 40, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: bodyscroll.scrollview)
        addCatageries(image: categoriesStaticimages as! [UIImage], title: categoriesStaticName)
        let ac = AllCategoriesAPIVC()
        ac.GetAllCategories()

        
        
        ///////////////////////////////////////////////// BRAND
        brand.Label(x: 10, y: categoriesStaticview.view.frame.maxY+10, width: 150, height: 40, txt: "BRANDS", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: bodyscroll.scrollview)
        brand.Button(x: x-10-150, y: categoriesStaticview.view.frame.maxY+15, width: 150, height: 30, title: "View All Brands", fontsize: 14, any: self, function: #selector(ShowAllBrandsButton(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4418308139, green: 0.2794203758, blue: 0.6323543191, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: bodyscroll.scrollview)
        brand.ScrollView(x: 10, y: brand.label.frame.maxY+10, width: x-20, height: ((x-20)/100)*25, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), contentwidth: x, contentheight: ((x-20)/100)*25, view: bodyscroll.scrollview)
        let ab = GetAllBrandsAPIVC()
        ab.GetAllBrands()
        
        //////////////////////////////////////////////// POSTER 1
        poster.clickableimage(x: 10, y: brand.scrollview.frame.maxY+10, width: x-20, height: (x/100)*15, image: UIImage(named: "poster")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(distributorButton(_:)), any: self, view: bodyscroll.scrollview)
        
        //////////////////////////////////////////////// CHECK 1 / 2
        check[0].clickableimage(x: 10, y: poster.clickableimg.frame.maxY+30, width: 20, height: 20, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(checkAllProductCheckBox), any: self, view: bodyscroll.scrollview)
        check[0].Label(x: check[0].clickableimg.frame.maxX+5, y: poster.clickableimg.frame.maxY+10, width: 80, height: 60, txt: "Check All", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: bodyscroll.scrollview)
        check[0].Button(x: check[0].label.frame.maxX, y: poster.clickableimg.frame.maxY+10, width: 230, height: 60, title: "ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: 0)", fontsize: 14, any: self, function: #selector(AddAllCheckedProduct), cornerRadius: 10, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4375680685, green: 0.2701445818, blue: 0.6246482134, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: bodyscroll.scrollview)
        
        check[0].button.titleLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
        
//        check[0].clickableimg.isHidden = true
//        check[0].label.isHidden = true
//        check[0].button.isHidden = true
        
        
        
        
        
        //////////////////////////////////////////////// FEATURED PRODUCTS
        productLayout.Label(x: 10, y: check[0].label.frame.maxY+10, width: 250, height: 40, txt: "FEATURED PRODUCTS", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: UIColor.clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: bodyscroll.scrollview)
        productLayout.View(x: 15, y: productLayout.label.frame.maxY, width: x-30, height: 200, bkcolor: .clear, cornerRadius: 0, border: 0, borderColor: .clear, view: bodyscroll.scrollview)
        
        let fp = FeatureProductApiVC()
        fp.FeaturesProduct()
        addProduct(isSignedin: UserDefaults.standard.bool(forKey: "IsLogined"))
        
        
        
        
        //////////////////////////////////////////////// CHECK 2 / 2
        check[1].clickableimage(x: 10, y: productLayout.view.frame.maxY+30, width: 20, height: 20, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(checkAllProductCheckBox), any: self, view: bodyscroll.scrollview)
        check[1].Label(x: check[1].clickableimg.frame.maxX+5, y: productLayout.view.frame.maxY+10, width: 80, height: 60, txt: "Check All", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: bodyscroll.scrollview)
        check[1].Button(x: check[1].label.frame.maxX, y: productLayout.view.frame.maxY+10, width: 230, height: 60, title: "ADD ALL PRODUCTS TO CART \n (TOTAL PRODUCT: 0)", fontsize: 14, any: self, function: #selector(AddAllCheckedProduct), cornerRadius: 10, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4375680685, green: 0.2701445818, blue: 0.6246482134, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: bodyscroll.scrollview)
        check[1].button.titleLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
        
//        check[1].clickableimg.isHidden = true
//        check[1].label.isHidden = true
//        check[1].button.isHidden = true
        
        //////////////////////////////////////
        //////////////////////////////////////
        ////// Footer
        /////////////////////////////////////
        /////////////////////////////////////
        bodyscroll.scrollview.contentSize.height = check[1].label.frame.maxY+10
//        y-bodyscroll.scrollview.frame.size.height
        footer.View(x: 0, y: bodyscroll.scrollview.frame.size.height+bodyscroll.scrollview.frame.minY, width: x, height: 50, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: view)
        FooterMenu.Create(any: self,
                          homeBtn: #selector(barhomeButton),
                          searchBtn: #selector(barsearchButton(_:)),
                          myCartBtn: #selector(barmyCartButton(_:)),
                          myAccountBtn: #selector(barmyAccountButton(_:)),
                          menuBtn: #selector(barmenuButton(_:)),
                          withinView: footer.view)
        FooterMenu.ButtonClicked(home: true, search: false, myCart: false, myAccount: false, menu: false)
        
        
        
        
        ////////// POP SCREEN
        bodyfor.checkoutpop.ScrollView(x: 0, y: 0, width: x, height: y, bkcolor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7), contentwidth: x, contentheight: y, view: view)
        bodyfor.checkoutpop.scrollview.isHidden = true
        bodyfor.checkoutnewAddress.ScrollView(x: 0, y: 0, width: x, height: y, bkcolor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7), contentwidth: x, contentheight: y, view: view)
        Checkout.newAddressUI()
        bodyfor.checkoutnewAddress.scrollview.isHidden = true
        bodyfor.cartpop.ScrollView(x: 0, y: 0, width: x, height: y, bkcolor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7), contentwidth: x, contentheight: y, view: view)
        bodyfor.cartpop.scrollview.isHidden = true
        bodyfor.shoplistcopypop.ScrollView(x: 0, y: 0, width: x, height: y, bkcolor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7), contentwidth: x, contentheight: y, view: view)
        bodyfor.shoplistcopypop.scrollview.isHidden = true
        
        bodyfor.shoplistmovepop.ScrollView(x: 0, y: 0, width: x, height: y, bkcolor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7), contentwidth: x, contentheight: y, view: view)
        bodyfor.shoplistmovepop.scrollview.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController = self
    }
    
    func RefreshProduct(){
        addProduct(isSignedin: UserDefaults.standard.bool(forKey: "IsLogined"))
    }
    
    //////////////////////////////// FOOTER BAR BUTTONS
    @objc func barhomeButton(){
        FooterMenu.ButtonClicked(home: true, search: false, myCart: false, myAccount: false, menu: false)
        time.delay(sec: 1) {
            self.addBrands()
            self.RefreshProduct()
            self.updateframe()
        }
        // dashboard liked pages
        AllCategories.disAppear()
        allBrands.disAppear()
        product.disAppear()
        Distributor.disAppear()
        promotion.disAppear()
        bodyfor.compare.scrollview.isHidden = true
        bodyfor.quotecart.scrollview.isHidden = true
        
        // footerBar
        Searchpop.disAppear()
        myCartpop.disAppear()
        myAccountpop.disAppear()
        menupop.disAppear()
        
        // footerBar linked pages
        search.disAppear()//searchResult.disAppear()
        shoppingCart.disAppear()
        Checkout.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        forgotpassword.disAppear()
        bodyfor.myaccount.scrollview.isHidden = true
        bodyfor.Editaccount.scrollview.isHidden = true
        bodyfor.Editaddress.scrollview.isHidden = true
        bodyfor.addressbook.scrollview.isHidden = true
        bodyfor.orderlist.scrollview.isHidden = true
        bodyfor.shoplist.scrollview.isHidden = true

    }
    @objc func barsearchButton(_ tap:UITapGestureRecognizer){
        FooterMenu.ButtonClicked(home: false, search: true, myCart: false, myAccount: false, menu: false)
        bodyfor.pop.scrollview.subviews.last?.removeFromSuperview()
        Searchpop.Create(any: self, searchBtn: #selector(SearchButton(_:)), withinview: bodyfor.pop.scrollview)
    }
//    @objc func barmyCartButton(_ tap:UITapGestureRecognizer){
//        FooterMenu.ButtonClicked(home: false, search: false, myCart: true, myAccount: false, menu: false)
//        myCartpop.Create(any: self, viewCartBtn: #selector(myCartViewCartButton(_:)), checkoutBtn: #selector(myCartCheckoutButton(_:)), view: bodyfor.pop.scrollview)
//    }
    
            // MARK: - DashBoard Changes By Mahad
        @objc func barmyCartButton(_ tap:UITapGestureRecognizer){
    //        FooterMenu.ButtonClicked(home: false, search: false, myCart: true, myAccount: false, menu: false)
    //        myCartpop.Create(any: self, viewCartBtn: #selector(myCartViewCartButton(_:)), checkoutBtn: #selector(myCartCheckoutButton(_:)), view: bodyfor.pop.scrollview)
            
            AlertHelper.showLoadingAlert(WithTitle: "Loading...", OnView: self.view, Animated: false)
            FooterMenu.ButtonClicked(home: false, search: false, myCart: true, myAccount: false, menu: false)
            bodyfor.pop.scrollview.subviews.last?.removeFromSuperview()
            let cartApi = GetCartAPIVC()
            cartApi.GetCart()
        }
    
    @objc func barmyAccountButton(_ tap:UITapGestureRecognizer){
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: true, menu: false)
        bodyfor.pop.scrollview.subviews.last?.removeFromSuperview()
        myAccountpop.Create(islogedin: UserDefaults.standard.bool(forKey: "IsLogined"), any: self, signinBtn: #selector(signInButton(_:)), createAccountBtn: #selector(createAccountButton(_:)), forgotpassBtn: #selector(forgotpasswordButton(_:)), withinview: bodyfor.pop.scrollview)
    }
    @objc func barmenuButton(_ tap:UITapGestureRecognizer){
        FooterMenu.ButtonClicked(home: false, search: false, myCart: false, myAccount: false, menu: true)
        
                if( bodyfor.pop.scrollview.subviews.last?.classForCoder == MenuPopView.classForCoder())
                         {
                          bodyfor.pop.scrollview.isHidden = true
                          bodyfor.pop.scrollview.subviews.last?.removeFromSuperview()
                       FooterMenu.menuButton(clicked: false)
                          }
               else
               {
               let myCustomView = Bundle.main.loadNibNamed("MenuPopView", owner: self, options: nil)![0] as? MenuPopView
                   myCustomView?.AddItemsInTableView()
               var frame = myCustomView?.frame
               frame?.origin.x = 0
               frame?.origin.y = y-70
               frame?.size.width = bodyfor.pop.scrollview.frame.size.width
               frame?.size.height = myCustomView!.mainview.frame.maxY
               myCustomView?.frame = frame!
               bodyfor.pop.scrollview.addSubview(myCustomView!)
               Searchpop.body.view.frame.origin.y = y-70
               FooterMenu.searchButton(clicked: false)
               myCartpop.body.scrollview.frame.origin.y = y-70
               FooterMenu.myCartButton(clicked: false)
               myAccountpop.body.view.frame.origin.y = y-70
               FooterMenu.myAccountButton(clicked: false)
               
               UIView.animate(withDuration: 0.2) {
                   bodyfor.pop.scrollview.isHidden = false
                   myCustomView!.frame.origin.y = y-70-myCustomView!.frame.size.height
               }
               }
//        menupop.Create(withinview: bodyfor.pop.scrollview)
    }
    
    
    var popoverController:UIPopoverPresentationController?

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //////////////////////////////////////////////////
    /////////////////////////////////////////////////
    ///////// CART POP
    let popview = UI()
    let l = UI()
    let popimag = UI()
    let poptitle = UI()
    let popdes = UI()
    let popcheckoutbtn = UI()
    let popviewcartbtn = UI()
    let popshopbtn = UI()
    
    func cartpopUI(id:Int){
//        bodyfor.cartpop.scrollview.isHidden = false
//
//        popview.View(x: 20, y: (y/2)-250, width: x-40, height: 500, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 5, border: 0, borderColor: .clear, view: bodyfor.cartpop.scrollview)
//        popview.clickableimage(x: popview.view.frame.maxX-15, y: popview.view.frame.minY-15, width: 30, height: 30, image: UIImage(named: "x")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(popcancle(_:)), any: self, view: bodyfor.cartpop.scrollview)
//        popview.clickableimg.tag = id
//        popview.Label(x: 0, y: 0, width: x-40, height: 40, txt: "Shopping Cart", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: popview.view)
//
//        l.Label(x: 0, y: popview.label.frame.maxY, width: x-40, height: 50, txt: "You have added following items to the cart:", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: popview.view)
//
//        popimag.Image(x: 40, y: l.label.frame.maxY, width: x-120, height: x-120, mode: .scaleAspectFit, src: productobj[id].imag.imag.image!, view: popview.view)
//
//        poptitle.Label(x: 0, y: popimag.imag.frame.maxY, width: x-40, height: 40, txt: productobj[id].title.label.text!, fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: popview.view)
//        let q = Double(productobj[id].check.txtfield.text!)!
//        let pt = productobj[id].price * q
//        popdes.Label(x: 0, y: poptitle.label.frame.maxY, width: x-40, height: 50, txt: "There are \(productobj[id].check.txtfield.text!) items in your cart. \nCart Subtotal: AED\(pt)", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: popview.view)
//        popcheckoutbtn.Button(x: (popview.view.frame.size.width/2)-100, y: popdes.label.frame.maxY, width: 200, height: 30, title: "goto Checkout", any: self, function: #selector(popCheckoutButton(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), view: popview.view)
//        popcheckoutbtn.button.tag = id
//        popviewcartbtn.Button(x: (popview.view.frame.size.width/2)-130, y: popcheckoutbtn.button.frame.maxY, width: 100, height: 40, title: "View Cart", any: self, function: #selector(popviewcartButton(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2705882353, blue: 0.6039215686, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: popview.view)
//        popviewcartbtn.button.tag = id
//        popshopbtn.Button(x: (popview.view.frame.size.width/2)-20, y: popcheckoutbtn.button.frame.maxY, width: 150, height: 40, title: "Continue Shopping", any: self, function: #selector(popcancle(_:)), cornerRadius: 5, bordercolor: .clear, bkcolor: #colorLiteral(red: 0.4274509804, green: 0.2705882353, blue: 0.6039215686, alpha: 1), txtcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), view: popview.view)
//        popview.view.frame.size.height = popshopbtn.button.frame.maxY + 10

    }
    
    
    @objc func popcancle(_ btn:UIButton){
        btn.setBackgroundImage(UIImage(named: "shoppingfalse")!, for: .normal)
        bodyfor.cartpop.scrollview.isHidden = true
    }
    @objc func popCheckoutButton(_ btn:UIButton){
        print("pop checkout")
        self.popcancle(btn)
        // footerBar
        myCartpop.disAppear()
               
        // footerBar linked pages
        search.disAppear()//searchResult.disAppear()
        shoppingCart.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        forgotpassword.disAppear()
        
        
        Checkout.create(view: bodyfor.Checkout.scrollview)
    }
    @objc func popviewcartButton(_ btn:UIButton){
        print("pop viewcart \(btn.tag)")
        self.popcancle(btn)
        // footerBar
        myCartpop.disAppear()
        
        // footerBar linked pages
        search.disAppear()//searchResult.disAppear()
        Checkout.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        forgotpassword.disAppear()
        
        shoppingCart.Create(view: bodyfor.ShoppingCart.scrollview)
    }
    
    
    
    
    
    
    func addtoCart(id:Int) {
        for obj in productobj {
            if obj.id == id {
                cartobj.append(cart())
                cartobj[cartobj.count-1].distributorID = obj.distributorID
                cartobj[cartobj.count-1].distributorName = obj.distributorName
                cartobj[cartobj.count-1].id = obj.id
                cartobj[cartobj.count-1].imag = obj.imag
                cartobj[cartobj.count-1].title = obj.title
                cartobj[cartobj.count-1].sku = obj.sku
                cartobj[cartobj.count-1].price = obj.price
                cartobj[cartobj.count-1].quantity = obj.quantity
                cartobj[cartobj.count-1].variant = obj.variant
                
            }
        }
        
    }
    
    
    
    
    
    
    
    
    //////////////////////////////////////////////////
    //////////////////////// Add Categories
    func addCatageries(image:[UIImage],title:[String]) {
        var index = 0
        var top:CGFloat = 0
        let x1 = (x-20)/3
        let xw = ((x-20)/100)*20
        
        categoriesStatic[0].clickableimage(x: ((x1/2)+(x1*CGFloat(index)))-(xw/2), y: top, width: xw, height: xw, image: UIImage(named: "static_All Categories")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(AllCategoriesButton(_:)), any: self, view: categoriesStaticview.view)
        categoriesStatic[0].clickableimg.tag = 0
        categoriesStaticview.view.frame.size.height = categoriesStatic[0].clickableimg.frame.maxY+40
        
        
        categoriesStatic[0].Button(x: x1*CGFloat(index), y: categoriesStatic[0].clickableimg.frame.maxY, width: x1, height: 40, title: "", fontsize: 14, any: self, function: #selector(AllCategoriesButton(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: categoriesStaticview.view)
        categoriesStatic[0].button.tag = 0
        index = 0
        
        for i in 1...5 {
            if i>2 {
                index = i%3
                top = categoriesStatic[i-3].clickableimg.frame.maxY+40
            }
            else{index = i}
            
            
            categoriesStatic[i].clickableimage(x: ((x1/2)+(x1*CGFloat(index)))-(xw/2), y: top, width: xw, height: xw, image: image[i], cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(SpecificCategorieButton(_:)), any: self, view: categoriesStaticview.view)
            categoriesStatic[i].clickableimg.tag = i
            categoriesStaticview.view.frame.size.height = categoriesStatic[i].clickableimg.frame.maxY+40
            
            
            categoriesStatic[i].Button(x: x1*CGFloat(index), y: categoriesStatic[i].clickableimg.frame.maxY, width: x1, height: 40, title: title[i], fontsize: 14, any: self, function: #selector(SpecificCategorieButton(_:)), cornerRadius: 0, bordercolor: .clear, bkcolor: .clear, txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: categoriesStaticview.view)
            categoriesStatic[i].button.tag = i
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////// ADD BRANDS
    func addBrands() {
        var bx:CGFloat = 0
        let bw = brand.scrollview.frame.size.width/100 * 45
        let bh = brand.scrollview.frame.size.height
        let margin = brand.scrollview.frame.size.width/100 * 10
        
        for obj in brandobj {obj.clickableimg.removeFromSuperview()}
        brandobj.removeAll()
        
        for obj in allbrandobj {
            brandobj.append(UI())
            brandobj[brandobj.count-1].clickableimage(x: bx, y: 0, width: bw, height: bh, image: obj.image, cornerRadius: 10, borderWidth: 2, borderColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), function: #selector(specificBrandButton(_:)), any: self,imgurl: obj.imgurl, view: brand.scrollview)
            brandobj[brandobj.count-1].clickableimg.tag = obj.id
            bx+=margin+bw
            brand.scrollview.contentSize.width = brandobj[brandobj.count-1].clickableimg.frame.maxX

        }
        if brandobj.count>2 {
            brandsAnimation(index: 0)
        }
        
    }
    func brandsAnimation(index:Int) {
        var i = 0
        if(index+2 > allbrandobj.count){
            self.brand.scrollview.contentOffset.x = self.brandobj[0].clickableimg.frame.minX
            i = 0
        }else{i = index+1}
        UIView.animate(withDuration: 0.2, delay: 1, options: [], animations: {
            if(i+1 < self.brandobj.count){
                self.brand.scrollview.contentOffset.x = self.brandobj[i].clickableimg.frame.minX
            }
        }) { (true) in
            time.delay(sec: 1) {
                if(i+1 > self.brandobj.count){
                    self.brand.scrollview.contentOffset.x = self.brandobj[0].clickableimg.frame.minX
                    self.brandsAnimation(index: 0)
                }
                else{self.brandsAnimation(index: i)}
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////// Add Featured Product
    var pview:[UI] = []
    var pimag:[UI] = []
    var pselected:[UI] = []
    var ptitle:[UI] = []
    var ppricelabel:[UI] = []
    var pprice:[UI] = []
    var pdiscount:[UI] = []
    var pfavbtn:[UI] = []
    var pbarbtn:[UI] = []
    var pcheck:[UI] = []
    var pinc:[UI] = []
    var pdec:[UI] = []
    var pquantity:[UI] = []
    var pstorebtn:[UI] = []
    
    func addProduct(isSignedin:Bool){
        for obj in pview {obj.view.removeFromSuperview()}
        for obj in pimag {obj.imag.removeFromSuperview()}
        for obj in pselected {obj.imag.removeFromSuperview()}
        for obj in ptitle {obj.label.removeFromSuperview()}
        for obj in ppricelabel {obj.label.removeFromSuperview()}
        for obj in pprice {obj.label.removeFromSuperview()}
        for obj in pdiscount {obj.autoSizelabel.removeFromSuperview()}
        for obj in pfavbtn {obj.clickableimg.removeFromSuperview()}
        for obj in pbarbtn {obj.clickableimg.removeFromSuperview()}
        for obj in pcheck {obj.clickableimg.removeFromSuperview()}
        for obj in pinc {obj.clickableimg.removeFromSuperview()}
        for obj in pdec {obj.clickableimg.removeFromSuperview()}
        for obj in pquantity {obj.txtfield.removeFromSuperview()}
        for obj in pstorebtn {obj.clickableimg.removeFromSuperview()}
        
        pview.removeAll()
        pimag.removeAll()
        pselected.removeAll()
        ptitle.removeAll()
        ppricelabel.removeAll()
        pprice.removeAll()
        pdiscount.removeAll()
        pfavbtn.removeAll()
        pbarbtn.removeAll()
        pcheck.removeAll()
        pinc.removeAll()
        pdec.removeAll()
        pquantity.removeAll()
        pstorebtn.removeAll()
        
        var index = 0
        var top:CGFloat = 0
        let x1 = (productLayout.view.frame.size.width-10)/2 + 10
        let xw = (productLayout.view.frame.size.width-10)/2
        
        for i in 0..<productobj.count {
            pview.append(UI())
            pimag.append(UI())
            pselected.append(UI())
            ptitle.append(UI())
            ppricelabel.append(UI())
            pprice.append(UI())
            pdiscount.append(UI())
            pfavbtn.append(UI())
            pbarbtn.append(UI())
            pcheck.append(UI())
            pinc.append(UI())
            pdec.append(UI())
            pquantity.append(UI())
            pstorebtn.append(UI())
            
            if i>1 {
                index = i%2
                top = pview[i-2].view.frame.maxY+10
            }
            else{index = i}
            
            
            //body
            pview[i].View(x: x1*CGFloat(index), y: top, width: xw, height: 100, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 10, border: 0, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), view: productLayout.view)
            pview[i].view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openProductpageButton(_:))))
            //image
            pimag[i].Image(x: 5, y: 15, width: pview[i].view.frame.size.width-10, height: pview[i].view.frame.size.width-30, mode: .scaleAspectFit, src: productobj[i].imag, view: pview[i].view,imageUrl: productobj[i].imagUrl)
            //Selected icon
            let xy = pview[i].view.frame.size.width/100 * 20
            pselected[i].Image(x: 10, y: 10, width: xy, height: xy, mode: .scaleToFill, src: UIImage(named: "selected")!, view: pview[i].view)
            pselected[i].imag.isHidden = true
            //Title
            ptitle[i].Label(x: 5, y: pimag[i].imag.frame.maxY, width: pview[i].view.frame.size.width-10, height: 50, txt: productobj[i].title, fontsize: 12, bold: false, cornerRadius: 0, border: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), alignment: .center, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: pview[i].view)
            //Price Label
            if isSignedin {
                ppricelabel[i].Label(x: 5, y: ptitle[i].label.frame.maxY, width: (pview[i].view.frame.size.width-10)/100 * 60, height: 40, txt: "AED\((productobj[i].price))", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), view: pview[i].view)
                pdiscount[i].AutoSizeLabel(x: ppricelabel[i].label.frame.maxX, y: ptitle[i].label.frame.maxY, height: 40, txt: "AED\(productobj[i].discount)", fontsize: 12, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), border: 0, borderColor: .clear, cornerRadius: 0, alignment: .center, view: pview[i].view)
                pdiscount[i].View(x: 0, y: 20, width: pdiscount[i].autoSizelabel.frame.size.width, height: 1, bkcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), cornerRadius: 0, border: 0, borderColor: .clear, view: pdiscount[i].autoSizelabel)
                
            }else{
                ppricelabel[i].Label(x: 5, y: ptitle[i].label.frame.maxY, width: pview[i].view.frame.size.width-10, height: 40, txt: "Login For Price", fontsize: 14, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .center, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: pview[i].view)
            }
            //Heart Radio button
            pfavbtn[i].clickableimage(x: pview[i].view.frame.size.width/2 - 32, y: ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "heartfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(productRadioHeartButton(_:)), any: self, view: pview[i].view)
            //Bar Radio button
            pbarbtn[i].clickableimage(x: pview[i].view.frame.size.width/2 + 2, y: ppricelabel[i].label.frame.maxY, width: 30, height: 30, image: UIImage(named: "barfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(productRadioBarButton(_:)), any: self, view: pview[i].view)
            //CheckBox
            var cx:CGFloat = 0
            if isSignedin {cx = (pview[i].view.frame.size.width/2) - 30}
            else{cx = pview[i].view.frame.size.width/2 - 37.5}
            pcheck[i].clickableimage(x: cx-30, y: pfavbtn[i].clickableimg.frame.maxY+10, width: 20, height: 20, image: UIImage(named: "checkfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(productCheckBox(_:)), any: self, view: pview[i].view)
            pquantity[i].Textfield(x: pcheck[i].clickableimg.frame.maxX+5, y: pfavbtn[i].clickableimg.frame.maxY+5, width: 40, height: 30, placeholder: "", border: 1, borderRadius: 0, txtAlign: .center, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .numberPad, textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), view: pview[i].view)
            pquantity[i].txtfield.text = "1"
            
//            pinc[i].clickableimage(x: pquantity[i].txtfield.frame.maxX+2, y: pfavbtn[i].clickableimg.frame.maxY+10, width: 25, height: 25, image: #imageLiteral(resourceName: "inc.png"), cornerRadius: 15, borderWidth: 0, borderColor: .clear, function: #selector(incquantitybtn(_:)), any: self, view: pview[i].view)
//            pdec[i].clickableimage(x: pinc[i].clickableimg.frame.maxX+2, y: pfavbtn[i].clickableimg.frame.maxY+10, width: 25, height: 25, image: #imageLiteral(resourceName: "dec"), cornerRadius: 15, borderWidth: 0, borderColor: .clear, function: #selector(decquantitybtn(_:)), any: self, view: pview[i].view)
            
            if isSignedin {
                pstorebtn[i].clickableimage(x: pquantity[i].txtfield.frame.maxX+5, y: pfavbtn[i].clickableimg.frame.maxY+5, width: 30, height: 30, image: UIImage(named: "shoppingfalse")!, cornerRadius: 0, borderWidth: 0, borderColor: .clear, function: #selector(productShoppingButton(_:)), any: self, view: pview[i].view)
            }
            
            pview[i].view.tag = productobj[i].id
            pimag[i].imag.tag = productobj[i].id
            pselected[i].imag.tag = productobj[i].id
            ptitle[i].label.tag = productobj[i].id
            ppricelabel[i].label.tag = productobj[i].id
            pdiscount[i].autoSizelabel.tag = productobj[i].id
            pfavbtn[i].clickableimg.tag = productobj[i].id
            pbarbtn[i].clickableimg.tag = productobj[i].id
            pcheck[i].clickableimg.tag = productobj[i].id
            pinc[i].clickableimg.tag = productobj[i].id
            pdec[i].clickableimg.tag = productobj[i].id
            pquantity[i].txtfield.tag = productobj[i].id
            pstorebtn[i].clickableimg.tag = productobj[i].id

            
            pview[i].view.frame.size.height = pquantity[i].txtfield.frame.maxY+20
            productLayout.view.frame.size.height = pview[i].view.frame.maxY
            check[1].clickableimg.frame.origin.y = productLayout.view.frame.maxY+30
            check[1].label.frame.origin.y = productLayout.view.frame.maxY+10
            check[1].button.frame.origin.y = productLayout.view.frame.maxY+10
            bodyscroll.scrollview.contentSize.height = check[1].label.frame.maxY+10
        }
    }
    @objc func incquantitybtn(_ btn:UIButton){
        for obj in pquantity {
            if obj.txtfield.tag == btn.tag {
                obj.txtfield.text=String((Int(obj.txtfield.text!) ?? 1)+1)
            }
        }
    }
    @objc func decquantitybtn(_ btn:UIButton){
        for obj in pquantity {
            if obj.txtfield.tag == btn.tag && Int(obj.txtfield.text!) ?? 1 > 1{
                obj.txtfield.text=String((Int(obj.txtfield.text!) ?? 1)-1)
            }        }
    }
    
    
    
    
   
    
    func updateframe() {
        check[1].clickableimg.frame.origin.y = productLayout.view.frame.maxY+30
        check[1].label.frame.origin.y = productLayout.view.frame.maxY+10
        check[1].button.frame.origin.y = productLayout.view.frame.maxY+10
        bodyscroll.scrollview.contentSize.height = check[1].label.frame.maxY+10
        
    }
    
    
    
    
    
    
}










































   /////////////////////////////////////
   /////////////////////////////////////
   //////  Slider
   /////////////////////////////////////
   /////////////////////////////////////

class Slider: UIView {
   
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
        defaultimg.Image(x: 0, y: 0, width: width, height: height-30, mode: .scaleToFill, src: UIImage(named: images[0])!, view: imageSlider)
        helperimg.Image(x: width, y: 0, width: width, height: height-30, mode: .scaleToFill, src: UIImage(named: images[0])!, view: imageSlider)
        
        // helper slider controller
        imageslidercontroller.frame = CGRect(x: 0, y: height-30, width: 5, height: 30)
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
        if images.count>1 {
            self.headerSlider(currentindex: 0, images: images, controllerColor: controllerColor)
        }
        
                
    }
    
    func headerSlider(currentindex:Int,images:[String],controllerColor:UIColor) {
        var i = currentindex+1
        if currentindex == (images.count-1) {i = 0}
        self.defaultimg.imag.image = UIImage(named: images[currentindex])
        self.helperimg.imag.image = UIImage(named: images[i])
        self.defaultimg.imag.frame.origin.x = 0
        self.helperimg.imag.frame.origin.x = self.imageSlider.frame.size.width
        
        UIView.animate(withDuration: 0.5, delay: 1.5, usingSpringWithDamping: 5, initialSpringVelocity: 01, options: [], animations: {
            self.defaultimg.imag.frame.origin.x = -self.imageSlider.frame.size.width
            self.helperimg.imag.frame.origin.x = 0
            
            for j in 0..<images.count {
                if j == i
                {self.imagesliderview[j].backgroundColor = controllerColor}
                else{self.imagesliderview[j].backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)}
            }
            
        }) { (true) in
            
            time.delay(sec: 3) {self.headerSlider(currentindex: i, images: images, controllerColor: controllerColor)}
        }
    }
    
    ///////////////////////////////////
    //////////////////////////////////
    ////// second slider
    ///////////////////////////////////
    ///////////////////////////////////
    let left = UI()
    let right = UI()
    let secondslider = UIView()
    var a:CGRect!,b:CGRect!
    func SecondSlider(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,view:UIView) {
        secondslider.frame = CGRect(x: x, y: y, width: width, height: height)
        view.addSubview(secondslider)
        
        left.Image(x: 0, y: 0, width: (UIScreen.main.bounds.size.width-50)/2, height: ((UIScreen.main.bounds.size.width-50)/2)/100 * 60, mode: .scaleToFill, src: UIImage(named: "sliderleft")!, view: secondslider)
        right.Image(x: width-(UIScreen.main.bounds.size.width-50)/2, y: 0, width: (UIScreen.main.bounds.size.width-50)/2, height: ((UIScreen.main.bounds.size.width-50)/2)/100 * 60, mode: .scaleToFill, src: UIImage(named: "sliderleft")!, view: secondslider)
        right.imag.loadGif(name: "dealgif")
        a = left.imag.frame
        b = right.imag.frame
        secondslider.frame.size.height = ((UIScreen.main.bounds.size.width-50)/2)/100 * 60
        animate()
    }
    func animate() {
        UIView.animate(withDuration: 0.2, delay: 1, options: [], animations: {
            if(self.left.imag.frame == self.a){
                self.left.imag.frame = self.b
                self.right.imag.frame = self.a
            }
            else{
                self.left.imag.frame = self.a
                self.right.imag.frame = self.b
            }
        }) { (true) in
            self.animate()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}






