//
//  IdleState.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 24/07/23.
//

import GameplayKit

class IdleState: GKState {
    var node: SKNode
    var anim: SKAction

    init(withNode: SKNode, animation: SKAction) {
        node = withNode
        anim = animation
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return true
//        switch stateClass {
//        case is WalkingState.Type:
//            return true
//        case is FallingState.Type:
//            return true
//        case is JumpingState.Type:
//            return true
//        case is RunningState.Type:
//            return true
//        default:
//            return false
//        }
    }
    override func didEnter(from previousState: GKState?) {
        print("Enter idle state")
    }
    override func willExit(to nextState: GKState) {
        print("exit idle state")
    }

    override func update(deltaTime seconds: TimeInterval) {
        //
    }
}
