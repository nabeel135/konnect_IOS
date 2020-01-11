//
//  ProductDetailAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/26/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit

class ProductDetailAPIVC: UIViewController {

    var data:pdata?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func ProductDetail() {
            
            let manager = NetworkingHelper.sharedNetworkManager
        manager.ProductDetail(withurlString: "rest/V1/products/\(data?.sku)", successBlock: GetSucceeded, failureBlock: GetFailed)
        }
        
        func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
        {
            if responseObject == nil
            {
                return
            }
            
            do{
    //            let dictionary: Dictionary<String, AnyObject> = (try JSONSerialization.jsonObject(with: responseObject! as! Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>)
    //            let array:[[String:Any]] = dictionary["data"] as! [[String:Any]]
                let decoder = JSONDecoder()
                let array = try decoder.decode(ProductDetailModel.self, from: responseObject as! Data)
                
//                print(array)
            }
                catch
                {
                    
                }
            }
            
            func GetFailed(task:URLSessionDataTask?, error:Error)
            {
                weak var weakSelf = self
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
