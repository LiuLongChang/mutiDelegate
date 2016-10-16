//
//  NSObject+Delegate.swift
//  Muti_Delegate
//
//  Created by 刘隆昌 on 16/10/16.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import UIKit



private var delegateBridgesKey = "delegateBridgesKey"

class WeakObjectBridge: NSObject {
    
    weak var weakObject: AnyObject?
    override init() {
        super.init()
    }
    
    init(object:AnyObject?) {
        super.init()
        weakObject = object
    }
    
    
}

extension NSObject{

    
    private var delegateBridges : Array<WeakObjectBridge> {
    
        get{
            var bridges = objc_getAssociatedObject(self, &delegateBridgesKey)
            if bridges == nil {
                bridges = Array<WeakObjectBridge>()
                objc_setAssociatedObject(self, &delegateBridgesKey, bridges, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
            return bridges as! Array<WeakObjectBridge>
        }
    
        set(newValue){
            objc_setAssociatedObject(self, &delegateBridgesKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    
    }
    
    
    
    func addDelegateObj(delegate:AnyObject?){
        var exist = false
        for (index,weakObjectBridge) in self.delegateBridges.enumerated().reversed(){
            if let weakObj = weakObjectBridge.weakObject {
                if delegate?.isEqual(weakObj) == true {
                    exist = true
                    break
                }
            }else{
                self.delegateBridges.remove(at: index)
            }
        }
        
        if exist == false {
            self.delegateBridges.append(WeakObjectBridge(object:delegate))
        }
        
    }
    
    
    
    
    
    func removeDelegate(delegate:NSObject){
    
        for (index,weakObjectBridge) in self.delegateBridges.enumerated().reversed() {
            if delegate.isEqual(weakObjectBridge.weakObject) == true {
                self.delegateBridges.remove(at: index)
                break
            }
        }
        
    }
    
    
    
    
    func operateDelegate(cb: @escaping (_ delegate:AnyObject?) -> ()){
    
        for weakObjectBridge in self.delegateBridges{
            
            DispatchQueue.main.async {
                cb(weakObjectBridge.weakObject)
            }
        }
    
    }
    
    
    
    
    
    

}
