//
//  GraphView.swift
//  Try draw line
//
//  Created by Dima Biliy on 19.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import UIKit

private struct Constants {
  static let margin: CGFloat = 20.0
  static let topBorder: CGFloat = 60
  static let bottomBorder: CGFloat = 50
}

class LineView: UIView{
    
    var startColor: UIColor = UIColor(red: 0.914, green: 0.408, blue: 0.531, alpha: 1.0)
    var endColor: UIColor = UIColor(red: 0.16, green: 0.143, blue: 0.229, alpha: 1.0)
    
    private var graphPoints = [Int]()
    
    func receive(points : [Int]){
        graphPoints = points
    }
    
    
    override func draw(_ rect: CGRect) {
        // Градиент
        let context = UIGraphicsGetCurrentContext()!
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        let gradient = CGGradient(colorsSpace: colorSpace,colors: colors as CFArray, locations: colorLocations)!
        
        
        // рисование линий
        let width = rect.width
        let height = rect.height
        
        let margin = Constants.margin
        let graphWidth = width - margin * 2 - 4
        let columnXPoint = { (column: Int) -> CGFloat in
            let spacing = graphWidth / CGFloat(self.graphPoints.count - 1)
            return CGFloat(column) * spacing + margin + 2
        }
        
        let topBorder = Constants.topBorder
        let bottomBorder = Constants.bottomBorder
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = graphPoints.max()!
        let columnYPoint = { (graphPoint: Int) -> CGFloat in
            let y = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
            return graphHeight + topBorder - y
        }
        
        UIColor(red: 1.0, green: 0.507, blue: 0.44, alpha: 1.0).setFill()
        UIColor(red: 1.0, green: 0.507, blue: 0.44, alpha: 1.0).setStroke()
        
        // Точки линии 
        let graphPath = UIBezierPath()
        
        graphPath.lineWidth = 1.0
        graphPath.fill()
        
        graphPath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(Int(graphPoints[0]))))
        
        for i in 1..<graphPoints.count {
            let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(Int(graphPoints[i])))
            graphPath.addLine(to: nextPoint)
        }
        
        graphPath.stroke()
        
        let clippingPath = graphPath.copy() as! UIBezierPath
        
        clippingPath.addLine(to: CGPoint(x: columnXPoint(graphPoints.count - 1), y:height))
        clippingPath.addLine(to: CGPoint(x:columnXPoint(0), y:height))
        clippingPath.close()
        
        clippingPath.addClip()
        
        let highestYPoint = columnYPoint(Int(maxValue))
        let graphStartPoint = CGPoint(x: margin, y: highestYPoint - 30)
        let graphEndPoint = CGPoint(x: margin, y: frame.height)
        
        context.drawLinearGradient(gradient, start: graphStartPoint, end: graphEndPoint, options: [])
    }
    
}
