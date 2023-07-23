//
//  ColliderTypeEnum.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 23/07/23.
//


enum ColliderType {
    case player
    case ground

    var identifier: UInt32 {
        switch self {
        case .player:
            return 1
        case .ground:
            return 2
        }
    }
}
