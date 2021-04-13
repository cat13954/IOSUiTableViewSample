//
//  FindViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/8.
//

import UIKit
import SnapKit
class FindViewController: BaseViewController, UISearchBarDelegate{

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
    }
}
