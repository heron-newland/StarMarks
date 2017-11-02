//
//  HLLCircleView.swift
//  HLLStarMark
//
//  Created by  bochb on 2017/11/1.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class HLLCircleView: HLLMarkView {
    
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        let maxWidth = min(rect.width, rect.height)
        //中心点
        let centerP = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        
        //半径
        let radius = (maxWidth - padding * 2) * 0.5
        ctx?.move(to: centerP)
        ctx?.addArc(center: centerP, radius: radius, startAngle: -CGFloat.pi, endAngle: CGFloat.pi, clockwise: false)
//        if isSelected {
//            ctx?.setFillColor(UIColor.red.cgColor)
//        }else{
//            ctx?.setFillColor(UIColor.green.cgColor)
//        }
//        ctx?.fillPath()
        super.draw(rect)
    }
    
}
