enum TapDirection: CustomStringConvertible {
    case left
    case right
    case front
    case back

    var description: String {
        switch self {
        case .left:
            return "left"
        case .right:
            return "right"
        case .front:
            return "front"
        case .back:
            return "back"
        }
    }
}

enum CharacterAction: CustomStringConvertible, CaseIterable {
    case idle
    case attack
    case run
    case walk
    case dead
    case jump
    case fall
    case launch

    var description: String {
        switch self {
        case .idle:
            return "idle"
        case .attack:
            return "attack"
        case .run:
            return "run"
        case .dead:
            return "dead"
        case .jump:
            return "jump"
        case .fall:
            return "fall"
        case .launch:
            return "launch"
        case .walk:
            return "walk"
        }
    }
}


