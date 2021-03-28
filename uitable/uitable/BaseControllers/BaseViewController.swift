//
//  BaseViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/10.
//

import UIKit



class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 如果所有的 ChildViewController 都继承于 BaseViewController，且想在 viewDidLoad 中统一设置导航栏的『左按钮』，
        /// 那么，只能设置 backBarButtonItem ，而不能设置 leftBarButtonItem，原因如下：
        ///
        /// previousVC 是上一个页面，nextVC 是下一个页面，当发生 push 时，有如下规则：
        /// 1、如果 nextVC 的 leftBarButtonItem != nil，那么将在 navigationBar 的左边显示 nextVC 指定的 leftBarButtonItem；
        /// 2、如果 nextVC 的 leftBarButtonItem == nil，previousVC 的 backBarButtonItem != nil，那么将在 navigationBar 的左边显示 previousVC 指定的 backBarButtonItem；
        /// 3、如果两者都为 nil 则：
        ///   3.1、nextVC 的 navigationItem.hidesBackButton = YES，那么 navigationBar 将隐藏左侧按钮；
        ///   3.2、否则 navigationBar的左边将显示系统提供的默认返回按钮；
        ///
        /// 我们从以上规则中发现：
        /// 1、leftBarButtonItem 的优先级比 backBarButtonItem 要高；
        /// 2、backBarButtonItem 是来自上一个页面，如果当前 VC 是第一个页面，那么它没有上一个页面，也就没有 backBarButtonItem；
        /// 3、leftBarButtonItem 是来自当前页面，与上个页面无关，因此，如果当前 VC 是第一个页面，那么设置了 leftBarButtonItem 就会很奇怪；
        ///
        let item = UIBarButtonItem.init()
        navigationItem.backBarButtonItem = item
        navigationItem.backBarButtonItem?.tintColor = .black
        
        
        //设置导航栏背景为透明色图片
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //设置导航栏阴影为透明色图片
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    
}
