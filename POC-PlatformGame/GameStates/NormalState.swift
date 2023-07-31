//
//  NormalState.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 26/07/23.
//

import GameplayKit

class NormalState:GKState {
    var charNode: PlayerNode

    init(with node: PlayerNode) {
        self.charNode = node
    }

    override func update(deltaTime seconds: TimeInterval) {
        
    }

}
