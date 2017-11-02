//
//  HLLMarkContaier.swift
//  HLLStarMark
//
//  Created by  bochb on 2017/10/27.
//  Copyright © 2017年 com.heron. All rights reserved.
//

//取view得高度作为item的最大高度计算
import UIKit

class HLLMarkContaier: UIView {
    
    
    
    var delegate: HLLMarkDelegate?
    //存放marks的数组
    var marks = [HLLMarkView]()
    //mark的大小
    var markSize: CGSize
    //mark的个数
    var markNumber: Int
    //mark的样式
    var markStyle: HLLMarkStyle
    //缓存上次给的marks的个数, 相同就不重绘, 能提高性能
    var lastStars: Int = 0
    
    //mark中的内容和mark的间距
    var padding: CGFloat = 8 {
        didSet{
            redraw()
        }
    }
    
    //边框颜色
    var selectedStrokeColor: UIColor? {
        didSet{
            redraw()
        }
    }
    var deSelectedStrokeColor: UIColor? {
        didSet{
            redraw()
        }
    }
    //填充颜色
    var selectedFillColor: UIColor? {
        didSet{
            redraw()
        }
    }
    var deSelectedFillColor: UIColor?{
        didSet{
            redraw()
        }
    }
    
    //边框宽度
    var borderWidth: CGFloat = 0  {
        didSet{
            redraw()
        }
    }
    
    //绘制图片,用与stlye == image
    //选中图片
    var selectedImge:UIImage?  {
        didSet{
            redraw()
        }
    }
    //不选中图片
    var deSelectedImage: UIImage?  {
        didSet{
            redraw()
        }
    }

    
    init(frame: CGRect, markSize: CGSize, markNumber: Int, style: HLLMarkStyle) {
        self.markSize = markSize
        self.markNumber = markNumber
        self.markStyle = style
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: markSize.width * CGFloat(markNumber), height: markSize.height))
        configure()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(paned(sender:)))

        addGestureRecognizer(tap)
        addGestureRecognizer(pan)
       
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 手势事件 ***************************
    
    /// 点击手势, 点击选择
    @objc func tapped(sender: UITapGestureRecognizer) {
        let point = sender.location(in: self)
        drawMark(to: point)
    }
    
    /// 拖动手势, 拖动选择
    @objc func paned(sender: UISwipeGestureRecognizer) {
        switch sender.state {
        case .changed:
            var point = sender.location(in: self)
            if point.x < markSize.width * 0.5 {//拖动手势小于第一个mark的一半就取消所有选中
                point = .zero
            }
            drawMark(to: point)
            debugPrint(point)
        default:
            break
        }
      
    }

    /// 从开始绘制到指定点
    ///
    /// - Parameter point: 绘制结束点
    private func drawMark(to point: CGPoint){
        if point == .zero {
            for i in 0 ..< markNumber {
                marks[i].isSelected = false
            }
            lastStars = 0
            return
        }
        let index = Int(point.x / markSize.width)
        //调用代理方法
        delegate?.markView(self, didSelectItemAt: index)
        if index != lastStars {//如果给的marks不一样就重绘
            for i in 0 ..< markNumber {
                marks[i].isSelected = index >= i
            }
            lastStars = index
        }
    }
    
    /// 配置UI
    func configure() {

        switch  markStyle {
        case .star://星星
            for i in 0 ..< markNumber {
                let star = HLLStarView(frame: CGRect(x: 0 + bounds.height * CGFloat(i), y: 0, width: bounds.height, height: bounds.height))
                //添加到标记数组中
                marks.append(star)
                star.backgroundColor = UIColor.lightGray
                star.isSelected = false
                addSubview(star)
                
            }
          
        case .circle:
            for i in 0 ..< markNumber {
                let star = HLLCircleView(frame: CGRect(x: 0 + bounds.height * CGFloat(i), y: 0, width: bounds.height, height: bounds.height))
                //添加到标记数组中
                marks.append(star)
                star.backgroundColor = UIColor.lightGray
                star.isSelected = false
                addSubview(star)
                
            }
            
        }
    }

    /// 设置好属性之后重新绘制
    func redraw() -> Void {
        for mark in marks {
            mark.deSelectedFillColor = deSelectedFillColor
            mark.selectedFillColor = selectedFillColor
            mark.selectedStrokeColor = selectedStrokeColor
            mark.deSelectedStrokeColor = deSelectedStrokeColor
            mark.deSelectedImage = deSelectedImage
            mark.selectedImge = selectedImge
            mark.borderWidth = borderWidth
            mark.padding = padding
            mark.setNeedsDisplay()
            mark.layoutIfNeeded()
        }
    }
}
