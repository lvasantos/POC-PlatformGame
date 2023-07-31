import SpriteKit

class CharacterNode: SKSpriteNode {
    let characterFolderName: CharacterSelectionOptions
    private var allFrames: [SKTexture] = []
    private var currentFrames: [SKTexture] = []
    private var idleFrames: [SKTexture] = []
    private var facingPosition: TapDirection = .front
    private var action: CharacterAction = .walk

    init(characterFolderName: CharacterSelectionOptions) {
        self.characterFolderName = characterFolderName
        super.init(texture: SKTexture(), color: .clear, size: CGSize(width: 200, height: 200))
        self.buildCharacter()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    final private func checkAtlasFolderName() throws  {
        /// Checks if the files inside the atlas folder follows the pattern <folder name>_<action>_<number of frames>

        let atlasFileName = characterFolderName.description
        let atlas: SKTextureAtlas = SKTextureAtlas(named: characterFolderName.description)

        for textureName in atlas.textureNames {
            // Check for missing <values>, check for inconsistency in naming
            let textureComponents = textureName.components(separatedBy: "_")

            guard textureComponents.count >= 3 else {
                assertionFailure(AssetError.missingTextureInfo(textureName).description)
                throw AssetError.missingTextureInfo(textureName)
            }

            guard textureComponents[0] == atlasFileName else {
                assertionFailure(AssetError.incorrectAssetInAtlas(textureName).description)
                throw AssetError.incorrectAssetInAtlas(textureName)
            }

            guard CharacterAction.allCases.map({ $0.description }).contains(textureComponents[1])  else {
                assertionFailure(AssetError.missingTextureInfo(textureName).description)
                throw AssetError.missingTextureInfo(textureName)
            }

        }
    }
    private func fetchAllFrames() -> [SKTexture] {
        /// Fetches the sprites for any character that has an available atlas
        var fetchedFrames: [SKTexture] = []
        let atlas: SKTextureAtlas = SKTextureAtlas(named: characterFolderName.description)

        atlas.textureNames.forEach { textureFrame in
            guard textureFrame.contains(characterFolderName.description) else { return }
            fetchedFrames.append(atlas.textureNamed(textureFrame))
        }

        return fetchedFrames
    }
    private func loadFrames() {
        // Load idle frames and assign to idleFrames property
        idleFrames = allFrames.filter { texture in
            texture.description.contains(CharacterAction.idle.description)
        }.sorted { texture1, texture2 in
            texture1.description < texture2.description
        }
    }
    private func animateCharacter() {
        /// Runs the selected frames as an animation, then returns to idle frame
        guard !currentFrames.isEmpty else {
            return
        }

        let animationAction = SKAction.animate(with: currentFrames, timePerFrame: 0.3)
        let resetAction = SKAction.setTexture(currentFrames[0])
        let sequenceAction = SKAction.sequence([animationAction, resetAction])

        run(sequenceAction)
    }

    @available(*, unavailable, message: "This should not be used. The function is for characters that walk in 4 directions. left,right, top and down")
    private func characterFacingDirection(_ tapPosition: CGPoint) {
        // Updates the direction the character is facing according to user tap location
        if abs(tapPosition.x - self.position.x) > abs(tapPosition.y - self.position.y) {
            if tapPosition.x < self.position.x {
                facingPosition = .left
            } else {
                facingPosition = .right
            }
        } else {
            if tapPosition.y > self.position.y {
                facingPosition = .back
            } else {
                facingPosition = .front
            }
        }
    }
    private func characterCurrentPosition(_ tapPosition: CGPoint) {
        // Updates the direction the character is facing according to user tap location
        if tapPosition.x < self.position.x {
            facingPosition = .left
        } else {
            facingPosition = .right
        }
    }
    private func buildCharacter() {
        /// Should run on init so you can check all textures availability.

        // build and order the correct images for specific action (walking, idle etc). Goes through all frames from the atlas and builds accondingly.
        do {

            try checkAtlasFolderName()
            allFrames = fetchAllFrames()
            loadFrames()

        } catch let error as AssetError {
//            Using as AssetError so I could switch and it would automatically autofill for me. Love me a lazy way out. 💜
            switch error {
            case .incorrectAssetInAtlas(let string):
                print(AssetError.incorrectAssetInAtlas(string).description)
            case .missingTextureInfo(let string):
                print(AssetError.missingTextureInfo(string).description)
            case .framesNotLoaded(let string):
                print(AssetError.framesNotLoaded(string).description)
            }
        } catch {
            print("An unexpected error occurred: \(error.localizedDescription)")
        }

        // Start Character with animation
        runIdleAnimation()
    }
    private func runIdleAnimation() {
            guard !idleFrames.isEmpty else {
                print(AssetError.framesNotLoaded(CharacterAction.idle.description))
                return
            }
            let idleAction = SKAction.animate(with: idleFrames, timePerFrame: 0.4)
            let repeatAction = SKAction.repeatForever(idleAction)
            self.run(repeatAction)

/*

            outra forma de utilizar, aparentemente  usar withKey é mais recomendado.
            run(repeatAction, withKey: "IdleAnimation")

 */
        }

    private func moveSpriteNode(_ tapPosition: CGPoint) {
        self.xScale = facingPosition == .left ? -1 : 1
        let moveAction = SKAction.moveTo(x: tapPosition.x, duration: 1)
//        let moveAction = SKAction.move(to: tapPosition, duration: 1)
        let frameAction = SKAction.animate(with: currentFrames, timePerFrame: 0.3)
        let groupAction = SKAction.group([frameAction, moveAction])

        run(groupAction)
    }
    func moveSprite(_ tapPosition: CGPoint) {
        characterCurrentPosition(tapPosition)

        let actionFrames = allFrames.filter { texture in
            texture.description.contains(action.description)
        }.sorted { texture1, texture2 in
            texture1.description < texture2.description
        }
        currentFrames = actionFrames
        moveSpriteNode(tapPosition)
    }
    @available(*, unavailable, message: "This should not be used. The function is for characters that walk in 4 directions. left,right, top and down" )
    private func moveTo(_ tapPosition: CGPoint) {
        /// Checks the tap position on the screen and updates the frames to match.

        characterCurrentPosition(tapPosition)

        let directionFrames = allFrames.filter { texture in
            texture.description.contains(facingPosition.description)
        }.sorted { texture1, texture2 in
            texture1.description < texture2.description
        }

        currentFrames = directionFrames
        moveSpriteNode(tapPosition)
    }
    func characterMoveEnded() {
        self.removeAllActions()
    }



    // MARK: Redoing funcs

    private func update() {}
    private func move() { }
    private func interact() {}
    private func takeDamage() { }
    private func die() { }
    private func respawn() { }
    private func detectPlayer() { }
    private func readtToPlayer() { }
    private func patrol() { }
    private func faceDirection() { }
    private func performAction() { }
    private func isGrounded() { }
    private func isInDanger() { }
    private func handleCollision() { }
}
