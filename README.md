# GameWidget

User interface widgets for SpriteKit.

## DEMO

```swift
import GameWidget
import SpriteKit

let node = Display()
        .place {
            Button(.init("Select"))
                .position(CGPoint(x: 0, y: 32))
            Button(.init("Cancel"))
                .position(CGPoint(x: 0, y: -32))
        }
        .node()

```

## Supported widgets

- Button(beta)
- Bar chart(beta)

## Planning to make follows

- Controller stick
