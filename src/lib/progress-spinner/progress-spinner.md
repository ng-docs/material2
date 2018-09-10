`<mat-progress-spinner>` and `<mat-spinner>` are a circular indicators of progress and activity.

`<mat-progress-spinner>` 和 `<mat-spinner>` 是一个表示进度和活动的圆形指示符。 

<!-- example(progress-spinner-overview) -->

### Progress mode

### 进度模式

The progress-spinner supports two modes, "determinate" and "indeterminate". 
The `<mat-spinner>` component is an alias for `<mat-progress-spinner mode="indeterminate">`.

进度圈支持两种模式：确定（"determinate"）和待定（"indeterminate"）。

| 模式          | 说明                                                                      |
|---------------|----------------------------------------------------------------------------------|
| determinate   | <p translation-result>标准的进度指示符，填充 0% 到 100%</p><p translation-origin="off">Standard progress indicator, fills from 0% to 100%                               </p>
| indeterminate | <p translation-result>表示正在发生某些事情，却没有传达离散的进度</p><p translation-origin="off">Indicates that something is happening without conveying a discrete progress      </p>


The default mode is "determinate". In this mode, the progress is set via the `value` property, 
which can be a whole number between 0 and 100.

默认模式是确定的（"determinate"）。在该模式下，进度要通过 `value` 属性进行设置，它可以是 0 到 100 之间的整数。

In "indeterminate" mode, the `value` property is ignored.

在 "indeterminate" 模式下，会忽略 `value` 属性。

### Theming

### 主题

The color of a progress-spinner can be changed by using the `color` property. By default, 
progress-spinners use the theme's primary color. This can be changed to `'accent'` or `'warn'`.

进度圈的颜色可以通过 `color` 属性进行修改。默认情况下，进度圈使用主题的主色调（primary）。
它可以修改为 `'accent'` 或 `'warn'`。

### Accessibility

### 可访问性

Each progress spinner should be given a meaningful label via `aria-label` or `aria-labelledby`.

每个进度圈都应该通过 `aria-label` 或 `aria-labelledby` 给出一个有意义的标签。
