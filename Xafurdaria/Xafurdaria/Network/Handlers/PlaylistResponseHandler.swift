//
//  PlaylistResponseHandler.swift
//  Xafurdaria
//
//  Created by Iuri Matsuura on 3/6/16.
//  Copyright © 2016 Iuri Matsuura. All rights reserved.
//

import UIKit

class PlaylistResponseHandler: ResponseHandler {
    
    //MARK: NetworkManegerObserver Protocol methods    
    override func responseDidSucceed(result: AnyObject?) {
        if let object = result {
            let videos = self.parseResponseResult(object)
            for observer in observers!
            {
                observer.handleSuccessResponse(from: self, result:videos)
            }
        }
    }
    
    //parses the response to video objects
    func parseResponseResult(resultObject:AnyObject?) -> [Video] {
        var videos:[Video] = []
        let dictionary:NSDictionary = resultObject as! NSDictionary
        let items = dictionary.valueForKeyPath("items") as! [NSDictionary]
        for videoDict in items {
            let video:Video = Video.init(dictionary: videoDict)
            videos.append(video)
        }
        
        return videos
    }
    
}
