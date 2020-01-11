// Feature.swift dependent

import Foundation
import UIKit
import AVFoundation
let x = UIScreen.main.bounds.size.width
let y = UIScreen.main.bounds.size.height
class UI: UIView {
    let table = UITableView()
    let tableDelegate = TVC()
    let label = UILabel.init()
    let imag = UIImageView()
    let clickableimg = UIButton.init()
    let button = UIButton.init(type: UIButton.ButtonType.roundedRect)
    let view = UIView.init()
    let txtfield = UITextField.init()
    let txtview = UITextView.init()
    let msgbox = UIView.init()
    let scrollview = UIScrollView.init()
    let Lbutton = UIView.init()
    let Lbuttontext = UILabel.init()
    let clickAbleViewImage = UIView.init()
    let input = UIView.init()
    let comboBox = UIView()
    var comboBoxrunAfter:() -> () = {}
    private var iscomboBoxcreated = false
    let autoSizelabel = UILabel()
    let toastmsg = UILabel()

    let triangle = CAShapeLayer()
    let line = CAShapeLayer()
    let arc = CAShapeLayer()
    let cgpath = UIBezierPath()
    let checkBox = UIButton.init()
    var isCheckBoxChecked = false
    private var checkBoxfunc:() -> () = {}
    var checkBoxtrueimage = UIImage()
    var checkboxfalseimage = UIImage()
    
    
    /*---------------------------*/
    func TableView(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,bkcolor:UIColor,border:CGFloat,borderColor:UIColor,separatorColor:UIColor,Rows:Int,editing:Bool,cellheight:CGFloat,CellHeight:@escaping () -> Void,Cellview:@escaping () -> Void,onDelete:@escaping () -> Void,view:UIView) {
        
        tableDelegate.use(editing: editing, numberOFrows: Rows, cellheight: cellheight, CellHeight: {
            CellHeight()
        }, Cellview: {
            Cellview()
        }) {
            onDelete()
        }

        if table.superview == nil {
            table.frame = CGRect(x: x, y: y, width: width, height: height)
            table.layer.masksToBounds = true
            table.layer.borderWidth = border
            table.layer.borderColor = borderColor.cgColor
            table.separatorColor = separatorColor
            table.backgroundColor = bkcolor
            table.delegate = tableDelegate
            table.dataSource = tableDelegate
            table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            view.addSubview(table)
        }
        
    }
    
