//
//  AllCategoriesAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit

class AllCategoriesAPIVC {

    
        var AllCatArray:CategoriesDataModel?
        func GetAllCategories() {
            
            let manager = NetworkingHelper.sharedNetworkManager
            manager.GetAllBCategories(withParameters: nil, successBlock: GetSucceeded, failureBlock: GetFailed)
        }
        
    
    
    
    
    func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
        {
            if responseObject == nil
            {
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let Array = try decoder.decode(CategoriesDataModel.self, from: responseObject as! Data)
                AllCatArray = Array
                
                
                
                
                for obj in AllCatArray!.childrenData! {
//                    print("\(obj.id) \(obj.name)  \(obj.isActive)")
                    nested2(obj)
                }
            }
                catch
                {
                    
                }
            }
            fileprivate func nested2(_ obj: CategoriesDataModel) {
                if obj.childrenData!.count > 0 {
//                    print(obj.childrenData!.count)
                    for obj2 in obj.childrenData! {
//                        print("----  \(obj2.id)  \(obj2.name)   \(obj2.isActive)")
                        nested3(obj2)
                    }
                }
            }
    
            fileprivate func nested3(_ obj2: CategoriesDataModel) {
                if obj2.childrenData!.count > 0 {
                    for obj3 in obj2.childrenData! {
//                        print("     *** \(obj3.id) \(obj3.name)   \(obj3.isActive)")
                    }
                }
            }
            func GetFailed(task:URLSessionDataTask?, error:Error)
            {
                AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
            }


}
