//
//  UIIntroductionView.swift
//  MarvelApp
//
//  Created by Valery Shestakov on 22.07.2022.
//

import UIKit

@IBDesignable
class TriangleView: UIView {

    init(width: CGFloat, height: CGFloat){
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {return}
        guard let context2 = UIGraphicsGetCurrentContext() else {return}
        
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX, y: (rect.maxY/2)))
        context.closePath()
        
        context.setFillColor(red: 1.0, green: 0, blue: 0.0, alpha: 0.60)
        context.fillPath()
        
        context2.beginPath()
        context2.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context2.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        context2.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        context2.addLine(to: CGPoint(x: rect.maxX, y: (rect.maxY/2)))
        context2.closePath()
        
        context2.setFillColor(red: 0.16, green: 0.15, blue: 0.17, alpha: 0.9)
        context2.fillPath()
    }

}
