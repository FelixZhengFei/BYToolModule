//
//  ViewController.swift
//  BYToolModule
//
//  Created by 郑强飞 on 2017/12/26.
//  Copyright © 2017年 郑强飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: FFAttrTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testAttrobute()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /**测试属性字*/
    func testAttrobute() {
        
        let tempString = "属性字"
            .attribute()
            .fontSize(18)
            .color(UIColor.blue)
            .ff_underLine(NSUnderlineStyle.single)
            .ff_underLineColor(UIColor.black)
            +
             "2000"
                .attribute()
                .fontSize(19)
                .color(UIColor.purple)
                .backgroundColor(UIColor.lightGray)
                .fontSpace(3.5)
            
            +
             "描边文字"
                .attribute()
                .fontSize(19)
                .strokeColor(UIColor.blue)
                .strokeWidth(3)
            +
             "中划线"
                .attribute()
                .fontSize(17)
                .strike(2)
                .strikeColor(UIColor.darkGray)
            
        
        
        textView.removeAllAttribute()
            .appendAttributedText(tempString.toString())
            .appendAttributedText( "点我".attribute().color(UIColor.red).toString().addAction({
                print(333333)
            }))
    }


    
        
    
}


