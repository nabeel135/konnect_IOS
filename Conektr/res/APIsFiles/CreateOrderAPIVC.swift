//
//  CreateOrderAPIVC.swift
//  Conektr
//
//  Created by Mahad on 1/5/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class CreateOrderAPIVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var parameters:[String:Any]?
    let manager = NetworkingHelper.sharedNetworkManager
    func CreateShiping(ShipingParameters:[String:Any],CreateorderParameters:[String:Any]) {
//        print(ShipingParameters)
        print(CreateorderParameters)
        parameters = CreateorderParameters
        
        manager.SaveShippingAddress(withParameters: ShipingParameters as AnyObject, successBlock: ShippingSucceeded, failureBlock: ShippingFailed)
        
    }
    
    func ShippingSucceeded(task:URLSessionDataTask, responseObject:Any?)
            {
                if responseObject == nil
                {
                    return
                }
                
                do{
                    
                    let str = String(decoding: responseObject as! Data, as: UTF8.self)
                    let decoder = JSONDecoder()
                    manager.PlaceOrder(withParameters: parameters as AnyObject, successBlock: GetSucceeded, failureBlock: GetFailed)
    //                let array = try decoder.decode(CartItem.self, from: responseObject as! Data)
                    
    //                print(array)
                }
                    catch
                    {
                        
                    }
                }
                
                func ShippingFailed(task:URLSessionDataTask?, error:Error)
                {
                    if error.localizedDescription == "Request failed: unauthorized (401)"
                    {
                        UserDefaults.standard.set(false, forKey: "IsLogined")
                        AlertHelper.showErrorAlert(WithTitle: "Error", Message: "You are not Login", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
                        return
                    }
                    AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
                }
    
    func CreateOrder(parameters:[String:Any]){

        print(parameters)
        
        let manager = NetworkingHelper.sharedNetworkManager
        
        manager.PlaceOrder(withParameters: parameters as AnyObject, successBlock: GetSucceeded, failureBlock: GetFailed)
    }
    
        func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
        {
            if responseObject == nil
            {
                return
            }
            
            do{
                
                let str = String(decoding: responseObject as! Data, as: UTF8.self)
                AlertHelper.showSuccessAlert(WithTitle: "Success", Message: "Sucessfully Place Order", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
//                let array = try decoder.decode(CartItem.self, from: responseObject as! Data)
                
//                print(array)
            }
                catch
                {
                    
                }
            }
            
            func GetFailed(task:URLSessionDataTask?, error:Error)
            {
                if error.localizedDescription == "Request failed: unauthorized (401)"
                {
                    UserDefaults.standard.set(false, forKey: "IsLogined")
                    AlertHelper.showErrorAlert(WithTitle: "Error", Message: "You are not Login", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
                    return
                }
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
