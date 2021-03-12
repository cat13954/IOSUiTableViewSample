//
//  PreferentialCellTableViewCell.swift
//  uitable
//
//  Created by Alice on 2021/3/12.
//

import UIKit

class PreferentialCellTableViewCell: UITableViewCell {
    
    private lazy var imgCover: UIImageView = {
        let img = UIImageView()
        
        return img
    }()
    
    //商品名字
    private lazy var labGoodsName: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 2
        lab.font = lab.font.withSize(12)
        return lab
    }()
    
    //原价
    private lazy var labOriginalPrice: UILabel = {
        let lab = UILabel()
        lab.font = lab.font.withSize(10)
        return lab
    }()
    
    private lazy var labPrice: UILabel = {
        let lab = UILabel()
        lab.font = lab.font.withSize(10)
        return lab
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imgCover)
        addSubview(labGoodsName)
        addSubview(labOriginalPrice)
        addSubview(labPrice)
        //布局左边的封面图片
        imgCover.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(12)
            make.size.equalTo(90)
            make.bottom.equalTo(-10)
        }
        //名字
        labGoodsName.snp.makeConstraints { (make) in
            make.left.equalTo(imgCover.snp.right).offset(10)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            //make.bottom.equalTo(-10)
        }
        
        //优惠之前的价格
        labOriginalPrice.snp.makeConstraints { (make) in
            make.left.equalTo(imgCover.snp.right).offset(10)
            make.bottom.equalTo(imgCover.snp.bottom)
        }
        
        //优惠之后的价格
        labPrice.snp.makeConstraints { (make) in
            make.left.equalTo(labOriginalPrice.snp.right).offset(10)
            make.bottom.equalTo(labOriginalPrice.snp.bottom)
        }
    }
    
    func setValueForCell(item: MapData) {
        print("图地址:\(item.pictUrl)")
        let url = "https:\(item.pictUrl ?? "")"
        print(url)
        let u = URL(string: url)
        imgCover.kf.setImage(with: u)
        labGoodsName.text = item.title
        //offPrise = ((itemData.zk_final_price.toFloat()) - itemData.coupon_amount)
        //开始价格
        labOriginalPrice.text = item.zkFinalPrice
        //优惠之后的
        let coupon = item.couponAmount
        let price = (item.zkFinalPrice! as NSString).floatValue
        let finalPrice = (price - Float(coupon))
        labPrice.text = "券后价:\(finalPrice)"
    }
    
    
}