    /*---------------------------*/
    func CheckBox(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,trueImage:UIImage,falseImage:UIImage,isTrue:Bool,view:UIView,onClick:@escaping () -> Void) {
        
        checkBoxtrueimage = trueImage
        checkboxfalseimage = falseImage
        checkBoxfunc = onClick
        
        checkBox.frame = CGRect(x: x, y: y, width: width, height: height)
        if isTrue {
            checkBox.setBackgroundImage(trueImage, for: .normal)
            isCheckBoxChecked = isTrue
        }else{
            checkBox.setBackgroundImage(falseImage, for: .normal)
            isCheckBoxChecked = isTrue
        }
        checkBox.addTarget(self, action: #selector(oncheckClick), for: .touchUpInside)
        view.addSubview(checkBox)
    }
    @objc func oncheckClick(){
        if self.isCheckBoxChecked {
            self.checkBox.setBackgroundImage(self.checkboxfalseimage, for: .normal)
            self.isCheckBoxChecked = false
        }else{
            self.checkBox.setBackgroundImage(self.checkBoxtrueimage, for: .normal)
            self.isCheckBoxChecked = true
        }
        self.checkBoxfunc()
    }
    
    ///////////////////////////////
    func Arc(x:CGFloat, y:CGFloat,startAngle:CGFloat, endAngle:CGFloat, radius:CGFloat,fillcolor:UIColor,view: UIView) {
        
        //if angle is anticlock wise
        var SA:CGFloat!
        var EA:CGFloat!
        var clockwise:Bool!
        if startAngle >= 0 && endAngle >= 0{
            SA = startAngle
            EA = endAngle
            if startAngle < endAngle{
                clockwise = true
            }
            else{
                clockwise = false
            }
            
        }
        else if startAngle <= 0 && endAngle <= 0{
            SA = 360 + startAngle
            EA = 360 + endAngle
            if startAngle > endAngle{
                clockwise = false
            }
            else{
                clockwise = true
            }
        }
        else if startAngle >= 0 && endAngle <= 0{
            SA = startAngle
            EA = 360 + endAngle
            clockwise = false
        }
        else if startAngle <= 0 && endAngle >= 0{
            SA = 360 + startAngle
            EA = endAngle
            clockwise = true
        }
        
        
        /*--make shape--*/
        cgpath.removeAllPoints()
        cgpath.move(to: CGPoint(x: x, y: y))
        cgpath.addArc(withCenter: CGPoint(x: x, y: y), radius: radius, startAngle: Radian(SA), endAngle: Radian(EA), clockwise: clockwise)
        cgpath.close()
        
        /*--final step--*/
        arc.path = cgpath.cgPath
        arc.fillColor = fillcolor.cgColor
        view.layer.addSublayer(arc)
        
    }
    
    func line(p1:CGPoint,p2:CGPoint,lineWidth:CGFloat,color:UIColor,view:UIView) {
        cgpath.removeAllPoints()
        triangle.isHidden = false
        
        /*--make shape--*/
        cgpath.move(to: p1)
        cgpath.addLine(to: p2)
        
        /*--final step--*/
        line.path = cgpath.cgPath
        line.strokeColor = color.cgColor
        line.lineWidth = lineWidth
        view.layer.addSublayer(line)
    }
    func lineframe(p1:CGPoint,p2:CGPoint) {
        cgpath.removeAllPoints()
        cgpath.move(to: p1)
        cgpath.addLine(to: p2)
        line.path = cgpath.cgPath
    }
    
    
    func Toastmessage(y:CGFloat,_ Text:String,txtColor:UIColor,bkColor:UIColor,fontsize:CGFloat,view:UIView) {
        toastmsg.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0.5, options: [], animations: {
            self.toastmsg.alpha = 1
        })
        
        toastmsg.text = Text
        toastmsg.textColor = txtColor
        toastmsg.backgroundColor = bkColor
        toastmsg.layer.cornerRadius = 20
        toastmsg.numberOfLines = 10
        toastmsg.layer.masksToBounds = true
        toastmsg.font = UIFont.systemFont(ofSize: fontsize)
        toastmsg.textAlignment = .center
        toastmsg.sizeToFit()
        if toastmsg.frame.size.width > (view.frame.size.width - 20) {
            toastmsg.frame.size.width = view.frame.size.width - 20
            toastmsg.sizeToFit()
        }
        else{
            toastmsg.frame.size.width = toastmsg.frame.size.width + 20
        }
        toastmsg.frame.size.height = toastmsg.frame.size.height + 20
        toastmsg.frame.origin.x = view.frame.midX - toastmsg.frame.size.width/2
        toastmsg.frame.origin.y = y
        view.addSubview(toastmsg)
        view.bringSubviewToFront(toastmsg)
        
        time.delay(milliSec: 2500) {
            UIView.animate(withDuration: 1) {self.toastmsg.alpha = 0}
            time.delay(milliSec: 1000, code: {self.toastmsg.removeFromSuperview()})
        }
        
    }
    
    
    
    func ComboBox(_ list:[String],_ defaultTextindex:Int,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,bkcolor:UIColor,txtcolor:UIColor,cornerRadius:CGFloat,editable:Bool,placeholder:String,fontsize:CGFloat,iconColor:UIColor,listbkcolor:UIColor,listTextcolor:UIColor,view:UIView, runAfter:@escaping () -> Void) {
        comboBoxrunAfter = runAfter
        
        if iscomboBoxcreated == false {
            comboBox.frame = CGRect(x: x, y: y, width: width, height: height)
            view.addSubview(comboBox)
            
            // scroll
            
            let scroll = UIScrollView()
            scroll.frame = CGRect(x: 0, y: height/2, width: width, height: 0)
            scroll.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scroll.contentSize.width = width
            comboBox.addSubview(scroll)
            
            // textfield
            
            let textfield = UITextField()
            textfield.frame = CGRect(x: 0, y: 0, width: width, height: height)
            textfield.backgroundColor = bkcolor
            textfield.textColor = txtcolor
            if defaultTextindex >= 0 {
                textfield.text = list[defaultTextindex]
            }
            textfield.layer.cornerRadius = cornerRadius
            textfield.isUserInteractionEnabled = editable
            textfield.font = UIFont.systemFont(ofSize: fontsize)
            textfield.placeholder = placeholder
            textfield.textAlignment = .center
            comboBox.addSubview(textfield)
            
            // click icon
            let iconbtn = UIView()
            iconbtn.frame = CGRect(x: width - 15, y: 0, width: 15, height: height)
            iconbtn.layer.cornerRadius = cornerRadius
            comboBox.addSubview(iconbtn)
            
            let cgpath = UIBezierPath()
            cgpath.removeAllPoints()
            cgpath.move(to: CGPoint(x: 0, y: height/2 - 5))
            cgpath.addLine(to: CGPoint(x: 14, y: height/2  - 5))
            cgpath.addLine(to: CGPoint(x: 7, y: height/2 + 5))
            cgpath.close()
            
            let triangle = CAShapeLayer()
            triangle.path = cgpath.cgPath
            triangle.fillColor = iconColor.cgColor
            iconbtn.layer.addSublayer(triangle)
            
            iconbtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(comboBoxListOpening)))
            
