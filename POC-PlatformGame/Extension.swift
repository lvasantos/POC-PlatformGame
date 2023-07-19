//
//  Extension.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 13/07/23.
//

import Foundation
import UIKit

extension CGSize {
    static let halfScreenSize = CGSize(width: UIScreen.main.bounds.size.width/2, height: UIScreen.main.bounds.size.width/2)
}

extension CGSize {
    static let onefourteenthWidth: CGFloat = 1/14
    static let oneSeventhHeight: CGFloat = 1/7
}


// ------------------------------------------------------

// MARK: Desired screen size settings

// ------------------------------------------------------
extension CGFloat {
    static let desiredWidth: CGFloat = 844.0
    static let desiredHeight: CGFloat = 390.0
}



let scaleX = UIScreen.main.bounds.width / (CGFloat.desiredWidth)
let scaleY = UIScreen.main.bounds.height / (CGFloat.desiredHeight)
var cameraScale = min(scaleX, scaleY)


//print(cameraScale)
//if cameraScale < 1.4 {
//    return cameraScale = 1.4
//}
