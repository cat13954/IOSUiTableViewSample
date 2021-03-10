//
//  ArticleViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/6.
//

import Foundation
import UIKit
import SnapKit
import Alamofire

///作者对应文章列表
class ArticleViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let cellID = "article"
    private var articleList = [Article]()
    
    private lazy var uiTableView: UITableView = {
        let tab = UITableView()
        //把默认的分割线隐藏(当数据还没有返回的时候,不显示分割线)
        tab.tableFooterView = UIView(frame: .zero)
        return tab
    }()
    
    //作者的id
    var userId: String?
    var authorName: String?
    
    override func viewDidLoad() {
        //设置页面的标题
        self.title = authorName
        print("id: \(userId ?? "def")")
        view.addSubview(uiTableView)
        uiTableView.snp.makeConstraints { (make) in
            //宽度等于容器宽度 =  屏幕宽度
            make.width.equalToSuperview()
            //top bottom都是安全区的位置
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        //代理方法
        uiTableView.dataSource = self
        uiTableView.delegate = self
        //cell高度自动计算
        uiTableView.rowHeight = UITableView.automaticDimension
        //注册cell
        uiTableView.register(CellArticleDetail.self, forCellReuseIdentifier: cellID)
        //获取文章列表
        getArtileById()
        
    }
    
    func getArtileById() {
        //通过传递过来的id,获取文章列表
        Alamofire.request(ApiConstant.getArticleListUrl(userID: userId ?? "", page: 1))
            .responseObject{ (response: DataResponse<BeanArticle>) in
                //数据获取成功之后,设置到list中.然后更新table
                //let size = response.result.value?.data?.datas?.count
                //print("size: \(String(describing: size))")
                self.articleList = response.result.value?.data?.datas ?? [Article]()
                //刷新tableview
                self.uiTableView.reloadData()
            }
    }
}

extension ArticleViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CellArticleDetail
        //设置cell的数据
        cell.setValueForCell(data: articleList[indexPath.row])
        return cell
    }
    
    //文章的点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //关闭点击的灰色背景
        tableView.deselectRow(at: indexPath, animated: false)
        //点击文章的时候,进入文章详情中
        let web = ArticleWebViewController()
        //把数据中对应的文章的链接取出,设置到文章详情中的属性articleUrl中
        web.articleUrl = articleList[indexPath.row].link
        self.navigationController?.pushViewController(web, animated: true)
    }
}
