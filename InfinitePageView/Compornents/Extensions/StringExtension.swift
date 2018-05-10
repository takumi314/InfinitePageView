//
//  StringExtension.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/10.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

extension String {

    func drawingRect(_ font: UIFont) -> CGRect {
        let maxSize = CGSize(width: UIScreen.main.bounds.width , height: 1000.0)
        return drawingRect(font, within: maxSize)
    }

    func drawingRect(_ font: UIFont, within maxSize: CGSize) -> CGRect {
        return (self as NSString).boundingRect(
            with: maxSize,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [NSAttributedStringKey.font: font],
            context: nil
        )
    }


}
