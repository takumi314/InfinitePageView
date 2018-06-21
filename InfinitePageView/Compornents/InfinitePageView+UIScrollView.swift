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
    }

    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {

//        if isOK(from: currentContentOffsetX, to: scrollView.contentOffset.x) {
//
//            let index = Int((scrollView.contentOffset.x + scrollView.center.x) / scrollView.bounds.size.width)
//            print(index)
//
//            let menuItem = menuItems[index]
//
//            menuItems[currentIndex].highlightMenuItem(false)
//            menuItem.highlightMenuItem(true)
//
//
//            currentIndex = index
//
//            // moto to next offset of the scroll
//            let targetCenter = menuItem.center  // a coordinate in menuScrollView
//            let targetOffsetX = targetCenter.x - menuScrollView.bounds.width / 2
//            menuScrollView.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: true)
//        }
//
//        return

    }

    private func isOK(from start: CGFloat, to end: CGFloat) -> Bool {
        let direction = Int32(end - start )
        let halfContent = Int32(contentScrollView.bounds.size.width / 2)
        return abs(direction) > halfContent
    }

}
