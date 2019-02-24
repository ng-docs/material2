The `text-field` package provides useful utilities for working with text input fields such as
`<input>` and `<textarea>`.

`text-field` 包为用来处理文本输入字段（如 `<input>` 和 `<textarea>` 提供了一些很有用的实用工具。

## Automatically resizing a `<textarea>`

## 自动调整 `<textarea>` 的大小

The `cdkTextareaAutosize` directive can be applied to any `<textarea>` to make it automatically
resize to fit its content. The minimum and maximum number of rows to expand to can be set via the
`cdkAutosizeMinRows` and `cdkAutosizeMaxRows` properties respectively.

`cdkTextareaAutosize` 指令可以应用在任何 `<textarea>` 上，以便让它自动根据内容调整大小。要扩展的最小和最大行数可以分别通过 `cdkAutosizeMinRows` 和 `cdkAutosizeMaxRows` 属性来设置。

The resize logic can be triggered programmatically by calling `resizeToFitContent`. This method
takes an optional boolean parameter `force` that defaults to `false`. Passing true will force the
`<textarea>` to resize even if its text content has not changed, this can be useful if the styles
affecting the `<textarea>` have changed.

调用 `resizeToFitContent` 可以通过编程的方式触发调整大小的逻辑。该方法接受一个默认为 `false` 的可选逻辑参数 `force`。传入 `true` 就会强制 `<textarea>` 调整大小（即使文本内容没有改变）。当影响 `<textarea>` 的一些样式发生变化时，这很有用。

<!-- example(text-field-autosize-textarea) -->

## Monitoring the autofill state of an `<input>`

## 监控 `<input>` 的自动填充状态

The `AutofillMonitor` is an injectable service that allows the user to monitor the autofill state of
an `<input>`. It has a `monitor` method that takes an element to monitor and returns an
`Observable` of autofill event objects with a `target` and `isAutofilled` property. The observable
emits every time the autofill state of the given `<input>` changes. Any element you monitor should
eventually be unmonitored by calling `stopMonitoring` with the same element.

`AutofillMonitor` 是一个可注入的服务，它允许用户监控 `<input>` 的自动填充状态。它有一个 `monitor` 方法，可以接受一个要监视的元素，并返回带有 `target` 和 `isAutofilled` 属性的 `Observable`。每当指定 `<input>` 的自动填充状态发生变化时，该可观察对就会发出事件。你所监控的任何元素最终都应该通过调用 `stopMonitoring` ，并传入同一个元素来停止监控。

<!-- example(text-field-autofill-monitor) -->

To simplify this process, there is also a `cdkAutofill` directive that automatically handles
monitoring and unmonitoring and doubles as an `@Output` binding that emits when the autofill state
changes.

为了简化这个过程，还有一个 `cdkAutofill` 指令可以自动处理监控与停止监控，并在自动填充状态发生变化时作为 `@Output` 绑定发出事件。

<!-- example(text-field-autofill-directive) -->

Note: This service requires some CSS to install animation hooks when the autofill statechanges. If
you are using Angular Material, this CSS is included as part of the `mat-core` mixin. If you are not
using Angular Material, you should include this CSS with the `cdk-text-field` mixin.

注意：当自动填充状态发生变化时，这项服务会需要一些 CSS 来安装动画钩子。如果你正在使用 Angular Material，那么这个 CSS 就已经作为 `mat-core` mixin 的一部分提供了。如果你没有使用 Angular Material，就应该用 `cdk-text-field` mixin 来包含这个 CSS。

```scss
@import '~@angular/cdk/text-field/text-field'; 

@include cdk-text-field();
```

## Styling the autofill state of an `<input>`

## 为 `<input>` 的自动填充状态设置样式

It can be difficult to override the browser default `background` and `color` properties on an
autofilled `<input>`. To make this simpler, the CDK includes a mixin `cdk-text-field-autofill-color`
which can be used to set these properties. It takes a `background` value as the first parameter and
an optional `color` value as the second parameter.

在自动填充的 `<input>` 上覆盖浏览器的默认 `background` 和 `color` 属性可能会很困难。为了简单起见，CDK 包含了一个 mixin `cdk-text-field-autofill-color`，它可以用来设置这些属性。它以第一个参数 `background` 和第二个可选参数 `color` 的值作为参数。

```scss
@import '~@angular/cdk/text-field/text-field'; 

// Set custom-autofill inputs to have no background and red text.
input.custom-autofill {
  @include cdk-text-field-autofill-color(transparent, red);
}
```
