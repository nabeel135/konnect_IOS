//
//  AppDelegate.swift
//  Conektr
//
//  Created by Mr. Nabeel on 12/16/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import AFNetworking
import SwiftGoogleTranslate



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var presentedViewController:Dashboard?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
               
        SwiftGoogleTranslate.shared.start(with: "AIzaSyBVXCQBptg4VoEZ1fdow07xCQvv6oBFZbk")
               let manager = NetworkingHelper.sharedNetworkManager
               manager.requestSerializer = AFJSONRequestSerializer()
               manager.responseSerializer = AFHTTPResponseSerializer()
               let defaults = UserDefaults.standard
               
               if(defaults.bool(forKey: "IsLogined"))
               {
                   manager.saveToken(token: defaults.string(forKey: "Token")!)
//                self.GetQuote(token: defaults.string(forKey: "Token")!)
                
               }
               else{
        }
               
        return true
    }
    
    func GetQuote(token:String)  {
        
        let manager = AFHTTPSessionManager()
        
        let token1 = "Bearer " + token
        let serializer = AFJSONRequestSerializer()
        serializer.setValue(token1, forHTTPHeaderField: "Authorization")
        serializer.timeoutInterval = 300
        manager.requestSerializer = serializer
                              let resserializer = AFJSONResponseSerializer()
                              resserializer.acceptableContentTypes = ["application/json"]
                              resserializer.readingOptions = JSONSerialization.ReadingOptions.allowFragments
                              manager.responseSerializer = resserializer
        manager.post("http://www.dev.conektr.com/index.php/rest/V1/carts/mine", parameters: nil, success: GetQuoteSucceeded, failure: GetQuoteFailed)
    }

        func GetQuoteSucceeded(task:URLSessionDataTask, responseObject:Any?)
            {
                if responseObject == nil
                {
                    return
                }
                
                do{
//                    let str = String(decoding: responseObject as! Data, as: UTF8.self)
                    let defaults = UserDefaults.standard
//                    defaults.set(responseObject as! String, forKey: "quote_id")
                    defaults.set(responseObject as! String, forKey: "quote_id")
                    defaults.synchronize()
//                    NetworkingHelper.sharedNetworkManager.responseSerializer = AFJSONResponseSerializer()
                 

                }
                    catch
                    {
                        
                    }
                }
        
        func GetQuoteFailed(task:URLSessionDataTask?, error:Error)
        {
            print(error.localizedDescription)
    //     let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
    //     weak var weakSelf = dashboard
    //
    //     AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
    //        AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
        }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {    }


}

