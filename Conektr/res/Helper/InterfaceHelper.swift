//
//  InterfaceHelper.swift
//  AcademyLockSmith-iPad
//
//  Created by Umer Farooq on 24/07/2018.
//  Copyright © 2018 Umer Farooq. All rights reserved.
//

import UIKit

class InterfaceHelper: NSObject
{
    static let sharedInstance:InterfaceHelper = InterfaceHelper()
    
    let fontName = "SanFranciscoDisplay"
    let boldFontName = "SanFranciscoDisplay-Bold"
    let fontSize:CGFloat = 14.0
    let biggerFontSize:CGFloat = 15.0
    let buttonBorderWidth:CGFloat = 0
    let viewContainerBorderWidth:CGFloat = 2.0
    let buttonCornerRadius:CGFloat = 3.0
    let viewContainerCornerRadius:CGFloat = 3.0
    let textFieldCornerRadius:CGFloat = 5.0
    let textFieldBorderWidth:CGFloat = 1.0
    let barTintColor = "FB164E"
    let labelsTextColor = #colorLiteral(red: 0.4717543125, green: 0.4723894596, blue: 0.4912327528, alpha: 1) //"65656A"
    let viewBackgroundColor = "EEEEF3"
    let buttonBackgroundColor = "1B3D91" // logo dark
    let submittedButtonBackgroundColor = "78A078"
    let buttonTitleColor = "FFFFFF"
    let textFieldBorderColor = "7F828B"
    let textfldBorderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1) // logo light
    let readonlyBorderColor = "9a9ca3"
    let buttonBorderColor = "000000"
    let calenderCellColorForNonSelected = "F6F6F6"
    let calenderCellColorForSelected = "FB164E"
    let defaultPlaceholderColor = "C7C7CD"
    
    let myAttributeColor = "254E6C"//"00007F"
    
    private override init()
    {
        super.init()
    }
    
    
    //  MARK: - Fonts
    
    func getSelectedFontForLabel() -> UIFont
    {
        let font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
        return font;
    }
    func getselectedBoldFontForLabel() -> UIFont
    {
        let font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        return font
    }
    
    func getSmallerFont() -> UIFont
    {
        let font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        return font;
    }
    func getSmallerBoldFont() -> UIFont
    {
        let font = UIFont.boldSystemFont(ofSize: UIFont.smallSystemFontSize)
        return font
    }
    
    
    func getSelectedFontForButton() -> UIFont
    {
        let font = UIFont.systemFont(ofSize: 15)
        return font;
    }
    
    func getSelectedFontForTextField() -> UIFont
    {
        let font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        return font;
    }
    
    func fontColorForButtons() -> UIColor
    {
        return self.getUIColorFromHexString(hex: self.buttonTitleColor)
    }
    
    func getSelectedBackgroundForButton() -> UIColor
    {
        return self.getUIColorFromHexString(hex: self.buttonBackgroundColor)
    }
    
    func getSelectedBackgroundForSubmittedButton() -> UIColor
    {
        return self.getUIColorFromHexString(hex: self.submittedButtonBackgroundColor)
    }
    
    func getSelectedFontColorForButton() -> UIColor
    {
        let color = UIColor.white
        return color
    }
    
    func getSelectedFontColorForNavigationBar() -> UIColor
    {
        return self.getUIColorFromHexString(hex: self.buttonBackgroundColor)
    }
    
    
    //  MARK: - Borders and Seperators
    
    func getButtonBorderWidth() -> CGFloat
    {
        return self.buttonBorderWidth
    }
    
    func getButtonCornerRadius() -> CGFloat
    {
        return self.buttonCornerRadius
    }
    
    func getTextFieldCornerRadius() -> CGFloat
    {
        return self.textFieldCornerRadius
    }
    
    //  MARK: - UIButton Customization
    
    func styleButton(button:UIButton) {
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.1725490196, green: 0.4, blue: 0.568627451, alpha: 1)
    }
    
    
    func tableHeaderViewbackground(vw:UIView) {
        vw.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.6235294118, blue: 0.8235294118, alpha: 1)
        
