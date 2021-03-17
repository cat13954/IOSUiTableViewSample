//
//  AppFontUtils.swift
//  uitable
//
//  Created by Alice on 2021/3/17.
//  处理价格显示高矮效果的工具
//

import UIKit

// 文字相关的工具
class AppFontUtils: NSObject {
    // 提供价格和需要的大小,颜色,转成高矮效果
    public static func formatThePrice(priceContent: String, tagFontSize: UIFont, priceFontSize: UIFont, textColor: UIColor) -> NSAttributedString{
        
        let dic = [NSAttributedString.Key.foregroundColor: textColor,
                   NSAttributedString.Key.font: tagFontSize,
        ]
        let dicNum = [NSAttributedString.Key.foregroundColor: textColor,
                      NSAttributedString.Key.font: priceFontSize,
        ]
        //富文本
        let mutablePrice = NSMutableAttributedString.init(string: priceContent)
        mutablePrice.addAttributes(dic as [NSAttributedString.Key : Any], range: NSRange(location: 0, length: 1))
        mutablePrice.addAttributes(dicNum as [NSAttributedString.Key : Any], range: NSRange(location: 1, length: priceContent.count - 3))
        return mutablePrice
    }
    
    // 处理中划线
    public static func strikethroughStyle(content: String) -> NSAttributedString {
        let mutableStr = NSMutableAttributedString.init(string: content)
        mutableStr.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber.init(value: 1), range: NSRange(location: 0, length: mutableStr.length))
        return mutableStr
    }
}
