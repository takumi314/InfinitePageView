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
