//
//  HItboxComponent.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 06/09/23.
//

import Foundation
import GameplayKit

class HitboxComponent: GKComponent {
    var hitboxSprite: SKSpriteNode?

    func setupHitbox() {
        if let hitbox = entity?.component(ofType: GKSKNodeComponent.self)?.node as? PlayerNode {
            hitboxSprite = hitbox
            hitbox.isHidden = true
        }
    }
}
