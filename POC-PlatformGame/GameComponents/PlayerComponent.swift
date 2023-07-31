//
//  PlayerComponent.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 22/07/23.
//

import GameplayKit

class PlayerComponent: GKComponent {
    var playerNode: PlayerNode

    init(playerNode: PlayerNode) {
        self.playerNode = playerNode
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
