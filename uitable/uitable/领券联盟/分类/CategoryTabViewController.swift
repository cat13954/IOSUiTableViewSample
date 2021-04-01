//
//  CategoryTabViewController.swift
//  uitable
//
//  Created by Alice on 2021/4/1.
//

import UIKit
import Alamofire
import ESPullToRefresh
import JXSegmentedView
//分类页面,提供一个分类id,获取具体分类内容
class CategoryTabViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource  {
    
    //需要提供一个分类id
    var categoryID = "9660"
    
    let cellId = "categoryCell"//默认加载第一页数据
    private var currentPage = 1
    
    //当前全部数据
    private var preferentialList = [MapData]()
    
    private lazy var uiTable: UITableView = {
        let tab = UITableView()
        //开始隐藏分割线
        tab.tableFooterView = UIView()
        //cell的高度自动计算
        tab.rowHeight = UITableView.automaticDimension
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uiTable)
        //设置代理
        uiTable.delegate = self
        uiTable.dataSource = self
        uiTable.register(PreferentialCellTableViewCell.self, forCellReuseIdentifier: cellId)
        uiTable.snp.makeConstraints { (make) in
            //安全区内
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            //宽度等于屏幕
            make.width.equalToSuperview()
        }
        
        //设置刷新es工具
        uiTable.es.addPullToRefresh {
            print("refresh??")
            self.currentPage = 1
            //下拉刷新的时候,我们获取第一页的数据
            self.getData(page: self.currentPage)
        }
        uiTable.es.addInfiniteScrolling {
            print("load more")
            self.getData(page: self.currentPage)
        }
        
        //加载第一页数据
        uiTable.es.startPullToRefresh()
    }
 
    func getData(page: Int) {
        //获取数据
        let url = UnionApi.getCategoriesByID(id: categoryID, page: page)
        print("地址:\(url)")
        Alamofire.request(url)
            .responseObject {  (response: DataResponse<CategoryListBean>) in
                //获取数据成功
                let result = response.result.value
                print("获取的数据page:\(page)")
                print(result?.message)
                //设置到数组中
                if let arr = result?.data{
                    if page == 1{
                        //清空全部数据
                        self.preferentialList.removeAll()
                        self.preferentialList = arr
                        //停止下拉刷新
                        self.uiTable.es.stopPullToRefresh()
                    } else{
                        //不是第一页的时候,我们需要把获取到的数据,加入到之前的数组中
                        
                        self.preferentialList += arr
                        self.uiTable.es.stopLoadingMore()
                    }
                    self.currentPage += 1
                    //刷新列表
                    self.uiTable.reloadData()
                } else {
                    //返回的数据是空的,那就没有数据了
                    self.uiTable.es.noticeNoMoreData()
                }
            }
    }
    
}
extension CategoryTabViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //返回数组的大小
        if preferentialList.isEmpty {
            tableView.separatorStyle = .none
            tableView.setEmptyDataView(image: UIImage(systemName: "tortoise") ?? UIImage(), title: "推荐商品正在赶来")
        }else{
            tableView.separatorStyle = .singleLine
            tableView.removeEmptyDataView()
        }
        return preferentialList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //我们的cell处理
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PreferentialCellTableViewCell
        cell.setValueForCell(item: preferentialList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //禁止cell点击之后显示灰色
        tableView.deselectRow(at: indexPath, animated: false)
        //进入详情页面
        let goodsVC = GoodsDetailControllerViewController()
        if let imgs = preferentialList[indexPath.row].smallImages?.string{
            goodsVC.images = imgs
        } else {
            goodsVC.images = ["//imgs.sunofbeaches.com/group1/M00/00/46/rBsADWBlzGyAIR-tAABhL_YvXjs27.jpeg"]
        }
        goodsVC.goodsData = preferentialList[indexPath.row]
        navigationController?.pushViewController(goodsVC, animated: true)
    }
}

extension CategoryTabViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }

    func listDidAppear() {
        //因为`JXSegmentedListContainerView`内部通过`UICollectionView`的cell加载列表。当切换tab的时候，之前的列表所在的cell就被回收到缓存池，就会从视图层级树里面被剔除掉，即没有显示出来且不在视图层级里面。这个时候MJRefreshHeader所持有的UIActivityIndicatorView就会被设置hidden。所以需要在列表显示的时候，且isRefreshing==YES的时候，再让UIActivityIndicatorView重新开启动画。
//        if (self.tableView.mj_header.isRefreshing) {
//            UIActivityIndicatorView *activity = [self.tableView.mj_header valueForKey:@"loadingView"];
//            [activity startAnimating];
//        }
//        if refreshControl?.isRefreshing == true {
//            refreshControl?.beginRefreshing()
//        }
//        print("listDidAppear")
    }

    func listDidDisappear() {
//        print("listDidDisappear")
    }
}

