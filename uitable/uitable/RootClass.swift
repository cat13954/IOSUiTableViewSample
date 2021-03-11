//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class RootClass : NSObject, NSCoding, Mappable{

	var data : HomeData?
	var errmsg : String?
	var errno : Int?


	class func newInstance(map: Map) -> Mappable?{
		return RootClass()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		data <- map["data"]
		errmsg <- map["errmsg"]
		errno <- map["errno"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObject(forKey: "data") as? HomeData
         errmsg = aDecoder.decodeObject(forKey: "errmsg") as? String
         errno = aDecoder.decodeObject(forKey: "errno") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if errmsg != nil{
			aCoder.encode(errmsg, forKey: "errmsg")
		}
		if errno != nil{
			aCoder.encode(errno, forKey: "errno")
		}

	}

}
class HomeData : NSObject, NSCoding, Mappable{

    var banner : [Banner]?
    var brandList : [BrandList]?
    var channel : [Channel]?
    var couponList : [CouponList]?
    var floorGoodsList : [FloorGoodsList]?
    var grouponList : [AnyObject]?
    var hotGoodsList : [GoodsList]?
    var newGoodsList : [GoodsList]?
    var topicList : [TopicList]?


     
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        banner <- map["banner"]
        brandList <- map["brandList"]
        channel <- map["channel"]
        couponList <- map["couponList"]
        floorGoodsList <- map["floorGoodsList"]
        grouponList <- map["grouponList"]
        hotGoodsList <- map["hotGoodsList"]
        newGoodsList <- map["newGoodsList"]
        topicList <- map["topicList"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         banner = aDecoder.decodeObject(forKey: "banner") as? [Banner]
         brandList = aDecoder.decodeObject(forKey: "brandList") as? [BrandList]
         channel = aDecoder.decodeObject(forKey: "channel") as? [Channel]
         couponList = aDecoder.decodeObject(forKey: "couponList") as? [CouponList]
         floorGoodsList = aDecoder.decodeObject(forKey: "floorGoodsList") as? [FloorGoodsList]
         grouponList = aDecoder.decodeObject(forKey: "grouponList") as? [AnyObject]
         hotGoodsList = aDecoder.decodeObject(forKey: "hotGoodsList") as? [GoodsList]
         newGoodsList = aDecoder.decodeObject(forKey: "newGoodsList") as? [GoodsList]
         topicList = aDecoder.decodeObject(forKey: "topicList") as? [TopicList]

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if banner != nil{
            aCoder.encode(banner, forKey: "banner")
        }
        if brandList != nil{
            aCoder.encode(brandList, forKey: "brandList")
        }
        if channel != nil{
            aCoder.encode(channel, forKey: "channel")
        }
        if couponList != nil{
            aCoder.encode(couponList, forKey: "couponList")
        }
        if floorGoodsList != nil{
            aCoder.encode(floorGoodsList, forKey: "floorGoodsList")
        }
        if grouponList != nil{
            aCoder.encode(grouponList, forKey: "grouponList")
        }
        if hotGoodsList != nil{
            aCoder.encode(hotGoodsList, forKey: "hotGoodsList")
        }
        if newGoodsList != nil{
            aCoder.encode(newGoodsList, forKey: "newGoodsList")
        }
        if topicList != nil{
            aCoder.encode(topicList, forKey: "topicList")
        }

    }

}
class Banner : NSObject, NSCoding, Mappable{

    var addTime : String?
    var content : String?
    var deleted : Bool?
    var enabled : Bool?
    var id : Int?
    var link : String?
    var name : String?
    var position : Int?
    var updateTime : String?
    var url : String?


