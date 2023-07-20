//
//  ExploreScene.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 18/07/23.
//

import SpriteKit

class ExploreScene: SKScene {
    var player: Player = Player(characterFolderName: .hoodie)
    private var cameraNode: SKCameraNode? = SKCameraNode()

    override func didMove(to view: SKView) {
        if let pcComponent = player.entity?.component(ofType: PlayerControlComponent.self) {
            pcComponent.setupControls(camera: cameraNode!, scene: self)
        }
    }
}
