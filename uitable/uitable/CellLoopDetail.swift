//
//  CellLoopDetail.swift
//  sw-http
//
//  Created by Alice on 2021/3/2.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher
class CellLoopDetail: UITableViewCell {
    
    private lazy var ivLoop :UIImageView = {
        let img = UIImageView()
        //比例,填充,超出界限,裁剪
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 6
        img.layer.masksToBounds = true
        return img
    }()
    
    private lazy var labTitle:UILabel = {
       let lab = UILabel()
        //单行显示
        lab.lineBreakMode = NSLineBreakMode.byWordWrapping
        lab.numberOfLines = 1
        lab.textColor = ColorUtils.parser("#313131")
        
        return lab
    }()
    
    private lazy var labDesc:UILabel = {
       let lab = UILabel()
        lab.lineBreakMode = NSLineBreakMode.byWordWrapping
        lab.numberOfLines = 1
        lab.textColor = ColorUtils.parser("#666666")
        
        return lab
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(ivLoop)
        addSubview(labTitle)
        addSubview(labDesc)
        ivLoop.snp.makeConstraints { (make) in
            make.size.equalTo(50)
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        labTitle.snp.makeConstraints { (make) in
            make.top.equalTo(ivLoop.snp.top)
            make.left.equalTo(ivLoop.snp.right).offset(10)
        }
        labDesc.snp.makeConstraints { (make) in
            make.left.equalTo(ivLoop.snp.right).offset(10)
            make.bottom.equalTo(ivLoop.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setValueForCell(item: Forecast)  {
      
        let imagePath = "http://mp.moonlightshadow.cn:2020/admin/image/"
        //设置轮播图的数据
        labTitle.text = item.name
        labDesc.text = item.id
        //图片显示
        if let img = item.logo {
            print(img)
            let url = URL(string: imagePath + img)
            ivLoop.kf.setImage(with: url)
        }
        
    }
}
