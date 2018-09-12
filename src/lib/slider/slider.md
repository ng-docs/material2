`<mat-slider>` allows for the selection of a value from a range via mouse, touch, or keyboard,
similar to `<input type="range">`.

像 `<input type="range">` 一样，`<mat-slider>` 允许通过鼠标、触控或键盘来从范围中选择一个值。

<!-- example(slider-overview) -->

_Note: the sliding behavior for this component requires that HammerJS is loaded on the page._

*注意：该组件的滑动行为要求本页面中加载过 HammerJS 库。*

### Selecting a value

### 选择一个值

By default the minimum value of the slider is `0`, the maximum value is `100`, and the thumb moves
in increments of `1`. These values can be changed by setting the `min`, `max`, and `step` attributes
respectively. The initial value is set to the minimum value unless otherwise specified.

默认情况下，滑竿（slider）的最小值是 `0`，最大值是 `100`，滑块（thumb）移动时的增量是 `1`。
这些值可以通过设置 `min`、`max` 和 `step` 属性进行修改。除非另行指定，否则其初始值就等于最小值。

```html
<mat-slider min="1" max="5" step="0.5" value="1.5"></mat-slider>
```

### Orientation

### 方向

By default sliders are horizontal with the minimum value on the left and the maximum value on the
right. The `vertical` attribute can be added to a slider to make it vertical with the minimum value
on bottom and the maximum value on top.

默认情况下，滑竿是水平放置的，其最小值在左侧，最大值在右侧。可以给滑竿添加 `vertical` 属性，来让它变成垂直的，其最小值在底部，而最大值在顶部。

```html
<mat-slider vertical></mat-slider>
```

An `invert` attribute is also available which can be specified to flip the axis that the thumb moves
along. An inverted horizontal slider will have the minimum value on the right and the maximum value
on the left, while an inverted vertical slider will have the minimum value on top and the maximum
value on bottom.

还可以指定 `invert` 属性，来翻转坐标轴（滑块会沿着它移动）。
翻转后的水平滑竿，其最小值在右侧，而最大值在左侧；翻转后的垂直滑竿，其最小值在上部，而最大值在底部。

```html
<mat-slider invert></mat-slider>
```

### Thumb label

### 滑块标签

By default, the exact selected value of a slider is not visible to the user. However, this value can
be added to the thumb by adding the `thumbLabel` attribute.

默认情况下，滑竿所选的精确值不会显示给用户。不过，可以通过 `thumbLabel` 属性来把这个值显示在滑块上。

The [Material Design spec](https://material.io/design/components/sliders.html#discrete-slider) recommends using the
`thumbLabel` attribute (along with `tickInterval="1"`) only for sliders that are used to display a
discrete value (such as a 1-5 rating).

[Material Design 规范](https://material.io/design/components/sliders.html#discrete-slider)建议只为那些用来显示离散值（比如 1~5 的打分值）的滑竿使用 `thumbLabel` 属性（同时设置 `tickInterval="1"`）。

```html
<mat-slider thumbLabel tickInterval="1"></mat-slider>
```

### Formatting the thumb label

### 格式化滑块标签

By default, the value in the slider's thumb label will be the same as the model value, however this
may end up being too large to fit into the label. If you want to control the value that is being
displayed, you can do so using the `displayWith` input.

默认情况下，滑块标签上的值会始终和模型的值相同，不过它可能太大，而没办法放进标签中。
如果你要控制要显示的值，你可以使用输入属性 `displayWith` 来实现。

<!-- example(slider-formatting) -->

### Tick marks

### 刻度标记

By default, sliders do not show tick marks along the thumb track. This can be enabled using the
`tickInterval` attribute. The value of `tickInterval` should be a number representing the number
of steps between between ticks. For example a `tickInterval` of `3` with a `step` of `4` will draw
tick marks at every `3` steps, which is the same as every `12` values.

默认情况下，滑竿不会在滑块的导轨（track）上显示刻度标记，不过可以使用 `tickInterval` 属性来启用它。`tickInterval` 的值应该是一个表示刻度之间步长的数字。比如 `tickInterval` 为 `3` 而 `step` 为 `4` 时，将会每隔 `3` 步画出一个标记，每 `12` 个值重复一轮。

```html
<mat-slider step="4" tickInterval="3"></mat-slider>
```

The `tickInterval` can also be set to `auto` which will automatically choose the number of steps
such that there is at least `30px` of space between ticks.

`tickInterval` 还可以设置为 `auto` 来自动选择步数，来让刻度之间至少相距 `30px`。

```html
<mat-slider tickInterval="auto"></mat-slider>
```

The slider will always show a tick at the beginning and end of the track. If the remaining space
doesn't add up perfectly the last interval will be shortened or lengthened so that the tick can be
shown at the end of the track.

滑竿始终会在导轨的起点和终点显示一个刻度。如果剩下的控件不够添加了，那么最后一个间距可能被缩短或拉长，以便让刻度显示在导轨的末尾。

The [Material Design spec](https://material.io/design/components/sliders.html#discrete-slider) recommends using the
`tickInterval` attribute (set to `1` along with the `thumbLabel` attribute) only for sliders that
are used to display a discrete value (such as a 1-5 rating).

[Material Design 规范](https://material.io/design/components/sliders.html#discrete-slider) 建议只为那些用来显示离散值（比如 1~5 的打分值）的滑竿设置 `tickInterval` 属性（同时把 `thumbLabel` 属性设置为 `1`）。

### Keyboard interaction

### 键盘交互

The slider has the following keyboard bindings:

滑竿具有下列键盘绑定：

| 按键         | 操作                                                                             |
|-------------|------------------------------------------------------------------------------------|
| 右方向键 | <p translation-result>滑竿的值增加一步（在 RTL 下则减小）。</p><p translation-origin="off">Increment the slider value by one step (decrements in RTL).</p>
| 上方向键 | <p translation-result>滑竿的值增加一步。</p><p translation-origin="off">Increment the slider value by one step.</p>
| 左方向键 | <p translation-result>滑竿的值减小一步（在 RTL 下则增加）。</p><p translation-origin="off">Decrement the slider value by one step (increments in RTL).</p>
| 下方向键  | <p translation-result>滑竿的值减小一步。</p><p translation-origin="off">Decrement the slider value by one step.</p>
| 上翻页 | <p translation-result>滑竿的值增加 10 步。</p><p translation-origin="off">Increment the slider value by 10 steps.</p>
| 下翻页 | <p translation-result>滑竿的值减小 10 步。</p><p translation-origin="off">Decrement the slider value by 10 steps.</p>
| End         | <p translation-result>设置为可能的最大值。</p><p translation-origin="off">Set the value to the maximum possible.</p>
| Home        | <p translation-result>设置为可能的最小值。</p><p translation-origin="off">Set the value to the minimum possible.</p>

### Accessibility

### 可访问性

Sliders without text or labels should be given a meaningful label via `aria-label` or
`aria-labelledby`.

没有文本或标签的滑竿应该通过 `aria-label` 或 `aria-labelledby` 给出一个有意义的标签。
