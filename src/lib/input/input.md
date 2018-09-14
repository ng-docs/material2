`matInput` is a directive that allows native `<input>` and `<textarea>` elements to work with
[`<mat-form-field>`](https://material.angular.io/components/form-field/overview). 

`matInput` 是一个指令，它能让原生的 `<input>` 和 `<textarea>` 元素与 [`<mat-form-field>`](/components/form-field/overview) 协同工作。

<!-- example(input-overview) -->

### `<input>` and `<textarea>` attributes

### `<input>` 和 `<textarea>` 的属性

All of the attributes that can be used with normal `<input>` and `<textarea>` elements can be used
on elements inside `<mat-form-field>` as well. This includes Angular directives such as `ngModel`
and `formControl`.

所有能在标准 `<input>` 和 `<textarea>` 元素上使用的属性都同样能用在 `<mat-form-field>` 内部的元素上。
这些属性也包括像 `ngModel` 和 `formControl` 这样的 Angular 指令。

The only limitation is that the `type` attribute can only be one of the values supported by
`matInput`.

唯一的限制是 `type` 属性只能是 `matInput` 所支持的值之一。

### Supported `<input>` types

### 支持的 `<input>` 类型（type）

The following [input types](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input) can
be used with `matInput`:

下列[输入框类型](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)可以和 `matInput` 一起使用：

* color
* date
* datetime-local
* email
* month
* number
* password
* search
* tel
* text
* time
* url
* week

### Form field features

### 表单字段的特性

There are a number of `<mat-form-field>` features that can be used with any `<input matInput>` or
`<textarea matInput>`. These include error messages, hint text, prefix & suffix, and theming. For
additional information about these features, see the
[form field documentation](https://material.angular.io/components/form-field/overview).

`<mat-form-field>` 的一些特性可以和 `<input matInput>` 或 `<textarea matInput>` 一起使用。
这些特性包括错误信息、提示信息、前缀与后缀和主题。要了解这些特性的更多信息，参见[表单字段的文档](/components/form-field/overview)。

### Placeholder

### 占位符

The placeholder is text shown when the `<mat-form-field>` label is floating but the input is empty.
It is used to give the user an additional hint about what they should type in the input. The
placeholder can be specified by setting the `placeholder` attribute on the `<input>` or `<textarea>`
element. In some cases that `<mat-form-field>` may use the placeholder as the label (see the
[form field label documentation](https://material.angular.io/components/form-field/overview#floating-label)).

占位符是当 `<mat-form-field>` 浮起但输入框为空时显示的文本。
它可以给用户一个额外的提示，来告诉他们该在输入框中输入什么。
占位符可以通过 `<input>` 或 `<textarea>` 上的 `placeholder` 属性进行指定。
在某些情况下，`<mat-form-field>` 可以把此占位符用作标签（参见[表单字段的文档](/components/form-field/overview)）。

### Changing when error messages are shown

### 修改错误信息的显示时机

The `<mat-form-field>` allows you to
[associate error messages](https://material.angular.io/components/form-field/overview#error-messages)
with your `matInput`. By default, these error messages are shown when the control is invalid and
either the user has interacted with (touched) the element or the parent form has been submitted. If
you wish to override this behavior (e.g. to show the error as soon as the invalid control is dirty
or when a parent form group is invalid), you can use the `errorStateMatcher` property of the
`matInput`. The property takes an instance of an `ErrorStateMatcher` object. An `ErrorStateMatcher`
must implement a single method `isErrorState` which takes the `FormControl` for this `matInput` as
well as the parent form and returns a boolean indicating whether errors should be shown. (`true`
indicating that they should be shown, and `false` indicating that they should not.)

`<mat-form-field>` 让你能把[错误信息](/components/form-field/overview#error-messages)和你的 `matInput` 关联起来。
默认情况下，当该控件无效并且用户已经跟它交互过（碰过 touched）或者提交过父表单时才会显示这些错误信息。
如果你要覆盖这种行为（比如当无效控件或父表单组变脏时想尽快显示错误信息），可以使用 `matInput` 的 `errorStateMatcher` 属性。
该属性接收一个 `ErrorStateMatcher` 对象的实例。`ErrorStateMatcher` 必须实现一个 `isErrorState` 方法，它接受该 `matInput` 或其父表单的 `FormControl`，并返回一个 `boolean` 值，以指出是否应该显示错误信息。（`true` 表示应该显示，`false` 表示不该。）

<!-- example(input-error-state-matcher) -->

A global error state matcher can be specified by setting the `ErrorStateMatcher` provider. This
applies to all inputs. For convenience, `ShowOnDirtyErrorStateMatcher` is available in order to
globally cause input errors to show when the input is dirty and invalid.

全局的错误状态匹配器可以通过 `ErrorStateMatcher` 提供商来指定。它将作用于所有输入框。
为方便起见，可以使用 `ShowOnDirtyErrorStateMatcher` 作为全局配置，来要求只有当输入框是脏（dirty）且无效（invalid）时才显示错误信息。

```ts
@NgModule({
  providers: [
    {provide: ErrorStateMatcher, useClass: ShowOnDirtyErrorStateMatcher}
  ]
})
```

### Auto-resizing `<textarea>` elements

### 自动控制 `<textarea>` 元素的大小

`<textarea>` elements can be made to automatically resize by using the
[`cdkTextareaAutosize` directive](https://material.angular.io/components/input/overview#auto-resizing-code-lt-textarea-gt-code-elements)
available in the CDK.

通过使用 CDK 中的 [`cdkTextareaAutosize` 指令](/components/input/overview#auto-resizing-code-lt-textarea-gt-code-elements)，可以把 `<textarea>` 元素做成自动调整大小的。

### Responding to changes in the autofill state of an `<input>`

### 响应 `<input>` 自动填充状态的变更

The CDK provides
[utilities](https://material.angular.io/cdk/text-field/overview#monitoring-the-autofill-state-of-an-input)
for detecting when an input becomes autofilled and changing the appearance of the autofilled state.

CDK 提供了[一些工具](/cdk/text-field/overview#monitoring-the-autofill-state-of-an-input)来检测输入合适被自动填充了，并修改自动填充状态的外观。

### Accessibility

### 可访问性

The `matInput` directive works with native `<input>` to provide an accessible experience.

`matInput` 指令和原生的 `<input>` 一起使用，以提供具有可访问性的用户体验。

If the containing `<mat-form-field>` has a label it will automatically be used as the `aria-label`
for the `<input>`. However, if there's no label specified in the form field, `aria-label`,
`aria-labelledby` or `<label for=...>` should be added.

如果容器 `<mat-form-field>` 具有一个标签，它就会自动用作该 `<input>` 的 `aria-label` 属性。
不过，如果该表单字段没有指定过标签，就应该添加 `aria-label`、`aria-labelledby` 或 `<label for=...>`。

Any `mat-error` and `mat-hint` are automatically added to the input's `aria-describedby` list, and
`aria-invalid` is automatically updated based on the input's validity state.

任何 `mat-error` 和 `mat-hint` 都会自动添加到该输入框的 `aria-describedby` 列表中，并且 `aria-invalid` 会根据输入框的有效性状态进行自动更新。

### Troubleshooting

### 排查问题

#### Error: Input type "..." isn't supported by matInput

#### Error: Input type "..." isn't supported by matInput <br>（matInput 不支持输入类型 "..."）

This error is thrown when you attempt to set an input's `type` property to a value that isn't
supported by the `matInput` directive. If you need to use an unsupported input type with
`<mat-form-field>` consider writing a
[custom form field control](https://material.angular.io/guide/creating-a-custom-form-field-control)
for it.

当你尝试将输入框的 `type` 属性设置为 `matInput` 指令不支持的值时，将引发此错误。
如果需要使用不支持的输入类型和 `<mat-form-field>`，请考虑编写[自定义表单控件](/guide/creating-a-custom-form-field-control)。
