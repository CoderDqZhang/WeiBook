//
//  AboutUsViewController.swift
//  LiangPiao
//
//  Created by Zhang on 09/11/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    var logoImage: UIImageView!
    var versionLabel: UILabel!
    var deverloperLabel: UITextView!
    var protoclBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.view.backgroundColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        let leftImage = UIImage.init(named: "Icon_Back_Normal")
        let backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x: 15, y: 20, width: 40, height: 40)
        backButton.addTarget(self, action: #selector(UIViewController.backBtnPress(_:)), for: .touchUpInside)
        backButton.setImage(leftImage, for: UIControlState())
        self.view.addSubview(backButton)
        
        logoImage = UIImageView.init()
        logoImage.frame = CGRect.init(x: SCREENWIDTH / 2 - 50, y: SCREENHEIGHT / 2 - 150, width: 100, height: 100)
        logoImage.image = UIImage.init(named: "about_logo.png")
        self.view.addSubview(logoImage)
        
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        versionLabel = UILabel.init()
        versionLabel.frame = CGRect.init(x: 0, y: SCREENHEIGHT / 2 - 40, width: SCREENWIDTH, height: 20)
        versionLabel.textAlignment = .center
        versionLabel.text = "Version \(version)"
        versionLabel.font = App_Theme_PinFan_R_14_Font
        versionLabel.textColor = UIColor.white
        self.view.addSubview(versionLabel)
        
        let str = "-\nfounder & director - weidong & xuhui\ndeveloper - dequan & dapeng\ndesign - dequan\nmarketing - yiping"
        let attribute = NSMutableAttributedString(string: str)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 5
        attribute.addAttributes([NSParagraphStyleAttributeName:paragraph], range: NSRange.init(location: 0, length: str.length))
        
        deverloperLabel = UITextView.init()
        deverloperLabel.backgroundColor = UIColor.clear
        deverloperLabel.attributedText = attribute
        deverloperLabel.textAlignment = .center
        deverloperLabel.textColor = UIColor.white
        deverloperLabel.isEditable = false
        deverloperLabel.frame = CGRect.init(x: 15, y: SCREENHEIGHT / 2, width: SCREENWIDTH - 30, height: 140)
        self.view.addSubview(deverloperLabel)
        
        protoclBtn = UIButton.init(type: .custom)
        protoclBtn.layer.cornerRadius = 2
        protoclBtn.frame = CGRect.init(x: SCREENWIDTH / 2 - 40, y: SCREENHEIGHT - 60, width: 80, height: 20)
        protoclBtn.titleLabel?.font = App_Theme_PinFan_R_14_Font
        protoclBtn.setTitle("使用协议", for: .normal)
        protoclBtn.layer.masksToBounds = true
        protoclBtn.reactive.controlEvents(.touchUpInside).observe { (action) in
            NavigationPushView(self, toConroller: UserProtocolViewController())
        }
        self.view.addSubview(protoclBtn)
        
        if IPHONE4 {
            logoImage.snp.updateConstraints({ (make) in
                make.top.equalTo(self.view.snp.top).offset(74)
            })
            versionLabel.snp.updateConstraints({ (make) in
                make.top.equalTo(self.logoImage.snp.bottom).offset(30)
            })
        }else if IPHONE5 {
            logoImage.snp.updateConstraints({ (make) in
                make.top.equalTo(self.view.snp.top).offset(94)
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
