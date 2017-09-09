//
//  ViewController.swift
//  hangge_1603
//
//  Created by hangge on 2017/7/29.
//  Copyright © 2017年 hangge.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //用来演示抖动效果的输入框
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //水平抖动按钮点击
    @IBAction func shakeHorizontally(_ sender: Any) {
        textField.shake(){
            print("水平抖动结束!")
        }
    }

    //垂直抖动按钮点击
    @IBAction func shakeVertically(_ sender: Any) {
        textField.shake(direction: .vertical, times: 4, interval: 0.1, delta: 1.2){
            print("垂直抖动结束!")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

