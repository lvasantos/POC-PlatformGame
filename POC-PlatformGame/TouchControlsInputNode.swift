//
//  TouchControlInputNode.swift
//  POC-PlatformGame
//
//  Created by Luciana Adrião on 19/07/23.
//

import SpriteKit

class TouchControlsInputNode:SKSpriteNode {

    var alphaUnpressed: CGFloat = 0.5
    var alphaPressed: CGFloat = 0.9

    var pressedButtons = [SKSpriteNode]()

    let buttonDirLeft = SKSpriteNode(imageNamed: "flatDark23")
    let buttonDirRight = SKSpriteNode(imageNamed: "flatDark24")
    let buttonDirUp = SKSpriteNode(imageNamed: "flatDark25")
    let buttonDirDown = SKSpriteNode(imageNamed: "flatDark26")


    let buttonA = SKSpriteNode(imageNamed: "flatDark35")
    let buttonB = SKSpriteNode(imageNamed: "flatDark36")
    let buttonX = SKSpriteNode(imageNamed: "flatDark37")
    let buttonY = SKSpriteNode(imageNamed: "flatDark38")

    var inputDelegate: ControlsInputDelegate?

    init(frame: CGRect) {
        super.init(texture: nil, color: .clear, size: frame.size)

        setupControls(size: frame.size)
        isUserInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupControls(size: CGSize) {
        /** ------------------------------------------
                        LEFT  SIDE BUTTONS
            ------------------------------------------
        */

        addButton(button: buttonDirLeft,
                  position: CGPoint(x: -(size.width / 3) - 50, y: -(size.height / 4)),
                  name: "left",
                  scale: 2.0)

        addButton(button: buttonDirRight,
                  position: CGPoint(x: -(size.width / 3) + 50, y: -(size.height / 4)),
                  name: "right",
                  scale: 2.0)

        addButton(button: buttonDirUp,
                  position: CGPoint(x: -(size.width / 3), y: -(size.height / 4) + 50),
                  name: "up",
                  scale: 2.0)

        addButton(button: buttonDirDown,
                  position: CGPoint(x: -(size.width / 3), y: -(size.height / 4) - 50),
                  name: "down",
                  scale: 2.0)

        /** ------------------------------------------
                        RIGHT SIDE BUTTONS
            ------------------------------------------
        */

        addButton(button: buttonX,
                  position: CGPoint(x: (size.width / 3), y: -(size.height / 4) + 50),
                  name: "X",
                  scale: 0.40)

        addButton(button: buttonY,
                  position: CGPoint(x: (size.width / 3) - 50, y: -(size.height / 4)),
                  name: "Y",
                  scale: 0.40)

        addButton(button: buttonB,
                  position: CGPoint(x: (size.width / 3), y: -(size.height / 4) - 50),
                  name: "B",
                  scale: 0.40)

        addButton(button: buttonA,
                  position: CGPoint(x: (size.width / 3), y: -(size.height / 4)),
                  name: "A",
                  scale: 0.40)


    }

    func addButton(button: SKSpriteNode, position: CGPoint, name: String, scale: CGFloat) {
        button.position = position
        button.setScale(scale)
        button.name = name
        button.zPosition = 10
        button.alpha = alphaUnpressed
        self.addChild(button)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: parent!)
            // for all 8 buttons
            for button in [buttonA, buttonB, buttonX, buttonY, buttonDirUp,buttonDirDown,buttonDirLeft,buttonDirRight] {
                if button.contains(location) && pressedButtons.firstIndex(of: button) == nil {
                    pressedButtons.append(button)
                    if (inputDelegate != nil) {
                        inputDelegate?.follow(command: button.name)
                    }
                }
                if (pressedButtons.firstIndex(of: button) == nil) {
                    button.alpha = alphaPressed
                } else {
                    button.alpha = alphaUnpressed
                }
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: parent!)
            let previousLocation = touch.previousLocation(in: parent!)
            for button in [buttonA, buttonB, buttonX, buttonY, buttonDirUp,buttonDirDown,buttonDirLeft,buttonDirRight] {
                // if I get off the buttons whre I was before
                if button.contains(previousLocation) && !button.contains(location) {
                    let index = pressedButtons.firstIndex(of: button)
                    if index != nil {
                        pressedButtons.remove(at: index!)
                        if (inputDelegate != nil) {
                            inputDelegate?.follow(command: "cancel \(String(describing: button.name))")
                        }
                    }
                } else if !button.contains(previousLocation)  && button.contains(location) && pressedButtons.firstIndex(of: button) == nil {
                    pressedButtons.append(button)
                    if (inputDelegate != nil) {
                        inputDelegate?.follow(command: button.name!)
                    }
                }
                if (pressedButtons.firstIndex(of: button) == nil) {
                    button.alpha = alphaPressed
                } else {
                    button.alpha = alphaUnpressed
                }
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }

    func touchUp(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: parent!)
            let previousLocation = touch.previousLocation(in: parent!)

            for button in[buttonA, buttonB, buttonX, buttonY, buttonDirUp,buttonDirDown,buttonDirLeft,buttonDirRight] {
                if button.contains(location) || button.contains(previousLocation) {
                    let index = pressedButtons.firstIndex(of: button)
                    if index != nil {
                        pressedButtons.remove(at: index!)
                        if inputDelegate != nil {
                            inputDelegate?.follow(command: "stop \(String(describing: button.name))")
                        }
                    }
                }
                if (pressedButtons.firstIndex(of: button) == nil) {
                    button.alpha = alphaPressed
                } else {
                    button.alpha = alphaUnpressed
                }
            }
        }
    }

}




