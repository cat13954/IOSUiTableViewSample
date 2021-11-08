//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class PreferentialBean : NSObject, NSCoding, Mappable{

	var code : Int?
	var data : DataBean?
	var message : String?
	var success : Bool?


	 
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		code <- map["code"]
		data <- map["data"]
		message <- map["message"]
		success <- map["success"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         code = aDecoder.decodeObject(forKey: "code") as? Int
         data = aDecoder.decodeObject(forKey: "data") as? DataBean
         message = aDecoder.decodeObject(forKey: "message") as? String
         success = aDecoder.decodeObject(forKey: "success") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if code != nil{
			aCoder.encode(code, forKey: "code")
		}
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if success != nil{
			aCoder.encode(success, forKey: "success")
		}

	}

}
class TbkDgOptimusMaterialResponse : NSObject, NSCoding, Mappable{

    var isDefault : Bool?
    var requestId : String?
    var resultList : ResultList?


    class func newInstance(map: Map) -> Mappable?{
        return TbkDgOptimusMaterialResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        isDefault <- map["is_default"]
        requestId <- map["request_id"]
        resultList <- map["result_list"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         isDefault = aDecoder.decodeObject(forKey: "is_default") as? Bool
         requestId = aDecoder.decodeObject(forKey: "request_id") as? String
         resultList = aDecoder.decodeObject(forKey: "result_list") as? ResultList

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if isDefault != nil{
            aCoder.encode(isDefault, forKey: "is_default")
        }
        if requestId != nil{
            aCoder.encode(requestId, forKey: "request_id")
        }
        if resultList != nil{
            aCoder.encode(resultList, forKey: "result_list")
        }

    }

}
class SmallImage : NSObject, NSCoding, Mappable{

    var string : [String]?


    class func newInstance(map: Map) -> Mappable?{
        return SmallImage()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        string <- map["string"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         string = aDecoder.decodeObject(forKey: "string") as? [String]

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if string != nil{
            aCoder.encode(string, forKey: "string")
        }

    }

}
class DataBean : NSObject, NSCoding, Mappable{

    var tbkDgOptimusMaterialResponse : TbkDgOptimusMaterialResponse?


   
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        tbkDgOptimusMaterialResponse <- map["tbk_dg_optimus_material_response"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         tbkDgOptimusMaterialResponse = aDecoder.decodeObject(forKey: "tbk_dg_optimus_material_response") as? TbkDgOptimusMaterialResponse

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if tbkDgOptimusMaterialResponse != nil{
            aCoder.encode(tbkDgOptimusMaterialResponse, forKey: "tbk_dg_optimus_material_response")
        }

    }

}

class MapData : NSObject, Mappable{

    var categoryId : Int?
    var categoryName : AnyObject?
    var clickUrl : String?
    var commissionRate : String?
    var couponAmount : Int = 0
    var couponClickUrl : String?
    var couponEndTime : String?
    var couponInfo : AnyObject?
    var couponRemainCount : Int?
    var couponShareUrl : String?
    var couponStartFee : String?
    var couponStartTime : String?
    var couponTotalCount : Int?
    var itemDescription : String?
    var itemId : Int?
    var levelOneCategoryId : Int?
    var levelOneCategoryName : String?
    var nick : String?
    var pictUrl : String?
    var sellerId : Int?
    var shopTitle : AnyObject?
    var smallImages : SmallImage?
    var title : String?
    var userType : Int?
    var volume : Int?
    var zkFinalPrice : String?
    var url : String?
    var reservePrice : String?

    class func newInstance(map: Map) -> Mappable?{
        return MapData()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        reservePrice <- map["reserve_price"]
        url <- map["url"]
        categoryId <- map["category_id"]
        categoryName <- map["category_name"]
        clickUrl <- map["click_url"]
        commissionRate <- map["commission_rate"]
        couponAmount <- map["coupon_amount"]
        couponClickUrl <- map["coupon_click_url"]
        couponEndTime <- map["coupon_end_time"]
        couponInfo <- map["coupon_info"]
        couponRemainCount <- map["coupon_remain_count"]
        couponShareUrl <- map["coupon_share_url"]
        couponStartFee <- map["coupon_start_fee"]
        couponStartTime <- map["coupon_start_time"]
        couponTotalCount <- map["coupon_total_count"]
        itemDescription <- map["item_description"]
        itemId <- map["item_id"]
        levelOneCategoryId <- map["level_one_category_id"]
        levelOneCategoryName <- map["level_one_category_name"]
        nick <- map["nick"]
        pictUrl <- map["pict_url"]
        sellerId <- map["seller_id"]
        shopTitle <- map["shop_title"]
        smallImages <- map["small_images"]
        title <- map["title"]
        userType <- map["user_type"]
        volume <- map["volume"]
        zkFinalPrice <- map["zk_final_price"]
        
    }


}

class ResultList : NSObject, NSCoding, Mappable{

    var mapData : [MapData]?


    class func newInstance(map: Map) -> Mappable?{
        return ResultList()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        mapData <- map["map_data"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         mapData = aDecoder.decodeObject(forKey: "map_data") as? [MapData]

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if mapData != nil{
            aCoder.encode(mapData, forKey: "map_data")
        }

    }

}

class CategoryListBean : NSObject, Mappable{

    var code : Int?
    var data : [MapData]?
    var message : String?
    var success : Bool?


     
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        code <- map["code"]
        data <- map["data"]
        message <- map["message"]
        success <- map["success"]
        
    }
 

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if data != nil{
            aCoder.encode(data, forKey: "data")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}