            // list
            
            var labelh = height/2 + 1
            
            var labelview:[UIView] = []
            var label:[UILabel] = []
            for i in 0..<label.count {label[i].removeFromSuperview()}
            for i in 0..<list.count {
                labelview.append(UIView())
                labelview[i].frame = CGRect(x: 1, y: labelh, width: width - 2, height: 30)
                labelview[i].backgroundColor = listbkcolor
                labelview[i].tag = i
                scroll.addSubview(labelview[i])
                
                label.append(UILabel())
                label[i].frame = CGRect(x: 0, y: 0, width: labelview[i].frame.size.width, height: labelview[i].frame.size.height)
                label[i].text = list[i]
                label[i].tag = i
                label[i].textColor = listTextcolor
                label[i].textAlignment = .center
                labelview[i].addSubview(label[i])
                
                labelh += 31
                scroll.contentSize.height = labelh
                if labelh > 100 {scroll.frame.size.height = 100}
                else{scroll.frame.size.height = labelh}
                scroll.isHidden = true
                labelview[i].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(comboBoxChoose)))
            }
        }
        
        iscomboBoxcreated = true
    }
        
    @objc func comboBoxListOpening(){
        // 0 scroll
        // 1 textfield
        if comboBox.subviews[0].isHidden {
            comboBox.frame.size.height = comboBox.subviews[1].frame.size.height/2 + comboBox.subviews[0].frame.size.height
            comboBox.subviews[0].isHidden = false
        }
        else{
            self.comboBox.subviews[0].isHidden = true
            self.comboBox.frame.size.height = (self.comboBox.frame.size.height - self.comboBox.subviews[0].frame.size.height) * 2
        }
        comboBoxrunAfter()
    }
    @objc func comboBoxChoose(_ tap:UITapGestureRecognizer){
        coreAnimation.Scale(start: 1, end: 0.8, duration: 0.1, repeatCount: 1, autoReverse: true, view: tap.view!)
        
        comboBox.text_comboBox(comboBox.label_comboBox(tap.view!))
        time.delay(milliSec: 100) {
            self.comboBox.subviews[0].isHidden = true
            self.comboBox.frame.size.height = (self.comboBox.frame.size.height - self.comboBox.subviews[0].frame.size.height) * 2
            self.comboBoxrunAfter()
        }
        
    }
    
    
    
    func Input(multiline:Bool, x:CGFloat, y:CGFloat, width:CGFloat, labelheight:CGFloat, inputheight:CGFloat, cornerRadius:CGFloat, fontsize:CGFloat, label:String, labelbkcolor:UIColor, labelcolor:UIColor, inputplaceholder:String, inputbk:UIColor, inputcolor:UIColor, inputborderColor:UIColor, view:UIView) {
        
        
        // view
        var bkframeheight:CGFloat!
        if multiline {
            bkframeheight = labelheight + inputheight + 5
        }
        else{
            bkframeheight = inputheight
        }
        
        input.frame = CGRect(x: x, y: y, width: width, height: bkframeheight)
        view.addSubview(input)
        
        
        // label
        
        let l = UILabel()
        l.frame.origin = CGPoint(x: 0, y: 0)
        l.backgroundColor = labelbkcolor
        l.text = label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: fontsize)
        l.textColor = labelcolor
        l.textAlignment = .center
        l.layer.cornerRadius = cornerRadius
        l.layer.masksToBounds = true
        l.sizeToFit()
        l.frame.size.width = l.frame.size.width + 20
        l.frame.size.height = labelheight
        input.addSubview(l)
        
        
        // textfield
        var inputwidth:CGFloat!
        var inputx:CGFloat!
        var inputy:CGFloat!
        if multiline {
            inputwidth = width
            inputx = 0
            inputy = l.frame.maxY + 5
        }
        else{
            inputwidth = input.frame.size.width - l.frame.size.width
            inputx = l.frame.maxX
            inputy = 0
        }
        
        
        if multiline {
            let t = UITextView.init()
            t.frame = CGRect(x: inputx, y: inputy, width: inputwidth, height: inputheight)
            t.textAlignment = .center
            t.font = UIFont.systemFont(ofSize: fontsize)
            t.layer.borderWidth = 1
            t.layer.borderColor = inputborderColor.cgColor
            t.layer.backgroundColor = inputbk.cgColor
            t.layer.cornerRadius = cornerRadius
            t.keyboardType = UIKeyboardType.default
            input.addSubview(t)
        }
        else{
            let t = UITextField.init()
            t.frame = CGRect(x: inputx, y: inputy, width: inputwidth, height: inputheight)
            t.textAlignment = .center
            t.placeholder = inputplaceholder
            t.layer.borderWidth = 1
            t.layer.borderColor = inputborderColor.cgColor
            t.layer.backgroundColor = inputbk.cgColor
            t.layer.cornerRadius = cornerRadius
            t.keyboardType = UIKeyboardType.default
            input.addSubview(t)
        }
        
        
        
    }
    
    func ClickAbleViewImage(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,image:UIImage,any: Any, Tapfunction:Selector,view:UIView) {
        
        clickAbleViewImage.frame = CGRect(x: x, y: y, width: width, height: height)
        clickAbleViewImage.BackgroundImage(image: image)
        view.addSubview(clickAbleViewImage)
        
        clickAbleViewImage.addGestureRecognizer(UITapGestureRecognizer(target: any, action: Tapfunction))
    }

    
    func LButton(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, title:String,fontSize:CGFloat, any: Any, tapfunction:Selector,cornerRadius:CGFloat, bordercolor:CGColor, bkcolor:UIColor, txtcolor:UIColor, view:UIView) {
        Lbutton.frame = CGRect(x: x, y: y, width: width, height: height)
        Lbutton.backgroundColor = bkcolor
        Lbutton.layer.cornerRadius = cornerRadius
        Lbutton.layer.borderWidth = 1
        Lbutton.layer.borderColor = bordercolor
        view.addSubview(Lbutton)
        
        Lbutton.addGestureRecognizer(UITapGestureRecognizer(target: any, action: tapfunction ))
        
        Lbuttontext.frame = CGRect(x: 0, y: 0, width: Lbutton.frame.size.width, height: Lbutton.frame.size.height)
        Lbuttontext.text = title
        Lbuttontext.font = UIFont.boldSystemFont(ofSize: fontSize)
        Lbuttontext.textColor = txtcolor
        Lbuttontext.textAlignment = .center
        Lbutton.addSubview(Lbuttontext)
        
    }
    
    func drawTriangle(_ p1:CGPoint,_ p2:CGPoint,_ p3:CGPoint,bkcolor:UIColor,borderColor:UIColor,view:UIView){
        cgpath.removeAllPoints()
        triangle.isHidden = false
        
        /*--make shape--*/
        cgpath.move(to: p1)
        cgpath.addLine(to: p2)
        cgpath.addLine(to: p3)
        cgpath.close()
        
        /*--final step--*/
        triangle.path = cgpath.cgPath
        triangle.fillColor = bkcolor.cgColor
        triangle.strokeColor = borderColor.cgColor
        view.layer.addSublayer(triangle)
    }
    func Triangleframe(_ p1:CGPoint,_ p2:CGPoint,_ p3:CGPoint) {
        cgpath.removeAllPoints()
        cgpath.move(to: p1)
        cgpath.addLine(to: p2)
        cgpath.addLine(to: p3)
        cgpath.close()
        triangle.path = cgpath.cgPath
    }
   ////////////////////////////////////////////////
    func ScrollView(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, bkcolor:UIColor, contentwidth:CGFloat, contentheight:CGFloat, view:UIView) {
        scrollview.frame = CGRect(x: x, y: y, width: width, height: height)
        scrollview.backgroundColor = bkcolor
        scrollview.contentSize.width = contentwidth
        scrollview.contentSize.height = contentheight
        view.addSubview(scrollview)
    }
    
    ////////////////////////////////////////////////
    func View(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, bkcolor:UIColor,cornerRadius:CGFloat,border:CGFloat,borderColor:UIColor, view:UIView){
        self.view.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.backgroundColor = bkcolor
        self.view.layer.cornerRadius = cornerRadius
        self.view.layer.borderWidth = border
        self.view.layer.borderColor = borderColor.cgColor
        view.addSubview(self.view)
    }
    
    ////////////////////////////////////////////////
    func Label(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, txt:String, fontsize:CGFloat, bold:Bool, cornerRadius:CGFloat,border:CGFloat,borderColor:UIColor, alignment:NSTextAlignment, bkcolor:UIColor, txtcolor:UIColor, view:UIView) {
           label.frame = CGRect(x: x, y: y, width: width, height: height)
           label.backgroundColor = bkcolor
           label.text = txt
           label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.layer.cornerRadius = cornerRadius;
        label.layer.borderColor = borderColor.cgColor;
        label.layer.borderWidth = border;
        if bold {label.font = .boldSystemFont(ofSize: fontsize)}
        else{label.font = UIFont.systemFont(ofSize: fontsize)}
           label.textColor = txtcolor
           label.textAlignment = alignment
           view.addSubview(label)
       }
    func AutoSizeLabel(x:CGFloat,y:CGFloat,height:CGFloat,txt:String,fontsize:CGFloat,bkcolor:UIColor,txtcolor:UIColor,border:CGFloat,borderColor:UIColor,cornerRadius:CGFloat,alignment:NSTextAlignment,view:UIView) {
        autoSizelabel.frame.origin = CGPoint(x: x, y: y)
        autoSizelabel.backgroundColor = bkcolor
        autoSizelabel.text = txt
        autoSizelabel.numberOfLines = 0
        autoSizelabel.font = UIFont.systemFont(ofSize: fontsize)
        autoSizelabel.textColor = txtcolor
        autoSizelabel.textAlignment = alignment
        autoSizelabel.layer.cornerRadius = cornerRadius
        autoSizelabel.layer.masksToBounds = true
        autoSizelabel.sizeToFit()
        autoSizelabel.frame.size.width = autoSizelabel.frame.size.width
        autoSizelabel.frame.size.height = height
        view.addSubview(autoSizelabel)
    }
    
    func Textfield(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, placeholder:String,border:CGFloat,borderRadius:CGFloat,txtAlign:NSTextAlignment, bordercolor: CGColor,keyboard:UIKeyboardType,textColor:UIColor, bkcolor:UIColor, view:UIView ) {
        txtfield.frame = CGRect(x: x, y: y, width: width, height: height)
        txtfield.textAlignment = txtAlign
        txtfield.textColor = textColor
        txtfield.placeholder = placeholder
        txtfield.layer.borderWidth = border
        txtfield.layer.borderColor = bordercolor
        txtfield.layer.backgroundColor = bkcolor.cgColor
        txtfield.layer.cornerRadius = borderRadius
        txtfield.keyboardType = keyboard
        view.addSubview(txtfield)
    }
    func TextView(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,border:CGFloat,text:String,cornerRadius:CGFloat,borderColor:UIColor,size:CGFloat,weight:UIFont.Weight,bkColor:UIColor,textColor:UIColor,align:NSTextAlignment,view:UIView) {
           txtview.frame = CGRect(x: x, y: y, width: width, height: height)
           txtview.layer.borderWidth = border
           txtview.layer.cornerRadius = cornerRadius
           txtview.layer.borderColor = borderColor.cgColor
           txtview.backgroundColor = bkColor
           txtview.textColor = textColor
           txtview.textAlignment = align
           txtview.font = UIFont.systemFont(ofSize: 20, weight: weight)
           txtview.text = text
           view.addSubview(txtview)
       }
    
    func Button(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, title:String,fontsize:CGFloat, any: Any, function:Selector,cornerRadius:CGFloat, bordercolor:UIColor, bkcolor:UIColor, txtcolor:UIColor, view:UIView) {
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontsize, weight: .regular)
        button.layer.borderWidth = 1
        button.layer.borderColor = bordercolor.cgColor
        button.layer.backgroundColor = bkcolor.cgColor
        button.layer.cornerRadius = cornerRadius
        button.addTarget(any, action: function, for: .touchUpInside)
        button.tintColor = txtcolor
