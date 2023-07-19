enum AssetError: Error {
    case incorrectAssetInAtlas(String)

//    case missingAction(String)
    case missingTextureInfo(String)
    case framesNotLoaded(String)
//    case missingFolderName


    var description: String {
        switch self {
        case .incorrectAssetInAtlas(let string):
            return "Error: Check folder for inconsistency in: \(string)"
        case .missingTextureInfo(let string):
            return "Error: Missing texture information in \(string). Follow pattern <folder name>_<action>_<number of frame>"


//        case .missingFolderName:
//            return "Error: Missing folder name in texture. Follow pattern <folder name>_<action>_<number of frame>"
//        case .missingAction(let string):
//            return "Error: Missing action in texture \(string). Follow pattern <folder name>_<action>_<number of frame>"
        case .framesNotLoaded(let string):
            return "Error: Verify that during character build the frames for \(string) are correctly loaded."
        }
    }
}


