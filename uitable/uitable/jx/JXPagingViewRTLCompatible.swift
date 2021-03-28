//
//  JXPagingViewRTLCompatible.swift
//  uitable
//
//  Created by Alice on 2021/3/28.
//

import UIKit

protocol JXPagingViewRTLCompatible: class {
    func pagingViewShouldRTLLayout() -> Bool
    func pagingView(horizontalFlipForView view: UIView?)
}

extension JXPagingViewRTLCompatible {
    
    func pagingViewShouldRTLLayout() -> Bool {
        return UIView.userInterfaceLayoutDirection(for: UIView.appearance().semanticContentAttribute) == .rightToLeft
    }
    
    func pagingView(horizontalFlipForView view: UIView?) {
        view?.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
}

class JXPagingRTLCollectionCell: UICollectionViewCell, JXPagingViewRTLCompatible {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        if pagingViewShouldRTLLayout() {
            pagingView(horizontalFlipForView: self)
            pagingView(horizontalFlipForView: contentView)
        }
    }
    
}

