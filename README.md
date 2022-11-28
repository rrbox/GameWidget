# GameWidget

[![GitHub issues](https://img.shields.io/github/issues/rrbox/GameWidget)](https://github.com/rrbox/GameWidget/issues)
[![GitHub license](https://img.shields.io/github/license/rrbox/GameWidget)](https://github.com/rrbox/GameWidget/blob/main/LICENCE)
[![Swift](https://github.com/rrbox/GameWidget/actions/workflows/swift.yml/badge.svg?branch=develop)](https://github.com/rrbox/GameWidget/actions/workflows/swift.yml)

User interface widgets for SpriteKit.

## DEMO

```swift
import GameWidget
import SpriteKit

let node = Display()
	.place {
		Button(.init("Select"))
			.modifiable
			.position(CGPoint(x: 0, y: 32))
		Button(.init("Cancel"))
			.modifiable
			.position(CGPoint(x: 0, y: -32))
	}
	.node()

```

## Layout widgets

### Display

Display multiple widgets in one SKNode.

```swift
let node = Display()
	.place {
		Button(.init("Select"))
			.modifiable
			.position(CGPoint(x: 0, y: 32))
		Button(.init("Cancel"))
			.modifiable
			.position(CGPoint(x: 0, y: -32))
	}
	.place {
		Button(.init("Select_B"))
			.modifiable
			.position(CGPoint(x: 0, y: 64))
		Button(.init("Cancel_B"))
			.modifiable
			.position(CGPoint(x: 0, y: -64))
		HorizontalSingleBarChart(name: .init("Bar"))
	}
	.node()

```

Up to 10 widgets can be placed on a single `Display.place`.

### Node

`Node` widget is modifiable with the values used for SKNode parameters.

```swift
let node = Node {
		Button(.init("Select"))
			.modifiable
			.position(CGPoint(x: 0, y: 32))
		Button(.init("Cancel"))
			.modifiable
			.position(CGPoint(x: 0, y: -32))
	}
	.modifiable
	.posisition(CGPoint(x: 0, y: 32))
	.zRotation(0.5)
	.node()

```

Up to 10 widgets can be placed on a single `Node`.

### Extension

Use `Extension` to place more than 10 widgets.

```swift
// case Display
let node = Display()
	.place {
		Button(.init("Select"))
			.modifiable
			.position(CGPoint(x: 0, y: 32))
		Button(.init("Cancel"))
			.modifiable
			.position(CGPoint(x: 0, y: -32))
		Button(.init("Select_B"))
			.modifiable
			.position(CGPoint(x: 0, y: 64))
		Button(.init("Cancel_B"))
			.modifiable
			.position(CGPoint(x: 0, y: -64))
		HorizontalSingleBarChart(name: .init("Bar"))
		//...
		Extension {
			Button(.init("Select"))
				.modifiable
				.position(CGPoint(x: 0, y: 32))
			Button(.init("Cancel"))
				.modifiable
				.position(CGPoint(x: 0, y: -32))
			Button(.init("Select_B"))
				.modifiable
				.position(CGPoint(x: 0, y: 64))
			Button(.init("Cancel_B"))
				.modifiable
				.position(CGPoint(x: 0, y: -64))
			HorizontalSingleBarChart(name: .init("Bar"))
		}
	}
	.node()
```

Extension is a special widget that cannot generate SKNode.

```swift
let node = Extension {
		Button(.init("Select"))
			.modifiable
			.position(CGPoint(x: 0, y: 32))
		Button(.init("Cancel"))
			.modifiable
			.position(CGPoint(x: 0, y: -32))
		Button(.init("Select_B"))
			.modifiable
			.position(CGPoint(x: 0, y: 64))
		Button(.init("Cancel_B"))
			.modifiable
			.position(CGPoint(x: 0, y: -64))
		HorizontalSingleBarChart(name: .init("Bar"))
	}
	.node() // fatalError
```

## Supported widgets

### Button(beta)

```swift
let node = Button(.init("Button"))
	.node()
```

### Bar chart(beta)

```swift
let node = HorizontalSingleBarChart(name: .init("Bar"))
	.node()
```

## Planning to make follows

### Controller (joy stick)
