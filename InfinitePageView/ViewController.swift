//
//  ViewController.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/04.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infinitePageView: InfinitePageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let itemA = PageItemView(frame: CGRect.zero, title: "TitleA")
        let contentA = PageContentView()
        let pageA = InfinitePage(index: 0, item: itemA, content: contentA, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageA)

        let itemB = PageItemView(frame: CGRect.zero, title: "TitleB")
        let contentB = PageContentView()
        let pageB = InfinitePage(index: 1, item: itemB, content: contentB, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageB)

        let itemC = PageItemView(frame: CGRect.zero, title: "TitleC")
        let contentC = PageContentView()
        let pageC = InfinitePage(index: 2, item: itemC, content: contentC, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageC)

        let itemD = PageItemView(frame: CGRect.zero, title: "TitleD")
        let contentD = PageContentView()
        let pageD = InfinitePage(index: 2, item: itemD, content: contentD, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageD)


        infinitePageView.commonInit()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        infinitePageView.scrollToView(at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

