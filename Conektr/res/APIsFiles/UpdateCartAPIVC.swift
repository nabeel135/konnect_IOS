//
//  UpdateCartAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit

class UpdateCartAPIVC {

    var items:[CartDatum]?
    
    
    
    func updateCart(){
//        print("add to Cart")
        var nsArray = [[String:Any]]()
        for item in items!
        {
            var dictionary = [String:Any]()
            dictionary["item_id"] = item.itemID
            dictionary["quote_id"] = item.quoteID
            dictionary["qty"] = item.qty
            nsArray.append(dictionary)
        }
        
        let parameters:[String:Any] = ["cartItem":nsArray]
//        print(parameters)
        
        let manager = NetworkingHelper.sharedNetworkManager
        
        manager.UpdateCart(withParameters: parameters as AnyObject, successBlock: GetSucceeded, failureBlock: GetFailed)
    }
    
        func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
        {
            if responseObject == nil
            {
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let array = try decoder.decode(CartDatum.self, from: responseObject as! Data)
                
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
