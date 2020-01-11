//
//  EditAccountInformationVC.swift
//  MyAccountScreens
//
//  Created by Waqas on 26/12/2019.
//  Copyright © 2019 Waqas. All rights reserved.
//
import UIKit
class EditAccountInformationVC: UIViewController {
        
    let scroll = UI()
        
    //////////////// MAIN HEADER LABEL////////////////////////////
    let EditAcountInformation = UI()
    //////////////// LABEL////////////////////////////
    let AccountInformation = UI()
        let FirstName = UI()
        let LastName = UI()
    let AdditionalData = UI()
        let RetailerLattitude = UI()
        let RetailerLongitude = UI()
        let TelephoneNumber = UI()
        let NearestLandMark = UI()
        let VDCode = UI()
        let TradeLincenseNumber = UI()
        let TradeLicenseAttachment = UI()
        let NoFileChosen1 = UI()
        let VATORTRNNumber = UI()
        let NoFileChosen2 = UI()
        let VATORTRNAttachment = UI()
        let Email = UI()
        let CurrentPassword = UI()
        let NewPassword = UI()
        let ConformNewPassword = UI()
    ////////////
    ////////////// This variable change if user select the change email or password checkbox
    ////////////
        let ChangeEmailAndPasswordLabel = UI()
        
        
        
        
    //////////////// TEXT FIRELDS ////////////////////////////
    var FirstNameTextField = UI()
    var LastNameTextField = UI()
    var RetailerLatitudeTextField = UI()
    var RetailerLongitudeTextField = UI()
    var TelephoneNumberTextField = UI()
    var NearestLandMarkTextField = UI()
    var VDCodeLongitudeTextField = UI()
    var TradeLicenseNumberTextField = UI()
    var VATTRNTextField = UI()
        
        
    ///////////////////  BUTTONS ///////////////////////////////////
        
    let ChoseFileButton1 = UI()
    let ChoseFileButton2 = UI()
    let SaveButton = UI()
    let BackButton = UI()
        
   //////////////////////  CHECK BOX VIEW   //////////////////
    let CheckBox1View1 = UIView()
    let CheckBox1View2 = UIView()
        
    var ChangeEmailStatus1:Bool = false
    var ChangePasswordStatus2:Bool = false
        
        
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
        //////////////////////////      CREATING SCROLL VIEW        //////////////////////////////////
        scroll.ScrollView(x: 0, y: 0, width: x, height: y-70, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), contentwidth: x, contentheight: 1380, view: view)
           
        //////////////////////////      CALLING COMPONENTS FUNCTIONS     //////////////////////////////////
        CreateLabels()
        CreateTextFields()
        CreateButtons()
        CreateCheckBox()
            
    }
        
        
        
        
}
extension EditAccountInformationVC{
     
         
         
         
         
     /////////////////////////////////////
    ///////////////////////////////////////     CREATE BUTTONS       //////////////////////////////////////////////////////////
     /////////////////////////////////////
         
