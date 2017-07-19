//
//  RecordTableViewCell.swift
//  WeiBook
//
//  Created by Zhang on 2017/7/19.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    var startButton:UIButton!
    var stopButton:UIButton!
    var playButton:UIButton!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        startButton = UIButton.init(type: .custom)
        startButton.setTitle("开始录制", for: .normal)
        startButton.setTitleColor(UIColor.black, for: .normal)
        self.contentView.addSubview(startButton)
        
        
        stopButton = UIButton.init(type: .custom)
        stopButton.setTitle("停止录制", for: .normal)
        stopButton.setTitleColor(UIColor.black, for: .normal)
        self.contentView.addSubview(stopButton)

        
        playButton = UIButton.init(type: .custom)
        playButton.setTitle("播放", for: .normal)
        playButton.setTitleColor(UIColor.black, for: .normal)
        self.contentView.addSubview(playButton)

        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            startButton.snp.makeConstraints({ (make) in
                make.left.equalTo(self.contentView.snp.left).offset(0)
                make.right.equalTo(stopButton.snp.left).offset(0)
                make.top.equalTo(self.contentView.snp.top).offset(0)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
                make.width.equalTo(SCREENWIDTH/3)
            })
            stopButton.snp.makeConstraints({ (make) in
                make.left.equalTo(self.startButton.snp.right).offset(0)
                make.right.equalTo(playButton.snp.left).offset(0)
                make.top.equalTo(self.contentView.snp.top).offset(0)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
                make.width.equalTo(SCREENWIDTH/3)
            })
            playButton.snp.makeConstraints({ (make) in
                make.left.equalTo(self.stopButton.snp.right).offset(0)
                make.right.equalTo(contentView.snp.right).offset(0)
                make.top.equalTo(self.contentView.snp.top).offset(0)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
                make.width.equalTo(SCREENWIDTH/3)
            })
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
