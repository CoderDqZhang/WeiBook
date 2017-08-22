//
//  DiscoverCreateViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/10.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import Photos

class DiscoverCreateViewController: BaseViewController {
    
    var model:ServerBookModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: DiscoverCreateViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [CreateDataTableViewCell.self,AddBookTableViewCell.self,BookInfoTableViewCell.self,GloableLableDetailLabelImageCell.self], controller: self)
        self.setUpView()
        self.setUpNavigationItem()
        self.bindLogic()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        
    }
    
    func bindLogic(){
        if self.model != nil {
            (self.viewModel as! DiscoverCreateViewModel).model = self.model
        }
    }
    
    func setUpNavigationItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(DiscoverCreateViewController.leftBarItemPress))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "发布", style: .plain, target: self, action: #selector(DiscoverCreateViewController.rightBarItemPress))
    }

    func leftBarItemPress(){
        UIAlertController.shwoAlertControl(self, style: .alert, title: "您确定取消此次编辑吗？", message: "取消后数据不保存", titles: nil, cancel: "稍等一会", doneTitle: "确定", cancelAction: { 
            
        }) { (str) in
            self.navigationController?.dismiss(animated: true, completion: {
                
            })
        }
    }
    
    func rightBarItemPress(){
        (self.viewModel as! DiscoverCreateViewModel).rigthBarItemPress()
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
            let picker = DXPhotoPickerController()
            picker.photoPickerDelegate = self
            picker.imageFlowVC.selectedAssetsArray = (self.viewModel as! DiscoverCreateViewModel).selectedAssetsArray
            self.present(picker, animated: true, completion: nil)
        }
        controller.addAction(cancel)
        controller.addAction(album)
        self.present(controller, animated: true) {
            
        }
        
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

extension DiscoverCreateViewController : UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        let image = info[UIImagePickerControllerEditedImage] as! UIImage
//        _ = SaveImageTools.sharedInstance.saveImage("photoImage.png", image: image, path: "headerImage")
        picker.dismiss(animated: true, completion: nil)
    }
}

extension DiscoverCreateViewController : UINavigationControllerDelegate {
    
}

extension DiscoverCreateViewController : DXPhotoPickerControllerDelegate {
    // MARK: DXPhototPickerControllerDelegate
    func photoPickerDidCancel(photoPicker: DXPhotoPickerController) {
        photoPicker.dismiss(animated: true, completion: nil)
    }
    
    func photoPickerController(photoPicker photosPicker: DXPhotoPickerController?,
                               sendImages: [PHAsset]?,
                               isFullImage: Bool) {
        
        (self.viewModel as! DiscoverCreateViewModel).imagePickerDone(sendImages: sendImages!)
        photosPicker?.dismiss(animated: true, completion: nil)
        
    }
}
