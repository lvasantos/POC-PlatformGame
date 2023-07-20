import Foundation
import SpriteKit

class Player: CharacterNode {
    // Has player-specific properties like score, inventory, etc.

    override init(characterFolderName: CharacterSelectionOptions) {
        super.init(characterFolderName: characterFolderName)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: new functions
    private func build() { }
    private func move() { }
    private func jump() { }
    private func attack() { }
    private func throwHead() { }
    private func takeDamage() { }
    private func die() { }
    private func respawn() { }
    private func collectItem() { }
    private func interact() { }
    private func isGrounded() { }
    private func isCrouching() { }
    private func isAttacking() { }
    private func isJumping() { }
    private func handleInput() { }
    private func faceDirection() { }
    private func performAction() { }
    private func playSound() { }
    private func canMove() { }


}

