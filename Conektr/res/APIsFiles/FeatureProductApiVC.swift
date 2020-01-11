
//
//  FeatureProductApiVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit
import Foundation
import AFNetworking

class FeatureProductApiVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeaturesProduct()
        // Do any additional setup after loading the view.
    }
    
    
    
    var frProfuct:FeaturesProductModel?
    
    func FeaturesProduct() {
        let manager = NetworkingHelper.sharedNetworkManager
        let parameters:[String:Any] = ["fieldName":""] as [String:Any]
        manager.FeaturesProduct(withParameters: parameters as AnyObject, successBlock: GetSucceeded, failureBlock: GetFailed)
    }
    
    
    func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
    {
        if responseObject == nil
        {
            return
        }
        do{
            let decoder = JSONDecoder()
            let prod = try decoder.decode(FeaturesProductModel.self, from: responseObject as! Data)
            frProfuct = prod
            
            
            //////////////////////////////////////////////////////////////////////////////////
            for obj in frProfuct!.data! {
                let distid = obj.distributorID!
                let distname:String = obj.distributorName!.rawValue
                let pid = obj.id!
                let ptitle = obj.name!
                let psku = obj.sku!
                let pprice = obj.price ?? Double()
                
                
                let pimageurl = (obj.customAttributes?.filter{$0.attributeCode == AttributeCode.image}.first?.value?.string() ?? String())
                let pdesc = obj.customAttributes?.filter{$0.attributeCode == AttributeCode.attributeCodeDescription}.first?.value?.string() ?? "N/A"
                let pShortdesc = obj.customAttributes?.filter{$0.attributeCode == AttributeCode.shortDescription}.first?.value?.string()
                let pquantity = obj.customAttributes?.filter{$0.attributeCode == AttributeCode.quantityAndStockStatus}.first?.value?.string() ?? "1"
                let pconfig = obj.customAttributes?.filter{$0.attributeCode == AttributeCode.prodConfig}.first?.value?.string() ?? "N/A"
                let pvariant = obj.customAttributes?.filter{$0.attributeCode == AttributeCode.variant}.first?.value?.string()
                let ppricing = obj.customAttributes?.filter{$0.attributeCode == AttributeCode.pricing}.first?.value?.string()
                let smfeature = obj.customAttributes?.filter{$0.attributeCode == AttributeCode.smFeatured}.first?.value?.string()
                
//                if(obj.typeID == TypeID.simple)
//                {
                    if smfeature == "1" && pprice != 0 && pimageurl != ""
                    {
                        
                        productobj.append(ps())
                        productobj[productobj.count-1].distributorID = Int(distid)!
                        productobj[productobj.count-1].distributorName = distname
                        productobj[productobj.count-1].id = pid
//                        productobj[productobj.count-1].imag = URLtoImage(imgurl: "https://www.dev.conektr.com/pub/media/catalog/product"+pimageurl)
                        productobj[productobj.count-1].imagUrl = "https://www.dev.conektr.com/pub/media/catalog/product"+pimageurl
                        productobj[productobj.count-1].title = ptitle
                        productobj[productobj.count-1].description = pdesc
                        productobj[productobj.count-1].price = pprice
                        productobj[productobj.count-1].discount = pprice+((pprice/100)*10)
                        productobj[productobj.count-1].sku = psku
                        productobj[productobj.count-1].typeId = obj.typeID == TypeID.simple ? "simple":"configurable"
                        productobj[productobj.count-1].quantity = Int(pquantity)!
                        productobj[productobj.count-1].config = pconfig
                        productobj[productobj.count-1].variant = pvariant ?? "N/A"
                        productobj[productobj.count-1].pricing = ppricing ?? "N/A"
                        
                        
                    }
//                }
                
            }
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!.RefreshProduct()
            NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!.updateframe()
            //////////////////////////////////////////////////////////////////////////////////
            
            
        }catch{}
    }
    
    
    // DEPEND ON AFNETWORKING COCOAPOD
    func URLtoImage(imgurl:String) -> UIImage {
        var rimg = UIImage()
        do{
            guard let url = NSURL(string: imgurl as String) else {
                throw NetworkingHelper.NetworkErrors.NilValue
            }
            let manager = AFHTTPSessionManager()
            manager.responseSerializer = AFImageResponseSerializer()
            Thread.sleep(forTimeInterval: 10)
            DispatchQueue.main.async {

            manager.get(url.absoluteString!,
                        parameters: nil,
                        progress: nil, success: { (task, response) in
                            
                            rimg = response as! UIImage
                            print(rimg)
            }) { (task, err) in
                print("Error: " + err.localizedDescription)
            }
            }
        }
        
        catch{
            
        }
                return rimg
    }
    func GetFailed(task:URLSessionDataTask?, error:Error)
    {
        AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: self)
    }
    
    
}
