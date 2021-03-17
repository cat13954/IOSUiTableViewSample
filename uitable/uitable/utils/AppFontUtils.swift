//
//  AppFontUtils.swift
//  uitable
//
//  Created by Alice on 2021/3/17.
//  处理价格显示高矮效果的工具
//

import UIKit

// 提供价格和需要的大小,颜色,转成高矮效果
class AppFontUtils: NSObject {
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
}
