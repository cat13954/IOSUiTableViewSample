//
//  ApiConstant.swift
//  uitable
//
//  Created by Alice on 2021/3/5.
//

import Foundation
class ApiConstant: NSObject {
    public static func getChaptersUrl() -> String{
        return "https://wanandroid.com/wxarticle/chapters/json"
    }
    
    public static func getArticleListUrl(userID: String, page: Int) -> String{
        //https://wanandroid.com/wxarticle/list/408/1/json
        //替换userID和page
        return "https://wanandroid.com/wxarticle/list/\(userID)/\(page)/json"
         
    }
    
    public static func getStoreIndexUrl() -> String{
        return "http://106.52.55.28:8080/wx/home/index"
    }
}
