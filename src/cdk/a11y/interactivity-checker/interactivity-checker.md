### InteractivityChecker

### InteractivityChecker（交互检查器）

`InteractivityChecker` is used to check the interactivity of an element, capturing disabled,
visible, tabbable, and focusable states for accessibility purposes.

`InteractivityChecker` 用于检查元素的交互性，它会捕获禁用（disabled）、可见（visible）、（可 tab）tabbable 和可获得焦点（focusable）状态，以便检查无障碍性。

#### Methods

#### 方法

##### `isDisabled(element: HTMLElement): boolean`

Whether the given element is disabled.

指定的元素是否已禁用。

##### `isVisible(element: HTMLElement): boolean`

Whether the given element is visible. 

指定的元素是否可见。

This will capture states like `display: none` and `visibility: hidden`,
but not things like being clipped by an `overflow: hidden` parent or being outside the viewport.

这会考察元素的 `display: none` 和 `visibility: hidden` 等状态，但不会管它是否被父元素的 `overflow: hidden` 切掉或位于视口（viewport）外。

##### `isFocusable(element: HTMLElement): boolean`

Gets whether an element can be focused by the user.

获取用户是否可以给某个元素设置焦点。

##### `isTabbable(element: HTMLElement): boolean`

Gets whether an element can be reached via Tab key. 
Assumes that the element has already been checked with isFocusable.

获取是否可以通过 Tab 键抵达该元素。这里假设你已经用 isFocusable 检查过这个元素了。
