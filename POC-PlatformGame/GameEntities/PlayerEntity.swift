//
//  PlayerCharacterEntity.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 22/07/23.
//

import GameplayKit

class PlayerEntity: GKEntity {
    var stateMachine: GKStateMachine?
    var playerNode: PlayerNode

    init(playerNode: PlayerNode, scene: SKScene) {

        self.playerNode = playerNode
        let playerComponent = PlayerComponent(playerNode: playerNode)
        super.init()



        let actionComponent = ActionComponent()
        let controlsInputComponent = ControlComponent(touchControlsInputNode: TouchControlsInputNode(frame: scene.frame))

        addComponent(playerComponent)
        addComponent(actionComponent)
        addComponent(controlsInputComponent)

        setStateMachine()

        if let stateMachine = stateMachine {
            stateMachine.enter(IdleState.self)
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setStateMachine() {
        let normalState = NormalState(with: self.playerNode)
        let idleState = IdleState(withNode: self.playerNode, animation: SKAction())

        stateMachine = GKStateMachine(states: [normalState, idleState])

    }
}
