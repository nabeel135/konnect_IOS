//
//  CustomerLoginAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit
import AFNetworking
import Alamofire
import SwiftyJSON


class CustomerLoginAPIVC {
    
    
    func signinBUTTON(username:String,password:String){
        loaderStart()
        /*---------- AF NETWORKING ---------------*/
        let manager = NetworkingHelper.sharedNetworkManager

        let serializer = AFJSONResponseSerializer()
        serializer.acceptableContentTypes = ["application/json"]
        serializer.readingOptions = JSONSerialization.ReadingOptions.allowFragments
        manager.responseSerializer = serializer

        manager.CustomerLogin(withParameters: ["username":username,
                                               "password":password] as AnyObject,
                              successBlock: GetSucceeded,
                              failureBlock: GetFailed)

        /*------------ Alamofire ------------*/
//        print("api hit")
//        let param:Parameters = [
//            "username":username,
//            "password":password]
//        let header = [
//            "Authorization":"Bearer fsme17qubyyzbg1wob2hgoe0bryeqrad",
//            "Content-Type":"application/json"
//        ]
//        Alamofire.request("https://www.dev.conektr.com/index.php/rest/V1/integration/customer/token",
//                          method: .post,
//                          parameters: param,
//                          encoding: JSONEncoding.default,
//                          headers: header).responseString { response in
//                            switch response.result {
//                            case .success(let data):
//                                self.alamoSuccess(data: data)
//                            case .failure(let err):
//                                print(err.localizedDescription)
//                                showAlert(title: "Error", text: err.localizedDescription)
//                            }
//        }
        /*------------------------*/
    }
    func alamoSuccess(data:Any){
        print("api success")
        let d:String = JSON(data).stringValue
        print("key:  \(d)")
        UserDefaults.standard.set(true, forKey: "IsLogined")
        UserDefaults.standard.set(d, forKey: "Token")
        UserDefaults.standard.synchronize()
        loaderEnd()
        showAlert(title: "Success", text: "Successfully Login")
        NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!.barhomeButton()

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
            UserDefaults.standard.set(true, forKey: "IsLogined")
            UserDefaults.standard.set(responseObject as! String, forKey: "Token")
            UserDefaults.standard.synchronize()
            
            
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
    }
    
    func GetQuoteFailed(task:URLSessionDataTask?, error:Error)
    {
        //     let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
        //     weak var weakSelf = dashboard
        //
        //     AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
        //        AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
    }
    
}
