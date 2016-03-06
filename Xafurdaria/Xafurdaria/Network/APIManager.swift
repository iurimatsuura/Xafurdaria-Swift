//
//  APIManager.swift
//  Xafurdaria
//
//  Created by Iuri Matsuura on 3/6/16.
//  Copyright © 2016 Iuri Matsuura. All rights reserved.
//

import UIKit

class APIManager: NSObject {

    static let sharedInstance = APIManager()
    
    static let apiKey = "AIzaSyA7-TdCyHBVFoGvp2oixemxDX72a_C0Xcs"
    
    func getPlaylist(id playlistId:String, observers:[ResponseHandlerProtocol]?) -> ResponseHandler {
        
        let url = "https://www.googleapis.com/youtube/v3/playlistItems"
        let requestParams:[String : AnyObject]? = ["part":"id,snippet,contentDetails", "maxResults":10, "playlistId":playlistId, "key":APIManager.apiKey]
        
        let playlistHandler = PlaylistResponseHandler(observers: observers)
        NetworkManager.request(url, params: requestParams, httpMethod: .GET, observer: playlistHandler)
        
        return playlistHandler
    }
}
