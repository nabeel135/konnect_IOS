//
//  CustomerLoginAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit
import AFNetworking



class CustomerLoginAPIVC {
    
    
    func signinBUTTON(username:String,password:String){
        
        AlertHelper.showLoadingAlert(WithTitle: "Loading...", OnView: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!.view, Animated: false)
               let manager = NetworkingHelper.sharedNetworkManager
               
               let serializer = AFJSONResponseSerializer()
               serializer.acceptableContentTypes = ["application/json"]
               serializer.readingOptions = JSONSerialization.ReadingOptions.allowFragments
               manager.responseSerializer = serializer
               
               
               let parameters:[String:Any] = ["username":username,
                                              "password":password]
               manager.CustomerLogin(withParameters: parameters as AnyObject, successBlock: GetSucceeded, failureBlock: GetFailed)
           }
           
           func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
               {
                   if responseObject == nil
                   {
                       return
                   }
                   
                   do{
                       let manager = NetworkingHelper.sharedNetworkManager
                       manager.responseSerializer = AFHTTPResponseSerializer()
                       manager.saveToken(token: responseObject as! String)
                       let defaults = UserDefaults.standard
                       defaults.set(true, forKey: "IsLogined")
                       defaults.set(responseObject as! String, forKey: "Token")
                       defaults.synchronize()
                    
                    let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                    weak var weakSelf = dashboard
                    
                    AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
                       AlertHelper.showSuccessAlert(WithTitle: "Success", Message: "Successfully Login", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
//                    GetQuote()
                    dashboard.barhomeButton()

                   }
                       catch
                       {
                           
                       }
                   }
           
           func GetFailed(task:URLSessionDataTask?, error:Error)
           {
            let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
            weak var weakSelf = dashboard
            
            AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
               AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
           }

    
    func GetQuote()  {
         let manager = NetworkingHelper.sharedNetworkManager
                      
                      let serializer = AFJSONResponseSerializer()
                      serializer.acceptableContentTypes = ["application/json"]
                      serializer.readingOptions = JSONSerialization.ReadingOptions.allowFragments
                      manager.responseSerializer = serializer
        manager.CreateQuote(withParameters: nil, successBlock: GetSucceeded, failureBlock: GetFailed)
    }

        func GetQuoteSucceeded(task:URLSessionDataTask, responseObject:Any?)
            {
                if responseObject == nil
                {
                    return
                }
                
                do{
                    let defaults = UserDefaults.standard
                    defaults.set(responseObject as! String, forKey: "quote_id")
                    defaults.synchronize()
                    NetworkingHelper.sharedNetworkManager.responseSerializer = AFJSONResponseSerializer()
                    
                }
                catch{}
    }
        
        func GetQuoteFailed(task:URLSessionDataTask?, error:Error)
        {
    //     let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
    //     weak var weakSelf = dashboard
    //
    //     AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
    //        AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
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
