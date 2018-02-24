//
//  ViewController.swift
//  BYToolModule
//
//  Created by 郑强飞 on 2017/12/26.
//  Copyright © 2017年 郑强飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if ("12609847823".isPhoneNumber()) {
            print("是")
        } else {
            print("否")

        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


