//
//  ArticleViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/6.
//

import Foundation
import UIKit
import SnapKit

///作者对应文章列表
class ArticleViewController: UIViewController {
    
    //作者的id
    var userId: String?
    var authorName: String?
    
    override func viewDidLoad() {
        //设置页面的标题
        self.title = authorName
        print("id: \(userId ?? "def")")
        
    }
}
