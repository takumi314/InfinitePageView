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

        let itemA = PageItemView(frame: CGRect.zero, title: "Tokyo")
        let contentA = PageContentView()
        contentA.backgroundColor = .blue
        let pageA = InfinitePage(index: 0, item: itemA, content: contentA, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageA)

        let itemB = PageItemView(frame: CGRect.zero, title: "Tipei")
        let contentB = PageContentView()
        contentB.backgroundColor = .red
        let pageB = InfinitePage(index: 1, item: itemB, content: contentB, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageB)

        let itemC = PageItemView(frame: CGRect.zero, title: "Paris")
        let contentC = PageContentView()
        contentC.backgroundColor = .yellow
        let pageC = InfinitePage(index: 2, item: itemC, content: contentC, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageC)

        let itemD = PageItemView(frame: CGRect.zero, title: "London")
        let contentD = PageContentView()
        contentD.backgroundColor = .red
        let pageD = InfinitePage(index: 3, item: itemD, content: contentD, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageD)

        let itemE = PageItemView(frame: CGRect.zero, title: "New York")
        let contentE = PageContentView()
        contentE.backgroundColor = .blue
        let pageE = InfinitePage(index: 4, item: itemE, content: contentE, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageE)

        let itemF = PageItemView(frame: CGRect.zero, title: "San Francisco")
        let contentF = PageContentView()
        contentF.backgroundColor = .yellow
        let pageF = InfinitePage(index: 5, item: itemF, content: contentF, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))
        infinitePageView.addPage(pageF)

        infinitePageView.commit()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        infinitePageView.scrollToView(at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

