//
//  FFBaseEmptyView.swift
//  EmptyPage
//
//  Created by linhey on 2018/1/10.
//  Copyright © 2018年 linhey <linhan.linhey@outlook.com>. All rights reserved.

import UIKit


open class FFBaseEmptyView: UIView {
    
    open class var backgroundView: FFBaseEmptyView {
        let view = FFBaseEmptyView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.clear
        return view
    }

    open class func mix(view: UIView,_ frame:CGRect) -> FFBaseEmptyView {
        let backView = backgroundView
        backView.addSubview(view)
        view.frame = frame
        view.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }
    
    open class func mix(view: UIView,_ y_Coord:CGFloat) -> FFBaseEmptyView {
        let backView = backgroundView
        backView.addSubview(view)
        view.center.x = UIScreen.main.bounds.size.width / 2
        view.frame.origin.y = y_Coord
        view.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }
}







