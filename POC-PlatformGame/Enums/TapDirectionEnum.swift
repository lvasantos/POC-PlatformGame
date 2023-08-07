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
    case launch
    case walk

    var description: String {
        return self.rawValue
    }

}
