//
//	Data.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Data : NSObject, NSCoding, Mappable{

	var model : String?
	var tbkTpwdCreateResponse : TbkTpwdCreateResponse?


	class func newInstance(map: Map) -> Mappable?{
		return Data()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		model <- map["model"]
		tbkTpwdCreateResponse <- map["tbk_tpwd_create_response"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         model = aDecoder.decodeObject(forKey: "model") as? String
         tbkTpwdCreateResponse = aDecoder.decodeObject(forKey: "tbk_tpwd_create_response") as? TbkTpwdCreateResponse

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if model != nil{
			aCoder.encode(model, forKey: "model")
		}
		if tbkTpwdCreateResponse != nil{
			aCoder.encode(tbkTpwdCreateResponse, forKey: "tbk_tpwd_create_response")
		}

	}

}