//        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize)
        view.addSubview(button)
    }
    
    func Backgroundimage(src:String ,view: UIView) {
        imag.image = UIImage(named: src)
        imag.contentMode = .scaleToFill
        imag.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imag)
        
        
        imag.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imag.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imag.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imag.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func Image(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,mode:UIView.ContentMode, src: UIImage, view:UIView,imageUrl:String?){
//        imag.image = src
        if let str = imageUrl
        {
            imag.load(url: URL(string: str)!)
        }
        else
        {
           imag.image = src
        }
//        imag.load(url: URL(string: imageUrl)!)
        imag.frame = CGRect(x: x, y: y, width: width, height: height)
        imag.contentMode = mode
        view.addSubview(imag)
        
    }
        func Image(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,mode:UIView.ContentMode, src: UIImage, view:UIView){
            imag.image = src
            imag.frame = CGRect(x: x, y: y, width: width, height: height)
            imag.contentMode = mode
            view.addSubview(imag)
            
        }
    
    
    
    func clickableimage(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat,image: UIImage,cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor, function:Selector, any:Any, view:UIView ) {
        clickableimg.setBackgroundImage(image, for: .normal)
        clickableimg.frame = CGRect(x: x, y: y, width: width, height: height)
        clickableimg.layer.masksToBounds = true
        clickableimg.layer.cornerRadius = cornerRadius
        clickableimg.layer.borderWidth = borderWidth
        clickableimg.layer.borderColor = borderColor.cgColor
        clickableimg.addTarget(any, action: function, for: .touchUpInside)
        view.addSubview(clickableimg)
    }
    
    func clickableimage(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat,image: UIImage,cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor, function:Selector, any:Any,imgurl:String?, view:UIView ) {
        if let str = imgurl
        {
            clickableimg.load(url: URL(string: str)!)
            
        }
        else
        {
            clickableimg.setBackgroundImage(image, for: .normal)
        }
        clickableimg.frame = CGRect(x: x, y: y, width: width, height: height)
        clickableimg.layer.masksToBounds = true
        clickableimg.layer.cornerRadius = cornerRadius
        clickableimg.layer.borderWidth = borderWidth
        clickableimg.layer.borderColor = borderColor.cgColor
        clickableimg.addTarget(any, action: function, for: .touchUpInside)
        view.addSubview(clickableimg)
    }
    
    func simplemessagebox(txt: String,any:Any,okfunction:Selector,view:UIView){
        msgbox.isHidden = false
        msgbox.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        msgbox.backgroundColor = UIColor(red: 28/255, green: 29/255, blue: 30/255, alpha: 0.9)
        view.addSubview(msgbox)
        ////////
        self.view.layer.borderWidth = 1
        self.view.layer.borderColor = UIColor.black.cgColor
        self.view.layer.cornerRadius = 20
        View(x: (x/100)*10, y: (y/100)*30, width: (x/100)*80, height: (y/100)*30, bkcolor: .white, cornerRadius: 0, border: 0, borderColor: .clear, view: msgbox)
        let viewX = self.view.frame.size.width
        let viewY = self.view.frame.size.height
        ////////
        Label(x: (viewX/100)*5, y: (viewY/100)*10, width: (viewX/100)*90, height: (viewY/100)*80, txt: txt,
              fontsize: 20, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: UIColor(red: 19/255, green: 39/255, blue: 39/255, alpha: 1), view: self.view)
        ////////
        Button(x: (x/100)*10, y: self.view.frame.maxY + 20, width: (x/100)*80, height: 40, title: "OK", fontsize: 14, any: any, function: okfunction, cornerRadius: 20, bordercolor: UIColor.black, bkcolor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5), txtcolor: UIColor.black, view: msgbox)
        
        
    }
    
    func optionMessagebox(txt: String,any:Any,okfunction:Selector,cancelfunction:Selector,view:UIView){
        msgbox.isHidden = false
        msgbox.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        msgbox.backgroundColor = UIColor(red: 28/255, green: 29/255, blue: 30/255, alpha: 0.9)
        view.addSubview(msgbox)
        ////////
        self.view.layer.borderWidth = 1
        self.view.layer.borderColor = UIColor.black.cgColor
        self.view.layer.cornerRadius = 20
        View(x: (x/100)*10, y: (y/100)*30, width: (x/100)*80, height: (y/100)*30, bkcolor: .white, cornerRadius: 0, border: 0, borderColor: .clear, view: msgbox)
        let viewX = self.view.frame.size.width
        let viewY = self.view.frame.size.height
        ////////
        Label(x: (viewX/100)*5, y: (viewY/100)*10, width: (viewX/100)*90, height: (viewY/100)*80, txt: txt,
              fontsize: 20, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: UIColor(red: 19/255, green: 39/255, blue: 39/255, alpha: 1), view: self.view)
        ////////
        let a = UI()
        a.Button(x: (x/100)*10, y: self.view.frame.maxY + 20, width: (x/100)*80, height: 40, title: "OK", fontsize: 14, any: any, function: okfunction, cornerRadius: 20, bordercolor: UIColor.black, bkcolor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5), txtcolor: UIColor.black, view: msgbox)
        let b = UI()
        b.Button(x: (x/100)*10, y: a.button.frame.maxY + 5, width: (x/100)*80, height: 40, title: "Cancel", fontsize: 14, any: any, function: cancelfunction, cornerRadius: 20, bordercolor: UIColor.black, bkcolor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5), txtcolor: UIColor.black, view: msgbox)
        
        
    }
    
    
}






