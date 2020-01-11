//
//  AddtoCartAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit


class AddtoCartAPIVC {

    var item:CartItem?
    var ItemtoAdd:[ps]?
    
    func AddItemToCart(){
        var nsArray = [[String:Any]]()
        let quoteid = UserDefaults.standard.string(forKey: "quote_id")
            var dictionary = Dictionary<String,Any>()
            dictionary["sku"] = item?.sku
            dictionary["quote_id"] = quoteid
            dictionary["qty"] = item?.qty
//            nsArray.append(dictionary)
        
        let parameters:[String:Any] = ["cartItem":dictionary]
//        print(parameters)
        
        // 2
        
        
        let manager = NetworkingHelper.sharedNetworkManager
        
        manager.AddItemtoCart(withParameters: parameters as AnyObject, successBlock: GetSucceeded, failureBlock: GetFailed)
    }
    
        func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
        {
            if responseObject == nil
            {
                return
            }
            
            do{
                AlertHelper.showSuccessAlert(WithTitle: "Success", Message: "Sucessfully Added", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
                let decoder = JSONDecoder()
                let array = try decoder.decode(CartItem.self, from: responseObject as! Data)
                
//                print(array)
            }
                catch
                {
                    
                }
            }
            
            func GetFailed(task:URLSessionDataTask?, error:Error)
            {
                if error.localizedDescription == "Request failed: unauthorized (401)"
                {
                    UserDefaults.standard.set(false, forKey: "IsLogined")
                    AlertHelper.showErrorAlert(WithTitle: "Error", Message: "You are not Login", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
                    return
                }
                weak var weakSelf = self
                AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
            }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
