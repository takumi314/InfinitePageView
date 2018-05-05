//
//  PageItemView.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class PageItemView: UIView {

    // MARK: - Properties

    var titleLabel : UILabel?
    var menuItemSeparator : UIView?

    // MARK: - Methods

    func setUpMenuItemView(_ menuItemWidth: CGFloat,
                           menuScrollViewHeight: CGFloat,
                           indicatorHeight: CGFloat,
                           separatorPercentageHeight: CGFloat,
                           separatorWidth: CGFloat,
                           separatorRoundEdges: Bool,
                           menuItemSeparatorColor: UIColor) {


        titleLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: menuItemWidth, height: menuScrollViewHeight - indicatorHeight))

        menuItemSeparator = UIView(frame: CGRect(x: menuItemWidth - (separatorWidth / 2),
                                                 y: floor(menuScrollViewHeight * ((1.0 - separatorPercentageHeight) / 2.0)),
                                                 width: separatorWidth,
                                                 height: floor(menuScrollViewHeight * separatorPercentageHeight)))

        menuItemSeparator!.backgroundColor = menuItemSeparatorColor

        if separatorRoundEdges {
            menuItemSeparator!.layer.cornerRadius = menuItemSeparator!.frame.width / 2
        }

        menuItemSeparator!.isHidden = true
        self.addSubview(menuItemSeparator!)
        self.addSubview(titleLabel!)
    }

    func setTitleText(_ text: String) {
        guard let titleLabel = self.titleLabel
            else { return }
        titleLabel.text = text
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
    }

    func configure(for pageView: InfinitePageView, view: UIView, index: CGFloat) {

    }

}
