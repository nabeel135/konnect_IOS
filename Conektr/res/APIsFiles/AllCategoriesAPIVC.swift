//
//  AllCategoriesAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit

class AllCategoriesAPIVC {
    
    
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
            
            
            AllCatArray.childrenData.map {
                if($0.isActive == true){
                    let parent = mc()
                    parent.id = $0.id
                    parent.parentID = $0.parentID
                    parent.name = $0.name
                    menuCateobj.append(parent)
                    $0.childrenData.map{
                        if($0.isActive == true){
                            let sub = mc()
                            sub.id = $0.id
                            sub.parentID = $0.parentID
                            sub.name = $0.name
                            menuCateobj[menuCateobj.count-1].sub.append(sub)
                            $0.childrenData.map{
                                if($0.isActive == true){
                                    let child = mc()
                                    child.id = $0.id
                                    child.parentID = $0.parentID
                                    child.name = $0.name
                                    menuCateobj[menuCateobj.count-1].sub[menuCateobj[menuCateobj.count-1].sub.count-1].sub.append(child)
                                }}}}}}
            
        }catch{}
    }
    
    func GetFailed(task:URLSessionDataTask?, error:Error)
    {
        AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
    }
    
    
}
