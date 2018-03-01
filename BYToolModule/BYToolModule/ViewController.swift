//
//  ViewController.swift
//  BYToolModule
//
//  Created by 郑强飞 on 2017/12/26.
//  Copyright © 2017年 郑强飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var pickerView1: FFOnePickerView?
    private var educationModelArray=[PickViewCodeModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonclicked(_ sender: Any) {
        pickerView1 = FFOnePickerView.initialize()
        pickerView1?.didInfoSelectedBlock = { (model) in
        }
        pickerView1?.dataArray=educationModelArray
        pickerView1?.titleName="选择最高学历"
        pickerView1?.show()
    }
    
}