extension UIButton {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.setBackgroundImage(image, for: .normal)
                    }
                }
            }
        }
    }
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}




/*---------------------------- Extension UIview ---------------------------*/


extension UIView {
    
    func textfield_comboBox() -> UITextField {
        // 0 scroll
        // 1 textfield
        return self.subviews[1] as! UITextField
    }
    
    func text_comboBox() -> String {
        // 0 scroll
        // 1 textfield
        let txtfield:UITextField = self.subviews[1] as! UITextField
        return txtfield.text!
    }
    
    func text_comboBox(_ text:String) {
        // 0 scroll
        // 1 textview
        let txtfield:UITextField = self.subviews[1] as! UITextField
        txtfield.text = text
    }
    
    func  label_comboBox(_ labelview:UIView) -> String {
        // 0 scroll
        var label:UILabel!
        let scroll:UIScrollView = self.subviews[0] as! UIScrollView
        for view in scroll.subviews {
            if labelview ==  view {
                label = view.subviews[0] as? UILabel
            }
        }
        return label.text!
    }
    
    func color_inputLabel(_ color:UIColor) {
        let label:UILabel = self.subviews[0] as! UILabel
        label.textColor = color
    }
    
    func backgroundcolor_inputLabel(_ color:UIColor) {
        let label:UILabel = self.subviews[0] as! UILabel
        label.backgroundColor = color
    }
    
