//
//  BannerImageView.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit

class BannerImageView: UIImageView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
    }
}
