import Foundation
import SpriteKit

class PlayerNode: SKSpriteNode {
    // Has player-specific properties like score, inventory, etc.
    init() {
        super.init(texture: SKTexture(), color: .green, size: CGSize(width: 50, height: 50))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
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

    */
}

