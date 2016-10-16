//
//  SomeManager.swift
//  Muti_Delegate
//
//  Created by 刘隆昌 on 16/10/16.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import UIKit

@objc protocol SomeManagerDelegate{
    func callBack()
    @objc optional func callback(msg:[String:String])
}

class SomeManager: NSObject {

    static let instance = SomeManager()
    static func shareInstance()->SomeManager{
        return instance
    }
    
    func action(){
        operateDelegate { (delegate) in
            
            if let myDelegate = delegate as? SomeManagerDelegate{
            
                myDelegate.callBack()
                myDelegate.callback?(msg: ["msg":"hello world!"])
                
            }
            
        }
    
    }
    
    
    func addDelegate(delegate:SomeManagerDelegate){
        super.addDelegateObj(delegate: delegate as AnyObject?)
    }
    
    
}
