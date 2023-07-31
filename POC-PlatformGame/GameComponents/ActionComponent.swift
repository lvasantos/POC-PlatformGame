//
//  ActionComponent.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 23/07/23.
//

import GameplayKit

class ActionComponent: GKComponent {

    var hSpeed:CGFloat = 0.0
    var vSpeed:CGFloat = 0.0

    var runSpeed: CGFloat = 3.3
    var walkSpeed:CGFloat = 1.6

    var direction:CGFloat = -1.0
    var maxJump:CGFloat = 20.0

    var runMode = false
    var onGround = false

    func moveLeft() {
//        if let node = entity?.component(ofType: GKSKNodeComponent.self)?.node {
            direction = -1.0
            startMoving()
//        }
    }

    func moveRight() {
//        if let node = entity?.component(ofType: GKSKNodeComponent.self)?.node {
            direction = 1.0
            startMoving()
//        }
    }

    func jump() {
        if let node = entity?.component(ofType: GKSKNodeComponent.self)?.node {
            node.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: maxJump))
        }
    }

    private func startMoving() {
//        let stateMachine = (self.entity as! PlayerEntity).stateMachine
        hSpeed = direction * runSpeed

    }

    func stopMoving() {
        hSpeed = 0.0
    }

    override init() {
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)

        if let node = entity?.component(ofType: GKSKNodeComponent.self)?.node {
            node.position = CGPoint(x: node.position.x + hSpeed, y: node.position.y + vSpeed) // Can move while on air
//            node.position.x = node.position.x + hSpeed
            if (hSpeed > 0) {
                node.xScale = 1.0
            } else if (hSpeed < 0) {
                node.xScale = -1.0
            }
        }
    }

    
}

//        if let node = entity?.component(ofType: GKSKNodeComponent.self)?.node {
//            print("actionComponent File")
//        }
//        let stateMachine = (self.entity as! PlayerEntity).stateMachine
