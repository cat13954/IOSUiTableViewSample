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
        img.layer.cornerRadius = 5
        img.layer.masksToBounds = true
        img.layer.borderWidth = 1
        img.layer.borderColor = UIColor.white.cgColor
        return img
    }()
    
    //商品名字
    private lazy var labGoodsName: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 2
        lab.font = lab.font.withSize(14)
        lab.textColor = ColorUtils.parser("#151617")
        return lab
    }()
    
    //原价
    private lazy var labOriginalPrice: UILabel = {
        let lab = UILabel()
        lab.textColor = ColorUtils.parser("#9D9E9F")
        lab.font = lab.font.withSize(10)
        lab.textAlignment = NSTextAlignment.left
        return lab
    }()
    //最后价格
    private lazy var labPrice: UILabel = {
        let lab = UILabel()
        lab.font = lab.font.withSize(15)
        lab.textColor = ColorUtils.parser("#F35410")
        return lab
    }()
    //店铺名字
    private lazy var labStoreName: UILabel = {
        let lab = UILabel()
        lab.font = lab.font.withSize(10)
        lab.textColor = ColorUtils.parser("#9B9C9D")
        return lab
    }()
    //💰符号
    private lazy var labMoneyTag: UILabel = {
        let lab = UILabel()
        lab.font = lab.font.withSize(10)
        lab.text = "¥"
        lab.textColor = ColorUtils.parser("#F35410")
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
        addSubview(labStoreName)
        addSubview(labMoneyTag)
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
        
        
        //店铺名字
        labStoreName.snp.makeConstraints { (make) in
            make.left.equalTo(imgCover.snp.right).offset(10)
            make.bottom.equalTo(imgCover.snp.bottom)
        }
        

        
        
        //💰符号
        labMoneyTag.snp.makeConstraints { (make) in
            make.left.equalTo(imgCover.snp.right).offset(10)
            make.bottom.equalTo(labStoreName.snp.top).offset(-4)
        }
        //优惠之后的价格
        labPrice.snp.makeConstraints { (make) in
            make.left.equalTo(labMoneyTag.snp.right).offset(0)
            make.bottom.equalTo(labStoreName.snp.top).offset(-3)
        }
        
        //优惠之前的价格
        labOriginalPrice.snp.makeConstraints { (make) in
            make.left.equalTo(labPrice.snp.right).offset(4)
            make.bottom.equalTo(labStoreName.snp.top).offset(-5)
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
        //labOriginalPrice.text = "原价:" + item.zkFinalPrice!
        
        //处理中划线
        let original = "原价:" + item.zkFinalPrice!
        let priceString = NSMutableAttributedString.init(string: original)
        priceString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber.init(value: 1), range: NSRange(location: 0, length: priceString.length))
        labOriginalPrice.attributedText = priceString
        
        //优惠之后的
        let coupon = item.couponAmount
        let price = (item.zkFinalPrice! as NSString).floatValue
        let finalPrice = String.init(format: "%.2f", (price - Float(coupon)))
        
        
        labPrice.text = "\(finalPrice)"
        
        //店铺名字
        labStoreName.text = "\(item.nick!)>" ?? "淘宝店铺>"
        
    }
    
    
}
