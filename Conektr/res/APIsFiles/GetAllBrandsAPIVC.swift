//
//  GetAllBrandsAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit
import AFNetworking
import Alamofire
import SwiftyJSON

class GetAllBrandsAPIVC {
    
    
    func GetAllBrands() {
        Alamofire.request("http://dev.conektr.com/brands.php",
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: ["Accept":"application/json"]).responseData { response in
                            
                            switch response.result {
                            case .success(let data):
                                let d = JSON(data)
                                
                                allbrandobj.removeAll()
                                
                                for obj in d["data"].arrayValue {
                                    let o = abs()
                                    o.id = obj["url"].stringValue.components(separatedBy: "brands=").last!.toInt()
                                    o.imgurl = "https://www.dev.conektr.com/pub/media/"+obj["image"].stringValue.components(separatedBy: "url=").last!.replacingOccurrences(of: "\"", with: "")
                                    o.title = obj["image"].stringValue.components(separatedBy: "/").last!.components(separatedBy: ".png").first!
                                    if o.title.contains("px") {
                                        o.title = o.title.replacingOccurrences(of: "-220x110px", with: "")
                                    }
                                    allbrandobj.append(o)
                                    
                                }
                                NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController?.addBrands()
                            case .failure(let err):
                                showAlert(title: "Error", text: err.localizedDescription)
                            }
        }
        
    }
    
    
    
    
    
}