    func Text_input(_ isTextField:Bool,_ text:String) {
        if isTextField {
            let t:UITextField = self.subviews[1] as! UITextField
            t.text = text
        }
        else{
            let t:UITextView = self.subviews[1] as! UITextView
            t.text = text
        }
    }
    
    func textField_input() -> UITextField {
        return self.subviews[1] as! UITextField
    }
    
    func textView_input() -> UITextView {
        return self.subviews[1] as! UITextView
    }
    
    func Text_input(_ istextField:Bool) -> String {
        if istextField {
            let text:UITextField = self.subviews[1] as! UITextField
            return text.text!
        }
        else{
            let text:UITextView = self.subviews[1] as! UITextView
            return text.text!
        }
        
    }
    
    func BackgroundImage(image:UIImage) {
        UIGraphicsBeginImageContext(self.frame.size)
        image.draw(in: self.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.backgroundColor = UIColor.init(patternImage: image!)
    }
    
    func Text(_ string:String) {
        let label:UILabel =  self.subviews[0] as! UILabel
        label.text = string
    }

    func text() -> String {
        let label:UILabel =  self.subviews[0] as! UILabel
        return label.text!
    }
    
    func textcolor(_ color:UIColor) {
        let label:UILabel =  self.subviews[0] as! UILabel
        label.textColor = color
    }
    
    func removeText() {
        let label:UILabel =  self.subviews[0] as! UILabel
        label.removeFromSuperview()
    }
    
}













/*---------------------------- Extension String ---------------------------*/


extension String {
    var stringWidth: CGFloat {
        let constraintRect = CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude)
        let boundingBox = self.trimmingCharacters(in: .whitespacesAndNewlines).boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return boundingBox.width
    }
    
