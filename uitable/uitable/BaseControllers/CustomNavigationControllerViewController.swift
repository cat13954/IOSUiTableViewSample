//
//  CustomNavigationControllerViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/10.
//

import UIKit

class CustomNavigationControllerViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //当控制器数量大于0,也就是不是第一个页面跳转了.
        if viewControllers.count > 0 {
            //隐藏底部的bar
            viewController.hidesBottomBarWhenPushed = true
        }
        //在push之后,增加上面的逻辑,通用处理bar显示的问题
        super.pushViewController(viewController, animated: animated)
    }

}
