//
//  DeleteCartAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit

class DeleteCartAPIVC {

    var item:cart?
    
    func DeleteCart() {
        
        let str = "rest/V1/carts/mine/items/\(item!.id)"
        let manager = NetworkingHelper.sharedNetworkManager
        manager.DeleteCartItem(withUrlString: "rest/V1/carts/mine/items/\(item!.id)", successBlock: GetSucceeded, failureBlock: GetFailed)
    }
    
    func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
    {
        if responseObject == nil
        {
            return
        }
        
        do{
            let getapi = GetCartAPIVC()
            getapi.GetCart()
//            let str = String(decoding: responseObject as! Data, as: UTF8.self)
//            let decoder = JSONDecoder()
//            let Array = try decoder.decode(CategoriesDataModel.self, from: responseObject as! Data)
//            AllCatArray = Array
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
