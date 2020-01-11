//
//  CountryAndRegionVC.swift
//  Conektr
//
//  Created by Mahad on 1/5/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class CountryAndRegionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
           func CountriesAndRegion() {
                        
                        let manager = NetworkingHelper.sharedNetworkManager
                        manager.GetCountryAndRegion(withParameters: nil, successBlock: GetSucceeded, failureBlock: GetFailed)
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
                            let array = try decoder.decode(CountryandRegionModel.self, from: responseObject as! Data)
                            
                            countriesandregionObj = array;
//                            print(array)
                            
                        }
                            catch
                            {
                            }
                        
//                        let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
//                        weak var weakSelf = dashboard
//
//                        AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
                        
    //                    myCartpop.Create(any: self, viewCartBtn: #selector(myCartViewCartButton(_:)), checkoutBtn: #selector(myCartCheckoutButton(_:)), view: bodyfor.pop.scrollview)
    //    //                myCartpop.updateCartlist()
    //    //                myCartpop.body.scrollview.frame.origin.y = y-70
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
    //                    myCartpop.Create(any: self, viewCartBtn: #selector(myCartViewCartButton(_:)), checkoutBtn: #selector(myCartCheckoutButton(_:)), view: bodyfor.pop.scrollview)
        //                AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
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
