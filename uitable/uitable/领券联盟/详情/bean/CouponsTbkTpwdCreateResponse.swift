//
//	TbkTpwdCreateResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class TbkTpwdCreateResponse : NSObject, NSCoding, Mappable{

	var data : Data?
	var requestId : String?


	class func newInstance(map: Map) -> Mappable?{
		return TbkTpwdCreateResponse()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		data <- map["data"]
		requestId <- map["request_id"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObject(forKey: "data") as? Data
         requestId = aDecoder.decodeObject(forKey: "request_id") as? String

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
		if requestId != nil{
			aCoder.encode(requestId, forKey: "request_id")
		}

	}

}