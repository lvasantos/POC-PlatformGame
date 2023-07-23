//
//  EntityManager.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 20/07/23.
//

import GameplayKit

class EntityManager {
    var entities: [GKEntity] = []

    func addEntity(_ entity: GKEntity) {
        entities.append(entity)
    }

    func removeEntity(_ entity: GKEntity) {
        entities.removeAll { $0 == entity }
    }

    func update(deltaTime: TimeInterval) {
        for entity in entities {
            entity.update(deltaTime: deltaTime)
        }
        
    }
}
