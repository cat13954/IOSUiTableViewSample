//
//  LoadDataViewController.swift
//  JXSegmentedView
//
//  Created by alice on 2021/3/28.
//

import UIKit
import JXSegmentedView
import SnapKit
import Alamofire
//分类页面
class CategoryController: UIViewController {
    var segmentedDataSource: JXSegmentedTitleDataSource!
    var segmentedView: JXSegmentedView!
    var listContainerView: JXSegmentedListContainerView!
    //标题tab数据
    private var tabTitles = [String]()
    //分类的完整数据
    private var categories = [CategoryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "推荐分类"
        view.backgroundColor = .white
        //直接隐藏bar
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        //1、初始化JXSegmentedView
        segmentedView = JXSegmentedView()
        
        //2、配置数据源
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedDataSource = JXSegmentedTitleDataSource()
        segmentedDataSource.titles = tabTitles
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
        
        //布局子控件,
        segmentedView.snp.makeConstraints { (make) in
            //tab的宽度等于屏幕宽度
            make.width.equalToSuperview()
            //tab高度50
            make.height.equalTo(50)
            //tab的顶部,在安全区顶部
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        listContainerView.snp.makeConstraints { (mm) in
            //可以滑动的容器,在tab的下面,宽度屏幕宽,底部在安全区的最下边
            mm.top.equalTo(segmentedView.snp.bottom)
            mm.width.equalToSuperview()
            mm.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        //获取分类数据
        getCategories()
    }
    //获取分类的数据
    func getCategories() {
        Alamofire.request(UnionApi.getCategoryUrl()).responseObject{
            (response: DataResponse<CategoryClass>) in
            if let res = response.result.value?.data{
                //分类数据获取成功,设置到tab中
                self.setTabTitle(data: res)
            }
        }
    }
    
    func setTabTitle(data: [CategoryData]) {
        categories = data
        //把分类名字取出来
        for category in data {
            tabTitles.append(category.title ?? "")
        }
        //把获取的分类数组设置到tab中
        segmentedDataSource.titles = tabTitles
        //显示当前tab的第一个位置
        segmentedView.defaultSelectedIndex = 0
        //设置数据之后,需要刷新
        segmentedView.reloadData()
    }
    
    @objc func reloadData() {
//        segmentedDataSource.titles = getRandomTitles()
//        segmentedView.defaultSelectedIndex = 1
//        segmentedView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
    
    override func viewWillAppear(_ animated: Bool) {
        //视图将出现,显示
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension CategoryController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        //tab的总个数
        return segmentedDataSource.dataSource.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        //当切换的时候,加载不同的页面
        let vc = PreferentialViewController()
        //vc.typeString = segmentedDataSource.titles[index]
        return vc
    }
}
