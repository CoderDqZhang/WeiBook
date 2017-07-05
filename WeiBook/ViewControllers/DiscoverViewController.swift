//
//  DiscoverViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/19.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {

    var segmentedControl:NYSegmentedControl!
    var discoverNew:DiscoverNewViewController!
    var discoverHot:DiscoverHotViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpNavigaitonItem()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigaitonItem() {
        segmentedControl = NYSegmentedControl.init(items: ["最新","最热"])
        segmentedControl.addTarget(self, action: #selector(DiscoverViewController.segmetedController(tag:)), for: .valueChanged)
        segmentedControl.selectedTitleFont = App_Theme_PinFan_R_15_Font!
        segmentedControl.titleFont = App_Theme_PinFan_L_14_Font!
        segmentedControl.titleTextColor = UIColor.init(hexString: App_Theme_DDE0E5_Color);
        segmentedControl.selectedTitleTextColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        segmentedControl.segmentIndicatorBackgroundColor = UIColor.init(hexString: App_Theme_594CA8_Color)
        segmentedControl.backgroundColor = UIColor.init(hexString: App_Theme_7169A5_Color)
        segmentedControl.borderWidth = 0.0;
        segmentedControl.drawsSegmentIndicatorGradientBackground = true;
        segmentedControl.segmentIndicatorBorderWidth = 0.0;
        segmentedControl.segmentIndicatorInset = 1.0;
        segmentedControl.segmentIndicatorBorderColor = UIColor.init(hexString: App_Theme_594CA8_Color);
        segmentedControl.cornerRadius = 15.0;
        segmentedControl.usesSpringAnimations = true;
        segmentedControl.sizeToFit()
        // Add the control to your view
        self.navigationItem.titleView = self.segmentedControl;
    }
    
    func setUpView(){
        discoverNew = DiscoverNewViewController()
        self.discoverNew.view.frame = CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT - 49)
        self.view.addSubview(self.discoverNew.view)
        self.addChildViewController(discoverNew)
        
        discoverHot = DiscoverHotViewController()
        self.discoverHot.view.frame = CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT - 64 - 49)
        self.addChildViewController(discoverHot)
    }
    
    func segmetedController(tag:UISegmentedControl){
        let index = tag.selectedSegmentIndex
        switch index {
        case 0:
            self.view.addSubview(self.discoverNew.view)
            self.discoverNew.didMove(toParentViewController: self)
        default:
            self.view.addSubview(self.discoverHot.view)
            self.discoverNew.didMove(toParentViewController: self)
        }
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
