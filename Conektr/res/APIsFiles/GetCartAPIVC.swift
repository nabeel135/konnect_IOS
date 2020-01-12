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
        let defaults = UserDefaults.standard
                       
                       if(defaults.bool(forKey: "IsLogined"))
                       {
                           manager.saveToken(token: defaults.string(forKey: "Token")!)
                        let parameters:[String:Any] = ["token":defaults.string(forKey: "Token")!]
                        let urlString = "/get_cart.php?token=\(defaults.string(forKey: "Token")!)"
                        manager.GetCartItems(withParameters: urlString, successBlock: GetSucceeded, failureBlock: GetFailed)
        //                self.GetQuote(token: defaults.string(forKey: "Token")!)
                        
                       }
        else
                       {
                        AlertHelper.showErrorAlert(WithTitle: "Error", Message: "Try to Login Again", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
        }
                   
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
                    
                    cartobj.removeAll()
                    
                    for obj in array.data ?? []
                    {
                        var crt = cart()
                        crt.itemID = obj.itemID
                        crt.id = obj.itemID!
                        crt.sku = obj.sku
                        crt.qty = obj.qty
                        crt.quantity = obj.qty!
                        crt.imgUrl = obj.value ?? ""
                        crt.name = obj.name
                        crt.title = obj.name!
                        crt.price = Double(obj.price ?? 0)
                        crt.productType = obj.productType ?? "simple"
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
