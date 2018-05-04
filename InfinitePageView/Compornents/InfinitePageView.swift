//
//  InfinitePageView.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

@objc public protocol PageMenuDelegate {
    // MARK: - Delegate functions
    @objc optional func willMoveToPage(_ controller: UIViewController, index: Int)
    @objc optional func didMoveToPage(_ controller: UIViewController, index: Int)
}

public protocol InfinitePageViewDelegate {
    /// Tells the delegate when the paging view is about to start scrolling the content.
    func infinitePageView(_ pageView: InfinitePageView, willBeginDragging scrollView: UIScrollView)

    /// Tells the delegate when the user scrolls the content view within the receiver.
    func infinitePageView(_ pageView: InfinitePageView, didScroll scrollView: UIScrollView)

    /// Tells the delegate when dragging ended in the paging view.
    func infinitePageView(_ pageView: InfinitePageView, didEndDragging scrollView: UIScrollView)

    /// Tells the delegate that the paging view is starting to decelerate the scrolling movement.
    func infinitePageView(_ pageView: InfinitePageView, willBeginDecelerating scrollView: UIScrollView)

    /// Tells the delegate that the scroll view has ended decelerating the scrolling movement.
    func infinitePageView(_ pageView: InfinitePageView, didEndDecelerating scrollView: UIScrollView, atPage index: Int)
}


public class InfinitePageView: UIView {

    // MARK: - Configuration

    var configuration = PageMenuConfiguration()


    // MARK: - Properties

    let menuScrollView      = UIScrollView()
    let contentScrollView   = UIScrollView()
    var viewContents        = [UIView]()
    var menuItems           = [PageItemView]()
    var menuItemWidths      = [CGFloat]()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public convenience init(_ views: [UIView]) {
        self.init()
        self.viewContents = views
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Others

    //#######################################################
    var totalMenuItemWidthIfDifferentWidths: CGFloat = 0.0

    var startingMenuMargin: CGFloat = 0.0
    var menuItemMargin: CGFloat = 0.0

    var selectionIndicatorView: UIView = UIView()

    public var currentPageIndex: Int = 0
    var lastPageIndex: Int = 0

    var currentOrientationIsPortrait: Bool = true
    var pageIndexForOrientationChange: Int = 0
    var didLayoutSubviewsAfterRotation: Bool = false
    var didScrollAlready: Bool = false

    var lastControllerScrollViewContentOffset: CGFloat = 0.0
    var lastScrollDirection: PageMenuScrollDirection = .other
    var startingPageForScroll: Int = 0
    var didTapMenuItemToScroll: Bool = false

    var pagesAddedDictionary = [Int : Int]()

    open weak var delegate: PageMenuDelegate?

    var tapTimer: Timer?

    enum PageMenuScrollDirection: Int {
        case left
        case right
        case other
    }
    //###########################################################

}

extension InfinitePageView {

    func addPageView(view: UIView) {

    }

    func scrollToPreviousPage() {

    }

    func scrollToNextPage() {

    }

}
