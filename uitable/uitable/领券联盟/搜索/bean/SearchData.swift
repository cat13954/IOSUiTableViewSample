//
//	Data.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class SearchData : NSObject, NSCoding, Mappable{

	var tbkDgMaterialOptionalResponse : TbkDgMaterialOptionalResponse?


	class func newInstance(map: Map) -> Mappable?{
        return SearchData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		tbkDgMaterialOptionalResponse <- map["tbk_dg_material_optional_response"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         tbkDgMaterialOptionalResponse = aDecoder.decodeObject(forKey: "tbk_dg_material_optional_response") as? TbkDgMaterialOptionalResponse

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if tbkDgMaterialOptionalResponse != nil{
			aCoder.encode(tbkDgMaterialOptionalResponse, forKey: "tbk_dg_material_optional_response")
		}

	}

}
