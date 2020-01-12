//
//  SearchProductAPIVC.swift
//  Conektr
//
//  Created by Mahad on 12/30/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit

class SearchProductAPIVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func GetSearchResult(str:String) {
        var allowedCharacters = CharacterSet()
        allowedCharacters.formUnion(CharacterSet.urlHostAllowed)
        allowedCharacters.formUnion(CharacterSet.urlPathAllowed)
        allowedCharacters.formUnion(CharacterSet.urlQueryAllowed)
        
        let encodedString = str.addingPercentEncoding(withAllowedCharacters: allowedCharacters)!
        let urlStr = "rest/V1/products?searchCriteria[filter_groups][0][filters][0][field]=name&searchCriteria[filter_groups][0][filters][0][value]=\(encodedString)&searchCriteria[filter_groups][0][filters][0][condition_type]=like"
        
        
        
//        print(urlStr)
        let manager = NetworkingHelper.sharedNetworkManager
        manager.SearchProductByText(withurlString: urlStr, successBlock: GetSucceeded, failureBlock: GetFailed)
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
            searchProductobj.removeAll()
            let str = String(decoding: responseObject as! Data, as: UTF8.self)
            
            guard str != nil else {throw NetworkingHelper.NetworkErrors.NilValue}
            let str1 = str.trimmingCharacters(in: .whitespaces)
            guard str1 != "" else {throw NetworkingHelper.NetworkErrors.NilValue}
            
            let decoder = JSONDecoder()
            let array = try decoder.decode(SearchResultModel.self, from: responseObject as! Data)
            searchProductobj.removeAll()
            for obj in array.items ?? [] {

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

                                    var ps = ss()

                                    ps.id = pid
                                    ps.imagUrl = "https://www.dev.conektr.com/pub/media/catalog/product"+pimageurl
                                    ps.title = ptitle
                                    ps.description = pdesc
                                    ps.price = pprice
                                    ps.discount = pprice+((pprice/100)*10)
                                    ps.sku = psku
                                    ps.typeId = obj.typeID ?? "simple"
                                    ps.quantity = Int(pquantity)!
                                    ps.config = pconfig
                                    ps.variant = pvariant ?? "N/A"
                                    ps.pricing = ppricing ?? "N/A"

                                    searchProductobj.append(ps)
                            }
            
            // footerBar
            Searchpop.disAppear()
            
            // footerBar linked pages
            shoppingCart.disAppear()
            Checkout.disAppear()
            SignIn.disAppear()
            bodyfor.CreateAccount.scrollview.isHidden = true
            forgotpassword.disAppear()
            
            search.create(login: UserDefaults.standard.bool(forKey: "IsLogined"), view: bodyfor.SearchResult.scrollview)
        }
        catch NetworkingHelper.NetworkErrors.NilValue
        {
            print("Error: isSuccess parameter was nil in response body")
            // footerBar
            Searchpop.disAppear()
            
            // footerBar linked pages
            shoppingCart.disAppear()
            Checkout.disAppear()
            SignIn.disAppear()
            bodyfor.CreateAccount.scrollview.isHidden = true
            forgotpassword.disAppear()
            
            search.create(login: UserDefaults.standard.bool(forKey: "IsLogined"), view: bodyfor.SearchResult.scrollview)
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