    class func newInstance(map: Map) -> Mappable?{
        return Banner()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        addTime <- map["addTime"]
        content <- map["content"]
        deleted <- map["deleted"]
        enabled <- map["enabled"]
        id <- map["id"]
        link <- map["link"]
        name <- map["name"]
        position <- map["position"]
        updateTime <- map["updateTime"]
        url <- map["url"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         addTime = aDecoder.decodeObject(forKey: "addTime") as? String
         content = aDecoder.decodeObject(forKey: "content") as? String
         deleted = aDecoder.decodeObject(forKey: "deleted") as? Bool
         enabled = aDecoder.decodeObject(forKey: "enabled") as? Bool
         id = aDecoder.decodeObject(forKey: "id") as? Int
         link = aDecoder.decodeObject(forKey: "link") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         position = aDecoder.decodeObject(forKey: "position") as? Int
         updateTime = aDecoder.decodeObject(forKey: "updateTime") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if addTime != nil{
            aCoder.encode(addTime, forKey: "addTime")
        }
        if content != nil{
            aCoder.encode(content, forKey: "content")
        }
        if deleted != nil{
            aCoder.encode(deleted, forKey: "deleted")
        }
        if enabled != nil{
            aCoder.encode(enabled, forKey: "enabled")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if link != nil{
            aCoder.encode(link, forKey: "link")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if position != nil{
            aCoder.encode(position, forKey: "position")
        }
        if updateTime != nil{
            aCoder.encode(updateTime, forKey: "updateTime")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }

    }

}
class BrandList : NSObject, NSCoding, Mappable{

    var desc : String?
    var floorPrice : Int?
    var id : Int?
    var name : String?
    var picUrl : String?


    class func newInstance(map: Map) -> Mappable?{
        return BrandList()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        desc <- map["desc"]
        floorPrice <- map["floorPrice"]
        id <- map["id"]
        name <- map["name"]
        picUrl <- map["picUrl"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         desc = aDecoder.decodeObject(forKey: "desc") as? String
         floorPrice = aDecoder.decodeObject(forKey: "floorPrice") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         picUrl = aDecoder.decodeObject(forKey: "picUrl") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if desc != nil{
            aCoder.encode(desc, forKey: "desc")
        }
        if floorPrice != nil{
            aCoder.encode(floorPrice, forKey: "floorPrice")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if picUrl != nil{
            aCoder.encode(picUrl, forKey: "picUrl")
        }

    }

}
class Channel : NSObject, NSCoding, Mappable{

    var iconUrl : String?
    var id : Int?
    var name : String?


    class func newInstance(map: Map) -> Mappable?{
        return Channel()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        iconUrl <- map["iconUrl"]
        id <- map["id"]
        name <- map["name"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         iconUrl = aDecoder.decodeObject(forKey: "iconUrl") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if iconUrl != nil{
            aCoder.encode(iconUrl, forKey: "iconUrl")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}
class CouponList : NSObject, NSCoding, Mappable{

    var days : Int?
    var desc : String?
    var discount : Int?
    var id : Int?
    var min : Int?
    var name : String?
    var tag : String?


    class func newInstance(map: Map) -> Mappable?{
        return CouponList()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        days <- map["days"]
        desc <- map["desc"]
        discount <- map["discount"]
        id <- map["id"]
        min <- map["min"]
        name <- map["name"]
        tag <- map["tag"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         days = aDecoder.decodeObject(forKey: "days") as? Int
         desc = aDecoder.decodeObject(forKey: "desc") as? String
         discount = aDecoder.decodeObject(forKey: "discount") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         min = aDecoder.decodeObject(forKey: "min") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         tag = aDecoder.decodeObject(forKey: "tag") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if days != nil{
            aCoder.encode(days, forKey: "days")
        }
        if desc != nil{
            aCoder.encode(desc, forKey: "desc")
        }
        if discount != nil{
            aCoder.encode(discount, forKey: "discount")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if min != nil{
            aCoder.encode(min, forKey: "min")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if tag != nil{
            aCoder.encode(tag, forKey: "tag")
        }

    }

}
class FloorGoodsList : NSObject, NSCoding, Mappable{

    var goodsList : [GoodsList]?
    var id : Int?
    var name : String?


    class func newInstance(map: Map) -> Mappable?{
        return FloorGoodsList()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        goodsList <- map["goodsList"]
        id <- map["id"]
        name <- map["name"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         goodsList = aDecoder.decodeObject(forKey: "goodsList") as? [GoodsList]
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if goodsList != nil{
            aCoder.encode(goodsList, forKey: "goodsList")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}
class TopicList : NSObject, NSCoding, Mappable{

    var id : Int?
    var picUrl : String?
    var price : Int?
    var readCount : String?
    var subtitle : String?
    var title : String?


    class func newInstance(map: Map) -> Mappable?{
        return TopicList()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        picUrl <- map["picUrl"]
        price <- map["price"]
        readCount <- map["readCount"]
        subtitle <- map["subtitle"]
        title <- map["title"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? Int
         picUrl = aDecoder.decodeObject(forKey: "picUrl") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int
         readCount = aDecoder.decodeObject(forKey: "readCount") as? String
         subtitle = aDecoder.decodeObject(forKey: "subtitle") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if picUrl != nil{
            aCoder.encode(picUrl, forKey: "picUrl")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if readCount != nil{
            aCoder.encode(readCount, forKey: "readCount")
        }
        if subtitle != nil{
            aCoder.encode(subtitle, forKey: "subtitle")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }

    }

}
class GoodsList : NSObject, NSCoding, Mappable{

    var brief : String?
    var counterPrice : Int?
    var id : Int?
    var isHot : Bool?
    var isNew : Bool?
    var name : String?
    var picUrl : String?
    var retailPrice : Int?


    class func newInstance(map: Map) -> Mappable?{
        return GoodsList()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        brief <- map["brief"]
        counterPrice <- map["counterPrice"]
        id <- map["id"]
        isHot <- map["isHot"]
        isNew <- map["isNew"]
        name <- map["name"]
        picUrl <- map["picUrl"]
        retailPrice <- map["retailPrice"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         brief = aDecoder.decodeObject(forKey: "brief") as? String
         counterPrice = aDecoder.decodeObject(forKey: "counterPrice") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isHot = aDecoder.decodeObject(forKey: "isHot") as? Bool
         isNew = aDecoder.decodeObject(forKey: "isNew") as? Bool
         name = aDecoder.decodeObject(forKey: "name") as? String
         picUrl = aDecoder.decodeObject(forKey: "picUrl") as? String
         retailPrice = aDecoder.decodeObject(forKey: "retailPrice") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if brief != nil{
            aCoder.encode(brief, forKey: "brief")
        }
        if counterPrice != nil{
            aCoder.encode(counterPrice, forKey: "counterPrice")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isHot != nil{
            aCoder.encode(isHot, forKey: "isHot")
        }
        if isNew != nil{
            aCoder.encode(isNew, forKey: "isNew")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if picUrl != nil{
            aCoder.encode(picUrl, forKey: "picUrl")
        }
        if retailPrice != nil{
            aCoder.encode(retailPrice, forKey: "retailPrice")
        }

    }

}
