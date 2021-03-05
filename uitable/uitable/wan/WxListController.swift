//
//  WxListController.swift
//  uitable
//
//  Created by Alice on 2021/3/5.
//
import AlamofireObjectMapper
import UIKit
import Alamofire

//公众号列表展示页面                 
class WxListController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    //保存微信列表
    var wxList = [WxAuthor]()
    
    private lazy var uiTableView : UITableView = {
        let tab = UITableView(frame: .zero)
        
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uiTableView)
        uiTableView.snp.makeConstraints { (make) in
            //大小和父容器一样大
            make.size.equalToSuperview()
        }
        //设置代理
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.rowHeight = UITableView.automaticDimension
        uiTableView.register(CellWxAuthor.self, forCellReuseIdentifier: "cell")
        getWxList()
    }
    
    func getWxList() {
        //获取列表数据
        Alamofire.request(ApiConstant.getChaptersUrl()).responseObject { (response: DataResponse<BeanWxList>) in
            
            let wxListBean = response.result.value
            //print(wxListBean?.data?.toJSONString() ?? "")
            self.wxList = wxListBean?.data ?? [WxAuthor]()
            self.uiTableView.reloadData()
            
        }
        
    }
}

extension WxListController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wxList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellWxAuthor
        
        //设置数据
        cell.setValueForCell(data: wxList[indexPath.row])
        return cell
    }
}
