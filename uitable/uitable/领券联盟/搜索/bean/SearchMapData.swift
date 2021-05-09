//
//	MapData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class SearchMapData : NSObject, NSCoding, Mappable{

	var categoryId : Int?
	var categoryName : String?
	var commissionRate : String?
	var commissionType : String?
	var couponAmount : AnyObject?
	var couponEndTime : AnyObject?
	var couponId : String?
	var couponInfo : String?
	var couponRemainCount : Int?
	var couponShareUrl : AnyObject?
	var couponStartFee : AnyObject?
	var couponStartTime : AnyObject?
	var couponTotalCount : Int?
	var includeDxjh : Bool?
	var includeMkt : Bool?
	var infoDxjh : String?
	var itemDescription : String?
	var itemId : Int?
	var itemUrl : String?
	var jddNum : Int?
	var jddPrice : AnyObject?
	var levelOneCategoryId : Int?
	var levelOneCategoryName : String?
	var nick : String?
	var numIid : Int?
	var oetime : AnyObject?
	var ostime : AnyObject?
	var pictUrl : String?
	var presaleDeposit : String?
	var presaleEndTime : Int?
	var presaleStartTime : Int?
	var presaleTailEndTime : Int?
	var presaleTailStartTime : Int?
	var provcity : String?
	var realPostFee : String?
	var reservePrice : String?
	var sellerId : Int?
	var shopDsr : Int?
	var shopTitle : String?
	var shortTitle : String?
	var smallImages : SmallImage?
	var title : String?
	var tkTotalCommi : String?
	var tkTotalSales : String?
	var url : String?
	var userType : Int?
	var volume : Int?
	var whiteImage : String?
	var xId : String?
	var zkFinalPrice : String?


	class func newInstance(map: Map) -> Mappable?{
		return SearchMapData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		categoryId <- map["category_id"]
		categoryName <- map["category_name"]
		commissionRate <- map["commission_rate"]
		commissionType <- map["commission_type"]
		couponAmount <- map["coupon_amount"]
		couponEndTime <- map["coupon_end_time"]
		couponId <- map["coupon_id"]
		couponInfo <- map["coupon_info"]
		couponRemainCount <- map["coupon_remain_count"]
		couponShareUrl <- map["coupon_share_url"]
		couponStartFee <- map["coupon_start_fee"]
		couponStartTime <- map["coupon_start_time"]
		couponTotalCount <- map["coupon_total_count"]
		includeDxjh <- map["include_dxjh"]
		includeMkt <- map["include_mkt"]
		infoDxjh <- map["info_dxjh"]
		itemDescription <- map["item_description"]
		itemId <- map["item_id"]
		itemUrl <- map["item_url"]
		jddNum <- map["jdd_num"]
		jddPrice <- map["jdd_price"]
		levelOneCategoryId <- map["level_one_category_id"]
		levelOneCategoryName <- map["level_one_category_name"]
		nick <- map["nick"]
		numIid <- map["num_iid"]
		oetime <- map["oetime"]
		ostime <- map["ostime"]
		pictUrl <- map["pict_url"]
		presaleDeposit <- map["presale_deposit"]
		presaleEndTime <- map["presale_end_time"]
		presaleStartTime <- map["presale_start_time"]
		presaleTailEndTime <- map["presale_tail_end_time"]
		presaleTailStartTime <- map["presale_tail_start_time"]
		provcity <- map["provcity"]
		realPostFee <- map["real_post_fee"]
		reservePrice <- map["reserve_price"]
		sellerId <- map["seller_id"]
		shopDsr <- map["shop_dsr"]
		shopTitle <- map["shop_title"]
		shortTitle <- map["short_title"]
		smallImages <- map["small_images"]
		title <- map["title"]
		tkTotalCommi <- map["tk_total_commi"]
		tkTotalSales <- map["tk_total_sales"]
		url <- map["url"]
		userType <- map["user_type"]
		volume <- map["volume"]
		whiteImage <- map["white_image"]
		xId <- map["x_id"]
		zkFinalPrice <- map["zk_final_price"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         categoryId = aDecoder.decodeObject(forKey: "category_id") as? Int
         categoryName = aDecoder.decodeObject(forKey: "category_name") as? String
         commissionRate = aDecoder.decodeObject(forKey: "commission_rate") as? String
         commissionType = aDecoder.decodeObject(forKey: "commission_type") as? String
         couponAmount = aDecoder.decodeObject(forKey: "coupon_amount") as? AnyObject
         couponEndTime = aDecoder.decodeObject(forKey: "coupon_end_time") as? AnyObject
         couponId = aDecoder.decodeObject(forKey: "coupon_id") as? String
         couponInfo = aDecoder.decodeObject(forKey: "coupon_info") as? String
         couponRemainCount = aDecoder.decodeObject(forKey: "coupon_remain_count") as? Int
         couponShareUrl = aDecoder.decodeObject(forKey: "coupon_share_url") as? AnyObject
         couponStartFee = aDecoder.decodeObject(forKey: "coupon_start_fee") as? AnyObject
         couponStartTime = aDecoder.decodeObject(forKey: "coupon_start_time") as? AnyObject
         couponTotalCount = aDecoder.decodeObject(forKey: "coupon_total_count") as? Int
         includeDxjh = aDecoder.decodeObject(forKey: "include_dxjh") as? Bool
         includeMkt = aDecoder.decodeObject(forKey: "include_mkt") as? Bool
         infoDxjh = aDecoder.decodeObject(forKey: "info_dxjh") as? String
         itemDescription = aDecoder.decodeObject(forKey: "item_description") as? String
         itemId = aDecoder.decodeObject(forKey: "item_id") as? Int
         itemUrl = aDecoder.decodeObject(forKey: "item_url") as? String
         jddNum = aDecoder.decodeObject(forKey: "jdd_num") as? Int
         jddPrice = aDecoder.decodeObject(forKey: "jdd_price") as? AnyObject
         levelOneCategoryId = aDecoder.decodeObject(forKey: "level_one_category_id") as? Int
         levelOneCategoryName = aDecoder.decodeObject(forKey: "level_one_category_name") as? String
         nick = aDecoder.decodeObject(forKey: "nick") as? String
         numIid = aDecoder.decodeObject(forKey: "num_iid") as? Int
         oetime = aDecoder.decodeObject(forKey: "oetime") as? AnyObject
         ostime = aDecoder.decodeObject(forKey: "ostime") as? AnyObject
         pictUrl = aDecoder.decodeObject(forKey: "pict_url") as? String
         presaleDeposit = aDecoder.decodeObject(forKey: "presale_deposit") as? String
         presaleEndTime = aDecoder.decodeObject(forKey: "presale_end_time") as? Int
         presaleStartTime = aDecoder.decodeObject(forKey: "presale_start_time") as? Int
         presaleTailEndTime = aDecoder.decodeObject(forKey: "presale_tail_end_time") as? Int
         presaleTailStartTime = aDecoder.decodeObject(forKey: "presale_tail_start_time") as? Int
         provcity = aDecoder.decodeObject(forKey: "provcity") as? String
         realPostFee = aDecoder.decodeObject(forKey: "real_post_fee") as? String
         reservePrice = aDecoder.decodeObject(forKey: "reserve_price") as? String
         sellerId = aDecoder.decodeObject(forKey: "seller_id") as? Int
         shopDsr = aDecoder.decodeObject(forKey: "shop_dsr") as? Int
         shopTitle = aDecoder.decodeObject(forKey: "shop_title") as? String
         shortTitle = aDecoder.decodeObject(forKey: "short_title") as? String
         smallImages = aDecoder.decodeObject(forKey: "small_images") as? SmallImage
         title = aDecoder.decodeObject(forKey: "title") as? String
         tkTotalCommi = aDecoder.decodeObject(forKey: "tk_total_commi") as? String
         tkTotalSales = aDecoder.decodeObject(forKey: "tk_total_sales") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         userType = aDecoder.decodeObject(forKey: "user_type") as? Int
         volume = aDecoder.decodeObject(forKey: "volume") as? Int
         whiteImage = aDecoder.decodeObject(forKey: "white_image") as? String
         xId = aDecoder.decodeObject(forKey: "x_id") as? String
         zkFinalPrice = aDecoder.decodeObject(forKey: "zk_final_price") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if categoryId != nil{
			aCoder.encode(categoryId, forKey: "category_id")
		}
		if categoryName != nil{
			aCoder.encode(categoryName, forKey: "category_name")
		}
		if commissionRate != nil{
			aCoder.encode(commissionRate, forKey: "commission_rate")
		}
		if commissionType != nil{
			aCoder.encode(commissionType, forKey: "commission_type")
		}
		if couponAmount != nil{
			aCoder.encode(couponAmount, forKey: "coupon_amount")
		}
		if couponEndTime != nil{
			aCoder.encode(couponEndTime, forKey: "coupon_end_time")
		}
		if couponId != nil{
			aCoder.encode(couponId, forKey: "coupon_id")
		}
		if couponInfo != nil{
			aCoder.encode(couponInfo, forKey: "coupon_info")
		}
		if couponRemainCount != nil{
			aCoder.encode(couponRemainCount, forKey: "coupon_remain_count")
		}
		if couponShareUrl != nil{
			aCoder.encode(couponShareUrl, forKey: "coupon_share_url")
		}
		if couponStartFee != nil{
			aCoder.encode(couponStartFee, forKey: "coupon_start_fee")
		}
		if couponStartTime != nil{
			aCoder.encode(couponStartTime, forKey: "coupon_start_time")
		}
		if couponTotalCount != nil{
			aCoder.encode(couponTotalCount, forKey: "coupon_total_count")
		}
		if includeDxjh != nil{
			aCoder.encode(includeDxjh, forKey: "include_dxjh")
		}
		if includeMkt != nil{
			aCoder.encode(includeMkt, forKey: "include_mkt")
		}
		if infoDxjh != nil{
			aCoder.encode(infoDxjh, forKey: "info_dxjh")
		}
		if itemDescription != nil{
			aCoder.encode(itemDescription, forKey: "item_description")
		}
		if itemId != nil{
			aCoder.encode(itemId, forKey: "item_id")
		}
		if itemUrl != nil{
			aCoder.encode(itemUrl, forKey: "item_url")
		}
		if jddNum != nil{
			aCoder.encode(jddNum, forKey: "jdd_num")
		}
		if jddPrice != nil{
			aCoder.encode(jddPrice, forKey: "jdd_price")
		}
		if levelOneCategoryId != nil{
			aCoder.encode(levelOneCategoryId, forKey: "level_one_category_id")
		}
		if levelOneCategoryName != nil{
			aCoder.encode(levelOneCategoryName, forKey: "level_one_category_name")
		}
		if nick != nil{
			aCoder.encode(nick, forKey: "nick")
		}
		if numIid != nil{
			aCoder.encode(numIid, forKey: "num_iid")
		}
		if oetime != nil{
			aCoder.encode(oetime, forKey: "oetime")
		}
		if ostime != nil{
			aCoder.encode(ostime, forKey: "ostime")
		}
		if pictUrl != nil{
			aCoder.encode(pictUrl, forKey: "pict_url")
		}
		if presaleDeposit != nil{
			aCoder.encode(presaleDeposit, forKey: "presale_deposit")
		}
		if presaleEndTime != nil{
			aCoder.encode(presaleEndTime, forKey: "presale_end_time")
		}
		if presaleStartTime != nil{
			aCoder.encode(presaleStartTime, forKey: "presale_start_time")
		}
		if presaleTailEndTime != nil{
			aCoder.encode(presaleTailEndTime, forKey: "presale_tail_end_time")
		}
		if presaleTailStartTime != nil{
			aCoder.encode(presaleTailStartTime, forKey: "presale_tail_start_time")
		}
		if provcity != nil{
			aCoder.encode(provcity, forKey: "provcity")
		}
		if realPostFee != nil{
			aCoder.encode(realPostFee, forKey: "real_post_fee")
		}
		if reservePrice != nil{
			aCoder.encode(reservePrice, forKey: "reserve_price")
		}
		if sellerId != nil{
			aCoder.encode(sellerId, forKey: "seller_id")
		}
		if shopDsr != nil{
			aCoder.encode(shopDsr, forKey: "shop_dsr")
		}
		if shopTitle != nil{
			aCoder.encode(shopTitle, forKey: "shop_title")
		}
		if shortTitle != nil{
			aCoder.encode(shortTitle, forKey: "short_title")
		}
		if smallImages != nil{
			aCoder.encode(smallImages, forKey: "small_images")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if tkTotalCommi != nil{
			aCoder.encode(tkTotalCommi, forKey: "tk_total_commi")
		}
		if tkTotalSales != nil{
			aCoder.encode(tkTotalSales, forKey: "tk_total_sales")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if userType != nil{
			aCoder.encode(userType, forKey: "user_type")
		}
		if volume != nil{
			aCoder.encode(volume, forKey: "volume")
		}
		if whiteImage != nil{
			aCoder.encode(whiteImage, forKey: "white_image")
		}
		if xId != nil{
			aCoder.encode(xId, forKey: "x_id")
		}
		if zkFinalPrice != nil{
			aCoder.encode(zkFinalPrice, forKey: "zk_final_price")
		}

	}

}
