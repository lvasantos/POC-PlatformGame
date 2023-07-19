enum CharacterSelectionOptions: CustomStringConvertible {
//   CustomStringConvertible allows you to define a customized string representation for an enum without the need for explicit method calls or additional properties.
    
    case calicoCat
    case hoodie

    var description: String {
        switch self {
        case .calicoCat:
            return "calico"
        case .hoodie:
            return "mysteriousboy"
        }
    }
}
