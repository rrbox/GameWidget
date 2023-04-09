# Widget の基本的な使い方

## DEMO

```swift
let button = Button(.init("test"))
    .modifiable
    .color(.green)
    .position(CGPoint(x: 1, y: 1))
    .text("test_2")
    .zPosition(1)
    .actionType(.alpha)
    .node()
```

## Create user inerface models

Widget から UI モデルを作成するには, Widget として定義された構造体から実行できる `createModels()` を使用します.

```swift
let (button, notificationCenter) = Button(.init("test"))
    .createModels()
```

`createModels()` の返り値は, その Widget に関連づけられた `SKNode` サブクラスと, そのノードと紐づけられた ``WidgetNotificationSystem`` のインスタンスです.

## Modify widget

Widget はビルダーパターンでレイアウトを編集するインターフェースを提供します. まずは Widget の ``Widget/modifiable-swift.property`` を呼び出しましょう.

```swift
// 1
let button = Button(.init("test"))
    .modifiable
```

すると, その下の行からこの `Button` にメソッドチェーンをつなげることができるようになります.

```swift
// 2
let button = Button(.init("test"))
    .modifiable
    .color(.green)
    .position(CGPoint(x: 1, y: 1))
```

最後に, `node()` でノードインスタンスを作成してみると, 座標や色が変化しているかと思います.

```swift
// 3
let button = Button(.init("test"))
    .modifiable
    .color(.green)
    .position(CGPoint(x: 1, y: 1))
    .node()
```
