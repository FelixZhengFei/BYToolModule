//
//  BYPickerView.swift
//  SinaFenQiCashLoan
//
//  Created by Sina on 2017/11/9.
//  Copyright © 2017年 SinaFenQi. All rights reserved.

/*一级菜单PickerView使用说明：
 *1、调用初始化方法 initialize() 创建对象
 *2、调用show()和hide()方法来显示和隐藏视图
 *3、对象可设置的参数有：
 */

import UIKit
/**屏幕宽度 */
fileprivate let FScreen_W:CGFloat = UIScreen.main.bounds.width
/**屏幕高度 */
fileprivate let FScreen_H:CGFloat = UIScreen.main.bounds.height
fileprivate let Default_Text_Color = UIColor(red: 90/255.0, green: 91/255.0, blue: 90/255.0, alpha: 1)
fileprivate let Default_Font_15Px: UIFont = UIFont.systemFont(ofSize: 15)
fileprivate let THEME_COLOR = UIColor(red: 255/255.0, green: 100/255.0, blue: 0/255.0, alpha: 1)
fileprivate let LINE_COLOR = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
fileprivate let Default_Font_18Px: UIFont = UIFont.systemFont(ofSize: 17)

class PickViewCodeModel: NSObject {
    var code = ""
    var value = ""
}

class FFOnePickerView: UIView,UIPickerViewDataSource,UIPickerViewDelegate {
   
    //MARK: -----公共对象和属性定义-----
    /**数据内容*/
    public var dataArray = [PickViewCodeModel]() {
        didSet {
            myPickerView?.reloadAllComponents()
        }
    }
    
    /**选中信息回调*/
    public var didInfoSelectedBlock:((_ model: PickViewCodeModel) -> Void)?
    /**Title*/
    public var titleName: String? {
        didSet {
            if titleLabel != nil {
                titleLabel?.text=titleName
            }
        }
    }
    
    //MARK: -----私有对象和属性定义-----
    /**遮罩视图*/
    private var myMaskView: UIView?
    /**功能背景视图*/
    private var myBGView: UIView?
    /**TitleLabel*/
    private var titleLabel: UILabel?
    /**内容选择器*/
    private var myPickerView: UIPickerView?
    /**显示时的Frame*/
    private var frameShowed: CGRect = CGRect.zero
    /**隐藏时的Frame*/
    private var frameHidden: CGRect = CGRect.zero
    /**BGView高度*/
    private let bgView_height: CGFloat = 300
    /**单个item的高度*/
    private let sigleItem_height: CGFloat = 40
    /**动画时间，默认0.25秒*/
    private var timeDuration: TimeInterval = 0.25
    /**选择的内容*/
    private var itemSelected = PickViewCodeModel()
    
    //MARK: -----自定义初始化类方法-----
    /**创建对象*/
    class func initialize() -> FFOnePickerView {
        let frame = CGRect.init(x: 0, y: FScreen_H, width: FScreen_W, height: FScreen_H)
        let pickerView = FFOnePickerView.init(frame: frame)
        UIApplication.shared.keyWindow?.addSubview(pickerView)
        return pickerView
    }
    
    
    //私有化本身初始化方法
    private override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        frameHidden=CGRect.init(x: 0, y: frame.size.height, width: frame.size.width, height: bgView_height)
        frameShowed=CGRect.init(x: 0, y: (frame.size.height-bgView_height), width: frame.size.width, height: bgView_height)
        
        //遮罩视图
        let mask = UIView.init(frame: self.bounds)
        mask.backgroundColor=UIColor.black
        mask.alpha=0
        self.addSubview(mask)
        myMaskView=mask
        
        //内容视图
        let bgView = UIView.init(frame: frameHidden)
        self.addSubview(bgView)
        bgView.backgroundColor=UIColor.white
        myBGView=bgView
        
