//
//  MenuItemConfiguration.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/09.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

struct MenuItemConfiguration {
    let menuItemWidth: CGFloat
    let menuScrollViewHeight: CGFloat
    let indicatorHeight: CGFloat
    let separatorPercentageHeight: CGFloat
    let separatorWidth: CGFloat
    let separatorRoundEdges: Bool
    let menuItemSeparatorColor: UIColor
}

extension MenuItemConfiguration: Equatable {
    static func ==(lhs: MenuItemConfiguration, rhs: MenuItemConfiguration) -> Bool {
        return lhs.menuItemWidth == rhs.menuItemWidth &&
            lhs.menuScrollViewHeight == rhs.menuScrollViewHeight &&
            lhs.indicatorHeight == rhs.indicatorHeight &&
            lhs.separatorPercentageHeight == rhs.separatorPercentageHeight &&
            lhs.separatorWidth == rhs.separatorWidth &&
            lhs.separatorRoundEdges == rhs.separatorRoundEdges &&
            lhs.menuItemSeparatorColor == rhs.menuItemSeparatorColor
    }
}
