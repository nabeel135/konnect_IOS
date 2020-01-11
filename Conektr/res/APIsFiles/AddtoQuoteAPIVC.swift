//
//  AddtoQuoteAPIVC.swift
//  Conektr
//
//  Created by Mahad on 1/11/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit
import AFNetworking

class AddtoQuoteAPIVC: UIViewController {
    
    var item:CartItem?
    var quoteId:String = ""
    var cartId:String = ""
    let manager = NetworkingHelper.sharedNetworkManager
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func CreateQuote1() {
//        let manager1 = AFHTTPSessionManager()
//        manager1.responseSerializer = AFJSONResponseSerializer()
        let serializer = AFJSONResponseSerializer()
        serializer.acceptableContentTypes = ["application/json"]
        serializer.readingOptions = JSONSerialization.ReadingOptions.allowFragments
        manager.responseSerializer = serializer
        manager.CreateAddtoQuoteToken(withParameters: nil, successBlock: GetSucceeded, failureBlock: GetFailed)
    }
    func GetSucceeded(task:URLSessionDataTask, responseObject:Any?)
    {
        if responseObject == nil
        {
            return
        }
        
        do{
            
//            let str = String(decoding: responseObject as! Data, as: UTF8.self)
            let str = responseObject as! String
            guard str != nil else {throw NetworkingHelper.NetworkErrors.NilValue}
//            let str1 = str.replacingOccurrences(of: "\u{22}", with: "").trimmingCharacters(in: .whitespaces)
            self.quoteId = str
            manager.responseSerializer = AFHTTPResponseSerializer()
            self.GetItemIdForQuote()
            print(str)
        }
        catch NetworkingHelper.NetworkErrors.NilValue
        {
            print("Error: isSuccess parameter was nil in response body")
        }
        catch
        {
            
        }
    }
    
    func GetFailed(task:URLSessionDataTask?, error:Error)
    {
        manager.responseSerializer = AFHTTPResponseSerializer()
        let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
        weak var weakSelf = dashboard
        
        AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
        AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
    }
    
    
    
    func GetItemIdForQuote() {
        let urlstring = "/index.php/rest/V1/guest-carts/\(quoteId)"
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.GetItemIdForQuote(withurlString: urlstring, successBlock: GetItemidSucceeded, failureBlock: AddItemToQuoteFailed)
    }
    
    func GetItemidSucceeded(task:URLSessionDataTask, responseObject:Any?)
    {
        do{
            if responseObject == nil
            {
                throw NetworkingHelper.NetworkErrors.NilValue
            }
            let str = String(decoding: responseObject as! Data, as: UTF8.self)
            
            let array: Dictionary<String, Any> = (try! JSONSerialization.jsonObject(with: responseObject as! Data, options: JSONSerialization.ReadingOptions.mutableContainers)) as! Dictionary<String, Any>
            let id:String = "\(array["id"] ?? "")"
            cartId = id
            //                           guard str != nil else {throw NetworkingHelper.NetworkErrors.NilValue}
            print(id)
            AddItemToQuote()
            
        }
        catch NetworkingHelper.NetworkErrors.NilValue
        {
            print("Error: isSuccess parameter was nil in response body")
        }
        catch
        {
            
        }
    }
    
    func AddItemToQuote() {
        
        var nsArray = [[String:Any]]()
        var dictionary = Dictionary<String,Any>()
        dictionary["sku"] = item?.sku
        dictionary["quote_id"] = quoteId
        dictionary["qty"] = item?.qty
        
        let parameters:[String:Any] = ["cartItem":dictionary]
        let urlString = "/index.php/rest/V1/guest-carts/\(cartId)/items"
        manager.AddItemtoQuote(withurlString: urlString, withParameters: parameters as AnyObject, successBlock: AddItemToQuoteSucceeded, failureBlock: AddItemToQuoteFailed)
        
    }
    
    func AddItemToQuoteSucceeded(task:URLSessionDataTask, responseObject:Any?)
            {
                if responseObject == nil
                {
                    return
                }
                
                do{
                    AlertHelper.showSuccessAlert(WithTitle: "Success", Message: "Sucessfully Added", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
                    let decoder = JSONDecoder()
                    let str = String(decoding: responseObject as! Data, as: UTF8.self)
//                    let array = try decoder.decode(CartItem.self, from: responseObject as! Data)
                    
                    print(str)
                }
                    catch
                    {
                        
                    }
                }
                
                func AddItemToQuoteFailed(task:URLSessionDataTask?, error:Error)
                {
                    if error.localizedDescription == "Request failed: unauthorized (401)"
                    {
                        UserDefaults.standard.set(false, forKey: "IsLogined")
                        AlertHelper.showErrorAlert(WithTitle: "Error", Message: "You are not Login", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
                        return
                    }
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
