//
//  CellWxAuthor.swift
//  uitable
//
//  Created by Alice on 2021/3/5.
//
import UIKit
import Foundation
import SnapKit
//微信作者
class CellWxAuthor: UITableViewCell {
    
    private lazy var labName : UILabel = {
        let lab = UILabel(frame: .zero)
        //显示作者名字
        lab.numberOfLines = 1
        lab.textColor = ColorUtils.parser("#000811")
        return lab
    }()
    
    private lazy var labID : UILabel = {
        let lab = UILabel(frame: .zero)
        //显示作者id
        lab.textColor = ColorUtils.parser("#666666")
        return lab
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //ui编写
        addSubview(labName)
        addSubview(labID)
        
        //开始约束,名字在上面,id在下面.
        labName.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(12)
            
        }
        
        labID.snp.makeConstraints { (make) in
            //左边位置到屏幕左边,margin 12
            make.left.equalToSuperview().offset(12)
            //顶部在name的下边,margin top 4
            make.top.equalTo(labName.snp.bottom).offset(4)
            //一定要约束下边.距离-12
            //下和右的margin,都是负数
            make.bottom.equalTo(-12)
        }
    }
    
    //设置数据
    func setValueForCell(data : WxAuthor) {
        labName.text = data.name
        labID.text = String(data.id)
    }
}
