//
//  GetCartAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/28/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit

class GetCartAPIVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func GetCart() {
                
                let manager = NetworkingHelper.sharedNetworkManager
                manager.GetCartItems(withParameters: nil, successBlock: GetSucceeded, failureBlock: GetFailed)
            }
            
            func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
            {
                if responseObject == nil
                {
                    return
                }
                
                do{
                    let str = String(decoding: responseObject as! Data, as: UTF8.self)
                    let decoder = JSONDecoder()
                    let array = try decoder.decode(CartsModel.self, from: responseObject as! Data)
                    
                    let defaultAddressarray = array.customer?.addresses
                    shippingAddress.removeAll()
                    
                    customer = array.customer ?? Customer()
                    
                    for addres in defaultAddressarray ?? []
                    {
                        billingAddObj.append(addres)
                        var sa1:sa = sa()
                        sa1.l1 = (addres.firstname ?? "") + (addres.lastname ?? "")
                        sa1.l2 = addres.city ?? ""
                        sa1.l5 = addres.telephone ?? "N/A"
                        sa1.l3 = "\(addres.city ?? ""), \(addres.region?.region ?? ""), \(addres.postcode ?? "")"
                        sa1.l4 = countriesandregionObj?.filter{$0.id == addres.countryID}.first?.fullNameEnglish ?? "N/A"
                        sa1.id = addres.id!
                        if(addres.defaultShipping == true && addres.defaultBilling == true)
                        {
                            sa1.isselected = true
                            
                        }
                        shippingAddress.append(sa1)
                    }
                    
                    cartobj.removeAll()
                    
                    for obj in array.items ?? []
                    {
                        var crt = cart()
                        crt.itemID = obj.itemID
                        crt.id = obj.itemID!
                        crt.sku = obj.sku
                        crt.qty = obj.qty
                        crt.quantity = obj.qty!

                        crt.name = obj.name
                        crt.title = obj.name!
                        crt.price = Double(obj.price ?? 0)
                        crt.productType = obj.productType == ProductType.simple ? "simple":"configurable"
                        crt.quoteID = obj.quoteID
                        cartobj.append(crt)
                    }
                    
//                    print(array)
                    
                }
                    catch
                    {
                        
                    }
                
                let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                weak var weakSelf = dashboard
                
                AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
                
                myCartpop.Create(any: self, viewCartBtn: #selector(myCartViewCartButton(_:)), checkoutBtn: #selector(myCartCheckoutButton(_:)), view: bodyfor.pop.scrollview)
//                myCartpop.updateCartlist()
//                myCartpop.body.scrollview.frame.origin.y = y-70
                }
                
            func GetFailed(task:URLSessionDataTask?, error:Error)
            {
//                if error.localizedDescription == "Request failed: unauthorized (401)"
//                {
//                    UserDefaults.standard.set(false, forKey: "IsLogined")
//                    AlertHelper.showErrorAlert(WithTitle: "Error", Message: "You are not Login", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
//                    return
//                }
                let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                weak var weakSelf = dashboard
                
                AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
                myCartpop.Create(any: self, viewCartBtn: #selector(myCartViewCartButton(_:)), checkoutBtn: #selector(myCartCheckoutButton(_:)), view: bodyfor.pop.scrollview)
//                AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
            }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func myCartViewCartButton(_ btn:UIButton){
               
        // footerBar
        myCartpop.disAppear()
        
        // footerBar linked pages
        searchResult.disAppear()
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
        searchResult.disAppear()
        shoppingCart.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        forgotpassword.disAppear()
        
        
        Checkout.create(view: bodyfor.Checkout.scrollview)
    }
}
