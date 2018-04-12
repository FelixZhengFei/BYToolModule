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
        
        let tempView = UIView()
        tempView.frame = CGRect(x: 0, y: 0, width: 100, height: 100).autoFit()
        tempView.backgroundColor = UIColor.red
        print("111==\(tempView.frame)")
        print("3232==\(100.autoFit())")

        self.view.addSubview(tempView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonclicked(_ sender: Any) {
    }
    
}


