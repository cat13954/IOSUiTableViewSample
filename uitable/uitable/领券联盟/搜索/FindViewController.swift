//
//  FindViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/8.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireObjectMapper

class FindViewController: BaseViewController, UISearchBarDelegate,
                          UITableViewDelegate, UITableViewDataSource{
    
    let cellId = "PreferentialCell"
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
    
    private lazy var lab: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var searchBox: UISearchBar = {
        let searchView = UISearchBar()
        return searchView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.numberOfTouchesRequired = 1
        tap.cancelsTouchesInView = false
        uiTable.addGestureRecognizer(tap)
        
        //标题
        title = "搜索"
        view.addSubview(lab)
        //搜索
        view.addSubview(searchBox)
        lab.text = "find"
        lab.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        searchBox.delegate = self
        //约束搜索
        searchBox.snp.makeConstraints { (mm) in
            mm.left.equalToSuperview()
            mm.right.equalToSuperview()
            mm.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            mm.height.equalTo(60)
        }
        
        view.addSubview(uiTable)
        self.uiTable.keyboardDismissMode = .onDrag
        //UIScrollViewKeyboardDismissModeOnDrag
        //设置代理
        uiTable.delegate = self
        uiTable.dataSource = self
        uiTable.register(PreferentialCellTableViewCell.self, forCellReuseIdentifier: cellId)
        uiTable.snp.makeConstraints { (make) in
            //安全区内
            make.top.equalTo(searchBox.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            //宽度等于屏幕
            make.width.equalToSuperview()
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    private func searchByKeyword(keyword: String){
        if keyword.isEmpty {
            return
        }
        self.view.endEditing(true)
        let paras = ["keyword": keyword, "page": 1] as [String : Any]
        Alamofire.request(UnionApi.search(),parameters: paras)
            .responseObject {  (response: DataResponse<SearchBean>) in
                //获取数据成功
                print("搜索成功了")
                let result = response.result.value
                // 设置到数组中
                if let arr = result?.data?.tbkDgMaterialOptionalResponse?.resultList?.mapData {
                    //清空全部数据
                    self.preferentialList.removeAll()
                    self.preferentialList = arr
                    //停止下拉刷新
                    self.uiTable.es.stopPullToRefresh()
                    //刷新列表
                    self.uiTable.reloadData()
                }
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchBox.resignFirstResponder()
    }
}

extension FindViewController{
    //文字变更
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //搜索文字触发回调
        print("[ViewController searchBar] 输入 searchText: \(searchText)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("键盘上面点击搜索 \(searchBar.text)")
        self.searchByKeyword(keyword: searchBar.text ?? "")
    }
}

extension FindViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //返回数组的大小
        if preferentialList.isEmpty {
            tableView.separatorStyle = .none
            tableView.setEmptyDataView(image: UIImage(systemName: "tortoise") ?? UIImage(), title: "")
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
        }
        goodsVC.goodsData = preferentialList[indexPath.row]
        navigationController?.pushViewController(goodsVC, animated: true)
    }
}



