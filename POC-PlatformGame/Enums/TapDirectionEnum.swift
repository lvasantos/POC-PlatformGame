enum TapDirection: String {
    case left
    case right
    case front
    case back

    var description: String {
        return self.rawValue
    }
}

enum CharacterAction: String, CaseIterable {
    case idle
    case attack
    case run
    case walk
    case dead
    case jump
    case fall
    case launch

    var description: String {
        return self.rawValue
    }
}
