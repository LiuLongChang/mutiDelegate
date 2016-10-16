//
//  ViewController2.swift
//  Muti_Delegate
//
//  Created by 刘隆昌 on 16/10/16.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import UIKit

extension ViewController2:SomeManagerDelegate{
    
    func callBack(){
        title = NSStringFromClass(classForCoder)
    }

}

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        SomeManager.shareInstance().addDelegate(delegate: self as SomeManagerDelegate)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func click(_ sender: AnyObject) {
        
        
        
        SomeManager.shareInstance().action()
        
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
