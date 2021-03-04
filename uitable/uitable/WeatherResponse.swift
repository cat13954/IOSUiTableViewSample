//
//  WeatherResponse.swift
//  sw-http
//
//  Created by Alice on 2021/3/2.
//

import Foundation
import ObjectMapper

class LoopBean: Mappable {
    var success :Bool=false
    var code :Int=0
    var message : String=""
    var data : [Forecast]?
    
    required init?(map: Map){

    }
    
    func mapping(map: Map) {
        success     <- map["success"]
        code        <- map["code"]
        message     <- map["message"]
        data        <- map["data"]
    }
}

class Forecast: Mappable {
    var id:String?
    var name:String?
    var logo:String?
    var url:String?
    var order:Int?
    var state:String?
    var createTime:String?
    var updateTime:String?
    
    
    required init?(map: Map){

    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        logo        <- map["logo"]
        url         <- map["url"]
        order       <- map["order"]
        state       <- map["state"]
        createTime  <- map["createTime"]
        updateTime  <- map["updateTime"]
       
    }
}
