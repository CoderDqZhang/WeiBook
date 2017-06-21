//
//  NSTimer.swift
//  LiangPiao
//
//  Created by Zhang on 12/11/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
public typealias TimerExcuteClosure = @convention(block)()->()

extension Timer{
    public class func YQ_scheduledTimerWithTimeInterval(_ ti:TimeInterval, closure:TimerExcuteClosure, repeats yesOrNo: Bool) -> Timer{
        return self.scheduledTimer(timeInterval: ti, target: self, selector: #selector(Timer.excuteTimerClosure(_:)), userInfo: unsafeBitCast(closure, to: AnyObject.self), repeats: true)
    }
    
    class func excuteTimerClosure(_ timer: Timer)
    {
        let closure = unsafeBitCast(timer.userInfo, to: TimerExcuteClosure.self)
        closure()
    }
}
