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
                        
                        shippingAddress.removeAll()
                        
                        for addres in array.addresses ?? []
                        {
                            billingAddObj.append(addres)
                            let sa1:sa = sa()
                            sa1.l1 = (addres.firstname ?? "") + (addres.lastname ?? "")
                            sa1.l2 = addres.city ?? ""
                            sa1.l5 = addres.telephone ?? "N/A"
                            sa1.l3 = "\(addres.city ?? ""), \(addres.region?.region ?? ""), \(addres.postcode ?? "")"
                            sa1.l4 = countriesandregionObj?.filter{$0.id == addres.countryID}.first?.fullNameEnglish ?? "N/A"
                            sa1.id = addres.id!
                            if(addres.defaultShipping == true && addres.defaultBilling == true)
                            {
                                sa1.isselected = true
                                
                            }
                            else
                            {
                                sa1.isselected = false
                            }
                            shippingAddress.append(sa1)
                        }
                        
                        
//                        for obj in array.addresses ?? []
//                        {
//                            let sa1 = sa()
//                            sa1.id = obj.id ?? 0
//                            sa1.l1 = (obj.firstname ?? "") + (obj.lastname ?? "")
//                            sa1.l2 = obj.company ?? ""
//                            sa1.l3 = obj.city ?? ""
//                            sa1.l4 = "\(obj.city ?? ""), \(obj.region?.region ?? ""), \(obj.postcode ?? "")"
//                            sa1.l5 = countriesandregionObj?.filter{$0.twoLetterAbbreviation == obj.countryID}.map{($0.fullNameEnglish ?? "")}.first ?? ""
//                            if(obj.defaultShipping ?? false)
//                            {
//                                sa1.isselected = true
//                            }
//                            else
//                            {
//                                sa1.isselected = false
//                            }
//                            shippingAddress.append(sa1)
//                        }
//                        billingAddObj = array.addresses ?? []
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
