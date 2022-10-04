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

## Layout widgets

### Display

Display multiple widgets in one SKNode.

```swift
let node = Display()
	.place {
		Button(.init("Select"))
			.position(CGPoint(x: 0, y: 32))
		Button(.init("Cancel"))
			.position(CGPoint(x: 0, y: -32))
	}
	.place {
		Button(.init("Select_B"))
			.position(CGPoint(x: 0, y: 64))
		Button(.init("Cancel_B"))
			.position(CGPoint(x: 0, y: -64))
		HorizontalSingleBarChart(name: .init("Bar"))
	}
	.node()

```

Up to 10 widgets can be placed on a single `Display.place`.

### Node

```swift
let node = Node {
		Button(.init("Select"))
			.position(CGPoint(x: 0, y: 32))
		Button(.init("Cancel"))
			.position(CGPoint(x: 0, y: -32))
	}
	.node()

```

Up to 10 widgets can be placed on a single `Node`.

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
