//
//  PreferentialCellTableViewCell.swift
//  uitable
//
//  Created by Alice on 2021/3/12.
//

import UIKit


class PreferentialCellTableViewCell: UITableViewCell {
    
    //商品封面
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
        lab.font = lab.font.withSize(10)
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
        //lab.text = "¥"
        lab.textColor = ColorUtils.parser("#F35410")
        return lab
    }()
    //标签
    private lazy var labTag: DDPaddingLabel = {
        let lab = DDPaddingLabel()
        lab.font = lab.font.withSize(10)
        //文字的颜色
        lab.textColor = ColorUtils.parser("#818181")
        
        lab.layer.backgroundColor = ColorUtils.parser("#F6F6F6").cgColor
        lab.layer.cornerRadius = 10
        lab.textAlignment = .center
        lab.padding.left = 6
        lab.padding.right = 6
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
        addSubview(labTag)
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
        //labMoneyTag.snp.makeConstraints { (make) in
        //    make.left.equalTo(imgCover.snp.right).offset(10)
        //    make.bottom.equalTo(labStoreName.snp.top).offset(-4)
        //}
        //优惠之后的价格
        labPrice.snp.makeConstraints { (make) in
            //make.left.equalTo(labMoneyTag.snp.right).offset(0)
            make.left.equalTo(imgCover.snp.right).offset(10)
            make.bottom.equalTo(labStoreName.snp.top).offset(-3)
        }
        
        //优惠之前的价格
        labOriginalPrice.snp.makeConstraints { (make) in
            make.left.equalTo(labPrice.snp.right).offset(4)
            make.bottom.equalTo(labStoreName.snp.top).offset(-5)
        }
        //标签
        labTag.snp.makeConstraints { (make) in
            make.left.equalTo(imgCover.snp.right).offset(10)
            make.bottom.equalTo(labPrice.snp.top).offset(-3)
        }
    }
    
    func setValueForCell(item: MapData) {
        //print("图地址:\(item.pictUrl)")
        let url = "https:\(item.pictUrl ?? "")"
        //print(url)
        let u = URL(string: url)
        //商品图片
        imgCover.kf.setImage(with: u)
        //商品名字,只显示2行
        labGoodsName.text = item.title
        //开始价格
        //处理中划线
        let original = "原价:" + item.zkFinalPrice!
        let priceString = NSMutableAttributedString.init(string: original)
        priceString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber.init(value: 1), range: NSRange(location: 0, length: priceString.length))
        //把处理中划线的值赋值
        labOriginalPrice.attributedText = priceString
        
        //优惠之后的
        let coupon = item.couponAmount
        let price = (item.zkFinalPrice! as NSString).floatValue
        //取2位小数
        let finalPrice = String.init(format: "%.2f", (price - Float(coupon)))
        let priceContent = "¥\(finalPrice)"
        
        //高矮处理,把$和价格都放进来一起处理
        labPrice.attributedText  = AppFontUtils.formatThePrice(priceContent: priceContent, tagFontSize: UIFont.systemFont(ofSize: 10), priceFontSize:UIFont.boldSystemFont(ofSize: 14), textColor: ColorUtils.parser("#F35410"))
        
        //店铺名字
        labStoreName.text = "\(item.nick!)>"
        //tab
        labTag.text = item.levelOneCategoryName
    }
    
    
}
