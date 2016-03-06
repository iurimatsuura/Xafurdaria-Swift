//
//  ViewController.swift
//  Xafurdaria
//
//  Created by Iuri Matsuura on 3/6/16.
//  Copyright © 2016 Iuri Matsuura. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,ResponseHandlerProtocol {

    //Why the error when remove the exclamation mark
    var responseHandler:ResponseHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        responseHandler = APIManager.sharedInstance.getPlaylist(id: "UU21wUP_bie85msUyT3eJnew", observers: [self])
        APIManager.sharedInstance.getPlaylist(id: "UU21wUP_bie85msUyT3eJnew", observers: [self])
    }
    
    func handleError(error: NSError) {
        NSLog("\(error)")
    }
    
    func handleSuccessResponse(from handler: ResponseHandler, result: AnyObject) {
        if responseHandler == handler {
            NSLog("\(result)")
        }
    }
}

