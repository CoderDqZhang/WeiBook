//
//  QRCodeViewController.swift
//  WeiBook
//
//  Created by Zhang on 2017/6/26.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit
import AVFoundation

let ScannerWidht:CGFloat = 280

class QRCodeViewController: BaseViewController {

    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    var maskView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavigationItem()
        self.bindViewModel(viewModel: QRCodeViewModel(), controller: self)
        self.setUpView()
        // Do any additional setup after loading the view.
    }

    func setUpNavigationItem(){
        self.navigationController?.navigationBar.barTintColor = UIColor.init(hexString: App_Theme_6B747B_Color, andAlpha: 0)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: App_Theme_6B747B_Color, andAlpha: 0), size: CGSize(width: SwifterSwift.screenWidth, height: 64)), for: .default)
        self.navigationController?.navigationBar.isTranslucent  = true
    }
    
    func setUpView(){
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter.
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            //添加输出设备
            let captureMetadataOutput = AVCaptureMetadataOutput()
            
            captureSession?.addOutput(captureMetadataOutput)
            // 一般这几种条码扫描就够用
            captureMetadataOutput.metadataObjectTypes = [
                AVMetadataObjectTypeEAN13Code,
                AVMetadataObjectTypeEAN8Code,
                AVMetadataObjectTypeCode128Code,
                AVMetadataObjectTypeQRCode
            ]
            captureMetadataOutput.rectOfInterest = CGRect.init(x: 0, y: 0, width: SwifterSwift.screenWidth , height: SwifterSwift.screenHeight)
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            captureSession?.startRunning()
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        let scanView = ScanView.init(frame: CGRect.init(x: 0, y: 0, width: SwifterSwift.screenWidth, height: SwifterSwift.screenHeight), cropRect: CGRect.init(x: (SwifterSwift.screenWidth - ScannerWidht) / 2, y: (SwifterSwift.screenHeight - ScannerWidht) / 2, width: ScannerWidht, height: ScannerWidht))
        scanView.lightButton.reactive.controlEvents(.touchUpInside).observe { (button) in
            self.openLight(open: !self.isLightOpened())
        }
        self.view.addSubview(scanView)
    }
    
    let kMargin = CGFloat(50)
    
    
    func setupMaskView() {
        
        
        
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

extension QRCodeViewController : AVCaptureMetadataOutputObjectsDelegate {
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        print(captureOutput)
        print(metadataObjects)
        print(connection)
        // 检查时候捕获到数据
        if metadataObjects == nil || metadataObjects.count == 0 {
            UIAlertController.shwoAlertControl(self, style: .alert, title: "没有读取到数据", message: nil, titles: nil, cancel: nil, doneTitle: "确定", cancelAction: {
                
            }, doneAction: { str in
                
            })
            return
        }
        
        // 获取数据
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        // 如果获取到的数据类型是QRCode
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            qrCodeFrameView?.frame = barCodeObject.bounds;
            
            if metadataObj.stringValue != nil {
                print(metadataObj.stringValue)
            }
        }
        
        if metadataObj.type == AVMetadataObjectTypeEAN13Code {
            let controller = AddBookViewController()
            controller.isbn = metadataObj.stringValue
            NavigationPushView(self, toConroller: controller)
        }
        captureSession?.stopRunning()
    }
}

extension QRCodeViewController {
    ///判断闪光灯是否打开
    func isLightOpened()->Bool{
        
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        if !(device?.hasTorch)!{
            return false
        }else{
            if device?.torchMode == AVCaptureTorchMode.on{//闪光灯已经打开
                return true
            }else{
                return false
            }
        }
    }
    ///打开闪光灯的方法
    func openLight(open:Bool){
        
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        if !(device?.hasTorch)!{
            UIAlertView(title: "提示", message:"闪光灯故障", delegate:nil, cancelButtonTitle: "确定").show()
        }else{
            if open{//打开
                if  device!.torchMode != AVCaptureTorchMode.on || device?.flashMode != AVCaptureFlashMode.on {
                    do{
                        try device?.lockForConfiguration()
                        device?.torchMode = AVCaptureTorchMode.on
                        device?.flashMode = AVCaptureFlashMode.on
                        device?.unlockForConfiguration()
                    }catch
                    {
                        print(error)
                    }
                }
            }else{
                //关闭闪光灯
                if  device!.torchMode != AVCaptureTorchMode.off || device?.flashMode != AVCaptureFlashMode.off {
                    
                    do{
                        try device?.lockForConfiguration()
                        device?.torchMode = AVCaptureTorchMode.off
                        device?.flashMode = AVCaptureFlashMode.off
                        device?.unlockForConfiguration()
                        
                    }catch
                    {
                        print(error)
                        
                    }
                }
            }
        }
    }
}
