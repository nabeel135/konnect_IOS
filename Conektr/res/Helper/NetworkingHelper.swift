    //
    //  NetworkingHelper.swift
    //  AcademyLockSmith-iPad
    //
    //  Created by Umer Farooq on 27/07/2018.
    //  Copyright © 2018 Umer Farooq. All rights reserved.
    //
    
    import Foundation
    import AFNetworking
    
    class NetworkingHelper: AFHTTPSessionManager
    {
        
        enum NetworkErrors:Error
        {
            case NoContent
            case SuccessFailed
            case NilValue
        }
        
        static var webAPIURL = "http://www.dev.conektr.com/"
        static var sharedNetworkManager:NetworkingHelper = NetworkingHelper(url: URL(string: webAPIURL))
        
        init(url:URL?)
        {
            super.init(baseURL: url, sessionConfiguration: nil)
            
        }
        
        required init?(coder aDecoder: NSCoder)
        {
            fatalError("init(coder:) has not been implemented")
        }
        
        func appDelegate()->AppDelegate
        {
            return  UIApplication.shared.delegate as! AppDelegate
        }
        
        
        //MARK: - Login and Authentication
        
        
        func performAuthenticationOperation(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            
            self.post("VerifyToken", parameters: parameters!, progress: nil, success: success , failure: failure)
            
        }
        
        
        //GetAllBrands
        func GetAllBrands(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //        self.post("brands.php",parameters: parameters!, progress: nil, success: success , failure: failure)
            self.get("brands.php",parameters: parameters, progress: nil, success: success , failure: failure)
            //        NetworkingHelper.sharedNetworkManager.get(<#T##URLString: String##String#>,
            //                                                  parameters: nil,
            //                                                  progress: nil,
            //                                                  success: <#T##((URLSessionDataTask, Any?) -> Void)?##((URLSessionDataTask, Any?) -> Void)?##(URLSessionDataTask, Any?) -> Void#>,
            //                                                  failure: <#T##((URLSessionDataTask?, Error) -> Void)?##((URLSessionDataTask?, Error) -> Void)?##(URLSessionDataTask?, Error) -> Void#>)
        }
        
        //GetAllBCategories
        func GetAllBCategories(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //        self.post("brands.php",parameters: parameters!, progress: nil, success: success , failure: failure)
            self.get("rest/V1/categories/",parameters: parameters, progress: nil, success: success , failure: failure)
        }
        
        //rest/V1/products?searchCriteria[pageSize]=0
        func FeaturesProduct(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //        self.post("brands.php",parameters: parameters!, progress: nil, success: success , failure: failure)
            self.get("product_list.php",parameters: parameters, progress: nil, success: success , failure: failure)
        }
        
        // MARK: - Login
        func CustomerLogin(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            
            //print(self.baseURL!)
            self.post("index.php/rest/V1/integration/customer/token", parameters: parameters!, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - Update Cart
        //    rest/V1/carts/mine/items
        func UpdateCart(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            self.post("rest/V1/carts/mine/items", parameters: parameters!, progress: nil, success: success , failure: failure )
        }
        
        func PlaceOrder(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print("\(self.baseURL!)/index.php/rest/V1/carts/mine/payment-information")
            self.post("/index.php/rest/V1/carts/mine/payment-information", parameters: parameters!, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - Create Shiping
        func SaveShippingAddress(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            print("\(self.baseURL!)/index.php/rest/V1/carts/mine/shipping-information")
            self.post("/index.php/rest/V1/carts/mine/shipping-information", parameters: parameters!, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - Add Item to Cart
        func AddItemtoCart(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            self.post("/index.php/rest/V1/carts/mine/items", parameters: parameters!, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - getCartItems
        func GetCartItems(withParameters parameters: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            //                        http://dev.conektr.com/get_qoute_cart.php?token=Of4ZRqXe34jdCPJ6NsawhK5Eui2nrqrD

            self.get(parameters, parameters: nil, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - GetCustomerDetail
        func GetCustomerDetail(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //print(self.baseURL!)
            self.get("index.php/rest/V1/customers/me", parameters: parameters, progress: nil, success: success , failure: failure )
        }
        
        
        // MARK: - GetCustomerDetail
        func GetPaymentMethods(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print("\(self.baseURL!)/index.php/rest/V1/carts/mine/payment-methods")
            self.get("/index.php/rest/V1/carts/mine/payment-methods", parameters: parameters, progress: nil, success: success , failure: failure )
        }
        
        
        // MARK: - GetCountryAndRegion
        func GetCountryAndRegion(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            self.get("/index.php/rest/V1/directory/countries", parameters: parameters, progress: nil, success: success , failure: failure )
        }
        
        
        
        // MARK: - Product Detail
        //rest/V1/products/CUNI-1263010350015002
        func ProductDetail(withurlString urlString: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            self.get(urlString, parameters: nil, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - Product Detail Options
        //rest/V1/products/CUNI-1263010350015002
        func ProductDetailOptions(withurlString urlString: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            self.get(urlString, parameters: nil, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - Product Detail Options
        //rest/V1/products/CUNI-1263010350015002
        func ProdConDetailOptions(withurlString urlString: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            self.get(urlString, parameters: nil, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - Delete Cart
        //    rest/V1/carts/mine/items/12634
        func DeleteCartItem(withUrlString urlString: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            //        self.get("rest/V1/carts/mine/items/\(parameters)", parameters: nil, progress: nil, success: success , failure: failure )
            self.delete(urlString, parameters: nil, success: success, failure: failure)
        }
        
        // MARK: - Delete Cart
        //    rest/V1/carts/mine/items/12634
        func CreateQuote(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            //        self.get("rest/V1/carts/mine/items/\(parameters)", parameters: nil, progress: nil, success: success , failure: failure )
            self.post("/index.php/rest/V1/carts/mine", parameters: nil, success: success, failure: failure)
        }
        
        // MARK: - CreateAddtoQuoteToken
        func CreateAddtoQuoteToken(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            //        self.get("rest/V1/carts/mine/items/\(parameters)", parameters: nil, progress: nil, success: success , failure: failure )
            self.post("/index.php/rest/V1/guest-carts", parameters: nil, success: success, failure: failure)
        }
        
        // MARK: - Search Result
        func GetItemIdForQuote(withurlString urlString: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //print(self.baseURL!)
            self.get(urlString, parameters: nil, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - GetQuoteListItems
        func GetQuoteListItems(withurlString urlString: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //print(self.baseURL!)
            self.get(urlString, parameters: nil, progress: nil, success: success , failure: failure )
        }
        
        
        // MARK: - DeleteQuoteItem
        func DeleteQuoteItem(withurlString urlString: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //print(self.baseURL!)
            self.delete(urlString, parameters: nil, success: success , failure: failure )
        }
        
        // MARK: - GetQuoteDetail
        func GetQuoteDetail(withurlString urlString: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //print(self.baseURL!)
            self.get(urlString, parameters: nil, progress: nil, success: success , failure: failure )
        }
        
        func AddItemtoQuote(withurlString urlString: String,withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            self.post(urlString, parameters: parameters!, progress: nil, success: success , failure: failure )
        }
        
        
        // MARK: - getCartItems
        func GetProConfigOption(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            self.get("rest/V1/products/attributes/prod_config/options", parameters: parameters, progress: nil, success: success , failure: failure )
        }
        
        // MARK: - Search Result
        func SearchProductByText(withurlString urlString: String, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //print(self.baseURL!)
            self.get(urlString, parameters: nil, progress: nil, success: success , failure: failure )
        }
        
        func ChangePassword(withParameters parameters: AnyObject?, successBlock success:((URLSessionDataTask, Any?) -> Void)?, failureBlock failure:((URLSessionDataTask?, Error) -> Void)?)
        {
            //            //print(self.baseURL!)
            self.post("/index.php/rest/V1/customers/me/password", parameters: parameters!, progress: nil, success: success , failure: failure )
        }
        
        
        func saveToken(token:String)
        {
            let token1 = "Bearer " + token
            let serializer = AFJSONRequestSerializer()
            serializer.setValue(token1, forHTTPHeaderField: "Authorization")
            serializer.timeoutInterval = 300
            self.requestSerializer = serializer
            
            self.responseSerializer = AFHTTPResponseSerializer()
            self.appDelegate().GetQuote(token: token)
            let vc = CustomDetailAPIVC()
            vc.GetCustomerDetail()
            
        }
        
        func GetNewManager() {
            
        }
        
        
        
        
        
        func isSimulatorOrTestFlight() -> Bool {
            guard let path = Bundle.main.appStoreReceiptURL?.path else {
                return false
            }
            return path.contains("CoreSimulator") || path.contains("sandboxReceipt")
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
                manager.get(url.absoluteString!,
                            parameters: nil,
                            progress: nil, success: { (task, response) in
                                rimg = response as! UIImage
                }) { (task, err) in
                    //print("Error: " + err.localizedDescription)
                }
            }
            catch{
                
            }
            
            return rimg
        }
    }
