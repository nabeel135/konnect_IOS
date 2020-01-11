//
//  GetAllBrandsAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit
import AFNetworking

class GetAllBrandsAPIVC {

    
    func GetAllBrands() {
            
            let manager = NetworkingHelper.sharedNetworkManager
            manager.GetAllBrands(withParameters: nil, successBlock: GetSucceeded, failureBlock: GetFailed)
        }
        
        func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
        {
            if responseObject == nil
            {
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let array = try decoder.decode(BrandsModel.self, from: responseObject as! Data)
                
//                print(array)
                allbrandobj.removeAll()
                for i in 0..<array.data!.count {
                    let data = array.data![i]
                    var abs1 = abs()
                    let a:[String] = (data.image?.components(separatedBy: "url="))!
                    
                    var str = a.last
                    let str2 = str?.replacingOccurrences(of: "\"", with: "")
                    
                    abs1.imgurl = "https://www.dev.conektr.com/pub/media/"+str2!
                    
                    
//                    abs1.image = NetworkingHelper.sharedNetworkManager.URLtoImage(imgurl: "https://www.dev.conektr.com/pub/media/"+(data.image ?? ""))
                    abs1.id = i
                    allbrandobj.append(abs1)
                }
                
//                for i in array.data! {
//
//                    print("https://www.dev.conektr.com/pub/media/"+i.image!)
////                    print(URLtoImage(imgurl: "https://www.dev.conektr.com/pub/media/"+i.image!))
//
//                }
                
            }
                catch
                {
                    
                }
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!.addBrands()
            }
            
        func GetFailed(task:URLSessionDataTask?, error:Error)
        {
            AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
        }
    
    
    


}
