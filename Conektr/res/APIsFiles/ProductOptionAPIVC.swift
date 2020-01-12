//
//  ProductOptionAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/29/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit

class ProductOptionAPIVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func GetProductandConfigOptions(sku:String) {
        GetProductOptions(sku: sku)
        GetProductcConOptions(sku: sku)
    }
    
    func GetProductOptions(sku:String) {
        let manager = NetworkingHelper.sharedNetworkManager
        manager.ProductDetailOptions(withurlString: "/product_detail.php?sku=\(sku)", successBlock: GetSucceeded, failureBlock: GetFailed)
    }
    
    func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
    {
        if responseObject == nil
        {
            return
        }
        
        do{
            let decoder = JSONDecoder()
            let array = try decoder.decode(ProductOptions.self, from: responseObject as! Data)
            
            
            //                    for obj in array
            //                    {
            //                        var pro = ProductOption()
            //                        pro.label = obj.label
            //                        pro.value = obj.value
            //                        productconfigoption.append(pro)
            //                    }
            
            
        }
        catch
        {
            
        }
    }
    
    func GetFailed(task:URLSessionDataTask?, error:Error)
    {
        print(error.localizedDescription)
    }
    
    func GetProductcConOptions(sku:String) {
        let manager = NetworkingHelper.sharedNetworkManager
        manager.ProductDetailOptions(withurlString: "/index.php/rest/V1/configurable-products/\(sku)/children", successBlock: GetProdConSucceeded, failureBlock: GetProdConFailed)
    }
    
    func GetProdConSucceeded(task:URLSessionDataTask, responseObject:Any?)
    {
        if responseObject == nil
        {
            return
        }
        
        do{
            let str = String(decoding: responseObject as! Data, as: UTF8.self)
            let decoder = JSONDecoder()
            let array = try decoder.decode(ProductConfigDetails.self, from: responseObject as! Data)
            print(array)
            
            //                    for obj in array
            //                    {
            //                        var pro = ProductOption()
            //                        pro.label = obj.label
            //                        pro.value = obj.value
            //                        productconfigoption.append(pro)
            //                    }
            
            
        }
        catch
        {
            
        }
    }
    
    func GetProdConFailed(task:URLSessionDataTask?, error:Error)
    {
        print(error.localizedDescription)
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
