### ListKeyManager

### ListKeyManager（列表键盘管理器）

`ListKeyManager` manages the focus in a list of items based on keyboard interaction. Intended to be
used with components that correspond to a `role="menu"` or `role="listbox"` pattern.

`ListKeyManager` 可以通过键盘交互来管理条目列表中的焦点。主要针对带有 `role="menu"` 或 `role="listbox"` 的组件。

#### Properties

#### 属性

##### `activeItemIndex`

Index of the currently active item

当前激活条目的索引

##### `activeItem`

The active item

激活条目

#### `tabOut`

Observable that emits any time the <kbd>Tab</kbd> key is pressed, so components can react when
focus is shifted off of the list.

一个可观察对象，每按一次 `Tab` 键就会发送一次，这样当焦点移出列表时，组件就能做出反应。

#### Methods

#### 方法

##### `withWrap(): this`

Turns on wrapping mode, which ensures that the active item will wrap to
the other end of list when there are no more items in the given direction.

打开包装模式，确保当指定方向上没有更多条目时，激活条目就会回卷到列表的另一端。

##### `setActiveItem(index: number): void`

Sets the active item to the item at the index specified.

把激活条目设置为由索引指定的条目。

##### `onKeydown(event: KeyboardEvent): void`

Sets the active item depending on the key event passed in.

根据传入的键盘事件设置激活条目。

##### `setFirstItemActive(): void`

Sets the active item to the first enabled item in the list.

将激活条目设置为列表中第一个可用的（enabled）条目。

##### `setLastItemActive(): void`

Sets the active item to the last enabled item in the list.

将激活条目设置为列表中最后一个可用的（enabled）条目。

##### `setNextItemActive(): void`

Sets the active item to the next enabled item in the list.

将激活条目设置为列表中的下一个可用的（enabled）条目。

##### `setPreviousItemActive(): void`

Sets the active item to a previous enabled item in the list.

将激活条目设置为列表中的上一个可用的（enabled）条目。

