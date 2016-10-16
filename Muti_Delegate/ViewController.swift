//
//  ViewController.swift
//  Muti_Delegate
//
//  Created by 刘隆昌 on 16/10/16.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SomeManager.shareInstance().addDelegate(delegate: self as SomeManagerDelegate)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        SomeManager.shareInstance().addDelegate(delegate: self as SomeManagerDelegate)
        SomeManager.shareInstance().action()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension ViewController:SomeManagerDelegate{


    func callBack() {
        title = NSStringFromClass(classForCoder)
    }

    func callback(msg: [String : String]) {
        print(msg)
    }

}







