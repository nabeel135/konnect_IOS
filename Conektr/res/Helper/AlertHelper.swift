//
//  AlertHelper.swift
//  AcademyLockSmith-iPad
//
//  Created by Umer Farooq on 27/07/2018.
//  Copyright © 2018 Umer Farooq. All rights reserved.
//

import UIKit
import MBProgressHUD

class AlertHelper: NSObject {
    static var loadingView:MBProgressHUD?
    
    
    
    class func showErrorAlert(WithTitle title:String, Message message:String, Sender sender:UIViewController)
    {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.tintColor = InterfaceHelper.sharedInstance.getUIColorFromHexString(hex: InterfaceHelper.sharedInstance.barTintColor)
        let action:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(action)
        
        sender.present(alert, animated: true, completion: nil)
    }
    
    class func showSuccessAlert(WithTitle title:String, Message message:String, Sender sender:UIViewController)
    {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.tintColor = InterfaceHelper.sharedInstance.getUIColorFromHexString(hex: InterfaceHelper.sharedInstance.barTintColor)
        let action:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: { (UIAlertAction) in
            alert.dismiss(animated: true, completion:nil)
            sender.navigationController?.popViewController(animated: true)
        })
        alert.addAction(action)
        sender.present(alert, animated: true, completion: nil)
    }
    
    class func showLoadingAlert(WithTitle title:String, OnView view:UIView, Animated animated:Bool)
    {
        loadingView = MBProgressHUD.showAdded(to: view, animated: animated)
        loadingView!.mode = MBProgressHUDMode.indeterminate
        loadingView!.animationType = .fade
        loadingView!.label.text = title
        loadingView!.tintColor = InterfaceHelper.sharedInstance.getUIColorFromHexString(hex: InterfaceHelper.sharedInstance.barTintColor)
        loadingView!.backgroundView.color = UIColor.white.withAlphaComponent(0.4)
    }
    
    class func showNotesAlert(Sender sender:UIViewController)
    {
        let alert:UIAlertController = UIAlertController(title: "Notes", message: nil, preferredStyle: .alert)
        alert.view.tintColor = InterfaceHelper.sharedInstance.getUIColorFromHexString(hex: InterfaceHelper.sharedInstance.barTintColor)
        let action:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: { (UIAlertAction) in
            alert.dismiss(animated: true, completion:nil)
            sender.navigationController?.popViewController(animated: true)
        })
        alert.addTextField()
        alert.addAction(action)
        sender.present(alert, animated: true, completion: nil)
    }
    
    class func shownormalsuccess(WithTitle title:String, Message message:String, Sender sender:UIViewController) {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.tintColor = InterfaceHelper.sharedInstance.getUIColorFromHexString(hex: InterfaceHelper.sharedInstance.barTintColor)
        let action:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: { (UIAlertAction) in
            alert.dismiss(animated: true, completion:nil)
        })
        alert.addAction(action)
        sender.present(alert, animated: true, completion: nil)
    }
    
    class func hideLoadingView(ForView view:UIView, Animated animated:Bool)
    {
        MBProgressHUD.hide(for: view, animated: animated)
    }
    
//    class func showJobAlert(WithTitle title:String, Message message:String, Sender sender:DispatchViewController)
//    {
//        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.view.tintColor = InterfaceHelper.sharedInstance.getUIColorFromHexString(hex: InterfaceHelper.sharedInstance.barTintColor)
//        if let presenter = alert.popoverPresentationController {
//            presenter.sourceView = sender.calendarselectedDate
//            presenter.sourceRect = sender.calendarselectedDate.bounds
//            presenter.permittedArrowDirections = .up
//        }
//        
//        sender.present(alert, animated: true, completion: nil)
//        let when = DispatchTime.now() + 0.7
//        DispatchQueue.main.asyncAfter(deadline: when){
//            // your code with delay
//            alert.dismiss(animated: true, completion: nil)
//        }
//    }
    
    class func showNewJobAlert(WithTitle title:String, Message message:String, Sender sender:UIViewController){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.tintColor = InterfaceHelper.sharedInstance.getUIColorFromHexString(hex: InterfaceHelper.sharedInstance.barTintColor)
        let action:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: { (UIAlertAction) in
            alert.dismiss(animated: true, completion:nil)
        })
        alert.addAction(action)
        sender.present(alert, animated: true, completion: nil)
    }
    
}
