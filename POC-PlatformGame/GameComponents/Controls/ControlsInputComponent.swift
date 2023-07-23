////
////  ControlsInputComponent.swift
////  POC-PlatformGame
////
////  Created by Luciana Adrião on 22/07/23.
////
//
//import GameplayKit
//
//class ControlsInputComponent: GKComponent, ControlsInputDelegate {
//
//
//    var touchControlNode : TouchControlsInputNode?
//
//    func setupControls(camera : SKCameraNode, scene: SKScene) {
//
//        touchControlNode = TouchControlsInputNode(frame: scene.frame)
//        touchControlNode?.inputDelegate = self
//        touchControlNode?.position = CGPoint.zero
//
//        camera.addChild(touchControlNode!)
//    }
//
//    func follow(command: String?) {
//        if let moveComponent = entity?.component(ofType: PlayerControlComponent.self){
//            switch (command!){
//            case ("left"):
//                print("left")
////                moveComponent.moveLeft()
//            case ("right"):
//                print("right")
////                moveComponent.moveRight()
//            case ("A"):
//                print("a")
////                moveComponent.jump()
//            case ("down"):
//                print("down")
////                moveComponent.getDown()
//            case ("stop down"):
//                print("stop")
////                moveComponent.stopDown()
//            case ("X"):
//                print("x")
////                moveComponent.beginRun()
//            case "stop X","cancel X":
//                print("stop, calcel")
////                moveComponent.stopRun()
//            case "stop right","stop left","cancel right","cancel left":
//                print("stopr,stopl, cancelr, cancell")
////                moveComponent.stopMoving()
//            case ("B"):
//                print("b")
////                moveComponent.attack()
//            default:
//                print("otro boton \(String(describing: command))")
//            }
//        }
//    }
//
//}
