//
//  AboutUsViewController.swift
//  LiangPiao
//
//  Created by Zhang on 09/11/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var deverloperLabel: UITextView!
    @IBOutlet weak var protoclBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.talKingDataPageName = "关于我们"
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        let leftImage = UIImage.init(named: "Icon_Back_Normal")
        let backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x: 15, y: 20, width: 40, height: 40)
        backButton.addTarget(self, action: #selector(UIViewController.backBtnPress(_:)), for: .touchUpInside)
        backButton.setImage(leftImage, for: UIControlState())
        self.view.addSubview(backButton)
        
        
        let str = "-\nfounder & director - rancan\ndeveloper - dequan & liuqiang\ndesign - yangtong\nmarketing - zhaoming"
        let attribute = NSMutableAttributedString(string: str)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 5
        attribute.addAttributes([NSParagraphStyleAttributeName:paragraph], range: NSRange.init(location: 0, length: str.length))
        deverloperLabel.attributedText = attribute
        deverloperLabel.textAlignment = .center
        deverloperLabel.textColor = UIColor.white
        deverloperLabel.isEditable = false
        
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        versionLabel.text = "Version \(version)"
        
        protoclBtn.layer.cornerRadius = 2
        protoclBtn.layer.masksToBounds = true
        protoclBtn.reactive.controlEvents(.touchUpInside).observe { (action) in
            NavigationPushView(self, toConroller: UserProtocolViewController())
        }
        
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
