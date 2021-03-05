//
//  ViewController.swift
//  sw-http
//
//  Created by Alice on 2021/3/1.
//
import AlamofireObjectMapper
import UIKit
import Alamofire
class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    let cellId = "sob_loop"

    var list = [Forecast]()
    
    private lazy var tableView :UITableView = {
        let tab = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: UITableView.Style.plain)
        return tab
    }()
    
    let blogUrl = "http://moonlightshadow.cn:2020/portal/web_size_info/friend_link"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加到主视图
        view.addSubview(tableView)
        //注册代理
        tableView.dataSource = self
        tableView.delegate = self
        //高度自动
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CellLoopDetail.self, forCellReuseIdentifier: cellId)
        //请求网络数据
        httpGetLoop()
    }
    

}
extension ViewController{
    func httpGetLoop() {
        Alamofire.request(blogUrl).responseObject { (response: DataResponse<LoopBean>) in

            let weatherResponse = response.result.value
            //print(weatherResponse?.message ?? "")
            self.list = weatherResponse?.data ?? [Forecast]()
            self.tableView.reloadData()
            //print("\(self.list.count)")
        }
    }
}

extension ViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //item
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CellLoopDetail
         
        cell.setValueForCell(item: self.list[indexPath.row])
        return cell
    }
}
