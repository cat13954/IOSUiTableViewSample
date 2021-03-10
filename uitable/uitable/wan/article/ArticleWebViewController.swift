//
//  ArticleWebViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/7.
//

import Foundation
import UIKit
import SnapKit
import WebKit
//显示文章详情的页面
class ArticleWebViewController: BaseViewController {
    
    var articleUrl = ""
    
    private lazy var webView: WKWebView = {
        let web = WKWebView(frame: .zero)
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "文章详情"
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        //打开网页
        let urlPath = URL(string: articleUrl)
        let request = NSMutableURLRequest(url: urlPath!)
        webView.load(request as URLRequest)
    }
}

