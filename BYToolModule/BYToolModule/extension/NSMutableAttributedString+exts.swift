//
//  NSMutableAttributedString+exts.swift
//  EasyTextor
//
//  Created by duzhe on 2017/10/23.
//  Copyright © 2017年 duzhe. All rights reserved.
//

import UIKit

public func + (attr1 : NSMutableAttributedString ,attr2 : NSMutableAttributedString ) -> NSMutableAttributedString{
    attr1.append(attr2)
    return attr1
}


public extension NSMutableAttributedString{
    func ff_allRange()->NSRange{
        return NSMakeRange(0,self.length)
    }
    /// 添加图片
    ///
    /// - Parameters:
    ///   - image: 图片对象
    ///   - bounds: 图片大小位置
    ///   - index: 插入下标
    /// - Returns: NSMutableAttributedString
    func picture( _ image:UIImage?, bounds: CGRect , index: Int )->NSMutableAttributedString{
        guard let image = image else {
            return self
        }
        let attchImage = NSTextAttachment()
        attchImage.image = image
        // 设置图片大小
        attchImage.bounds = bounds
        let imageAttr = NSAttributedString(attachment: attchImage)
        self.insert(imageAttr, at: index)
        return self
    }
    
    // 中划线
    func strike(_ value: Int)->NSMutableAttributedString{
        self.addAttributes([.strikethroughStyle:value], range: self.ff_allRange())
        return self
    }
    // 中划线颜色
    func strikeColor(_ color: UIColor)->NSMutableAttributedString{
        self.addAttributes([.strikethroughColor:color], range: self.ff_allRange())
        return self
    }
    // 描边宽度
    func strokeWidth(_ width: CGFloat)->NSMutableAttributedString{
        self.addAttributes([.strokeWidth:width], range: self.ff_allRange())
        return self
    }
    // 描边颜色
    func strokeColor(_ color: UIColor)->NSMutableAttributedString{
        self.addAttributes([.strokeColor:color], range: self.ff_allRange())
        return self
    }
    // 字间距
    func fontSpace(_ space: CGFloat)->NSMutableAttributedString{
        self.addAttributes([.kern:space], range: self.ff_allRange())
        return self
    }
    // 背景色
    func backgroundColor(_ color: UIColor)->NSMutableAttributedString{
        self.addAttributes([.backgroundColor:color], range: self.ff_allRange())
        return self
    }
    // 前景色
    func color(_ color: UIColor)->NSMutableAttributedString{
        self.addAttributes([.foregroundColor:color], range: self.ff_allRange())
        return self
    }
    // 下划线
    func ff_underLine(_ style: NSUnderlineStyle)->NSMutableAttributedString{
        self.addAttributes([.underlineStyle:style.rawValue], range: self.ff_allRange())
        return self
    }
    // 下划线颜色
    func ff_underLineColor(_ color: UIColor)->NSMutableAttributedString{
        self.addAttributes([.underlineColor:color], range: self.ff_allRange())
        return self
    }
    // 字体
    func ff_font(_ font: UIFont)->NSMutableAttributedString{
        self.addAttributes([.font:font], range: self.ff_allRange())
        return self
    }
    // 系统字体大小
    func fontSize(_ size: CGFloat)->NSMutableAttributedString{
        self.addAttributes([.font:UIFont.systemFont(ofSize: size)], range: self.ff_allRange())
        return self
    }
    // 行间距
    func ff_lineSpace( _ space: CGFloat )->NSMutableAttributedString{
        let style = NSMutableParagraphStyle()
        style.lineSpacing = space
        style.lineBreakMode = .byCharWrapping
        self.addAttribute(.paragraphStyle, value: style, range: self.ff_allRange())
        return self
    }
    func toString()->FFAttributeString{
        return FFAttributeString(attributeText: self)
    }
}


public extension String {
    func attribute()->NSMutableAttributedString{
        return NSMutableAttributedString(string: self)
    }
}





