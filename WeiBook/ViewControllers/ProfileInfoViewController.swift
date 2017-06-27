//
//  ProfileInfoViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/23.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class ProfileInfoViewController: BaseViewController {

    var cityPickerView:ZHPickView!
    var sexPickerView:ZHPickView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setUpNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        
        self.bindViewModel(viewModel: ProfileInfoViewModel.init(), controller: self)
        self.setUpTableView(style: .grouped, cells: [ProfileInfoHeaderTableViewCell.self,GloableImageLableTextFieldImageCell.self,GloableLableDetailLabelImageCell.self], controller: self)
    }
    
    func setUpNavigationBar(){
        self.navigationItem.title = (viewModel as! ProfileInfoViewModel).navigationTitle
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "保存", style: .plain, target: self, action: #selector(ProfileInfoViewController.rightNavigationItemPress))
    }
    
    func rightNavigationItemPress(){
        (viewModel as! ProfileInfoViewModel).saveUserInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func presentImagePickerView(){
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "取消", style: .cancel) { (cancelAction) in
            
        }
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            let cameraAction = UIAlertAction(title: "拍照", style: .default) { (cancelAction) in
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = true
                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                self.present(imagePicker, animated: true) {
                    
                }
            }
            controller.addAction(cameraAction)
        }
        
        
        let album = UIAlertAction(title: "相册", style: .default) { (cancelAction) in
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true) {
                
            }
        }
        controller.addAction(cancel)
        controller.addAction(album)
        self.present(controller, animated: true) {
            
        }
        
    }

    
    func showCityPickerView(){
        self.view.endEditing(true)
        if cityPickerView == nil {
            cityPickerView = ZHPickView(pickviewWithPlistName: "city", isHaveNavControler: false)
            cityPickerView.setPickViewColer(UIColor.white)
            cityPickerView.setTintColor(UIColor.white)
            cityPickerView.tag = 2
            cityPickerView.setToolbarTintColor(UIColor.white)
            cityPickerView.setTintFont(App_Theme_PinFan_R_13_Font, color: UIColor.init(hexString: App_Theme_384249_Color))
            cityPickerView.delegate = self
        }
        cityPickerView.show()
    }
    
    func showSexPickerView(){
        if sexPickerView == nil {
            sexPickerView = ZHPickView(pickviewWith: ["男","女"], isHaveNavControler: false)
            sexPickerView.setPickViewColer(UIColor.white)
            sexPickerView.setPickViewColer(UIColor.white)
            sexPickerView.setTintColor(UIColor.white)
            sexPickerView.tag = 1
            sexPickerView.setToolbarTintColor(UIColor.white)
            sexPickerView.setTintFont(App_Theme_PinFan_R_13_Font, color: UIColor.init(hexString: App_Theme_384249_Color))
            sexPickerView.delegate = self
        }
        
        sexPickerView.show()
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

extension ProfileInfoViewController : ZHPickViewDelegate {
    func toobarDonBtnHaveClick(_ pickView: ZHPickView!, resultString: String!) {
        print(resultString)
        if pickView.tag == 1 {
            if KWINDOWDS().viewWithTag(2) != nil {
                cityPickerView.remove()
            }
            UserInfoModel.shareInstance().tails.userInfo.sex = resultString
            (viewModel as! ProfileInfoViewModel).detailLabelTexts[0].replaceObject(at: 3, with: resultString)
            self.tableView.reloadRows(at: [IndexPath.init(row: 3, section: 1)], with: .automatic)
        }else{
            if KWINDOWDS().viewWithTag(1) != nil {
                sexPickerView.remove()
            }
            UserInfoModel.shareInstance().tails.userInfo.city = resultString! as NSObject
            (viewModel as! ProfileInfoViewModel).detailLabelTexts[0].replaceObject(at: 2, with: resultString)
            self.tableView.reloadRows(at: [IndexPath.init(row: 2, section: 1)], with: .automatic)
        }
    }
}

extension ProfileInfoViewController : UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        _ = SaveImageTools.sharedInstance.saveImage("photoImage.png", image: image, path: "headerImage")
        let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! ProfileInfoHeaderTableViewCell
        cell.updateImage(image: image)
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ProfileInfoViewController : UINavigationControllerDelegate {
    
}
