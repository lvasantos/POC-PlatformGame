//
//  PlayerControlComponent.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 19/07/23.
//

import SpriteKit
import GameplayKit

class PlayerControlComponent: GKComponent, ControlsInputDelegate {

    var touchControlNode: TouchControlsInputNode?

    func setupControls(camera: SKCameraNode, scene: SKScene) {
        touchControlNode = TouchControlsInputNode(frame: scene.frame)
        touchControlNode?.inputDelegate = self
        touchControlNode?.position = CGPoint.zero

        camera.addChild(touchControlNode!)
    }

    func follow(command: String?) {
        print("command \(String(describing: command))")
    }



}
