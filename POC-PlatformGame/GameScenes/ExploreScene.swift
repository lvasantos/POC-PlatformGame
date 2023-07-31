//
//  ExploreScene.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 18/07/23.
//

import SpriteKit
import GameplayKit

class ExploreScene: SKScene, SKPhysicsContactDelegate {
    private var cam: SKCameraNode = SKCameraNode()

    var entityManager: EntityManager = EntityManager()
    var playerEntity: PlayerEntity?
    var playerNode: PlayerNode!
    private var ground: SKSpriteNode!

    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -5)
        // Load Sprites in type Player,and add the sprites
        setupGround()
        setupPlayer()
        setupCamera()

        // The entity has all logic settings, now add playerNode
        playerEntity = PlayerEntity(playerNode: playerNode, scene: self)
        let skNodeComponent = GKSKNodeComponent(node: playerNode)
        playerEntity!.addComponent(skNodeComponent)
        // Add the entities to entityManager
        if let playerEntity = playerEntity {
            entityManager.addEntity(playerEntity)
        }

        if let pcc = playerEntity?.component(ofType: ControlComponent.self) {
            pcc.setupControls(camera: cam)
        }


    }


    func setupCamera() {
        cam.zPosition = 10
        cam.position = CGPoint(x: frame.midX, y: frame.midY)
        cam.setScale(1.4)
        cam.isUserInteractionEnabled = false
        camera = cam
        addChild(camera!)
    }

    func setupPlayer() {
        playerNode = PlayerNode()
        playerNode.physicsBody = SKPhysicsBody(rectangleOf: self.playerNode.size)
        playerNode.physicsBody?.categoryBitMask = ColliderType.player.identifier
        playerNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playerNode)
    }

    func setupGround() {
        let behind = SKSpriteNode(color: .gray, size: CGSize(width: frame.width/2, height: frame.height))
        behind.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(behind)

        ground = SKSpriteNode(color: .brown, size: CGSize(width: frame.width, height: frame.height/2))
        ground.position = CGPoint(x: frame.midX, y: frame.minY)
        ground.physicsBody = SKPhysicsBody(rectangleOf: self.ground.size)
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = ColliderType.ground.identifier
        ground.physicsBody?.collisionBitMask = ColliderType.player.identifier
        addChild(ground)

    }

/*
    --------------------------------------------

                MARK: Camera Movement

    --------------------------------------------
 */
    func centerOnNode(node: SKNode) {
        self.cam.run(SKAction.move(to: CGPoint(x:node.position.x , y:node.position.y), duration: 0.5))
    }

    override func didFinishUpdate() {
        centerOnNode(node: playerNode)
    }

    override func update(_ currentTime: TimeInterval) {
        entityManager.update(deltaTime: currentTime)
    }

}



