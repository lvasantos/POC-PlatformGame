import SpriteKit
import GameplayKit

class NewGameScene: SKScene, SKPhysicsContactDelegate {
    var tapLocation: CGPoint = .init()
    let groundRect: SKSpriteNode = SKSpriteNode(color: .green, size: .zero)


    // -----------------

    private var cam = SKCameraNode()
    var playerNode: SKSpriteNode!
    var touchControlsInputNode: TouchControlsInputNode!

    // -----------------

    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func update(_ currentTime: TimeInterval) {
        cam.position = playerNode.position
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
//        physicsWorld.contactDelegate = self

        // ------------------------------------


        setupGround()
        // Add the container node to the scene
        cam.zPosition = 10
        cam.position = CGPoint(x: size.width/2, y: size.height/2)
        cam.isUserInteractionEnabled = false
        camera = cam

        // Create the player node and add it to the container node
        playerNode = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        playerNode.position = CGPoint(x: frame.midX, y: frame.midY)
//        playerNode.physicsBody = SKPhysicsBody(rectangleOf: playerNode.size)
        addChild(playerNode)

        // Create the HUD node and add it directly to the scene
        let hudNode = TouchControlsInputNode(frame: CGRect(x: frame.width/2, y: frame.height/2, width: size.width, height: size.height))
        hudNode.inputDelegate = self

        addChild(cam)
        cam.addChild(hudNode)

        // ------------------------------------


    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

    }

    private func setupGround() {
        groundRect.position = CGPoint(x: frame.width/3, y: frame.minY+100)
        groundRect.size = CGSize(width: frame.width, height: 200)
        groundRect.physicsBody = SKPhysicsBody(rectangleOf: groundRect.frame.size)
        groundRect.physicsBody?.isDynamic = false
        groundRect.physicsBody?.categoryBitMask = 1
        groundRect.physicsBody?.collisionBitMask = 1
        groundRect.physicsBody?.contactTestBitMask = 1
        addChild(groundRect)
    }
}

extension NewGameScene: ControlsInputDelegate {
    func follow(command: String?) {
        // Implement your logic here based on the command received from the touch controls
        // For example, you can move the player node based on the command
        switch command {
        case "left":
            playerNode.position.x -= 10
            print("left")
        case "right":
            playerNode.position.x += 10
            // Add other cases for different commands
        case "up":
            playerNode.position.y += 10
        case "down":
            playerNode.position.y -= 10
        default:
            break
        }
    }
}
