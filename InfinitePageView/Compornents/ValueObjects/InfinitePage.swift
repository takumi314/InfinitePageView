//
//  InfinitePage.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

public struct InfinitePage {
    public let index: Int
    public let item: PageItemView
    public let content: PageContentView
    public let offset: CGFloat
    public let size: CGSize
}

extension InfinitePage {
    func syncColor() -> InfinitePage {
        item.backgroundColor = color
        content.backgroundColor = color
        return self
    }
    func pipeEachView() -> (PageItemView, PageContentView) {
        return (item, content)
    }
}

extension InfinitePage: Equatable {
    public static func ==(lhs: InfinitePage, rhs: InfinitePage) -> Bool {
        return lhs.index == rhs.index &&
            lhs.item.isEqual(rhs.item) &&
            lhs.content.isEqual(rhs.content) &&
            lhs.offset == rhs.offset &&
            lhs.size == rhs.size
    }
}
