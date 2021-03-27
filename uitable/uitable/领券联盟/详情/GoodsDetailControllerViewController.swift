//
//  GoodsDetailControllerViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/27.
//

import UIKit
import SnapKit
let width = UIScreen.main.bounds.size.width
let height = UIScreen.main.bounds.size.height
//商品详情页面
class GoodsDetailControllerViewController: BaseViewController {
    
    var images = [String]()
    
    private lazy var cycleView: ZCycleView = {
        let width = view.bounds.width - 20
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "详情"
        view.addSubview(cycleView)
        //轮播图的位置与大小
        cycleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(cycleView.snp.width)
        }
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
