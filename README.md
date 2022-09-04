# GameWidget

[![GitHub issues](https://img.shields.io/github/issues/rrbox/GameWidget)](https://github.com/rrbox/GameWidget/issues)
[![GitHub license](https://img.shields.io/github/license/rrbox/GameWidget)](https://github.com/rrbox/GameWidget/blob/main/LICENCE)
[![Swift](https://github.com/rrbox/GameWidget/actions/workflows/swift.yml/badge.svg)](https://github.com/rrbox/GameWidget/actions/workflows/swift.yml)

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
