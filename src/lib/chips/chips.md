`<mat-chip-list>` displays a list of values as individual, keyboard accessible, chips.

`<mat-chip-list>` 把一组值显示为独立的、可通过键盘访问的芯片。

<!-- example(chips-overview) -->

```html
<mat-chip-list>
  <mat-chip>Papadum</mat-chip>
  <mat-chip>Naan</mat-chip>
  <mat-chip>Dal</mat-chip>
</mat-chip-list>
```

### Unstyled chips

### 无样式的芯片

By default, `<mat-chip>` has Material Design styles applied. For a chip with no styles applied,
use `<mat-basic-chip>`. You can then customize the chip appearance by adding your own CSS.

默认情况下，`<mat-chip>` 具有 Material Design 样式。要想不用样式，请使用 `<mat-basic-chip>`。
然后你可以通过添加自己的 CSS 来定制该芯片的外观。

_Hint: `<mat-basic-chip>` receives the `mat-basic-chip` CSS class in addition to the `mat-chip` class._

*提示：`<mat-basic-chip>` 除了 `mat-chip` 类之外，还会添加 `mat-basic-chip`类。*

### Selection

### 选择

Chips can be selected via the `selected` property. Selection can be disabled by setting
`selectable` to `false` on the `<mat-chip-list>`.

芯片可以通过 `selected` 属性进行选择。可以通过把 `<mat-chip-list>` 的 `selectable` 设置为 `false` 来禁止选择。

Whenever the selection state changes, a `ChipSelectionChange` event will be emitted via
`(selectionChange)`.

每当选择状态发生变化时，它就会通过 `(selectionChange)` 发出一个 `ChipSelectionChange` 事件。

### Disabled chips

### 禁用芯片

Individual chips may be disabled by applying the `disabled` attribute to the chip. When disabled,
chips are neither selectable nor focusable. Currently, disabled chips receive no special styling.

每个独立芯片都可以通过使用 `disabled` 属性来禁用。当被禁用时，它既不能被选择，也不能获得焦点。
目前，禁用的芯片没有任何特殊样式。

### Chip input

### 芯片输入框

The `MatChipInput` directive can be used together with a chip-list to streamline the interaction
between the two components. This directive adds chip-specific behaviors to the input element
within `<mat-form-field>` for adding and removing chips. The `<input>` with `MatChipInput` can
be placed inside or outside the chip-list element.

`MatChipInput` 指令可以和芯片列表一起使用，以简化两个组件之间的交互。
该指令把一些芯片专属的行为添加到 `<mat-form-field>` 中的输入框元素上，以添加和删除芯片。
这个带有 `MatChipInput` 的 `<input>` 可放在芯片列表元素的内部或外部。

An example of chip input placed inside the chip-list element.

下面的例子把芯片输入框放在芯片列表内部。

<!-- example(chips-input) -->

An example of chip input placed outside the chip-list element.

下面的例子把芯片输入框放在芯片列表外部。

```html
<mat-form-field>
  <mat-chip-list #chipList>
    <mat-chip>Chip 1</mat-chip>
    <mat-chip>Chip 2</mat-chip>
  </mat-chip-list>
  <input [matChipInputFor]="chipList">
</mat-form-field>
```

An example of chip input with an autocomplete placed inside the chip-list element.

下面的例子把带有自动完成功能的芯片输入框放在芯片列表元素内部。

<!-- example(chips-autocomplete) -->

### Keyboard interaction

### 键盘交互

Users can move through the chips using the arrow keys and select/deselect them with the space. Chips
also gain focus when clicked, ensuring keyboard navigation starts at the appropriate chip.

用户可以使用方向键在芯片之间移动，也可以用空格键选择它们或取消选择。
在点击时，芯片还会获得焦点，以确保会从合适的芯片开始导航。

### Orientation

### 方向

If you want the chips in the list to be stacked vertically, instead of horizontally, you can apply
the `mat-chip-list-stacked` class, as well as the `aria-orientation="vertical"` attribute:

如果你希望列表中的芯片垂直排列而不是水平排列，你可以添加 `mat-chip-list-stacked` 类，以及 `aria-orientation="vertical"` 属性：

```html
<mat-chip-list class="mat-chip-list-stacked" aria-orientation="vertical">
  <mat-chip>Papadum</mat-chip>
  <mat-chip>Naan</mat-chip>
  <mat-chip>Dal</mat-chip>
</mat-chip-list>
```

### Specifying global configuration defaults

### 指定默认的全局配置

Default options for the chips module can be specified using the `MAT_CHIPS_DEFAULT_OPTIONS`
injection token.

芯片模块的默认选项用依赖注入令牌 `MAT_CHIPS_DEFAULT_OPTIONS` 表示。

```ts
@NgModule({
  providers: [
    {
      provide: MAT_CHIPS_DEFAULT_OPTIONS,
      useValue: {
        separatorKeyCodes: [ENTER, COMMA]
      }
    }
  ]
})
```

### Theming

### 主题

The selected color of an `<mat-chip>` can be changed by using the `color` property. By default, chips
use a neutral background color based on the current theme (light or dark). This can be changed to
`'primary'`, `'accent'`, or `'warn'`.

`<mat-chip>` 中选中芯片的颜色可以用 `color` 属性来改变。
默认情况下，芯片使用当前主题（无论亮色还是暗色）下的 `neutral`（中性）背景色。
此颜色可以修改为 `'primary'`、`'accent'` 或 `'warn'`。

### Accessibility

### 可访问性

A chip-list behaves as a `role="listbox"`, with each chip being a `role="option"`. The chip input
should have a placeholder or be given a meaningful label via `aria-label` or `aria-labelledby`.

芯片列表的行为是 `role="listbox"`，其中的每个芯片则是 `role="option"`。
芯片输入框要具有一个占位符或借助 `aria-label` 或 `aria-labelledby` 来指定一个有意义的标签。
