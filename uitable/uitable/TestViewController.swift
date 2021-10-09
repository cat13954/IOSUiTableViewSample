//
//  TestViewController.swift
//  uitable
//
//  Created by Alice on 2021/10/9.
//

import UIKit

class TestViewController: UIViewController, UICollectionViewDelegate {
    let SCREEN_W = UIScreen.main.bounds.size.width
    let SCREEN_H = UIScreen.main.bounds.size.height

    // 懒加载
    lazy var collectView: UICollectionView = {
        // FlowLayout自定义设置
        let layout = UICollectionViewFlowLayout()
        // 设置item的排列方式 ( horizontal , vertical)
        layout.scrollDirection = .vertical
        // 设置item的size
        layout.itemSize = CGSize(width: self.view.frame.size.width/4, height: self.view.frame.size.width/4)
        // 列间距
        layout.minimumLineSpacing = 1
        // 行间距
        layout.minimumInteritemSpacing = 1
        // 设置item的四边边距
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        // 设置页头尺寸
        // layout.footerReferenceSize = CGSize(width: self.view.frame.size.width, height: 50)
        // 设置页尾尺寸
        // layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 50)
        // 初始化
        // var collectview = UICollectionView()
        // collectview.collectionViewLayout = layout

        let collectview = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        // 设置背景颜色
        // collectview.backgroundColor = .green
        // 设置代理对象
        collectview.delegate = self
        // 设置数据源对象
        collectview.dataSource = self
        collectview.showsVerticalScrollIndicator = true
        // 设置垂直滚动是否滚到item的最底部
        collectview.alwaysBounceVertical = true
        // 设置水平滚动是否滚到item的最右边
        collectview.alwaysBounceHorizontal = true
        // 开启uicollectionView的分页显示效果
        collectview.isPagingEnabled = true
        // 注册Cell
        collectview.register(ProfessTypeViewCell.self, forCellWithReuseIdentifier: "ProfessTypeViewCell")

        // 注册Hearder
//                  collectview.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "reusable")
        return collectview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "测试列表"
        self.creatUI()
    }

    func creatUI() {
        self.view.addSubview(self.collectView)
        self.collectView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }

    //    MARK: - item 点击

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("响应点击事件")
    }

    //   MARK: - 设定header和footer的方法，根据kind不同进行不同的判断即可

//        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//            if kind == UICollectionView.elementKindSectionHeader{
//                let headerV = collectionView .dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerIdentifier", for: indexPath)
//                headerV.backgroundColor = armColor()
//                return headerV
//            }else if kind == UICollectionView.elementKindSectionFooter{
//                let footerV = collectionView .dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footIdentifier", for: indexPath)
//                footerV.backgroundColor = armColor()
//                return footerV
//            }
//            return UICollectionReusableView.init()
//        }

    //    MARK: - headerView 高

//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//            return CGSize (width: SCREEN_W, height: 100)
//        }
//
//        //    MARK: - footerView 高
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//            return CGSize (width: SCREEN_W, height: 100)
//        }

    //    MARK: - 是否高亮

    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    //    MARK: - 高亮颜色

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = self.armColor()
    }

    //    MARK: - 取消长按颜色

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(red: 53, green: 49, blue: 59, alpha: 1)
    }

    func armColor() -> UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        print("red:\(red),green:\(green),blue:\(blue)")
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension TestViewController: UICollectionViewDataSource {
    // 设置组数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }

    // 设置每组item格式
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    // 注册cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellString = "ProfessTypeViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellString, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    //    MARK: - item Size

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/3.73
        return CGSize(width: width, height: width + 20)
    }

    //     MARK: - 边框距离

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }

    //    MARK: - 行最小间距

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    //    MARK: - 列最小间距

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
