//
//  CustomDetailAPIVC.swift
//  Conektr
//
//  Created by Mahad on 1/4/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class CustomDetailAPIVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
        func GetCustomerDetail() {
                    
                    let manager = NetworkingHelper.sharedNetworkManager
                    manager.GetCustomerDetail(withParameters: nil, successBlock: GetSucceeded, failureBlock: GetFailed)
                }
                
                func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
                {
                    if responseObject == nil
                    {
                        return
                    }
                    
                    do{
                        let str = String(decoding: responseObject as! Data, as: UTF8.self)
                        let decoder = JSONDecoder()
                        let array = try decoder.decode(CustomerDetailModel.self, from: responseObject as! Data)
                        
                        custDetailModel = array;
                        
                        GetPaymentMethods()
                        
                        
                    }
                        catch
                        {
                            
                        }
                    
                    let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                    weak var weakSelf = dashboard
                    
                    AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
                    
                    }
                    
                func GetFailed(task:URLSessionDataTask?, error:Error)
                {
                    
                    if error.localizedDescription == "Request failed: unauthorized (401)"
                    {
                        UserDefaults.standard.set(false, forKey: "IsLogined")
                    }
                    let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                    weak var weakSelf = dashboard
                    
                    AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
                }

    
    
    // MARK: - PaymentMethods
    func GetPaymentMethods() {
                
                let manager = NetworkingHelper.sharedNetworkManager
                manager.GetPaymentMethods(withParameters: nil, successBlock: GetPaymentMethodSucceeded, failureBlock: GetPaymentMethodFailed)
            }
            
            func GetPaymentMethodSucceeded(task:URLSessionDataTask, responseObject:Any?)
            {
                if responseObject == nil
                {
                    return
                }
                
                do{
                    let str = String(decoding: responseObject as! Data, as: UTF8.self)
                    let decoder = JSONDecoder()
                    let array = try decoder.decode(PaymentMethodModel.self, from: responseObject as! Data)
                    
                    PaymentsMethods = array;
                    
                    
                }
                    catch
                    {
                        
                    }
                
                }
                
            func GetPaymentMethodFailed(task:URLSessionDataTask?, error:Error)
            {
                
                if error.localizedDescription == "Request failed: unauthorized (401)"
                {
                    UserDefaults.standard.set(false, forKey: "IsLogined")
                }
                let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
                weak var weakSelf = dashboard

                AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
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
