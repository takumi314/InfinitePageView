//
//  InfinitePageView.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

public protocol PageMenuDelegate {
    // MARK: - Delegate functions
    func willMoveToPage(_ controller: UIViewController, index: Int)
    func didMoveToPage(_ controller: UIViewController, index: Int)
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

public enum Menu {
    static let Offset: CGFloat = 0.0
    static let height: CGFloat = 35.0
    static let fontSize: CGFloat = 16.0

    enum Padding {
        static let top: CGFloat = 0.0
        static let leading: CGFloat = 25.0
        static let trailing: CGFloat = 25.0
        static let bottom: CGFloat = 0.0
    }

    enum Margin {
        static let top: CGFloat = 4.0
        static let leading: CGFloat = 2.0
        static let trailing: CGFloat = 2.0
        static let bottom: CGFloat = 0.0
    }
}


public class InfinitePageView: UIView {

    // MARK: - Configuration

    var configuration = PageMenuConfiguration()

    // MARK: - Properties

    let menuScrollView      = UIScrollView()
    let contentScrollView   = UIScrollView()

    var selectionIndicatorView: UIView = UIView()

    public var dataSource = [InfinitePage]()

    // コンテンツ管理
    var viewContents        = [PageContentView]()
    var menuItems           = [PageItemView]()
    var menuItemWidths      = [CGFloat]()

    var lastContentScrollOffset: CGPoint = CGPoint.zero
    var lastMenuScrollOffset: CGPoint = CGPoint.zero

    // ページ管理
    var currentPage: Page = 1   // { Page| 1, 2, 3, ... }
    var currentIndex: Int = 0

    var delegate: PageMenuDelegate?

    // MARK: - Initializer

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializeMenuScrollView()
        initializeContentScrollView()
    }

    public convenience init(_ views: [PageContentView], initialIndex: Int = 0) {
        self.init(frame: CGRect.zero)
        self.viewContents = views
        self.currentIndex = initialIndex
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeMenuScrollView()
        initializeContentScrollView()
    }

}

// MARK: - Menu

extension InfinitePageView {

    func initializeMenuScrollView() {

        menuScrollView.backgroundColor = .lightGray

        // Adds the UIScrollView instance to the parent view.
        addSubview(menuScrollView)

        // Turn off autoresizing masks. This is so you can apply your own constraints
        menuScrollView.translatesAutoresizingMaskIntoConstraints = false

        // Apply constraints to the scrollview. You want the scroll view
        // to completely fill the HorizontalScrollerView
        NSLayoutConstraint.activate([
            menuScrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
            menuScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            menuScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            menuScrollView.heightAnchor.constraint(equalToConstant: Menu.height)
        ])

        // Adds the Tap Action
        let tap = UITapGestureRecognizer(target: self, action: #selector(menuScrollTapped(_:)))
        menuScrollView.addGestureRecognizer(tap)
    }

    func initializeContentScrollView() {
        contentScrollView.backgroundColor = .gray

        addSubview(contentScrollView)

        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.isPagingEnabled = true

        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: self.menuScrollView.bottomAnchor, constant: 0.0),
            contentScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            contentScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            contentScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0)
        ])
    }

    @objc func menuScrollTapped(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: menuScrollView)
        guard let index = dataSource.index(where: { $0.item.frame.contains(location) })
            else { return }

        if currentIndex != index {
            UIView.animate(withDuration: 0.5) {
                self.menuItems[self.currentIndex].highlightMenuItem(false)
            }
        }

        currentIndex = index

        // reload and move to the current page
        scrollToView(at: index)

    }

    /// Retrieves the view for a specific index and centers it.
    func scrollToView(at index: Int, animated: Bool = true) {

        // menu
        let menuItem = menuItems[index]
        let targetCenter = menuItem.center  // a coordinate in menuScrollView
        let targetOffsetX = targetCenter.x - menuScrollView.bounds.width / 2
        menuScrollView.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: animated)

        // content
        let contentView = viewContents[index]
        let targetOrigin = contentView.origin
        contentScrollView.setContentOffset(targetOrigin, animated: animated)

        UIView.animate(withDuration: 0.1) {
            self.menuItems[index].highlightMenuItem(true)
        }

    }

}

extension InfinitePageView {

    // MARK: - Public methods

    public func commit() {
        reload()
        scrollToView(at: currentIndex)
        menuScrollView.showsHorizontalScrollIndicator = false
    }

    public func addPage(_ page: InfinitePage) {
        dataSource.append(page)
    }

