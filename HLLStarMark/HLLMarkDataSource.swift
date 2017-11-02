
//
//  HLLMarkDataSource.swift
//  HLLStarMark
//
//  Created by  bochb on 2017/10/27.
//  Copyright © 2017年 com.heron. All rights reserved.
//



protocol HLLMarkDataSource {
    
    //几颗星
    func numberOfItems(in markView: HLLMarkContaier) -> Int
    
    //样式
    func styleOfItem(in markView: HLLMarkContaier) -> HLLMarkStyle
    
   
}

extension HLLMarkDataSource {
//    func styleOfItem(in markView: HLLMarkContaier) -> HLLMarkStyle {
//        return .star
//    }
}
