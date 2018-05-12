//
//  CGManipulatable.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/07.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

public protocol CGManipulatable {
    var size: CGSize { get }
    var origin: CGPoint { get }
    func updateFrame(_ rect: CGRect)
}

extension CGManipulatable {

}

public extension CGManipulatable where Self: PageContentView {
    public var size: CGSize {
        return self.frame.size
    }
    public var origin: CGPoint {
        return self.frame.origin
    }
    public var originX: CGFloat {
        return self.frame.origin.x
    }
    public var originY: CGFloat {
        return self.frame.origin.y
    }
    public var centerX: CGFloat {
        return self.center.x
    }
    public var centerY: CGFloat {
        return self.center.y
    }
    public func updateFrame(_ rect: CGRect) {
        self.frame = rect
    }
}

public extension CGManipulatable where Self: PageItemView {
    public var size: CGSize {
        return self.frame.size
    }
    public var origin: CGPoint {
        return self.frame.origin
    }
    public var originX: CGFloat {
        return self.frame.origin.x
    }
    public var originY: CGFloat {
        return self.frame.origin.y
    }
    public var centerX: CGFloat {
        return self.center.x
    }
    public var centerY: CGFloat {
        return self.center.y
    }
    public func updateFrame(_ rect: CGRect) {
        self.frame = rect
    }
}
