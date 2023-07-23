//
//  PlayerComponent.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 22/07/23.
//

import GameplayKit

class PlayerComponent: GKComponent {
    var playerNode: PlayerNode

    init(playerNode: PlayerNode) {
        self.playerNode = playerNode
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    func follow(command: String?) {
//            // Handle the movement based on the command received from the button tap
//            // For example, you can move the player to the left, right, jump, etc.
//            // Use the playerNode property to access the SKSpriteNode representing the player
//
//        // Implement your logic here based on the command received from the touch controls
//        // For example, you can move the player node based on the command
//        switch command {
//        case "left":
////            playerNode.position.x -= 10
//            print("left")
//        case "right":
////            playerNode.position.x += 10
//            print("right")
//            // Add other cases for different commands
//        case "up":
////            playerNode.position.y += 10
//            print("uup")
//        case "down":
//            print("down")
////            playerNode.position.y -= 10
//        default:
//            break
//        }
//    }
}
