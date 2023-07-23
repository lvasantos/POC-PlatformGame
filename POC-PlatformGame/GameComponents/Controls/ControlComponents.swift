//
//  PlayerControlComponent.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 19/07/23.
//

import SpriteKit
import GameplayKit

// ------------------------------------

//  A VIEW ( B, NESSE CASO ) QUE QUER PASSAR A INFORMAÇÃO DEFINE O PROTOCOLO,

// A VIEW ( A ) ASSINA O PROTOCOLO

// ------------------------------------

class ControlComponent: GKComponent {
    var touchControlsInputNode: TouchControlsInputNode

    init(touchControlsInputNode: TouchControlsInputNode) {
        self.touchControlsInputNode = touchControlsInputNode
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupControls(camera: SKCameraNode) {
        touchControlsInputNode.inputDelegate = self
        camera.addChild(touchControlsInputNode)
    }
}

//extension ControlComponent: ControlsInputDelegate {
//    func follow(command: String?) {
//        if let moveComponent = entity?.component(ofType: PlayerComponent.self) {
//            
//        }
//    }
//}
extension ControlComponent: ControlsInputDelegate {
    func follow(command: String?) {
        if let moveComponent = entity?.component(ofType: PlayerComponent.self){
            switch (command!){
            case ("left"):
                print("left")
                moveComponent.playerNode.position = CGPoint(x: moveComponent.playerNode.position.x - 10, y: moveComponent.playerNode.position.y)
            case ("right"):
                print("right")

                moveComponent.playerNode.position = CGPoint(x: moveComponent.playerNode.position.x + 10, y: moveComponent.playerNode.position.y)
            case ("A"): print("jump")
            case ("down"):
                print("get down")
            case ("stop down"):
                print("stop down")
            case ("X"):
                print("begin run")
            case "stop X","cancel X":
                print("stop run")
            case "stop right","stop left","cancel right","cancel left":
                print("stop moving")
            case ("B"):
                print("attack")

            default:
                print("otro boton \(String(describing: command))")
            }
        }
    }
}
