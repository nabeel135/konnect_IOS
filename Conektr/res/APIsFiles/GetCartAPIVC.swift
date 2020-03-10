//
//  GetCartAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/28/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


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
                        
                        let url = "http://dev.conektr.com/get_cart.php?token=\(defaults.string(forKey: "Token")!)"
                        Alamofire.request(url,
                                          method: .get,
                                          parameters: nil,
                                          headers: ["Accept":"application/json"]).responseData { (response) in
                                            switch response.result{
                                            case .success(let data):
                                                /*--------------------*/
                                                let result = JSON(data)
                                                
                                                //print(result)
                                                
                                                let data = result["data"].dictionaryValue
                                                //print(data)
                                                let distributors = data["distributors"]?.arrayValue
                                                cartobj.removeAll()
                                                for dist in distributors! {
                                                    for obj in data[dist.stringValue]!.arrayValue {
                                                        
                                                        var crt = cart()
                                                        crt.distributorID = obj["distributor_id"].intValue
                                                        crt.distributorName = obj["distributor_name"].stringValue
                                                        crt.itemID = obj["item_id"].intValue
                                                        crt.id = obj["item_id"].intValue
                                                        crt.sku = obj["sku"].stringValue
                                                        crt.qty = obj["qty"].intValue
                                                        crt.quantity = obj["qty"].intValue
                                                        crt.imgUrl = "https://www.dev.conektr.com/pub/media/catalog/product"+obj["value"].stringValue
                                                        crt.name = obj["name"].stringValue
                                                        crt.title = obj["name"].stringValue
                                                        crt.price = obj["price"].doubleValue
                                                        crt.productType = obj["product_type"].stringValue
                                                        crt.quoteID = obj["quote_id"].stringValue
                                                        cartobj.append(crt)
                                                    }
                                                }
                                                
                                                
                                                let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                                                weak var weakSelf = dashboard
                                                
                                                AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
                                                
                                                myCartpop.Create(any: self, viewCartBtn: #selector(self.myCartViewCartButton(_:)), checkoutBtn: #selector(self.myCartCheckoutButton(_:)), view: bodyfor.pop.scrollview)
                                                
                                                /*--------------------*/

                                            case .failure(let err):
                                                print(err.localizedDescription)
                                            }
                        }
//                        manager.GetCartItems(
//                            withParameters: urlString,
//                            successBlock: GetSucceeded,
//                            failureBlock: GetFailed)
//                        self.GetQuote(token: defaults.string(forKey: "Token")!)
                        
                       }
        else
                       {
                        let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                        weak var weakSelf = dashboard
                        
                        AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
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
//                        crt.distributorID = obj.
//                        crt.distributorName =
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
                let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                weak var weakSelf = dashboard
                
                AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
                myCartpop.Create(any: self, viewCartBtn: #selector(myCartViewCartButton(_:)), checkoutBtn: #selector(myCartCheckoutButton(_:)), view: bodyfor.pop.scrollview)
            }

    
    
    @objc func myCartViewCartButton(_ btn:UIButton){
               
        // footerBar
        myCartpop.disAppear()
        
        // footerBar linked pages
        search.disAppear()
        Checkout.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        bodyfor.forgotPassword.scrollview.isHidden = true
        
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
        search.disAppear()
        shoppingCart.disAppear()
        SignIn.disAppear()
        bodyfor.CreateAccount.scrollview.isHidden = true
        bodyfor.forgotPassword.scrollview.isHidden = true    
        
        Checkout.create(view: bodyfor.Checkout.scrollview)
    }
}
