//
//  ViewController.swift
//  HLLStarMark
//
//  Created by  bochb on 2017/10/27.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HLLMarkDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let container = HLLMarkContaier(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 50), markSize: CGSize(width: 50, height: 50), markNumber: 5, style: .star)
        container.backgroundColor = UIColor.yellow
        view.addSubview(container)
        container.deSelectedFillColor = UIColor.yellow
        container.borderWidth = 4
        container.deSelectedStrokeColor = UIColor.black
        container.selectedStrokeColor = UIColor.blue
        container.delegate = self
        container.padding = 8
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        print(sin(CGFloat.pi * 30 / 180))
    }
    

    
    func markView(_ markView: HLLMarkContaier, didSelectItemAt index: Int) {
        print(markView)
        print(index)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

