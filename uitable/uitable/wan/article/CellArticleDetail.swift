//
//  CellArticleDetail.swift
//  uitable
//
//  Created by Alice on 2021/3/6.
//

import Foundation
import UIKit
import SnapKit

class CellArticleDetail: UITableViewCell {
    //作者名字
    private lazy var labAuthor: UILabel = {
        let lab = UILabel()
        lab.textColor = ColorUtils.parser("#959697")
        lab.font = lab.font.withSize(12)
        return lab
    }()
    
    //标题
    private lazy var labArticleTitle: UILabel = {
        let lab = UILabel()
        //显示多行
        lab.font = lab.font.withSize(16)
        lab.numberOfLines = 0
        lab.textColor = ColorUtils.parser("#111213")
        return lab
    }()
    
    //更新的时间显示
    private lazy var labNiceShareDate: UILabel = {
        let lab = UILabel()
        lab.textColor = ColorUtils.parser("#959697")
        lab.font = lab.font.withSize(12)
        return lab
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //添加view到cell中,并约束位置
        addSubview(labAuthor)
        addSubview(labArticleTitle)
        addSubview(labNiceShareDate)
        //约束标题
        labArticleTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview()
            
        }
        //约束作者名字
        labAuthor.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(labArticleTitle.snp.bottom).offset(13)
            
        }
        //约束更新时间
        labNiceShareDate.snp.makeConstraints { (make) in
            make.left.equalTo(labAuthor.snp.right).offset(10)
            make.top.equalTo(labAuthor.snp.top)
            make.bottom.equalTo(-10)
        }
    }
    
    func setValueForCell(data: Article){
        //设置数据
        labArticleTitle.text = data.title
        labAuthor.text = data.author
        labNiceShareDate.text = data.niceShareDate
    }
}

