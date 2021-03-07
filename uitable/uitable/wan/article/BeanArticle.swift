//
//  BeanArticle.swift
//  uitable
//
//  Created by Alice on 2021/3/6.
//

import Foundation
import ObjectMapper
class BeanArticle: Mappable {
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data        <- map["data"]
        errorCode   <- map["errorCode"]
        errorMsg    <- map["errorMsg"]
    }
    
    var data: ArticleInfo?
    var errorCode: Int = 0
    var errorMsg: String = ""
}

class ArticleInfo: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        curPage <- map["curPage"]
        offset <- map["offset"]
        over <- map["over"]
        pageCount <- map["pageCount"]
        size <- map["size"]
        total <- map["total"]
        datas <- map["datas"]
    }
    
    var curPage: Int = 0
    var offset: Int = 0
    var over: Bool = false
    var pageCount: Int = 0
    var size: Int = 0
    var total: Int = 0
    var datas: [Article]?
}

class Article: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        chapterName <- map["chapterName"]
        link <- map["link"]
        niceDate <- map["niceDate"]
        niceShareDate <- map["niceShareDate"]
        shareDate <- map["shareDate"]
        title <- map["title"]
    }
    var author: String = ""
    var chapterName: String = ""
    var link: String = ""
    var niceDate: String = ""
    var niceShareDate: String = ""
    var shareDate: Double = 0
    var title: String = ""
    
    
    
    
    
    
    
    
    
}
