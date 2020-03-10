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
    
    var item:CartDatum?
    var quoteId:String = ""
    var cartId:String = ""
    let manager = NetworkingHelper.sharedNetworkManager
    var requestser:AFHTTPRequestSerializer?
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestser = manager.requestSerializer
        // Do any additional setup after loading the view.
    }
    
    
    
    func CreateQuote1() {
        let serializer = AFJSONResponseSerializer()
        requestser = manager.requestSerializer
        serializer.acceptableContentTypes = ["application/json"]
        serializer.readingOptions = JSONSerialization.ReadingOptions.allowFragments
        manager.responseSerializer = serializer
        manager.requestSerializer = AFJSONRequestSerializer()
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
            
            defaults.set(str, forKey: "quoteToken")
            defaults.synchronize()
            quoteId = str
            manager.responseSerializer = AFHTTPResponseSerializer()
            self.GetItemIdForQuote()
        }
        catch NetworkingHelper.NetworkErrors.NilValue
        {
            print("Error: isSuccess parameter was nil in response body")
            manager.responseSerializer = AFHTTPResponseSerializer()
            manager.requestSerializer = requestser!
        }
        catch
        {
            manager.responseSerializer = AFHTTPResponseSerializer()
            manager.requestSerializer = requestser!
        }
    }
    
    func GetFailed(task:URLSessionDataTask?, error:Error)
    {
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.requestSerializer = requestser!
        let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
        weak var weakSelf = dashboard
        
        AlertHelper.hideLoadingView(ForView: weakSelf!.view, Animated: true)
        AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
    }
    
    
    
    func GetItemIdForQuote() {
        
        //        let quoteid = defaults.value(forKey: "quoteToken") ?? ""
        let urlstring = "/index.php/rest/V1/guest-carts/\(quoteId)"
        manager.requestSerializer = AFJSONRequestSerializer()
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
            manager.requestSerializer = requestser!
        }
        catch
        {
            manager.requestSerializer = requestser!
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
                manager.requestSerializer = requestser!
        }
        
        do{
            AlertHelper.showSuccessAlert(WithTitle: "Success", Message: "Sucessfully Added", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
            let decoder = JSONDecoder()
            let str = String(decoding: responseObject as! Data, as: UTF8.self)
            //                    let array = try decoder.decode(CartItem.self, from: responseObject as! Data)
            
            print(str)
            manager.requestSerializer = requestser!
        }
        catch
        {
            manager.requestSerializer = requestser!
        }
    }
    
    func AddItemToQuoteFailed(task:URLSessionDataTask?, error:Error)
    {
        manager.requestSerializer = requestser!
        if error.localizedDescription == "Request failed: unauthorized (401)"
        {
            UserDefaults.standard.set(false, forKey: "IsLogined")
            AlertHelper.showErrorAlert(WithTitle: "Error", Message: "You are not Login", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
            return
        }
        weak var weakSelf = self
        AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
    }
    
    
    func GetQuoteList()  {
        
        let quoteid = defaults.value(forKey: "quoteToken") as? String
        
        if(quoteid == "" || quoteid == nil)
        {
            AlertHelper.showErrorAlert(WithTitle: "Error", Message: "No Quote Found", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
        }
        else
        {
            
            let urlString = "/get_qoute_cart.php?token=\(quoteid)"
            manager.GetQuoteListItems(withurlString: urlString, successBlock: GetQuoteListSucceeded, failureBlock: GetQuoteListFailed)
            //        manager.AddItemtoQuote(withurlString: urlString, withParameters: parameters as AnyObject, successBlock: AddItemToQuoteSucceeded, failureBlock: GetQuoteListFailed)
        }
    }
    
    func GetQuoteListSucceeded(task:URLSessionDataTask, responseObject:Any?)
    {
        if responseObject == nil
        {
            return
        }
        
        do{
            let str = String(decoding: responseObject as! Data, as: UTF8.self)
            let decoder = JSONDecoder()
            let array = try decoder.decode(QuoteList.self, from: responseObject as! Data)
            quotelistobj.removeAll()
            for obj in array
            {
                var item = ps()
                item.sku = obj.sku ?? "N/A"
                item.title = obj.name ?? "N/A"
                item.id = obj.itemID ?? 0
                item.quantity = obj.qty ?? 0
                item.typeId = obj.productType ?? "simple"
                item.price = Double(obj.price ?? 0)
                quotelistobj.append(item)
            }
            quotepop.quoteList()
        }
        catch
        {
            
        }
        
        let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
        weak var weakSelf = dashboard
        
    }
    func GetQuoteListFailed(task:URLSessionDataTask?, error:Error)
    {
        manager.requestSerializer = requestser!
        if error.localizedDescription == "Request failed: unauthorized (401)"
        {
            UserDefaults.standard.set(false, forKey: "IsLogined")
            AlertHelper.showErrorAlert(WithTitle: "Error", Message: "You are not Login", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
            return
        }
        weak var weakSelf = self
        AlertHelper.showErrorAlert(WithTitle: "Error", Message: error.localizedDescription, Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
    }
    
    
    func DeleteQuoteItem(id:Int)  {
        
        let quoteid = defaults.value(forKey: "quoteToken") as? String
        
        if(quoteid == "" || quoteid == nil)
        {
            AlertHelper.showErrorAlert(WithTitle: "Error", Message: "No Quote Found", Sender: NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!)
        }
        else
        {
            let urlString = "/index.php/rest/V1/guest-carts/\(quoteid!)/items/\(id)"
            requestser = manager.requestSerializer
            
            let serializer = AFJSONRequestSerializer()
            serializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
            manager.requestSerializer = serializer
            manager.DeleteQuoteItem(withurlString: urlString, successBlock: DeleteQuoteItemSucceeded, failureBlock: DeleteQuoteItemFailed)
            //        manager.AddItemtoQuote(withurlString: urlString, withParameters: parameters as AnyObject, successBlock: AddItemToQuoteSucceeded, failureBlock: GetQuoteListFailed)
        }
    }
    
    func DeleteQuoteItemSucceeded(task:URLSessionDataTask, responseObject:Any?)
    {
        if responseObject == nil
        {
            return
        }
        
        do{
            let str = String(decoding: responseObject as! Data, as: UTF8.self)
            manager.requestSerializer = requestser!
            GetQuoteList()
//            if(str == "true")
//            {
//                GetQuoteList()
//            }
            
//            quotepop.quoteList()
        }
        catch
        {
            
        }
        
        let dashboard = NetworkingHelper.sharedNetworkManager.appDelegate().presentedViewController!
        weak var weakSelf = dashboard
        
    }
    func DeleteQuoteItemFailed(task:URLSessionDataTask?, error:Error)
    {
        manager.requestSerializer = requestser!
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
