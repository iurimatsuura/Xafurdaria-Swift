//
//  NetworkManager.swift
//  Xafurdaria
//
//  Created by Iuri Matsuura on 3/6/16.
//  Copyright © 2016 Iuri Matsuura. All rights reserved.
//

import UIKit
import Alamofire

protocol NetworkManagerObserver {
    
    func responseDidSucceed(result: AnyObject?)
    func responseDidFail(error: NSError)
}

class NetworkManager: NSObject {
    
    static func request(url:String, params:[String : AnyObject]?, httpMethod:Alamofire.Method, observer:NetworkManagerObserver ) {
        Alamofire.request(httpMethod, url, parameters: params)
            .responseJSON { (response) -> Void in
                if let error = response.result.error {
                    observer.responseDidFail(error)
                    return
                }
                observer.responseDidSucceed(response.result.value)
        }
    }
}
