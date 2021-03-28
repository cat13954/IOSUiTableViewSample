//
//  LoadDataViewController.swift
//  JXSegmentedView
//
//  Created by jiaxin on 2019/1/7.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit
import JXSegmentedView
import SnapKit
class LoadDataViewController: UIViewController {
    var segmentedDataSource: JXSegmentedTitleDataSource!
    var segmentedView: JXSegmentedView!
    var listContainerView: JXSegmentedListContainerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "推荐"
        view.backgroundColor = .white
        // 设置导航栏背景为透明色图片
        //navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // 设置导航栏阴影为透明色图片
        //navigationController?.navigationBar.shadowImage = UIImage()
        //这个默认是UIRectEdgeNone 表示视图坐标的计算是从导航栏下开始的。UIRectEdgeAll;
        //self.edgesForExtendedLayout = UIRectEdge.all
        //navigationController?.navigationBar.isTranslucent = true
        
         
        //1、初始化JXSegmentedView
        segmentedView = JXSegmentedView()

        //2、配置数据源
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedDataSource = JXSegmentedTitleDataSource()
        segmentedDataSource.titles = getRandomTitles()
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedView.dataSource = segmentedDataSource
        
        //3、配置指示器
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension
        indicator.lineStyle = .lengthen
        segmentedView.indicators = [indicator]

        //4、配置JXSegmentedView的属性
        view.addSubview(segmentedView)

        //5、初始化JXSegmentedListContainerView
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        view.addSubview(listContainerView)

        //6、将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.listContainer = listContainerView

        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "刷新数据", style: UIBarButtonItem.Style.plain, target: self, action: #selector(reloadData))
    }

    @objc func reloadData() {
        segmentedDataSource.titles = getRandomTitles()
        segmentedView.defaultSelectedIndex = 1
        segmentedView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //let app = UIApplication.shared
        //let height = app.statusBarFrame.size.height
        
        //let topInset: CGFloat = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? UIApplication.shared.statusBarFrame.size.height
         
        
        //let topInset = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        //segmentedView.frame = CGRect(x: 0, y: topInset, width: view.bounds.size.width, height: 50)
        segmentedView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        //listContainerView.frame = CGRect(x: 0, y: 150, width: view.bounds.size.width, height: view.bounds.size.height - 150)
        listContainerView.snp.makeConstraints { (mm) in
            mm.top.equalTo(segmentedView.snp.bottom)
            mm.width.equalToSuperview()
            mm.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    func getRandomTitles() -> [String] {
        let titles = ["猴哥", "青蛙王子", "旺财", "粉红猪", "喜羊羊", "黄焖鸡", "小马哥", "牛魔王", "大象先生", "神龙"]
        //随机title数量，4~n
        let randomCount = Int(arc4random()%7 + 4)
        var tempTitles = titles
        var resultTitles = [String]()
        for _ in 0..<randomCount {
            let randomIndex = Int(arc4random()%UInt32(tempTitles.count))
            resultTitles.append(tempTitles[randomIndex])
            tempTitles.remove(at: randomIndex)
        }
        return resultTitles
    }
}

extension LoadDataViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return segmentedDataSource.dataSource.count
    }

    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        let vc = LoadDataListViewController()
        vc.typeString = segmentedDataSource.titles[index]
        return vc
    }
}
