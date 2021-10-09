//
//  ProfessTypeViewCell.swift
//  uitable
//
//  Created by Alice on 2021/10/9.
//

import UIKit

class ProfessTypeViewCell: UICollectionViewCell {
    lazy var mTextLabel: UILabel = {
        let mTextLabel = UILabel()
        mTextLabel.font = UIFont.systemFont(ofSize: 14)
        mTextLabel.textAlignment = NSTextAlignment.center
        mTextLabel.layer.masksToBounds = true
        mTextLabel.layer.cornerRadius = 18
        mTextLabel.text = "Item"
        return mTextLabel
    }()
    
    lazy var mImage: UIImageView = {
        let mImage = UIImageView()
        mImage.image = UIImage(named: "gridman")
        return mImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let cellWidth: CGFloat = self.frame.size.width
        let cellHeight: CGFloat = self.frame.size.height
        
        self.contentView.addSubview(self.mImage)
        
        self.mImage.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-10)
            make.width.equalTo(cellWidth/3)
            make.height.equalTo(cellHeight/3)
        }
        
        self.contentView.addSubview(self.mTextLabel)
        
        self.mTextLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self.mImage.snp.bottom).offset(10)
            make.width.equalTo(cellWidth)
            make.height.equalTo(20)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
}
 