     func CreateButtons() {
             
        ChoseFileButton1.Button(x: 25, y: 760.0, width: 100, height: 20, title: "Chose file", fontsize: 14, any: self, function: #selector(ChoseFileName1(_:)), cornerRadius: 0.2, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: scroll.scrollview)
             
        ChoseFileButton2.Button(x: 25, y: 900.0, width: 100, height: 20, title: "Chose file", fontsize: 14, any: self, function: #selector(ChoseFileName2(_:)), cornerRadius: 0.2, bordercolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: scroll.scrollview)
             
        SaveButton.Button(x: 25.0, y: 1250, width: x - 50, height: 50, title: "SAVE", fontsize: 14, any: self, function: #selector(SaveButtonFunc(_:)), cornerRadius: 0.0, bordercolor: UIColor.clear, bkcolor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1), txtcolor: UIColor.white, view: scroll.scrollview)
             
        BackButton.Button(x: 25.0, y: 1310, width: x - 50, height: 50, title: "Go Back", fontsize: 14, any: self, function: #selector(BackButtonFunc(_:)), cornerRadius: 0.0, bordercolor: UIColor.clear, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: UIColor.blue, view: scroll.scrollview)
                 
     }
         
     @objc func SaveButtonFunc (_: UIButton) -> Void {
         print("Image")
     }
         
     @objc func BackButtonFunc (_: UIButton) -> Void {
            print("Image")
        }
         
     @objc func ChoseFileName1 (_ sender: UIButton){
         print("ABC")
     }
         
     @objc func ChoseFileName2 (_ sender: UIButton){
         print("abc")
     }
         
         
         
         
         
         
         
         
         
     ///////////////////////////////////////////
       ///////////////////////////////////////     CREATE LABELS       //////////////////////////////////////////////////////////
     ///////////////////////////////////////////
         
     func CreateLabels() {
         EditAcountInformation.Label(x: 25.0, y: 0.0, width: 280, height: 30, txt: "EDIT ACCOUNT INFORMATION", fontsize: 16.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: UIColor.black, view: scroll.scrollview)
             
             
         AccountInformation.Label(x: 25.0, y: 50.0, width: 250, height: 30, txt: "Account Information", fontsize: 16, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
        FirstName.Label(x: 25.0, y: 90.0, width: 150, height: 20, txt: (custDetailModel?.firstname ?? ""), fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
        LastName.Label(x: 25.0, y: 160.0, width: 150, height: 20, txt: (custDetailModel?.lastname ?? ""), fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         AdditionalData.Label(x: 25.0, y: 240.0, width: 250, height: 30, txt: "Aditional Data", fontsize: 16, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         RetailerLattitude.Label(x: 25.0, y: 280.0, width: 150, height: 20, txt: "Retailer Latitude", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
            
             
         RetailerLongitude.Label(x: 25.0, y: 350.0, width: 150, height: 20, txt: "Retailer Longitude", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         TelephoneNumber.Label(x: 25.0, y: 420.0, width: 150, height: 20, txt: "Telephone Number", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
        NearestLandMark.Label(x: 25.0, y: 490.0, width: 150, height: 20, txt: "", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         VDCode.Label(x: 25.0, y: 560.0, width: 150, height: 20, txt: "VD Code", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         TradeLincenseNumber.Label(x: 25.0, y: 630.0, width: 180, height: 20, txt: "Trade Lincense Number", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         TradeLicenseAttachment.Label(x: 25.0, y: 730.0, width: 180, height: 20, txt: "Trade Lincense Attachment", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         NoFileChosen1.Label(x: 150.0, y: 760.0, width: 180, height: 20, txt: "No file Chosen", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         VATORTRNNumber.Label(x: 25.0, y: 800.0, width: 180, height: 20, txt: "VAT/TAR Number", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         VATORTRNAttachment.Label(x: 25.0, y: 870.0, width: 180, height: 20, txt: "VAT/TAR Attachment", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
             
             
         NoFileChosen2.Label(x: 150.0, y: 900.0, width: 180, height: 20, txt: "No file Chosen", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
     }
         
         
         
         
     //////////////////////////////////////////
       ///////////////////////////////////////     CREATE TEXT FIELDS       //////////////////////////////////////////////////////////
     ///////////////////////////////////////////
         
     func CreateTextFields() {
         FirstNameTextField.Textfield(x: 25, y: 110, width: x - 50, height: 45, placeholder: "Nimila", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: FirstNameTextField)
         scroll.scrollview.addSubview(FirstNameTextField)
        
         LastNameTextField.Textfield(x: 25, y: 180, width: x - 50, height: 45, placeholder: "Jose", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: LastNameTextField)
         scroll.scrollview.addSubview(LastNameTextField)
             
         RetailerLatitudeTextField.Textfield(x: 25, y: 300, width: x - 50, height: 45, placeholder: "22.7107351", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: RetailerLatitudeTextField)
         scroll.scrollview.addSubview(RetailerLatitudeTextField)
             
         RetailerLongitudeTextField.Textfield(x: 25, y: 370, width: x - 50, height: 45, placeholder: "75.850181", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: RetailerLongitudeTextField)
         scroll.scrollview.addSubview(RetailerLongitudeTextField)
             
         TelephoneNumberTextField.Textfield(x: 25, y: 440, width: x - 50, height: 45, placeholder: "47893789", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: TelephoneNumberTextField)
         scroll.scrollview.addSubview(TelephoneNumberTextField)
             
         NearestLandMarkTextField.Textfield(x: 25, y: 510, width: x - 50, height: 45, placeholder: "Dudu", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: NearestLandMarkTextField)
         scroll.scrollview.addSubview(NearestLandMarkTextField)
             
         VDCodeLongitudeTextField.Textfield(x: 25, y: 580, width: x - 50, height: 45, placeholder: "Others", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: VDCodeLongitudeTextField)
         scroll.scrollview.addSubview(VDCodeLongitudeTextField)
             
         TradeLicenseNumberTextField.Textfield(x: 25, y: 650, width: x - 50, height: 45, placeholder: "12345678", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: TradeLicenseNumberTextField)
         scroll.scrollview.addSubview(TradeLicenseNumberTextField)
             
         VATTRNTextField.Textfield(x: 25, y: 820, width: x - 50, height: 45, placeholder: "12121212121", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: VATTRNTextField)
         scroll.scrollview.addSubview(VATTRNTextField)
             
     }
         
         
      ////////////////////////////////////
     /////////////////////////////////////     CREATE CHECKBOXES       //////////////////////////////////////////////////////////
      ////////////////////////////////////
          
      func CreateCheckBox() {
          CheckBox1View1.frame = CGRect(x: 25.0, y: 940.0, width: 18, height: 18)
          CheckBox1View1.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
          scroll.scrollview.addSubview(CheckBox1View1)
         let a = UI()
         a.Label(x: CheckBox1View1.frame.maxX+5, y: 940.0, width: 150, height: 20, txt: "Change Email", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: .black, view: scroll.scrollview)
             
          CheckBox1View2.frame = CGRect(x: 25.0, y: 980.0, width: 18, height: 18)
          CheckBox1View2.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
          scroll.scrollview.addSubview(CheckBox1View2)
         let b = UI()
         b.Label(x: CheckBox1View1.frame.maxX+5, y: 980.0, width: 150, height: 20, txt: "Change Password", fontsize: 16, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: .clear, txtcolor: .black, view: scroll.scrollview)
          let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap1(_:)))
          let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap2(_:)))
          CheckBox1View1.addGestureRecognizer(tap1)
          CheckBox1View2.addGestureRecognizer(tap2)
            
         self.emailandpasswordUI()
         self.updateframe(emailStatus: ChangeEmailStatus1, passStatus: ChangePasswordStatus2)
      }
          
      @objc func handleTap1(_: Any) {
          if ChangeEmailStatus1 == false{
              CheckBox1View1.BackgroundImage(image: .checkmark)
              ChangeEmailStatus1 = true
              self.updateframe(emailStatus: ChangeEmailStatus1, passStatus: ChangePasswordStatus2)
          }
          else{
              CheckBox1View1.BackgroundImage(image: .remove)
              ChangeEmailStatus1 = false
             self.updateframe(emailStatus: ChangeEmailStatus1, passStatus: ChangePasswordStatus2)
          }
      }
      @objc func handleTap2(_: Any) {
             if ChangePasswordStatus2 == false{
                 CheckBox1View2.BackgroundImage(image: .checkmark)
                 ChangePasswordStatus2 = true
                 self.updateframe(emailStatus: ChangeEmailStatus1, passStatus: ChangePasswordStatus2)
             }
             else{
                 CheckBox1View2.BackgroundImage(image: .remove)
                 ChangePasswordStatus2 = false
                 self.updateframe(emailStatus: ChangeEmailStatus1, passStatus: ChangePasswordStatus2)
             }
         }
         
     func emailandpasswordUI() {
         ////////////////// Adding Email and password Label and text fields   /////////////////
         ChangeEmailAndPasswordLabel.Label(x: 25.0, y: 1020.0, width: scroll.scrollview.frame.size.width-35, height: 60, txt: "Change Email", fontsize: 16, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
         // EMAIL
         Email.Label(x: 25.0, y: 1060.0, width: 150, height: 30, txt: "Email", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
         Email.Textfield(x: 25, y: 1080.0, width: x - 50, height: 45, placeholder: "nimila.jose@conektr.com", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
             
         // CURRENT PASSWORD
         CurrentPassword.Label(x: 25.0, y: 1130.0, width: 150, height: 30, txt: "Current Password", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
         CurrentPassword.Textfield(x: 25, y: 1150.0, width: x - 50, height: 45, placeholder: "", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
         // NEW PASSWORD
         NewPassword.Label(x: 25.0, y: 1200.0, width: 150, height: 30, txt: "New password", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
         NewPassword.Textfield(x: 25, y: 1220.0, width: x - 50, height: 45, placeholder: "", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
         // CONFIRM PASSWORD
         ConformNewPassword.Label(x: 25.0, y: 1270.0, width: 150, height: 30, txt: "Confirm New Password", fontsize: 14.0, bold: false, cornerRadius: 0.0, border: 0.0, borderColor: UIColor.clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), view: scroll.scrollview)
         ConformNewPassword.Textfield(x: 25, y: 1290.0, width: x - 50, height: 45, placeholder: "", border: 0.8, borderRadius: 3.0, txtAlign: .left, bordercolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), keyboard: .default, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), bkcolor: UIColor.clear, view: scroll.scrollview)
         // SAVE BUTTON
        SaveButton.Button(x: 25.0, y: 1340.0, width: x - 50, height: 50, title: "SAVE", fontsize: 14, any: self, function: #selector(SaveButtonFunc(_:)), cornerRadius: 0.0, bordercolor: UIColor.clear, bkcolor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1), txtcolor: UIColor.white, view: scroll.scrollview)
         // BACKBUTTON
        BackButton.Button(x: 25.0, y: 1395.0, width: x - 50, height: 50, title: "Go Back", fontsize: 14, any: self, function: #selector(BackButtonFunc(_:)), cornerRadius: 0.0, bordercolor: UIColor.blue, bkcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), txtcolor: UIColor.blue, view: scroll.scrollview)
     }
         
     func updateframe(emailStatus:Bool,passStatus:Bool) {
         if emailStatus {
             ChangeEmailAndPasswordLabel.label.isHidden = false
             Email.label.isHidden = false
             Email.txtfield.isHidden = false
             CurrentPassword.label.isHidden = false
             CurrentPassword.txtfield.isHidden = false
             NewPassword.label.isHidden = true
             NewPassword.txtfield.isHidden = true
             ConformNewPassword.label.isHidden = true
             ConformNewPassword.txtfield.isHidden = true
                 
             // frame
             ChangeEmailAndPasswordLabel.label.text = "CHANGE EMAIL"
             ChangeEmailAndPasswordLabel.label.frame.origin.y = CheckBox1View2.frame.maxY+50
             Email.label.frame.origin.y = ChangeEmailAndPasswordLabel.label.frame.maxY
             Email.txtfield.frame.origin.y = Email.label.frame.maxY
             CurrentPassword.label.frame.origin.y = Email.txtfield.frame.maxY+20
             CurrentPassword.txtfield.frame.origin.y = CurrentPassword.label.frame.maxY
                 SaveButton.button.frame.origin.y = CurrentPassword.txtfield.frame.maxY+30
         }
         if passStatus {
             ChangeEmailAndPasswordLabel.label.isHidden = false
             Email.label.isHidden = true
             Email.txtfield.isHidden = true
             CurrentPassword.label.isHidden = false
             CurrentPassword.txtfield.isHidden = false
             NewPassword.label.isHidden = false
             NewPassword.txtfield.isHidden = false
             ConformNewPassword.label.isHidden = false
             ConformNewPassword.txtfield.isHidden = false
                     
                 
             // frame
             ChangeEmailAndPasswordLabel.label.text = "CHANGE PASSWORD"
             ChangeEmailAndPasswordLabel.label.frame.origin.y = CheckBox1View2.frame.maxY+50
             CurrentPassword.label.frame.origin.y = ChangeEmailAndPasswordLabel.label.frame.maxY
             CurrentPassword.txtfield.frame.origin.y = CurrentPassword.label.frame.maxY
             NewPassword.label.frame.origin.y = CurrentPassword.txtfield.frame.maxY+20
             NewPassword.txtfield.frame.origin.y = NewPassword.label.frame.maxY
             ConformNewPassword.label.frame.origin.y = NewPassword.txtfield.frame.maxY+20
             ConformNewPassword.txtfield.frame.origin.y = ConformNewPassword.label.frame.maxY
             SaveButton.button.frame.origin.y = ConformNewPassword.txtfield.frame.maxY+30
         }
         if emailStatus && passStatus{
             ChangeEmailAndPasswordLabel.label.isHidden = false
             Email.label.isHidden = false
             Email.txtfield.isHidden = false
             CurrentPassword.label.isHidden = false
             CurrentPassword.txtfield.isHidden = false
             NewPassword.label.isHidden = false
             NewPassword.txtfield.isHidden = false
             ConformNewPassword.label.isHidden = false
             ConformNewPassword.txtfield.isHidden = false
                     
                 
             // frame
             ChangeEmailAndPasswordLabel.label.text = "CHANGE EMAIL AND PASSWORD"
             ChangeEmailAndPasswordLabel.label.frame.origin.y = CheckBox1View2.frame.maxY+50
             Email.label.frame.origin.y = ChangeEmailAndPasswordLabel.label.frame.maxY
             Email.txtfield.frame.origin.y = Email.label.frame.maxY
             CurrentPassword.label.frame.origin.y = Email.txtfield.frame.maxY+20
             CurrentPassword.txtfield.frame.origin.y = CurrentPassword.label.frame.maxY
             NewPassword.label.frame.origin.y = CurrentPassword.txtfield.frame.maxY+20
             NewPassword.txtfield.frame.origin.y = NewPassword.label.frame.maxY
             ConformNewPassword.label.frame.origin.y = NewPassword.txtfield.frame.maxY+20
             ConformNewPassword.txtfield.frame.origin.y = ConformNewPassword.label.frame.maxY
             SaveButton.button.frame.origin.y = ConformNewPassword.txtfield.frame.maxY+30
                 
         }
         if emailStatus == false && passStatus == false{
             ChangeEmailAndPasswordLabel.label.isHidden = true
             Email.label.isHidden = true
             Email.txtfield.isHidden = true
             CurrentPassword.label.isHidden = true
             CurrentPassword.txtfield.isHidden = true
             NewPassword.label.isHidden = true
             NewPassword.txtfield.isHidden = true
             ConformNewPassword.label.isHidden = true
             ConformNewPassword.txtfield.isHidden = true
                 
             SaveButton.button.frame.origin.y = CheckBox1View2.frame.maxY+30
                 
         }
             
         BackButton.button.frame.origin.y = SaveButton.button.frame.maxY+20
         scroll.scrollview.contentSize.height = BackButton.button.frame.maxY+50
     }
        
        
}
        
        
        
        
        
  
