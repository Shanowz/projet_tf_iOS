//
//  BannerImageView.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit

class BannerImageView: UIImageView {
    public static let shared = BannerImageView()
    private static var bannerImage: UIImage = UIImage(named: "banner")!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing codes
    }
    
    static func nextFrame() -> UIImage{
        return self.bannerImage
    }
}
