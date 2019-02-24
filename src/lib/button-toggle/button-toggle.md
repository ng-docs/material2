`<mat-button-toggle>` are on/off toggles with the appearance of a button. These toggles can be
configured to behave as either radio-buttons or checkboxes. While they can be standalone, they are
typically part of a `mat-button-toggle-group`.

`<mat-button-toggle>` 是一个具有按钮外观的双态开关。
这些开关的行为可以配置得像单选按钮或检查框一样。虽然它们也可以独立使用，但一般会作为 `mat-button-toggle-group` 中的一部分。

<!-- example(button-toggle-overview) -->

### Exclusive selection vs. multiple selection

### 单选与多选

By default, `mat-button-toggle-group` acts like a radio-button group- only one item can be selected.
In this mode, the `value` of the `mat-button-toggle-group` will reflect the value of the selected
button and `ngModel` is supported.

默认情况下，`mat-button-toggle-group` 的表现很像单选按钮组 —— 只能选中一个元素。
在这种模式下，`mat-button-toggle-group` 的 `value` 表示当前选中的按钮，还支持 `ngModel`。 

Adding the `multiple` attribute allows multiple items to be selected (checkbox behavior). In this
mode the values of the the toggles are not used, the `mat-button-toggle-group` does not have a value,
and `ngModel` is not supported.

添加 `multiple` 属性将会允许同时选中多个条目（就像检查框那样）。
在这种模式下，这些开关的值是没用的，`mat-button-toggle-group` 没有值，不支持 `ngModel`。

### Appearance

### 外观

By default, the appearance of `mat-button-toggle-group` and `mat-button-toggle` will follow the latest Material Design guidelines. If you want to, you can switch back to the appearance that was following the previous Material Design spec by using the `appearance` input. The `appearance` can be configured globally using the `MAT_BUTTON_TOGGLE_DEFAULT_OPTIONS` injection token.

默认情况下，`mat-button-toggle-group` 和 `mat-button-toggle` 的外观将遵循最新的 Material 设计准则。如果需要，也可以使用输入属性 `appearance` 切换回上一版 Material Design 规范的外观。可以使用 `MAT_BUTTON_TOGGLE_DEFAULT_OPTIONS` 注入令牌来全局配置 `appearance` 。

<!-- example(button-toggle-appearance) -->

### Accessibility

### 无障碍性

The button-toggles will present themselves as either checkboxes or radio-buttons based on the
presence of the `multiple` attribute.

按钮开关组会根据是否有 `multiple` 属性来表现的或者像多选框或者像单选按钮。

For button toggles containing only icons, each button toggle should be given a meaningful label via
`aria-label` or `aria-labelledby`.

对于只包含图标的按钮开关组，每个按钮开关都应该通过 `aria-label` 或 `aria-labelledby` 给出一个有意义的标签。 

For button toggle groups, each group should be given a meaningful label via `aria-label` or
`aria-labelledby`.

对于按钮开关组，每个组都要通过 `aria-label` 或 `aria-labelledby` 给出一个有意义的标签。

### Orientation

### 方向

The button-toggles can be rendered in a vertical orientation by adding the `vertical` attribute.

通过添加 `vertical` 属性，按钮开关组可以沿垂直方向渲染。
