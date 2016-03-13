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
    static let baseUrl = "https://www.googleapis.com/youtube/v3/"
    //Get playlist from Youtube Channel
    func getPlaylist(id playlistId:String, observers:[ResponseHandlerProtocol]?) -> ResponseHandler {
        
        let url = APIManager.baseUrl + "playlistItems"
        let requestParams:[String : AnyObject]? = ["part":"id,snippet,contentDetails", "maxResults":50, "playlistId":playlistId, "key":APIManager.apiKey]
        
        let playlistHandler = PlaylistResponseHandler(observers: observers)
        NetworkManager.request(url, params: requestParams, httpMethod:.GET, observer: playlistHandler)
        
        return playlistHandler
    }
    
    func getDetailsFromVideo(id videoId:String, observers:[ResponseHandlerProtocol]?) -> ResponseHandler {
        let url = APIManager.baseUrl + "videos"
        let requestParams:[String:AnyObject] = ["part":"snippet,contentDetails,statistics" , "fields":"items", "id":videoId]
        
        let videoHandler = VideoResponseHandler(observers:observers)
        NetworkManager.request(url, params: requestParams, httpMethod:.GET, observer: videoHandler)
        
        return videoHandler
    }
}
