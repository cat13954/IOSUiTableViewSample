//
//  PreferentialViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/12.
//

import UIKit
import Alamofire
//领券联盟特惠页面.单纯的一个ui tab
class PreferentialViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "特惠"
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
        //加载第一页数据
        getData(page: 1)
    }
    
    func getData(page: Int) {
        //获取数据
        Alamofire.request(UnionApi.getPreferentialUrl(page: page))
            .responseObject {  (response: DataResponse<PreferentialBean>) in
                //获取数据成功
                let result = response.result.value
                print("获取的数据page:\(page)")
                print(result?.data?.tbkDgOptimusMaterialResponse?.resultList?.mapData?.count)
                //设置到数组中
                if page == 1{
                    if let arr = result?.data?.tbkDgOptimusMaterialResponse?.resultList?.mapData {
                        self.preferentialList = arr
                    }
                    
                }
                //刷新列表
                self.uiTable.reloadData()
            }
    }
    
}
extension PreferentialViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //返回数组的大小
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
    }
}
