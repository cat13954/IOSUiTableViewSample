//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class CouponsResult : NSObject, NSCoding, Mappable{

	var code : Int?
	var data : Data?
	var message : String?
	var success : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return CouponsResult()
	}
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
         data = aDecoder.decodeObject(forKey: "data") as? Data
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