        let btnView_height: CGFloat = 50
        let btnView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: bgView.frame.size.width, height: btnView_height))
        bgView.addSubview(btnView)
        btnView.backgroundColor=UIColor.clear
        
        let btn_width:CGFloat = 70
        let cancelBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: btn_width, height: btnView.frame.size.height))
        btnView.addSubview(cancelBtn)
        cancelBtn.setTitle("取消", for: UIControlState.normal)
        cancelBtn.setTitleColor(Default_Text_Color, for: UIControlState.normal)
        cancelBtn.titleLabel?.font=Default_Font_15Px
        cancelBtn.addTarget(self, action: #selector(hide), for: UIControlEvents.touchUpInside)
        
        
        let sureBtn = UIButton.init(frame: CGRect.init(x: (btnView.frame.size.width-btn_width), y: 0, width: btn_width, height: btnView.frame.size.height))
        btnView.addSubview(sureBtn)
        sureBtn.setTitle("确定", for: UIControlState.normal)
        sureBtn.setTitleColor(THEME_COLOR, for: UIControlState.normal)
        sureBtn.titleLabel?.font=Default_Font_15Px
        sureBtn.addTarget(self, action: #selector(sureAction), for: UIControlEvents.touchUpInside)
        
        let title = UILabel.init(frame: CGRect.init(x: btn_width, y: 0, width: (btnView.frame.size.width-btn_width*2), height: btnView.frame.size.height))
        bgView.addSubview(title)
        title.textColor=UIColor.black
        title.font=Default_Font_15Px
        title.textAlignment=NSTextAlignment.center
        titleLabel=title
        
        let line = UIView.init(frame: CGRect.init(x: 0, y: (btnView.frame.size.height-0.5), width: btnView.frame.size.width, height: 0.5))
        btnView.addSubview(line)
        line.backgroundColor=LINE_COLOR
        
        let view = UIPickerView.init(frame: CGRect.init(x: 0, y: btnView_height, width: bgView.frame.size.width, height: (bgView.frame.size.height-btnView_height)))
        view.backgroundColor=UIColor.clear
        view.dataSource=self
        view.delegate=self
        bgView.addSubview(view)
        myPickerView=view
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -----UIPickerViewDataSource-----
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    
    //MARK: -----UIPickerViewDelegate-----
    internal func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return sigleItem_height
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if dataArray.count>row {
            return dataArray[row].value
        }
        return ""
    }
    
    internal func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let width = pickerView.frame.size.width, height=sigleItem_height
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        label.backgroundColor=UIColor.clear
        label.textColor=UIColor.black
        label.textAlignment=NSTextAlignment.center
        label.font=Default_Font_18Px
        label.text=self.pickerView(pickerView, titleForRow: row, forComponent: component)
        return label
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if dataArray.count>row {
            itemSelected=dataArray[row]
        }
    }

    /**确定操作*/
    @objc private func sureAction() {
        self.setBlock()
        self.hide()
    }
    
    /**设置回调*/
    private func setBlock() {
        if self.didInfoSelectedBlock != nil {
            self.didInfoSelectedBlock!(itemSelected)
        }
    }

    
    override func removeFromSuperview() {
        super.removeFromSuperview()
    }
}


// MARK: - public方法
extension FFOnePickerView {
    //MARK: -----显示视图-----
    /**显示视图*/
    public func show() {
        //设置默认选中第一个选项
        if dataArray.count>0 {
            myPickerView?.selectRow(0, inComponent: 0, animated: false)
            itemSelected=dataArray[0]
        }
        
        //设置动画
        var frame = self.frame
        frame.origin.y=0
        self.frame=frame
        weak var weakSelf = self
        UIView.animate(withDuration: timeDuration) {
            weakSelf?.myBGView?.frame=(weakSelf?.frameShowed)!
            weakSelf?.myMaskView?.alpha=0.5
        }
        
    }
    
    //MARK: -----隐藏视图 ----
    /**隐藏视图*/
    @objc public func hide() {
        weak var weakSelf = self
        UIView.animate(withDuration: timeDuration, animations: {
            weakSelf?.myBGView?.frame=(weakSelf?.frameHidden)!
            weakSelf?.myMaskView?.alpha=0
            
        }) { (complete) in
            var frame = self.frame
            frame.origin.y=FScreen_H
            self.frame=frame
        }
    }
}


