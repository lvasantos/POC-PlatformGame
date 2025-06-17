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
        self.physicsWorld.contactDelegate = self
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
        ground = SKSpriteNode(color: .brown, size: CGSize(width: frame.width, height: frame.height/2))
        ground.position = CGPoint(x: frame.midX, y: frame.minY)
        ground.physicsBody = SKPhysicsBody(rectangleOf: self.ground.size)
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = ColliderType.ground.identifier
        ground.physicsBody?.collisionBitMask = ColliderType.player.identifier
        ground.physicsBody?.contactTestBitMask = ColliderType.player.identifier
        addChild(ground)


        let platformSmall = SKSpriteNode(color: .systemBrown, size: CGSize(width: frame.width/5, height: 12))
        platformSmall.position = CGPoint(x: ground.position.x + 160 + ground.frame.width/2, y:ground.frame.height/2 + 20)
        platformSmall.physicsBody = SKPhysicsBody(rectangleOf: platformSmall.size)
        platformSmall.physicsBody?.isDynamic = false
        platformSmall.physicsBody?.categoryBitMask = ColliderType.platform.identifier
        platformSmall.physicsBody?.collisionBitMask = ColliderType.player.identifier
        platformSmall.physicsBody?.contactTestBitMask = ColliderType.player.identifier
        addChild(platformSmall)

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
    /*
        --------------------------------------------

                    MARK: Physics

        --------------------------------------------
     */

    func didBegin(_ contact: SKPhysicsContact) {

        if contact.bodyA.categoryBitMask == ColliderType.player.identifier || contact.bodyB.categoryBitMask == ColliderType.player.identifier  {
            if let moveComponent = playerNode.entity?.component(ofType: ActionComponent.self){
                moveComponent.onGround = true
            }
        }
    }
}
