//
//  SKViewExtencion.swift
//  Exchange
//
//  Created by Dima Biliy on 29.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation
import SpriteKit

extension SKView {
    convenience init(withEmitter name: String) {
        self.init()
        
        self.frame = UIScreen.main.bounds
        backgroundColor = .clear
        
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = .clear
        
        guard let emitter = SKEmitterNode(fileNamed: name + ".sks") else { return }
        emitter.name = name
        emitter.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
        
        scene.addChild(emitter)
        presentScene(scene)
    }
}
