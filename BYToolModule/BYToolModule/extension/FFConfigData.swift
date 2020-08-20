//
//  FFConfigData.swift
//  BYToolModule
//
//  Created by Felix on 2020/8/20.
//  Copyright © 2020 郑强飞. All rights reserved.
//


import UIKit

let ROOTVC      = UIApplication.shared.keyWindow?.rootViewController
let H5_FONT     = UIFont.systemFont(ofSize: 10)
let H4_FONT     = UIFont.systemFont(ofSize: 12)
let H3_FONT     = UIFont.systemFont(ofSize: 15)
let H2_FONT     = UIFont.systemFont(ofSize: 18)
let H1_FONT     = UIFont.systemFont(ofSize: 20)
let FLINEW       = 0.5

/**屏幕宽度 */
let FScreen_W:CGFloat = UIScreen.main.bounds.width
/**屏幕高度 */
let FScreen_H:CGFloat = UIScreen.main.bounds.height
/**导航栏高度 */
let FNavgationBar_H: CGFloat = FFAppDevicePulgin.navigationBarHeight
/**底部Home高度 */
let FHome_Indicator_H: CGFloat = FFAppDevicePulgin.homeIndicatorHeight
/**Tabar高度 */
let FTabBar_H: CGFloat = FFAppDevicePulgin.toolBarHeight
/**状态栏高度 */
let FStatusBar_H: CGFloat = FFAppDevicePulgin.statusBarHeight

/**系统版本*/
let System_Version:String = UIDevice.current.systemVersion
/**App 版本*/
let App_Version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
/**App 构建版本*/
let App_Build_Version = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
/**App 名称*/
let App_Display_Name:String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
/**Bundle Identifier 包标识符*/
let App_Bundle_Identifier:String = Bundle.main.bundleIdentifier!
/**设备系统名称（如：iOS、iPad）*/
let Device_System_Name:String = UIDevice.current.systemName

public func FFPrint<N>(_ message:N,fileName:String = #file,methodName:String = #function,lineNumber:Int = #line) {
    #if DEBUG
        print("\(message)");
    #else
    #endif
}
