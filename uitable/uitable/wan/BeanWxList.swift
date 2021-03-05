//
//  BeanWxList.swift
//  uitable
//  公众号列表模型
//  Created by Alice on 2021/3/5.
//

import Foundation
import ObjectMapper

class BeanWxList: Mappable {
    
    var errorCode : Int = 0
    var errorMsg : String =  ""
    var data : [WxAuthor]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        errorCode   <- map["errorCode"]
        errorMsg    <- map["errorMsg"]
        data        <- map["data"]
    }
}

class WxAuthor: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        courseId          <- map["courseId"]
        id                <- map["id"]
        name              <- map["name"]
        order             <- map["order"]
        parentChapterId   <- map["parentChapterId"]
    }
    
    var courseId: Int = 0
    var id : Int = 0
    var name : String = ""
    var order : Int = 0
    var parentChapterId : Int = 0
}