//        vw.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.3529411765, blue: 0.4980392157, alpha: 1)
    }
    
    func toolbarcolor(bar:UIToolbar)  {
        bar.barTintColor = #colorLiteral(red: 0.2509803922, green: 0.6235294118, blue: 0.8235294118, alpha: 1)
//        bar.backgroundColor = InterfaceHelper.sharedInstance.getUIColorFromHexString(hex: "409FD2")
//        bar.barTintColor = #colorLiteral(red: 0.1568627451, green: 0.3529411765, blue: 0.4980392157, alpha: 1)
    }
    
    
    func customizeMapButton(button:UIButton)
    {
//        button.backgroundColor = self.getUIColorFromHexString(hex: "357CA8")
        
//        button.backgroundColor = self.getUIColorFromHexString(hex: "807F7F")
        button.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.6235294118, blue: 0.8235294118, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 3.0
    }
    
    func customizeSaveButton(button:UIButton)
    {
        //        button.backgroundColor = self.getUIColorFromHexString(hex: "357CA8")
        
//        button.backgroundColor = self.getUIColorFromHexString(hex: "807F7F")
        button.backgroundColor = #colorLiteral(red: 0.2220961154, green: 0.7402719855, blue: 0, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 3.0
    }
    
    func customizeCancelButton(button:UIButton)
    {
        //        button.backgroundColor = self.getUIColorFromHexString(hex: "357CA8")
        
        //        button.backgroundColor = self.getUIColorFromHexString(hex: "807F7F")
        button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 3.0
    }
    
    func customizeButton(button:UIButton)
    {
        button.backgroundColor = self.getSelectedBackgroundForButton()
        button.setTitleColor(self.fontColorForButtons(), for: .normal)
        button.titleLabel!.font = self.getSelectedFontForButton()
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = self.getUIColorFromHexString(hex: self.buttonBorderColor).cgColor
        button.layer.borderWidth = self.buttonBorderWidth
        button.layer.cornerRadius = self.buttonCornerRadius
        button.titleLabel?.font = self.getSelectedFontForButton()
    }
    
    func customizeSubmittedButton(button:UIButton)
    {
        button.backgroundColor = self.getSelectedBackgroundForSubmittedButton()
        button.setTitleColor(self.fontColorForButtons(), for: .normal)
        button.titleLabel!.font = self.getSelectedFontForButton()
        button.layer.borderColor = self.getUIColorFromHexString(hex: self.buttonBorderColor).cgColor
        button.layer.borderWidth = self.buttonBorderWidth
        button.layer.cornerRadius = self.buttonCornerRadius
        button.titleLabel?.font = self.getSelectedFontForButton()
    }
    
    func customizeTextView(textView:UITextView)
    {
        textView.layer.borderColor = self.getUIColorFromHexString(hex: "E3E3E3").cgColor
        textView.layer.borderWidth = self.textFieldBorderWidth
        textView.layer.cornerRadius = self.textFieldCornerRadius
    }
    
    
    //  MARK: - UITextField Customization
    
    func customizeTextfield(field:UITextField)
    {
        let screenWidth = UIScreen.main.bounds.size.width
        
        let topBorder = CALayer()
        topBorder.borderWidth = self.textFieldBorderWidth
        topBorder.borderColor = self.getUIColorFromHexString(hex: self.textFieldBorderColor).cgColor
        topBorder.frame = CGRect(x:0,y: 0,width: screenWidth,height: self.textFieldBorderWidth)
        
        let bottomBorder = CALayer()
        bottomBorder.borderWidth = self.textFieldBorderWidth
        bottomBorder.borderColor = self.getUIColorFromHexString(hex: self.textFieldBorderColor).cgColor
        bottomBorder.frame = CGRect(x:0,y: field.frame.height - self.textFieldBorderWidth,width: screenWidth,height: self.textFieldBorderWidth)
        
        //        field.layer.addSublayer(topBorder)
        //        field.layer.addSublayer(bottomBorder)
        field.layer.shouldRasterize = true
        field.layer.rasterizationScale = UIScreen.main.scale
        field.font = self.getSelectedFontForTextField()
    }
    
    //  MARK: - UILabelCustomization
    
    func customizeUILabel(label:UILabel, isBold:Bool)
    {
        label.textColor = self.labelsTextColor
        
        
        
            if isBold
            {
                label.font = self.getSmallerBoldFont()
            }
            else
            {
                label.font = self.getSmallerFont()
            }
    }
    
    func lblcolor(label:UILabel){
        label.textColor = self.labelsTextColor
    }
    
    
    
    
    func styleUILabel(label:UILabel) {
        label.layer.cornerRadius = 3.0
        label.layer.borderWidth = 1.0
        label.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //  MARK: - uiViewcustomization
    func customizeUIView(view:UIView) {
        view.layer.borderWidth=viewContainerBorderWidth
        view.layer.cornerRadius=viewContainerCornerRadius
    }
    
    func styleView(view:UIView) {
        //        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func styleTextView(textvw:UITextView) {
        
    }
    
    func styletextField(field:UITextField) {
        field.layer.borderWidth = 1
        field.layer.borderColor = self.textfldBorderColor.cgColor
        field.layer.cornerRadius = 5
    }
    
    //Get border color for editable fields (to apply on tableview cells
    func getColorForEditableBorder () -> CGColor
    {
        return self.getUIColorFromHexString(hex: self.textFieldBorderColor).cgColor
    }
    
    func getColorForReadonlyBorder () -> CGColor
    {
        
        //return self.getUIColorFromHexString(self.readonlyBorderColor).CGColor
        //May be temproray for sme allignment suggested by sir asif
        return self.getUIColorFromHexString(hex: self.textFieldBorderColor).cgColor
    }
    
    func customizeAttributedString(str:String, isBold:Bool) -> NSMutableAttributedString
    {
        if isBold
        {
            let multipleAttributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.foregroundColor: self.getUIColorFromHexString(hex: myAttributeColor),
                NSAttributedString.Key.font: self.getselectedBoldFontForLabel()]
            
            return NSMutableAttributedString(string: str, attributes: multipleAttributes)
        }
            
        else
        {
            let multipleAttributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.foregroundColor: self.getUIColorFromHexString(hex: myAttributeColor),
                NSAttributedString.Key.font: self.getSelectedFontForLabel() ]
            
            return NSMutableAttributedString(string: str, attributes: multipleAttributes)
        }
        
        
    }
    
    func customizeSimpleString(str:String, isBold:Bool) -> NSMutableAttributedString
    {
        if isBold
        {
            let multipleAttributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.font: self.getselectedBoldFontForLabel()]
            
            return NSMutableAttributedString(string: str, attributes: multipleAttributes)
        }
            
        else
        {
            let multipleAttributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.font: self.getSelectedFontForLabel() ]
            
            return NSMutableAttributedString(string: str, attributes: multipleAttributes)
        }
        
        
    }
    
    //  MARK: - UITableViewCellCustomization
    
    func customizeTableViewCell(cell: UITableViewCell, color: String)
    {
        cell.backgroundColor = self.getUIColorFromHexString(hex: color)
    }
    
    func customizeTableViewMainContent(view: UIView, color: String)
    {
        view.backgroundColor = self.getUIColorFromHexString(hex: color)
        
    }
    
    func getUIColorFromHexString(hex:String!) -> UIColor
    {
        
        var cString:NSString = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased() as NSString
        
        if (cString.length < 6)
        {
            return UIColor.gray
        }
        
        if (cString.hasPrefix("0X"))
        {
            cString = cString.substring(from: 2) as NSString
        }
        else if(cString.hasPrefix("#"))
        {
            cString = cString.substring(from: 1) as NSString
        }
        
        if (cString.length != 6)
        {
            return UIColor.gray
        }
        
        var range:NSRange = NSRange(location: 0, length: 2)
        let rString:NSString = cString.substring(with: range) as NSString
        
        range.location = 2
        let gString:NSString = cString.substring(with: range) as NSString
        
        range.location = 4
        let bString:NSString = cString.substring(with: range) as NSString
        
        
        var r:uint = 0
        var g:uint = 0
        var b:uint = 0
        
        var scanner:Scanner = Scanner(string: rString as String)
        scanner.scanHexInt32(&r)
        scanner = Scanner(string: gString as String)
        scanner.scanHexInt32(&g)
        scanner = Scanner(string: bString as String)
        scanner.scanHexInt32(&b)
        
        return UIColor(red: (CGFloat(r))/255.0, green: (CGFloat(g))/255.0, blue: (CGFloat(b))/255.0, alpha: 1.0)
        
    }
    
    
    
}
