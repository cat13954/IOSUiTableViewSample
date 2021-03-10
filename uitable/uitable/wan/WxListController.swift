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
class WxListController: BaseViewController, UITableViewDelegate, UITableViewDataSource{

    
    //保存微信列表
    var wxList = [WxAuthor]()
    
    private lazy var uiTableView : UITableView = {
        let tab = UITableView(frame: .zero)
        
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置title
        //self.title = "公众号列表"
        //如果2个都设置,会显示nav的
        //设置导航元素项目的标题，如果没有设置self.navigationItem.title，
        //系统会使用self.title作为导航栏的标题
        self.navigationItem.title = "作者"
        
        //把tableview添加到当前控制器中.
        view.addSubview(uiTableView)
        uiTableView.snp.makeConstraints { (make) in
            //大小和父容器一样大
            make.width.equalToSuperview()
            //设置上下位置,在安全区内
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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
//tabview的cell实现
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
    
    //item 的点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //设置点击的时候,cell抬起手指之后，就没有那个选中的灰色背景颜色
        //方法①https://blog.csdn.net/iotjin/article/details/80806881
        tableView.deselectRow(at: indexPath, animated: false)
        //返回点击的position
        print("click \(indexPath.row)")
        //跳转push到一个新的view
        let articleVC = ArticleViewController()
        //传递id和名字
        articleVC.userId = String(wxList[indexPath.row].id)
        articleVC.authorName = wxList[indexPath.row].name
        self.navigationController?.pushViewController(articleVC, animated: true)
    }
}