    var stringHeight: CGFloat {
        let constraintRect = CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude)
        let boundingBox = self.trimmingCharacters(in: .whitespacesAndNewlines).boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return boundingBox.height
    }
}






















/*---------------------------- Extension UITextField ---------------------------*/

struct UITextFieldClass {
    static var inputDataType:[Int:Any] = [:]
}
extension UITextField {
    
    
    
    func inputDataType(_ dataType:Any) /* eg. dataType: Double() */ {
        UITextFieldClass.inputDataType[addressOF(self)] = dataType
        self.addTarget(self, action: #selector(inputDataType_onEditChanged), for: .editingChanged)
        
    }
    
    @objc func inputDataType_onEditChanged(){
        
        if type(of: UITextFieldClass.inputDataType[addressOF(self)]!) == Int.self && self.text! != "" {
            if (self.text!.last! != "0")
                && (self.text!.last! != "1")
                && (self.text!.last! != "2")
                && (self.text!.last! != "3")
                && (self.text!.last! != "4")
                && (self.text!.last! != "5")
                && (self.text!.last! != "6")
                && (self.text!.last! != "7")
                && (self.text!.last! != "8")
                && (self.text!.last! != "9") {self.text!.removeLast()}
        }
        else if type(of: UITextFieldClass.inputDataType[addressOF(self)]!) == Double.self && self.text! != "" {
            
            if (self.text?.filter{$0 == "."}.count)!>1 {self.text!.removeLast()}
            if self.text! == "." {self.text = "0."}
            
            if (self.text!.last! != "0")
                && (self.text!.last! != "1")
                && (self.text!.last! != "2")
                && (self.text!.last! != "3")
                && (self.text!.last! != "4")
                && (self.text!.last! != "5")
                && (self.text!.last! != "6")
                && (self.text!.last! != "7")
                && (self.text!.last! != "8")
                && (self.text!.last! != "9")
                && (self.text!.last! != ".") {self.text!.removeLast()}

        }

    }
    
    
}






























































































// MARK:- TableView Delegate
class TVC:UIView,UITableViewDelegate,UITableViewDataSource {
    var numberOFrows = Int()
    var cellheight = CGFloat()
    var CellHeight:() -> () = {}
    var cellview:() -> () = {}
    var ondelete:() -> () = {}
    var cell = UITableViewCell()
    var index = Int()
    var editing = false
    
