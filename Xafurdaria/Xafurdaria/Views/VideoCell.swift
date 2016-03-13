//
//  VideoCell.swift
//  Xafurdaria
//
//  Created by Iuri Matsuura on 3/6/16.
//  Copyright © 2016 Iuri Matsuura. All rights reserved.
//

import UIKit
import SDWebImage

class VideoCell: UICollectionViewCell {

    
    @IBOutlet var videoName: UILabel!
    @IBOutlet var videoImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var placeHolderView: UIView!
    
    override func awakeFromNib() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5.0
        self.videoImageView.alpha = 0.0
        
        let red = Float(arc4random()%255)
        let green = Float(arc4random()%255)
        let blue = Float(arc4random()%255)
       
        let color = UIColor(colorLiteralRed: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
        self.placeHolderView.backgroundColor = color
    }
    
    func configureCellWithVideo (video: Video) {
        self.videoName.text = video.name
        if video.image == nil {
            self.placeHolderView.alpha = 1.0
        }
        self.videoImageView.sd_setImageWithURL(NSURL(string:video.thumbnailUrl)) { (image, error, cache, url) -> Void in
            
            video.image = image
            
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                self.placeHolderView.alpha = 0.0
                }, completion:nil)
            
            UIView .animateWithDuration(0.6, delay: 0.5, options:.CurveEaseInOut, animations: { () -> Void in
                self.videoImageView.alpha = 1.0
                }, completion: nil)
        }
    }
}

extension UIImage {
    static func fromColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}