    func reload() {
        if dataSource.isEmpty {
            return
        }

        // remove all views from superview
        menuItems.forEach({ $0.removeFromSuperview() })
        viewContents.forEach({ $0.removeFromSuperview() })

        // setup scroll view paging
        contentScrollView.isPagingEnabled = true

        // Configure scroll view content size
//        let contentWidth = contentScrollView.bounds.width
//        let contentHeight = CGFloat(0.0)
//        contentScrollView.contentSize = CGSize(width: contentWidth * CGFloat(viewContents.count),
//                                               height: contentHeight)

        // order by index
//        viewContents = dataSource.sorted(by: { $0.index < $1.index }).map({ $0.content })

        var xValue = Menu.Offset
        var xIndex: CGFloat = 0.0
        let contentSize = contentScrollView.bounds.size

        dataSource
            .sorted { $0.index < $1.index }
            .map { ($0.item, $0.content) }
            .map { [unowned self](menu: PageItemView, content: PageContentView) -> (PageItemView, PageContentView) in

                // For menu
                xValue += Menu.Margin.leading

                let drawingTextSize = (menu.titleLabel.text ?? "").drawingRect(UIFont.systemFont(ofSize: Menu.fontSize))
                let menuItemWidth = drawingTextSize.width + Menu.Padding.leading + Menu.Padding.trailing
                menu.frame = CGRect(x: xValue, y: Menu.Margin.top, width: menuItemWidth, height: Menu.height)

                self.menuScrollView.addSubview(menu)

                xValue += menuItemWidth + Menu.Margin.trailing


                // For content
                print(xIndex)
                content.frame = CGRect(x: xIndex * contentSize.width, y: Menu.height, width: contentSize.width, height: contentSize.height)

                self.contentScrollView.addSubview(content)
                self.contentScrollView.backgroundColor = .yellow

                xIndex += 1.0

                return (menu, content)
            }.forEach {
                self.menuItems.append($0.0)
                self.viewContents.append($0.1)
            }

        menuScrollView.contentSize = CGSize(width: xValue + menuItems.last!.size.width , height: Menu.height)
        contentScrollView.contentSize = CGSize(width: xIndex * contentSize.width, height: contentSize.height)
    }

    // MARK: - Private methods

    private func sort(ascending: Bool = true) {
        dataSource = dataSource.lazy
            .sorted { (first, second) -> Bool in
                return ascending ? first.index < second.index : first.index > second.index
        }
    }

    func contentSizeOfMenuItem() -> CGFloat {
        let menuItemWidths = self.menuItemWidths
        return menuItemWidths.reduce(CGFloat(0.0), { (result, value) -> CGFloat in
            return result + value
        })
    }

    func updateOffset(pages views: [CGManipulatable]) {
        let contentWidth = contentScrollView.bounds.width

        // page origin offset
        var xAxis: CGFloat = 0.0

        for view in views {

            view.updateFrame(CGRect(x: xAxis, y: 0.0, width: contentWidth, height: view.size.height))

            // A step up to screen width
            xAxis += contentWidth
        }

    }

    // MARK: - Paging management

    typealias Page = Int

    var initialInfinitePage: [InfinitePage] {
        let lastPage = Page(dataSource.count)
        return [lastPage, 1, 2].map { (Index) in
            return dataSource[Index - 1]
        }
    }

    var nextPageSet: [Page] {
        let min = currentPage
        let lastPage = Page(dataSource.count)
        return (min...min + 2).map { (page) in
            return (page <= lastPage) ? page : (page - lastPage)
        }
    }

    var previousPageSet: [Page] {
        let max = currentPage
        let lastPage = Page(dataSource.count)
        return (max - 2...max).map { (page) in
            return (page < 1) ? (page + lastPage) : page
        }
    }

    var nextInfinitePages: [InfinitePage] {
        return nextPageSet.map { (index) in
            return dataSource[index - 1]
        }
    }

    var previousInfinitePages: [InfinitePage] {
        return previousPageSet.map { (index) in
            return dataSource[index - 1]
        }
    }

    // MARK: -

    func layout(pages views: [UIView], above scrollView: UIScrollView) {
        views.forEach(scrollView.addSubview(_:))
        updateContentSize(views)
    }

    func updateContentSize(_ views: [UIView]) {
        guard views.isEmpty else {
            return
        }
        let viewWidth = UIScreen.main.bounds.width
        let viewHeight = views.first!.bounds.height
        contentScrollView.contentSize = CGSize(width: viewWidth * CGFloat(views.count), height: viewHeight)
    }

    func scrollToPreviousPage() {

    }

    func scrollToNextPage() {

    }

}
