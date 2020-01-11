//
//  EditAddressVC.swift
//  MyAccountScreens
//
//  Created by Waqas on 30/12/2019.
//  Copyright © 2019 Waqas. All rights reserved.
//

import UIKit

class EditAddressVC: UIViewController {
    
    ////////////////////////////////////       Scroll View            /////////////////////////////////////////
    let scroll = UI()
    let BottomMenu = UI()
    ////////////////////////////////////       Labels            /////////////////////////////////////////
    var RegionValue = String()
    
    
    let EditAddressLabel = UI()
        let ContactInformationLabel = UI()
            let FirstNameLabel = UI()
            let LastNameLabel = UI()
            let ComponyLabel = UI()
            let PhoneNumberLabel = UI()
        let AddressLabel = UI()
            let StreetAddressLabel = UI()
            let CityLabel = UI()
            let StateAndProvenceLabel = UI()
            let ZipOrPostalCodeLabel = UI()
            let CountryLabel = UI()
    
    let ItsDefaultBillingAddressLabel = UI()
    let ItsDefaultBillingAddressBackView = UI()
    let ItsDefaultShippingAddressLabel = UI()
    let ItsDefaultShippingAddressBackView = UI()
    
    
    ////////////////////////////////////       TextFields            /////////////////////////////////////////
    
    var FirstNameTextField = UI()
    var LastNameTextField = UI()
    var ComponyTextField = UI()
    var PhoneNumberTextField = UI()
    var StreetAddressTextField = UI()
    var CityTextField = UI()
    var ZipOrPostalCodeTextField = UI()
    
    var StateProvinceTextLabel = UILabel()
    var CountryTextLabel = UILabel()
    
   
    ////////////////////////////            POP UP VIEW         ///////////////////////////////////
    let StateProvincePopup = UI()
    let CountryPopup = UI()
    
    let SaveButton = UI()
    let BackButton = UI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        scroll.ScrollView(x: 0, y: 0, width: x, height: y-70, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), contentwidth: x, contentheight: 1050, view: view)
        
        DefiningLabels()
        CreateTextFields()
        CreateLabelField()
        BackAndSaveButtons()
        BottomMenuBar()
        
    }
    
    
    func AddPopUpView() {
    }
    
    func SelectedRegion(Region: String) {
        //RegionValue = Region
    }
 
}










extension EditAddressVC{
    
