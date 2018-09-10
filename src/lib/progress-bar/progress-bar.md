`<mat-progress-bar>` is a horizontal progress-bar for indicating progress and activity.

`<mat-progress-bar>` 是一个水平进度条，以指示进度和活动。

### Progress mode

### 进度模式

The progress-bar supports four modes: determinate, indeterminate, buffer and query.

进度条支持四种模式：确定（determinate）、待定（indeterminate）、缓存（buffer）和查询（query）。

#### Determinate

#### 确定（determinate）

Operations where the percentage of the operation complete is known should use the 
determinate indicator.

对于那些已知操作完成度的操作，应该使用确定的指示符。

<!-- example(progress-bar-determinate) -->

This is the default mode and the progress is represented by the `value` property.

这是默认模式，其进度由 `value` 属性表示。

#### Indeterminate

#### 待定（indeterminate）

Operations where the user is asked to wait while something finishes and it’s 
not necessary to indicate how long it will take should use the indeterminate indicator.

对于那些要求用户等待却无法预估它要多久完成的操作时，应该使用待定指示符。

<!-- example(progress-bar-indeterminate) -->

In this mode the `value` property is ignored.

这种模式下，会忽略 `value` 属性的值。

#### Buffer

#### 缓存（buffer）

Operations where the user wants to indicate some activity or loading from the server, 
use the buffer indicator.

当用户需要等待某些活动或正在从服务器加载时，要使用缓存指示符。

<!-- example(progress-bar-buffer) -->

In "buffer" mode, `value` determines the progress of the primary bar while the `bufferValue` is 
used to show the additional buffering progress.

在缓存模式下，`value` 用来表示已完成的主进度，而 `bufferValue` 用于显示额外的缓存进度。

#### Query

#### 查询（query）

For situations where the user wants to indicate pre-loading (until the loading can actually be made), 
use the query indicator.

如果用户要指示预加载的情况（直到实际加载完），请使用查询指示符。

<!-- example(progress-bar-query) -->

In "query" mode, the progress-bar renders as an inverted "indeterminate" bar. Once the response 
progress is available, the `mode` should be changed to determinate to convey the progress. In
this mode the `value` property is ignored.

在查询模式下，进度条会渲染成一个反向的 "待定条"。一旦进度值可用，就应该把 `mode` 改为确定（determinate），以表达实际进度。
在这种模式下，会忽略 `value` 属性。

### Theming

### 主题

The color of a progress-bar can be changed by using the `color` property. By default, progress-bars
use the theme's primary color. This can be changed to `'accent'` or `'warn'`.  

进度条的颜色可以用 `color` 属性进行修改。默认情况下，进度条会使用主题的主色调（primary）。它可以修改为 `'accent'` 或 `'warn'`。

### Accessibility

### 可访问性

Each progress bar should be given a meaningful label via `aria-label` or `aria-labelledby`.

每个进度条都应该通过 `aria-label` 或 `aria-labelledby` 给出一个有意义的标签。
