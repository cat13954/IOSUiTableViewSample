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
        return "https://api.sunofbeach.net/shop"
    }
    
    //获取特惠数据,传递page
    public static func getPreferentialUrl(page: Int) -> String{
        return getBaseUrl()+"/onSell/\(page)";
    }
}
