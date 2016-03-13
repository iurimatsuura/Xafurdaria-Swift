//
//  Video.swift
//  Xafurdaria
//
//  Created by Iuri Matsuura on 3/6/16.
//  Copyright © 2016 Iuri Matsuura. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailUrl : String! = ""
    var publishedAt:NSDate! = nil
    var name:String! = ""
    var image:UIImage?
    
    init(dictionary:NSDictionary) {
        self.thumbnailUrl = dictionary.valueForKeyPath("snippet.thumbnails.medium.url") as! String
        //TODO: date not working
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dictionary.valueForKeyPath("snippet.publishedAt") as! String
        self.publishedAt = dateFormatter.dateFromString(date)
        self.name = dictionary.valueForKeyPath("snippet.title") as! String
    }

}
