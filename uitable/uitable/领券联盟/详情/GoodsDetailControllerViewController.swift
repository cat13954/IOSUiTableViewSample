//
//  GoodsDetailControllerViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/27.
//

import UIKit
import SnapKit
import Alamofire
import SimpleButton
let width = UIScreen.main.bounds.size.width
let height = UIScreen.main.bounds.size.height
//商品详情页面
class GoodsDetailControllerViewController: BaseViewController {
    //轮播图片的集合
    var images = [String]()
    var goodsData: MapData?
    //轮播图
    private lazy var cycleView: ZCycleView = {
        let width = view.bounds.width
        let cycleView1 = ZCycleView()
        //cycleView1.placeholderImage = #imageLiteral(resourceName: "placeholder")
        cycleView1.scrollDirection = .horizontal
        cycleView1.delegate = self
        cycleView1.reloadItemsCount(images.count)
        //缩放比例
        cycleView1.itemZoomScale = 1
        cycleView1.itemSpacing = 0
        cycleView1.initialIndex = 1
        cycleView1.isAutomatic = false
        //        cycleView1.isInfinite = false
        cycleView1.itemSize = CGSize(width: width, height: width)
        return cycleView1
    }()
    //最后价格
    private lazy var labPrice: UILabel = {
        let lab = UILabel()
        lab.font = lab.font.withSize(14)
        lab.textColor = ColorUtils.parser("#F35410")
        return lab
    }()
    //原价
    private lazy var labOriginalPrice: UILabel = {
        let lab = UILabel()
        lab.textColor = ColorUtils.parser("#9D9E9F")
        lab.font = lab.font.withSize(12)
        lab.textAlignment = NSTextAlignment.left
        lab.text = ""
        return lab
    }()
    
