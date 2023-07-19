import SpriteKit
import GameplayKit

class NewGameScene: SKScene, SKPhysicsContactDelegate {
    var player: PlayerNode = PlayerNode(characterFolderName: .hoodie)
    var tapLocation: CGPoint = .init()
    let groundRect: SKSpriteNode = SKSpriteNode(color: .green, size: .zero)
    private var cameraNode: SKCameraNode? = SKCameraNode()

    // -----------------
    lazy var controls = TouchControlsInputNode(frame: frame)
    let leftButton = SKSpriteNode(color: .gray, size: CGSize(width: 50, height: 50))
    let rightButton = SKSpriteNode(color: .gray, size: CGSize(width: 50, height: 50))
    var entities =  [GKEntity]()
    // -----------------

    override init(size: CGSize) {
        super.init(size: size)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func update(_ currentTime: TimeInterval) {
        // Game logic update code
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        physicsWorld.contactDelegate = self
        setupPlayer()

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
//        Receive the first location that the user touched and updates the BuildCharacter
        if let location = touches.first?.location(in: self) {
            tapLocation = location
        }
    }

    private func setupPlayer() {
//        player.physicsBody = SKPhysicsBody(rectangleOf: player.frame.size)
//        player.physicsBody?.categoryBitMask = 2
//        player.physicsBody?.collisionBitMask = 1
//        player.physicsBody?.contactTestBitMask = 2
        player.position = CGPoint(x: groundRect.frame.midX, y: groundRect.frame.maxY + player.frame.height)
        addChild(player)
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

    private func movePlayerRight() {
        movePlayer(by: player.size.width)
    }
    private func movePlayerLeft() {
        movePlayer(by: -player.size.width)
    }

    private func movePlayer(by distance: CGFloat) {

        let newPosition = CGPoint(x: player.position.x + distance, y: player.position.y)

        let moveAction = SKAction.move(to: newPosition, duration: 0.2)

        player.run(moveAction)

    }
}
