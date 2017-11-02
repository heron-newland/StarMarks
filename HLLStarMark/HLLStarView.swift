//
//  HLLStarView.swift
//  HLLStarMark
//
//  Created by  bochb on 2017/10/27.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class HLLStarView: HLLMarkView {

    //let margin: CGFloat = 8
   
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
       
        // Drawing code
        
        let maxWidth = min(rect.width, rect.height)
        //中心点
        let centerP = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
       
        //半径
        let radius = (maxWidth - padding * 2) * 0.5
        var degree: CGFloat = 0
        var points = [CGPoint]()
        //夹角
        let single: CGFloat = 360.0 / 5.0
        for i in 0 ..<  5 {
            degree = CGFloat.pi * CGFloat(i) * single / 180
       
            let deltaX = radius * sin(degree)
            let deltaY = radius * cos(degree)
            let p = CGPoint(x: centerP.x + deltaX, y: centerP.y - deltaY)
            points.append(p)
        }
        debugPrint(points)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.move(to: points[0])
        ctx?.addLine(to: points[2])
        ctx?.addLine(to: points[4])
        ctx?.addLine(to: points[1])
        ctx?.addLine(to: points[3])
        ctx?.closePath()
             
//        ctx?.setStrokeColor(UIColor.red.cgColor)
//        ctx?.setLineWidth(1)

         super.draw(rect)
    }
 

    
}
