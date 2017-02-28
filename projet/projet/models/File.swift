//
//  File.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import Foundation
import UIKit

class Banner{
    private static let bannerImageView:BannerImageView! = nil
    
    static func getImageView() -> BannerImageView{
        if bannerImageView == nil{
            bannerImageView.image = UIImage(named: "banner")
        }
        
        return self.bannerImageView
    }
}
