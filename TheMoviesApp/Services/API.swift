//
//  API.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 14/11/22.
//

import Foundation
import Alamofire

enum apiType {
    case popular
    case topRate
    case details
}

class API {
    
    func call(url:String, params:[String:Any], _ completion:@escaping (_ data:Data?, _ status:Bool) -> Void){
        AF.request(url, method: .get, parameters: params).response { response in
            DispatchQueue.main.async {
                if let responseDataOptional = response.value, let responseData = responseDataOptional {
                    completion(responseData,true)
                    return
                }
                completion(nil,false)
                return
            }
        }
    }
    
    func getImage(url:String , _ completion:@escaping (_ image:UIImage?) -> Void){
        AF.request(url, method: .get).response { response in
            if let responseDataOptional = response.value, let responseData = responseDataOptional {
                let image = UIImage(data: responseData)
                completion(image)
                return
            }
            completion(nil)
            return
        }
    }
}
