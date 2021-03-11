//
//  LDIndexViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/11.
//

import UIKit
import AlamofireObjectMapper

import Alamofire
//商城首页1.0
class LDIndexViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "商品"
        //获取商品列表
        getHomeListInfo()
    }

    func getHomeListInfo() {
        Alamofire.request(ApiConstant.getStoreIndexUrl()).responseObject { (response: DataResponse<RootClass>) in
            
            let homeBean = response.result.value
            print("首页获取数据:")
            print(homeBean?.data?.banner?.count)
//            //print(wxListBean?.data?.toJSONString() ?? "")
//            self.wxList = wxListBean?.data ?? [WxAuthor]()
//            self.uiTableView.reloadData()
            
        }
    }
}
