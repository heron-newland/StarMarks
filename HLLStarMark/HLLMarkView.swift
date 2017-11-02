//
//  HLLMarkView.swift
//  HLLStarMark
//
//  Created by  bochb on 2017/10/27.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class HLLMarkView: UIView {

    //是否选中状态
    var isSelected = false {
        didSet{
            //如果状态改变就重绘
            if isSelected != oldValue {
                redraw()
            }
        }
    }
    // 绘制的内容和边框的距离
    
    
    var padding: CGFloat = 8
    //边框颜色
    var selectedStrokeColor: UIColor?
    var deSelectedStrokeColor: UIColor?
    //填充颜色
    var selectedFillColor: UIColor?
    var deSelectedFillColor: UIColor?
    
    //边框宽度
    var borderWidth: CGFloat = 0
    
    //绘制图片,用与stlye == image
    //选中图片
    var selectedImge:UIImage?
    //不选中图片
    var deSelectedImage: UIImage?
    
//    var didSelect = {}
    //改变状态重新绘制
    func redraw() {
        //
        debugPrint("redraw")
        setNeedsDisplay()
        layoutIfNeeded()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
//        addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func tapped() {
//        isSelected = !isSelected
////        didSelect()
//    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
       
        ctx?.setLineWidth(borderWidth)
        if isSelected {
            ctx?.setFillColor(selectedFillColor?.cgColor ?? UIColor.red.cgColor)
            ctx?.setStrokeColor(selectedStrokeColor?.cgColor ?? UIColor.clear.cgColor)
        }else{
            ctx?.setFillColor(deSelectedFillColor?.cgColor ??  UIColor.lightGray.cgColor)
            ctx?.setStrokeColor(deSelectedStrokeColor?.cgColor  ?? UIColor.clear.cgColor)
        }
        //stroke暂时不处理, 后期处理
        //ctx?.strokePath()
        //默认是fill
        ctx?.fillPath()
       
        
        
//        ctx?.strokePath()
        
    }
 

}
