//
//  ResponseHandler.swift
//  Xafurdaria
//
//  Created by Iuri Matsuura on 3/6/16.
//  Copyright © 2016 Iuri Matsuura. All rights reserved.
//

import UIKit

protocol ResponseHandlerProtocol {
    func handleError(error:NSError)
    func handleSuccessResponse(from handler:ResponseHandler, result:AnyObject)
}

class ResponseHandler: NSObject {

    var observers:[ResponseHandlerProtocol]? = [ResponseHandlerProtocol]()

    init(observers:[ResponseHandlerProtocol]?) {
        if let obs = observers {
            self.observers = obs
        }
    }
}
