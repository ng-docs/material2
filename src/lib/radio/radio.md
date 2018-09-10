`<mat-radio>` provides the same functionality as a native `<input type="radio">` enhanced with
Material Design styling and animations.

`<mat-radio>` 提供了与原生元素 `<input type="radio">` 相同的功能，但用 Material Design 的样式和动画进行了增强。

<!-- example(radio-overview) -->

All radio-buttons with the same `name` comprise a set from which only one may be selected at a time.

所有具有相同 `name` 的单选按钮会构成一个集合，一次只能选择一个。

### Radio-button label

### 单选按钮的标签

The radio-button label is provided as the content to the `<mat-radio-button>` element. The label can
be positioned before or after the radio-button by setting the `labelPosition` property to `'before'`
or `'after'`.

单选按钮的标签是通过 `<mat-radio-button>` 元素的内容提供的。
该标签可以通过把 `labelPosition` 属性的值设置为 `'before'` 或 `'after'` 来把该标签定位在单选按钮的前面或后面。 

If you don't want the label to appear next to the radio-button, you can use
[`aria-label`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-label) or
[`aria-labelledby`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-labelledby) to
specify an appropriate label.

如果你不想让此标签出现在单选按钮的紧后面，你可以用 [`aria-label`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-label) 或 
[`aria-labelledby`](https://www.w3.org/TR/wai-aria/states_and_properties#aria-labelledby) 来指定一个合适的标签。

### Radio groups

### 单选组

Radio-buttons should typically be placed inside of an `<mat-radio-group>` unless the DOM structure
would make that impossible (e.g., radio-buttons inside of table cells). The radio-group has a
`value` property that reflects the currently selected radio-button inside of the group.

除非 DOM 结构不允许（比如在表格单元格中的单选按钮），否则单选按钮通常都要放在 `<mat-radio-group>` 的内部。
单选组具有一个 `value` 属性，用于表示该组中当前选中的单选按钮。

Individual radio-buttons inside of a radio-group will inherit the `name` of the group.

单选组中的每个单选按钮都会继承该组的 `name`。

### Use with `@angular/forms`

### 和 `@angular/forms` 一起使用

`<mat-radio-group>` is compatible with `@angular/forms` and supports both `FormsModule`
and `ReactiveFormsModule`.

`<mat-radio-group>` 与 `@angular/forms` 兼容，并且同时支持 `FormsModule` 和 `ReactiveFormsModule`。

### Accessibility

### 可访问性

The `<mat-radio-button>` uses an internal `<input type="radio">` to provide an accessible experience.
This internal radio button receives focus and is automatically labelled by the text content of the
`<mat-radio-button>` element.

`<mat-radio-button>` 使用其内部的 `<input type="radio">` 来提供可访问性。
这个内部单选按钮会接受焦点，并自动以 `<mat-radio-button>` 元素的内容作为标签。

Radio button groups should should be given a meaningful label via `aria-label` or `aria-labelledby`.

单选按钮组应该通过 `aria-label` 或 `aria-labelledby` 给出一个有意义的标签。
