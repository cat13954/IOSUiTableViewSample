//
//  UnionApi.swift
//  uitable
//
//  Created by Alice on 2021/3/12.
//

import UIKit

class UnionApi: NSObject {
    
    //base url
    public static func getBaseUrl() -> String{
        return "http://shop.debuglive.cn/shop"
    }
    
    //获取特惠数据,传递page
    public static func getPreferentialUrl(page: Int) -> String {
        let url =  getBaseUrl() + "/onSell/\(page)";
        print(url)
        return url
    }
    //获取优惠券
    public static func getCouponsUrl() -> String {
        return getBaseUrl() + "/tpwd";
    }
    //获取分类列表
    public static func getCategoryUrl() -> String {
        return getBaseUrl() + "/discovery/categories";
    }
    //获取具体分类
    public static func getCategoriesByID(id: String, page: Int) -> String {
        return getBaseUrl() + "/discovery/\(id)/\(page)"
    }
    
    public static func search() -> String {
        return getBaseUrl() + "/search"
    }
}
