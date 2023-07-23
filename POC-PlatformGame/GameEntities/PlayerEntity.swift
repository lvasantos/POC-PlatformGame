//
//  PlayerCharacterEntity.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 22/07/23.
//

import GameplayKit

class PlayerEntity: GKEntity {
    init(playerNode: PlayerNode, scene: SKScene) {
        super.init()

        let playerComponent = PlayerComponent(playerNode: playerNode)
        addComponent(playerComponent)

        let controlsInputComponent = ControlComponent(touchControlsInputNode: TouchControlsInputNode(frame: scene.frame))
        addComponent(controlsInputComponent)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
