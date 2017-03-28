//
//  BannerImageView.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit

class BannerImageView: UIImageView {
    lazy var bannerImage = UIImage(named: "banner")
    var myFrame: CGRect?
    var test = 0
    
    public static let shared: BannerImageView = {
        let banner = BannerImageView()
        banner.myFrame = CGRect(x: 0.0, y: 0.0, width: (banner.bannerImage?.size.width)!, height: (banner.bannerImage?.size.height)!)
        let wid = banner.bannerImage?.size.width
        let hei = banner.bannerImage?.size.height
        
        //banner.bannerImage?.size.width = wid*2
        
        banner.test = banner.test+50
        print("getShared")
        return banner
    }()

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        // Drawing codes
    }
    
    func nextFrame(imageV: UIImageView){
        imageV.image = self.bannerImage
        UIView.animate(withDuration: 0.5, delay: 0.3, animations: {
             
        }, completion: nil)
    }
}
