//
//  CustomCollectionViewCell.swift
//  uitable
//
//  Created by Alice on 2021/3/27.
//

import UIKit
import Kingfisher
import SnapKit
class CustomCollectionViewCell: UICollectionViewCell {
    private lazy var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        //imageView.frame = contentView.bounds
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(contentView.snp.size)
        }
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageUrl(imageUrl: String) {
        let u = URL(string: "https:\(imageUrl)")
        //商品图片
        imageView.kf.setImage(with: u)
    }
    
}