    func Cellheight(at:Int,height:CGFloat,oldheight:CGFloat) {
        if index == at {cellheight = height}
        else{cellheight = oldheight}
    }
    func use(editing:Bool,numberOFrows:Int,cellheight:CGFloat,CellHeight:@escaping () -> Void,Cellview:@escaping () -> Void,onDel:@escaping () -> Void) {
        self.editing = editing
        self.numberOFrows = numberOFrows
        self.cellheight = cellheight
        self.CellHeight = {CellHeight()}
        self.cellview = {Cellview()}
        self.ondelete = {onDel()}
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOFrows
    }
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        self.index = indexPath.row
        self.cellview()
        return cell
    }
    
    //height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        index = indexPath.row
        CellHeight()
        return cellheight
    }
    
    
    // delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return editing
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        index = indexPath.row
        if editingStyle == .delete {
            self.ondelete()
        }
    }
    
}





























// MARK:- Core Animation
/*----------------------- Core Animation -----------------------------*/
let coreAnimation = CA.use
class CA {
    
    static let use = CA()
    
    let position = CABasicAnimation(keyPath: "position")
    let scale = CABasicAnimation(keyPath: "transform.scale")
    let rotate = CABasicAnimation(keyPath: "transform.rotation")
    let opacity = CABasicAnimation(keyPath: "opacity")

    
    
    
    /*----------- position core animation -----------*/
    
    func Position(sX:CGFloat,sY:CGFloat,eX:CGFloat,eY:CGFloat,autorerse:Bool,repeatCount:Float,duration:Double,view:UIView) {
        position.fromValue = CGPoint(x: sX, y: sY)
        position.toValue = CGPoint(x: eX, y: eY)
        position.duration = duration
        position.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        position.autoreverses = autorerse
        position.repeatCount = repeatCount
        view.layer.add(position, forKey: "position")
        //        view.layer.position = CGPoint(x: eX, y: eY)
        
    }
    
    func stopPosition(_ startingX:CGFloat,_ startingY:CGFloat,view:UIView) {
        position.repeatCount = 0
        position.duration = 0
        position.toValue = CGPoint(x: startingX, y: startingY)
        view.layer.add(position, forKey: "position")
    }
    
    
    /*------------- scale core animation -------------*/
    
    func Scale(start:CGFloat,end:CGFloat,duration:Double,repeatCount:Float,autoReverse:Bool,view:UIView) {
        scale.fromValue = start
        scale.toValue = end
        scale.duration = duration
        scale.autoreverses = autoReverse
        scale.repeatCount = repeatCount
        view.layer.add(scale, forKey: "transform.scale")
    }
    
    func stopScale(view:UIView) {
        scale.repeatCount = 0
        scale.duration = 0
        scale.toValue = 1
        view.layer.add(scale, forKey: "transform.scale")
    }
    
    
    
    /*------------- rotate core animation -------------*/
    
    func Rotate(start:CGFloat,end:CGFloat,duration:Double,autoReverses:Bool,repeatCount:Float,view:UIView) {
        rotate.fromValue = Radian(start)
        rotate.toValue = Radian(end)
        rotate.duration = duration
        rotate.autoreverses = autoReverses
        rotate.repeatCount = repeatCount
        view.layer.add(rotate, forKey: "transform.rotation")
    }
    
    func Radian(_ degree: CGFloat) -> CGFloat {
        return degree * .pi/180
    }
    
    func stopRotation(view:UIView) {
        rotate.repeatCount = 0
        rotate.duration = 0
        rotate.toValue = Radian(0)
        view.layer.add(rotate, forKey: "transform.rotation")
    }
    
    
    
    
    
    /*------------- opacity core animation -------------*/
    
    func Opacity(start:CGFloat,end:CGFloat,duration:Double,repeatCount:Float,autoreverses:Bool,view:UIView) {
        opacity.fromValue = start
        opacity.toValue = end
        opacity.duration = duration
        opacity.autoreverses = autoreverses
        opacity.repeatCount = repeatCount
        view.layer.add(opacity, forKey: "opacity")
    }
    
    func stopOpacity(view:UIView) {
        opacity.repeatCount = 0
        opacity.duration = 0
        opacity.toValue = 1
        view.layer.add(opacity, forKey: "opacity")
    }
    
    
    
    
}
