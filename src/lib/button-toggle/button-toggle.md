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

### Accessibility

### 可访问性

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
