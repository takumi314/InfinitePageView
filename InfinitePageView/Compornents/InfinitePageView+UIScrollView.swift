//
//  InfinitePageView+UIScrollView.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

extension InfinitePageView: UIScrollViewDelegate {

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let newContentScrollOffset = contentScrollView.contentOffset
        let newMenuScrollOffset = menuScrollView.contentOffset

        let width = scrollView.bounds.width
        let contentDirection = Int((newContentScrollOffset.x - lastContentScrollOffset.x) / width)
        let menuDirection = Int((newMenuScrollOffset.x - lastMenuScrollOffset.x) / width)

        // 右へスクロール
        if contentDirection > 0 || menuDirection > 0 {
            print("一番左端のビューを右端へ移動")
            let firstContent = viewContents.first!
            let firstMenu = menuItems.first!
            viewContents.removeFirst()
            menuItems.removeFirst()
            viewContents.insert(firstContent, at: viewContents.count)
            menuItems.insert(firstMenu, at: menuItems.count)
        }
        // スクロールなし
        else if contentDirection == 0 || menuDirection == 0 {
            print("移動なし")
            return;
        }
        // 左へスクロール
        else if contentDirection < 0 || menuDirection < 0 {
            print("一番右端のビューを左端へ移動")
            let lastContent = viewContents.last!
            let lastMenu = menuItems.last!
            viewContents.removeLast()
            menuItems.removeLast()
            viewContents.insert(lastContent, at: 0)
            menuItems.insert(lastMenu, at: 0)
        }

        var contentX: CGFloat = 0.0

        self.viewContents = viewContents.map {
            (view) -> PageContentView in

            // 左から順にコンテンツを配置する
            contentX += 0.0
            view.updateFrame(CGRect(x: contentX,
                                    y: 0.0,
                                    width: view.size.width,
                                    height: view.size.height))
            contentX += contentScrollView.bounds.width

            return view
        }

        var itemX: CGFloat = 0.0

        self.menuItems = menuItems.map {
            (view) -> PageItemView in

            // 左から順にコンテンツを配置する
            itemX += 0.0
            view.updateFrame(CGRect(x: itemX,
                                    y: 0.0,
                                    width: view.size.width,
                                    height: view.size.height))
            itemX += menuScrollView.bounds.width

            return view
        }

        contentScrollView.contentOffset = CGPoint(x: width, y: 0.0)
        lastContentScrollOffset = CGPoint(x: width, y: 0.0)

    }

    // MARK: - Remove/Add Page

    func addPageAtIndex(_ index : Int) {
        // Call didMoveToPage delegate function
    }

    func removePageAtIndex(_ index : Int) {

    }

    // MARK: - Move to page index

    /**
        Move to page at index
        - parameter index: Index of the page to move to
     */
    open func moveToPage(_ index: Int) {

    }

}
