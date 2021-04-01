//
//  MainViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/8.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initTab()
    }
    
    func initTab() {
        //ZFDemoViewController
        //PreferentialViewController
        let homeVC = CustomNavigationControllerViewController(rootViewController: CategoryController())
        homeVC.tabBarItem.title = "首页"
        homeVC.tabBarItem.image = UIImage(named: "tab_home_normal")
        
        let activityVC = CustomNavigationControllerViewController(rootViewController: PreferentialViewController())
        activityVC.tabBarItem.title = "特惠"
        activityVC.tabBarItem.image = UIImage(named: "tab_activity")
        
        let findVC = CustomNavigationControllerViewController(rootViewController: FindViewController())
        findVC.tabBarItem.title = "发现"
        findVC.tabBarItem.image = UIImage(named: "tab_find_normal")
        
        let ceVC = CustomNavigationControllerViewController(rootViewController: CeViewController())
        ceVC.tabBarItem.title = "小册"
        ceVC.tabBarItem.image = UIImage(named: "tab_xiaoce_normal")
        
        let meVC = CustomNavigationControllerViewController(rootViewController: MeViewController())
        meVC.tabBarItem.title = "我的"
        meVC.tabBarItem.image = UIImage(named: "tab_profile_normal")
        
        viewControllers = [homeVC, activityVC, findVC, ceVC, meVC]
        setTabBarItemAttributes(fontName: "Courier", fontSize: 12, normalColor: ColorUtils.parser("#969695"), selectedColor: ColorUtils.parser("#027AFF"), bgColor: UIColor.white)
    }
    
    func setTabBarItemAttributes(fontName: String = "Courier",
                                     fontSize: CGFloat = 14,
                                     normalColor: UIColor = .gray,
                                     selectedColor: UIColor = .red,
                                     bgColor: UIColor = .white) {
            // tabBarItem 文字大小
            var attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: fontSize)!]
            
            // tabBarItem 文字默认颜色
            attributes[.foregroundColor] = normalColor
            UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
            
            // tabBarItem 文字选中颜色
            attributes[.foregroundColor] = selectedColor
            UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
            
            // tabBar 文字、图片 统一选中高亮色
            tabBar.tintColor = selectedColor
            
            // tabBar 背景色
            tabBar.barTintColor = bgColor
        }
 
}
