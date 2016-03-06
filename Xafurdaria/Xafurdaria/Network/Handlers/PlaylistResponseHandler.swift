//
//  PlaylistResponseHandler.swift
//  Xafurdaria
//
//  Created by Iuri Matsuura on 3/6/16.
//  Copyright © 2016 Iuri Matsuura. All rights reserved.
//

import UIKit

class PlaylistResponseHandler: ResponseHandler, NetworkManagerObserver{
    
    
    func responseDidFail(error: NSError) {
        for observer in observers!
        {
            observer.handleError(error)
        }
    }
    
    func responseDidSucceed(result: AnyObject?) {
        if let object = result {
            for observer in observers!
            {
                observer.handleSuccessResponse(from: self, result:object)
            }
        }
    }
    
}