    //商品名字
    private lazy var labGoodsName: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 3
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        lab.textColor = ColorUtils.parser("#151617")
        return lab
    }()
    
    //标签
    private lazy var labTag: DDPaddingLabel = {
        let lab = DDPaddingLabel()
        lab.font = lab.font.withSize(14)
        //文字的颜色
        lab.textColor = ColorUtils.parser("#818181")
        
        lab.layer.backgroundColor = ColorUtils.parser("#F6F6F6").cgColor
        lab.layer.cornerRadius = 4
        lab.textAlignment = .center
        lab.padding.left = 6
        lab.padding.right = 6
        return lab
    }()
    
    //简单描述
    private lazy var labDesc: UILabel = {
        let lab = UILabel()
        lab.font = lab.font.withSize(12)
        lab.textColor = ColorUtils.parser("#818181")
        lab.numberOfLines = 2
        return lab
    }()
    
    private lazy var labStoreName: UILabel = {
        let lab = UILabel()
        lab.font = lab.font.withSize(12)
        lab.textColor = ColorUtils.parser("#818181")
        return lab
    }()
    
    private lazy var labCouponContent: DDPaddingLabel = {
        let lab = DDPaddingLabel()
        lab.font = lab.font.withSize(12)
        //文字的颜色
        lab.textColor = ColorUtils.parser("#818181")
        lab.numberOfLines = 0
        lab.layer.backgroundColor = ColorUtils.parser("#F6F6F6").cgColor
        lab.layer.cornerRadius = 4
        lab.textAlignment = .center
        lab.padding.left = 6
        lab.padding.right = 6
        lab.lineBreakMode = .byWordWrapping
        return lab
    }()
    
    private lazy var btnCopy: UIButton = {
        let btn = UIButton()
        
        return btn
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //self.title = "详情"
        //navigationController?.setNavigationBarHidden(false, animated: false)
        
        view.addSubview(cycleView)
        view.addSubview(labPrice)
        //轮播图的位置与大小
        cycleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(cycleView.snp.width)
        }
        //价格位置
        labPrice.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalTo(cycleView.snp.bottom).offset(10)
            
        }
        
        //优惠之后的
        if let item = goodsData {
            let coupon = item.couponAmount
            let price = (item.zkFinalPrice! as NSString).floatValue
            print("优惠之后的价格\(coupon)")
            print("优惠之后的价格\(String(describing: item.reservePrice))")
            if coupon != 0 {
                //取2位小数
                let finalPrice = String.init(format: "%.2f", (price - Float(coupon)))
                let priceContent = "¥\(finalPrice)"
                //高矮处理,把$和价格都放进来一起处理
                labPrice.attributedText  = AppFontUtils.formatThePrice(priceContent: priceContent, tagFontSize: UIFont.systemFont(ofSize: 14), priceFontSize:UIFont.boldSystemFont(ofSize: 20), textColor: ColorUtils.parser("#F35410"))
            }else{
                let v = 0.00
                let finalPrice = String.init(format: "%.2f", (price - Float(v)))
                let priceContent = "¥\(finalPrice)"
                //高矮处理,把$和价格都放进来一起处理
                labPrice.attributedText  = AppFontUtils.formatThePrice(priceContent: priceContent, tagFontSize: UIFont.systemFont(ofSize: 14), priceFontSize:UIFont.boldSystemFont(ofSize: 20), textColor: ColorUtils.parser("#F35410"))
            }
        }
        view.addSubview(labGoodsName)
        //商品名字
        labGoodsName.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalTo(labPrice.snp.bottom).offset(10)
            make.right.equalToSuperview()
        }
        
        labGoodsName.text = goodsData?.title
        
        //原价
        view.addSubview(labOriginalPrice)
        labOriginalPrice.snp.makeConstraints { (make) in
            make.left.equalTo(labPrice.snp.right).offset(4)
            
            make.bottom.equalTo(labPrice.snp.bottom).offset(-3)
        }
        //处理中划线
        if let item = goodsData {
            if item.couponAmount == 0 {
                print("优惠之后的价格\(String(describing: item.reservePrice))")
                let va = 0.00
                let price = (item.reservePrice as! NSString).floatValue
                let finalPrice = String.init(format: "%.2f", (price - Float(va)))
                let priceContent = "¥\(finalPrice)"
                labOriginalPrice.attributedText = AppFontUtils.strikethroughStyle(content: priceContent)
            }else{
                let original = "原价:" + item.zkFinalPrice!
                //把处理中划线的值赋值
                labOriginalPrice.attributedText = AppFontUtils.strikethroughStyle(content: original)
            }
        }
        view.addSubview(labTag)
        //标签
        labTag.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            
            make.top.equalTo(labGoodsName.snp.bottom).offset(4)
        }
        labTag.text = goodsData?.levelOneCategoryName
        
        //简单描述
        view.addSubview(labDesc)
        labDesc.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalTo(labTag.snp.bottom).offset(4)
            make.right.equalToSuperview()
        }
        if let desc = goodsData?.itemDescription {
            labDesc.text = desc
        }
        
        //店铺名字
        view.addSubview(labStoreName)
        labStoreName.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalTo(labDesc.snp.bottom).offset(4)
        }
        if let name = goodsData?.nick {
            labStoreName.text = "\(name)>"
        }
        //显示复制按钮.
        let btnCopy = SimpleButton(type: .custom)
        btnCopy.setTitle("复制到粘贴板", for: .normal)
        btnCopy.setBackgroundColor(ColorUtils.parser("#FFAA02"), for: .normal, animated: true, animationDuration: 0.2)
        btnCopy.setBackgroundColor(ColorUtils.parser("#FFBE00"), for: .highlighted, animated: true, animationDuration: 0.2)
        btnCopy.setCornerRadius(4)
        view.addSubview(btnCopy)
        btnCopy.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        btnCopy.addTarget(self, action: #selector(copyToPasteboard), for: .touchUpInside )
        //优惠券显示
        view.addSubview(labCouponContent)
        labCouponContent.snp.makeConstraints { (make) in
            make.top.equalTo(labStoreName.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        //获取优惠券
        getCoupons()
    }
    // 复制到粘贴板中
    @objc func copyToPasteboard(sender: UIButton){
        //UIPasteboard.general.string = self.labCouponContent.text
        let pboard = UIPasteboard.general
        pboard.string = self.labCouponContent.text
        
        let titleStr = "淘口令复制成功，是否跳转到手机淘宝APP？"
        let jumpStr = "taobao://item.taobao.com/item.htm"
        
        
        let alertCtr = UIAlertController.init(title: titleStr, message: nil, preferredStyle: UIAlertController.Style.alert)
        alertCtr.addAction(UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler: nil))
        alertCtr.addAction(UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default, handler: { (action) in
            
            if let url = URL.init(string: jumpStr) {
                
                if UIApplication.shared.canOpenURL(url) == true {
                    UIApplication.shared.openURL(url)
                } else {
                    
                    let alertC = UIAlertController.init(title: "您未安装手机淘宝APP,是否前往AppStore下载安装？", message: nil, preferredStyle: UIAlertController.Style.alert)
                    
                    alertC.addAction(UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler: nil))
                    alertC.addAction(UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
                        
                        let AppStoreVC = UIViewController.init()
                        AppStoreVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                        
                        let webView = UIWebView.init(frame: AppStoreVC.view.bounds)
                        let request = NSURLRequest.init(url: URL.init(string: "itms-apps://itunes.apple.com/cn/app/tao-bao-sui-shi-sui-xiang/id387682726?mt=8")!) //AppStore手机淘宝地址
                        webView.loadRequest(request as URLRequest)
                        AppStoreVC.view.addSubview(webView)
                        
                        self.present(AppStoreVC, animated: true, completion: {
                            AppStoreVC.dismiss(animated: true, completion: nil)
                        })
                    }))
                    self.present(alertC, animated: true, completion: nil)
                    
                }
            }
        }))
        self.present(alertCtr, animated: true, completion: nil)
    }
    
    func getCoupons() {
        //获取优惠券
         
        var clickUrl = goodsData?.couponClickUrl ?? ""
        if clickUrl.isEmpty {
            clickUrl = goodsData?.url ?? ""
        }
        let targetUrl = "https:\(clickUrl)"
        let paraData: NSDictionary = ["title":goodsData?.title ?? "", "url":targetUrl]
        let headers = [
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(UnionApi.getCouponsUrl(), method: .post, parameters: paraData as! Parameters,encoding: JSONEncoding.default, headers: headers).responseObject{  (response: DataResponse<CouponsResult>) in
            let data = response.result.value
            //print(data?.data?.tbkTpwdCreateResponse?.data?.model)
            //显示优惠券数据
            if let model = data?.data?.tbkTpwdCreateResponse?.data?.model{
                self.labCouponContent.text = model
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //视图将出现,显示
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension GoodsDetailControllerViewController: ZCycleViewProtocol{
    func cycleViewRegisterCellClasses() -> [String : AnyClass] {
        return ["CustomCollectionViewCell": CustomCollectionViewCell.self]
    }
    
    func cycleViewConfigureCell(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, realIndex: Int) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        //cell.imageView.image = images[realIndex]
        cell.setImageUrl(imageUrl: images[realIndex])
        return cell
    }
    func cycleViewConfigurePageControl(_ cycleView: ZCycleView, pageControl: ZPageControl) {
        pageControl.isHidden = false
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .green
        pageControl.frame = CGRect(x: 0, y: cycleView.bounds.height-25, width: cycleView.bounds.width, height: 25)
    }
    
}
