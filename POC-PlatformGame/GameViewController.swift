//
//  GameViewController.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 12/07/23.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    var myView: SKView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the SKView instance
        myView = SKView(frame: view.bounds)
        myView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myView.ignoresSiblingOrder = true
        myView.showsFPS = true
        myView.showsNodeCount = true

        view.addSubview(myView)
        


        // Present scene
        let scene = NewGameScene(size: view.bounds.size)
//        let scene = SKScene(size: view.bounds.size)
        scene.scaleMode = .aspectFill
        myView.presentScene(scene)
    }
}