    func CreateLabelField() {
        
        
        
        StateProvincePopup.ComboBox(["Abudhabi","Ajman","Dubai","Faujairah","Ras Al Khaimah","Sharjah","Umm Al Qaiwain"], 0, x: 25.0, y: 600, width: x - 50, height: 45, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cornerRadius: 5, editable: false, placeholder: "", fontsize: 16, iconColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), listbkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), listTextcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview) {
            print(self.StateProvincePopup.comboBox.text_comboBox())
        }
        
        
        
        var countrypoplist:[String] = (countriesandregionObj?.map{$0.fullNameEnglish} ?? ["United Arab Emirates"]) as! [String]
        
        if countrypoplist.count == 0
        {
            countrypoplist.append("United Arab Emirates")
        }
        
        
        CountryPopup.ComboBox(countrypoplist, 0, x: 25.0, y: 740.0, width: x - 50, height: 45, bkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cornerRadius: 5, editable: false, placeholder: "", fontsize: 16, iconColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), listbkcolor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), listTextcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview) {
            
        }
        
        
    }
        

        
    

    func DefiningLabels() {
           
           EditAddressLabel.Label(x: 25.0, y: 0.0, width: 280, height: 30, txt: "EDIT ADDRESS", fontsize: 16.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: UIColor.black, view: scroll.scrollview)
           
           ContactInformationLabel.Label(x: 25.0, y: 50.0, width: 250, height: 30, txt: "Contact Information", fontsize: 16, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
           
           FirstNameLabel.Label(x: 25.0, y: 90.0, width: 150, height: 20, txt: "First Name", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
            
            
            LastNameLabel.Label(x: 25.0, y: 160.0, width: 150, height: 20, txt: "Last Name", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
                        
            
            ComponyLabel.Label(x: 25.0, y: 230, width: 150, height: 20, txt: "Compony", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
           
            
            PhoneNumberLabel.Label(x: 25.0, y: 300.0, width: 150, height: 20, txt: "Phone Label", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
           
           
           AddressLabel.Label(x: 25.0, y: 400.0, width: 180, height: 30, txt: "Address", fontsize: 16, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
           
           StreetAddressLabel.Label(x: 25.0, y: 440, width: 150, height: 20, txt: "Street Address", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
           
            
            CityLabel.Label(x: 25.0, y: 510.0, width: 150, height: 20, txt: "City", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
           
           StateAndProvenceLabel.Label(x: 25.0, y: 580.0, width: 150, height: 20, txt: "State/Province", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
           
           ZipOrPostalCodeLabel.Label(x: 25.0, y: 650.0, width: 150, height: 20, txt: "Zip/Postal Code", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
           
           CountryLabel.Label(x: 25.0, y: 720.0, width: 150, height: 20, txt: "Country", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
           
           /////////////////////////       Default Billing and shipping adderss labels             /////////////////////////////////
           
           ItsDefaultBillingAddressBackView.View(x: 25, y: 790.0, width: x - 50, height: 45, bkcolor: UIColor(displayP3Red: 250/255, green: 240/255, blue: 213/255, alpha: 1.0), cornerRadius: 0.2, border: 0.0, borderColor: UIColor.clear, view: scroll.scrollview)
           
           ItsDefaultBillingAddressLabel.Label(x: 60.0, y: 800.0, width: 250, height: 20, txt: "Its Default Billing Address", fontsize: 16.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.5647058824, green: 0.4901960784, blue: 0.3215686275, alpha: 1), view: scroll.scrollview)
           
           ItsDefaultShippingAddressBackView.View(x: 25, y: 840.0, width: x - 50, height: 45, bkcolor: UIColor(displayP3Red: 250/255, green: 240/255, blue: 213/255, alpha: 1.0), cornerRadius: 0.2, border: 0.0, borderColor: UIColor.clear, view: scroll.scrollview)
           
           ItsDefaultShippingAddressLabel.Label(x: 60.0, y: 850.0, width: 250, height: 20, txt: "Its Default Shipping Address", fontsize: 16.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.5647058824, green: 0.4901960784, blue: 0.3215686275, alpha: 1), view: scroll.scrollview)
      
           
       }
       
       
       func CreateTextFields() {
           
           
           FirstNameTextField.Textfield(x: 25, y: 110, width: x - 50, height: 45, placeholder: "Nimila", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
           
           
           LastNameTextField.Textfield(x: 25, y: 180, width: x - 50, height: 45, placeholder: "Jose", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
           
           
           ComponyTextField.Textfield(x: 25, y: 250, width: x - 50, height: 45, placeholder: "Conektr", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
           
           
           PhoneNumberTextField.Textfield(x: 25, y: 320, width: x - 50, height: 45, placeholder: "971566414729", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
           
           StreetAddressTextField.Textfield(x: 25, y: 460, width: x - 50, height: 45, placeholder: "Dubai", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
           
           
           CityTextField.Textfield(x: 25, y: 530, width: x - 50, height: 45, placeholder: "Dubai", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
           
           
           ZipOrPostalCodeTextField.Textfield(x: 25, y: 670, width: x - 50, height: 45, placeholder: "12345", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
           
       }
       
       
       func BackAndSaveButtons() {
        SaveButton.Button(x: 25.0, y: 900.0, width: x - 50, height: 50, title: "SAVE", fontsize: 14, any: self, function: #selector(SaveButtonFunc(_:)), cornerRadius: 0.0, bordercolor: UIColor.clear, bkcolor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1), txtcolor: UIColor.white, view: scroll.scrollview)
                  
        BackButton.Button(x: 25.0, y: 980, width: x - 50, height: 50, title: "Go Back", fontsize: 14, any: self, function: #selector(BackButtonFunc(_:)), cornerRadius: 0.0, bordercolor: UIColor.clear, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: UIColor.blue, view: scroll.scrollview)
       }
      
       @objc func SaveButtonFunc (_: UIButton) -> Void {
           print("Image")
       }
       
       @objc func BackButtonFunc (_: UIButton) -> Void {
           print("Image")
       }
       
    
       func BottomMenuBar() {
           BottomMenu.View(x: 0, y: y-70, width: x, height: 70, bkcolor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), cornerRadius: 0, border: 0.0, borderColor: UIColor.clear, view: view)
       }


}
