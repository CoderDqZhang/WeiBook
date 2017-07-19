//
//  AddBookCommentViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/11.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import Photos

class AddBookCommentViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: AddBookCommentViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GloableImageLableDetailImageCell.self,GloableImageLableSwitchCell.self,CreateDataTableViewCell.self,RecordTableViewCell.self], controller: self)
        self.setUpNavigaitonItem()
        // Do any additional setup after loading the view.
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
            picker.imageFlowVC.selectedAssetsArray = (self.viewModel as! AddBookCommentViewModel).selectedAssetsArray
            self.present(picker, animated: true, completion: nil)
        }
        controller.addAction(cancel)
        controller.addAction(album)
        self.present(controller, animated: true) {
            
        }
        
    }
    
    func setUpNavigaitonItem(){
        self.navigationItem.title = "添加评论"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一步", style: .plain, target: self, action: #selector(AddBookCommentViewController.rightBarItemPress))
    }

    
    func rightBarItemPress(){
        (self.viewModel as! AddBookCommentViewModel).rightBarItemPress()
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

extension AddBookCommentViewController : UIImagePickerControllerDelegate {
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

extension AddBookCommentViewController : UINavigationControllerDelegate {
    
}

extension AddBookCommentViewController : DXPhotoPickerControllerDelegate {
    // MARK: DXPhototPickerControllerDelegate
    func photoPickerDidCancel(photoPicker: DXPhotoPickerController) {
        photoPicker.dismiss(animated: true, completion: nil)
    }
    
    func photoPickerController(photoPicker photosPicker: DXPhotoPickerController?,
                               sendImages: [PHAsset]?,
                               isFullImage: Bool) {
        
        (self.viewModel as! AddBookCommentViewModel).imagePickerDone(sendImages: sendImages!)
        photosPicker?.dismiss(animated: true, completion: nil)
        
    }
}

