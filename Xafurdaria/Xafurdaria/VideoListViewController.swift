//
//  ViewController.swift
//  Xafurdaria
//
//  Created by Iuri Matsuura on 3/6/16.
//  Copyright © 2016 Iuri Matsuura. All rights reserved.
//

import UIKit

class VideoListViewController: UICollectionViewController,ResponseHandlerProtocol,UICollectionViewDelegateFlowLayout {

    //Why the error when remove the exclamation mark
    var responseHandler:ResponseHandler?
    var videos:[Video]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.triggerPlaylistRequest()
        
        let nibFile = UINib(nibName: "VideoCell", bundle: nil)
        self.collectionView?.registerNib(nibFile, forCellWithReuseIdentifier: "videocell")
    }
    
    //MARK: Custom methods
    func triggerPlaylistRequest() -> Void {
        responseHandler = APIManager.sharedInstance.getPlaylist(id: "UU21wUP_bie85msUyT3eJnew", observers: [self])
    }
    
    //MARK: ResponseHandler protocol 
    func handleError(error: NSError) {
        NSLog("\(error)")
    }
    
    func handleSuccessResponse(from handler: ResponseHandler, result: AnyObject) {
        if responseHandler == handler {
            self.videos = result as? [Video]
            self.collectionView?.reloadData()
        }
    }
    
    //MARK: CollectionView Datasource/Delegate
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.videos.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let videoCell:VideoCell = collectionView.dequeueReusableCellWithReuseIdentifier("videocell", forIndexPath: indexPath) as! VideoCell
        videoCell.configureCellWithVideo(self.videos[indexPath.row])
        return videoCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let trailingAndleadingPadding:CGFloat = 10.0
        let width = self.view.frame.size.width -  3*trailingAndleadingPadding
        let size = CGSizeMake(width/2, 200);
        return size
    }
    
}

