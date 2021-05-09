//
//	TbkDgMaterialOptionalResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class TbkDgMaterialOptionalResponse : NSObject, NSCoding, Mappable{

	var requestId : String?
	var resultList : ResultList?
	var totalResults : Int?


	class func newInstance(map: Map) -> Mappable?{
		return TbkDgMaterialOptionalResponse()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		requestId <- map["request_id"]
		resultList <- map["result_list"]
		totalResults <- map["total_results"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         requestId = aDecoder.decodeObject(forKey: "request_id") as? String
         resultList = aDecoder.decodeObject(forKey: "result_list") as? ResultList
         totalResults = aDecoder.decodeObject(forKey: "total_results") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if requestId != nil{
			aCoder.encode(requestId, forKey: "request_id")
		}
		if resultList != nil{
			aCoder.encode(resultList, forKey: "result_list")
		}
		if totalResults != nil{
			aCoder.encode(totalResults, forKey: "total_results")
		}

	}

}