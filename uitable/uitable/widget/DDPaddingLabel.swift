//
//  DDPaddingLabel.swift
//  uitable
//
//  Created by Alice on 2021/3/13.
//

import UIKit

class DDPaddingLabel: UILabel {
    
    var circularFillet = false

    var padding = UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8)
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if circularFillet == true {
            let h = self.layer.frame.size.height
            self.layer.cornerRadius = h / 2
        }
    }
}
