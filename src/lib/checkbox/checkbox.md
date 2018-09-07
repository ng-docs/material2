`<mat-checkbox>` provides the same functionality as a native `<input type="checkbox">`
enhanced with Material Design styling and animations.

`<mat-checkbox>` 提供了和原生 `<input type="checkbox">` 一样的功能，只是支持了 Material Design 的样式和动画。

<!-- example(checkbox-overview) -->

### Checkbox label

### 检查框标签

The checkbox label is provided as the content to the `<mat-checkbox>` element. The label can be 
positioned before or after the checkbox by setting the `labelPosition` property to `'before'` or
`'after'`.

检查框的标签是以 `<mat-checkbox>` 元素内容的形式提供的。该标签可以通过把 `labelPosition` 属性设置为 `'before'` 或 `'after'` 来让自己定位于检查框的前面或后面。

If you don't want the label to appear next to the checkbox, you can use 
[`aria-label`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-label) or 
[`aria-labelledby`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-labelledby) to 
specify an appropriate label.

如果你不想紧挨着检查框显示该标签，可以使用 [`aria-label`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-label) 或 
[`aria-labelledby`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-labelledby) 为它指定一个合适的标签。

### Use with `@angular/forms`

### 和 `@angular/forms` 一起使用

`<mat-checkbox>` is compatible with `@angular/forms` and supports both `FormsModule` 
and `ReactiveFormsModule`.

`<mat-checkbox>` 与 `@angular/forms` 兼容，并且同时支持 `FormsModule` 和 `ReactiveFormsModule`。

### Indeterminate state

### 未决状态

`<mat-checkbox>` supports an `indeterminate` state, similar to the native `<input type="checkbox">`.
While the `indeterminate` property of the checkbox is true, it will render as indeterminate 
regardless of the `checked` value. Any interaction with the checkbox by a user (i.e., clicking) will
remove the indeterminate state.

像原生的 `<input type="checkbox">` 一样，`<mat-checkbox>` 也支持未决（`indeterminate`）状态。
当检查框的 `indeterminate` 属性为 `true` 时，无论 `checked` 的值是什么，它都会渲染位未决状态。用户与该检查框的任何交互（比如点击）都会移除未决状态。

### Click action config

### 配置点击动作

When user clicks on the `mat-checkbox`, the default behavior is toggle `checked` value and set
`indeterminate` to `false`. This behavior can be customized by
[providing a new value](https://angular.io/guide/dependency-injection)
of `MAT_CHECKBOX_CLICK_ACTION` to the checkbox.

当用户点击 `mat-checkbox` 时，其默认行为是切换 `checked` 的值并把 `indeterminate` 设置为 `false`。
该行为可以通过为检查框的 `MAT_CHECKBOX_CLICK_ACTION` 令牌[提供一个新值](https://angular.io/guide/dependency-injection)进行定制。

```
providers: [
  {provide: MAT_CHECKBOX_CLICK_ACTION, useValue: 'check'}
]
```

The possible values are:

可能的值有：

#### `noop`

Do not change the `checked` value or `indeterminate` value. Developers have the power to
implement customized click actions.

不要修改 `checked` 或 `indeterminate` 的值。开发人员可以实现自己的点击动作。

#### `check`
Toggle `checked` value of the checkbox, ignore `indeterminate` value. If the
checkbox is in `indeterminate` state, the checkbox will display as an `indeterminate` checkbox
regardless the `checked` value.

切换检查框的 `checked` 值，但不管 `indeterminate` 的值。如果该检查框处于 `indeterminate` 状态，则该检查框会显示为 `indeterminate` 状态，忽略 `checked` 值。

#### `check-indeterminate`
Default behavior of `mat-checkbox`. Always set `indeterminate` to `false`
when user click on the `mat-checkbox`.
This matches the behavior of native `<input type="checkbox">`.

`mat-checkbox` 的默认行为。当用户点击 `mat-checkbox` 时，总是把 `indeterminate` 设置为 `false`。
这种行为和原生 `<input type="checkbox">` 的完全一样。

### Theming

### 主题

The color of a `<mat-checkbox>` can be changed by using the `color` property. By default, checkboxes
use the theme's accent color. This can be changed to `'primary'` or `'warn'`.  

`<mat-checkbox>` 的颜色可以通过 `color` 属性进行修改。默认情况下，检查框使用主题的 `accent` 颜色。它还可以修改为 `'primary'` 或 `'warn'`。

### Accessibility

### 可访问性

The `<mat-checkbox>` uses an internal `<input type="checkbox">` to provide an accessible experience.
This internal checkbox receives focus and is automatically labelled by the text content of the
`<mat-checkbox>` element.

`<mat-checkbox>` 使用一个内部的 `<input type="checkbox">` 来提供可访问性体验。
这个内部检查框可以接受焦点，并且自动把 `<mat-checkbox>` 元素的文本内容作为标签。

Checkboxes without text or labels should be given a meaningful label via `aria-label` or
`aria-labelledby`.

没有文本或标签的检查框需要通过 `aria-label` 或 `aria-labelledby` 属性给出一个有意义的标签。
