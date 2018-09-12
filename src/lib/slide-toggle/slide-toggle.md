`<mat-slide-toggle>` is an on/off control that can be toggled via clicking or dragging. 

`<mat-slide-toggle>` 是一个可通过点击或拖曳进行切换的开关控件。

<!-- example(slide-toggle-overview) -->

The slide-toggle behaves similarly to a checkbox, though it does not support an `indeterminate` 
state like `<mat-checkbox>`.

滑块开关的行为和检查框一样，不过它不像 `<mat-checkbox>` 那样支持 `indeterminate` 状态。

_Note: the sliding behavior for this component requires that HammerJS is loaded on the page._

*注意：本组件的滑块行为要求当前页面曾加载过 HammerJS 库。*

### Slide-toggle label

### 滑块开关标签

The slide-toggle label is provided as the content to the `<mat-slide-toggle>` element. 

滑块开关的标签是作为 `<mat-slide-toggle>` 的内容来提供的。

If you don't want the label to appear next to the slide-toggle, you can use 
[`aria-label`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-label) or 
[`aria-labelledby`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-labelledby) to 
specify an appropriate label.

如果你不希望该标签出现在滑块开关的紧后方，可以使用 [`aria-label`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-label) 或 [`aria-labelledby`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-labelledby) 来指定一个合适的标签。

### Use with `@angular/forms`

### 和 `@angular/forms` 一起用

`<mat-slide-toggle>` is compatible with `@angular/forms` and supports both `FormsModule` 
and `ReactiveFormsModule`.

`<mat-slide-toggle>` 与 `@angular/forms` 兼容，并支持 `FormsModule` 和 `ReactiveFormsModule`。

### Theming

### 主题

The color of a `<mat-slide-toggle>` can be changed by using the `color` property. By default, 
slide-toggles use the theme's accent color. This can be changed to `'primary'` or `'warn'`.  

`<mat-slide-toggle>` 的颜色可以通过 `color` 属性进行修改。默认情况下，滑块开关使用主题的 `accent`（强调）色。
可以把它修改为 `'primary'` 或 `'warn'`。

### Accessibility

### 可访问性

The `<mat-slide-toggle>` uses an internal `<input type="checkbox">` to provide an accessible
experience. This internal checkbox receives focus and is automatically labelled by the text content
of the `<mat-slide-toggle>` element.

`<mat-slide-toggle>` 使用内部的 `<input type="checkbox">` 来提供可访问性。这个内部检查框接受焦点，并自动使用 `<mat-slide-toggle>` 元素的文本内容作为标签。

Slide toggles without text or labels should be given a meaningful label via `aria-label` or
`aria-labelledby`.

没有文本或标签的滑块开关应该通过 `aria-label` 或 `aria-labelledby` 来指定一个有意义的标签。
