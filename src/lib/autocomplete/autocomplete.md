The autocomplete is a normal text input enhanced by a panel of suggested options.

自动完成（autocomplete）通过显示一个建议选项面板，来对标准文本框进行增强

### Simple autocomplete

### 简单的自动完成

Start by adding a regular `matInput` to your template. Let's assume you're using the `formControl`
directive from `ReactiveFormsModule` to track the value of the input.

在模板中加上标准的 `matInput` 即可。这里假设你在用来自 `ReactiveFormsModule` 的 `formControl` 来追踪输入框的值。

> Note: It is possible to use template-driven forms instead, if you prefer. We use reactive forms
in this example because it makes subscribing to changes in the input's value easy. For this
example, be sure to import `ReactiveFormsModule` from `@angular/forms` into your `NgModule`.
If you are unfamiliar with using reactive forms, you can read more about the subject in the
[Angular documentation](https://angular.io/guide/reactive-forms).
>
> 注意：如果你愿意，也可以用模板驱动表单代替。我们在这个例子中使用响应式表单，是因为这样比较容易订阅输入值的变化。在这个例子中，要确保你的 `NgModule` 从 `@angular/forms` 中导入了 `ReactiveFormsModule` 。
> 如果你对使用响应式表单还不熟，可以阅读 [Angular 官方文档](https://angular.cn/guide/reactive-forms) 中的相关主题。

*my-comp.html*
```html
<mat-form-field>
  <input type="text" matInput [formControl]="myControl">
</mat-form-field>
```

Next, create the autocomplete panel and the options displayed inside it. Each option should be
defined by an `mat-option` tag. Set each option's value property to whatever you'd like the value
of the text input to be upon that option's selection.

接下来，创建自动完成面板和待显示的候选项。每个选项都应该用 `mat-option` 标记来定义。将每个选项的值设置为你想用作候选文本的值。

*my-comp.html*
```html
<mat-autocomplete>
  <mat-option *ngFor="let option of options" [value]="option">
    {{ option }}
  </mat-option>
</mat-autocomplete>
```

Now we'll need to link the text input to its panel. We can do this by exporting the autocomplete
panel instance into a local template variable (here we called it "auto"), and binding that variable
to the input's `matAutocomplete` property.

现在，我们需要把这个输入框和它的面板联系起来。我们可以把这个自动完成面板的实例导出给一个局部模板变量（这里叫它 "auto"），然后把这个变量绑定到输入框的 `matAutocomplete` 属性上。

*my-comp.html*
```html
<mat-form-field>
  <input type="text" matInput [formControl]="myControl" [matAutocomplete]="auto">
</mat-form-field>

<mat-autocomplete #auto="matAutocomplete">
  <mat-option *ngFor="let option of options" [value]="option">{{option}}</mat-option>
</mat-autocomplete>
```

<!-- example(autocomplete-simple) -->

### Adding a custom filter

### 添加自定义过滤器

At this point, the autocomplete panel should be toggleable on focus and options should be
selectable. But if we want our options to filter when we type, we need to add a custom filter.

此刻，自动完成面板应该能根据焦点状态进行切换了，而候选项也是可供选择的。但如果我们希望这些选项能在输入时进行过滤，就要添加一个自定义过滤器。

You can filter the options in any way you like based on the text input\*. Here we will perform a
simple string test on the option value to see if it matches the input value, starting from the
option's first letter. We already have access to the built-in `valueChanges` Observable on the
`FormControl`, so we can simply map the text input's values to the suggested options by passing
them through this filter. The resulting Observable, `filteredOptions`, can be added to the
template in place of the `options` property using the `async` pipe.

可以用任何你喜欢的方式根据已输入的文本对候选项进行过滤。
这里我们对候选项的值执行一个简单的字符串测试，看它是否匹配已输入的值，从候选项的首字母开始。
我们已经能访问该 `FormControl` 的 `valueChanges` 这个 `Observable` 了，所以我们可以通过把它们传给过滤器来找出所建议的选项。
其结果 `filteredOptions` 可以使用 `async` 管道绑定到模板的 `options` 属性中。

Below we are also priming our value change stream with an empty string so that the options are
filtered by that value on init (before there are any value changes).

接下来还要我们往 `valueChanges` 中添加一个空字符串，以便在值初始化后（做任何修改之前）就对选项进行一次过滤。

\*For optimal accessibility, you may want to consider adding text guidance on the page to explain
filter criteria. This is especially helpful for screenreader users if you're using a non-standard
filter that doesn't limit matches to the beginning of the string.

为了获得最佳的可访问性，你可能还要往该页添加一些文本指南来解释过滤条件。
特别是，如果你使用了非标准过滤器，并且不单从字符串的开头儿进行匹配，那么它将对使用屏幕阅读器的用户有很大帮助。

<!-- example(autocomplete-filter) -->

### Setting separate control and display values

### 分别设置控件值和显示内容

If you want the option's control value (what is saved in the form) to be different than the option's
display value (what is displayed in the text field), you'll need to set the `displayWith`
property on your autocomplete element. A common use case for this might be if you want to save your
data as an object, but display just one of the option's string properties.

如果你希望把选项的控件值（它将保存在表单中）设置得和它的显示值（它将显示在文本框中）不同，那么你就要在你的自动完成元素上设置 `displayWith` 属性。
一种常见的用法是你希望把数据存为对象，却只想显示该选项的某个字符串型属性。

To make this work, create a function on your component class that maps the control value to the
desired display value. Then bind it to the autocomplete's `displayWith` property.

要做到这一点，请在你的组件类上创建一个用于把控件值映射为其显示值的函数。然后把该函数绑定到自动完成组件的 `displayWith` 属性上。

<!-- example(autocomplete-display) -->

### Automatically highlighting the first option

### 自动高亮第一个候选项

If your use case requires for the first autocomplete option to be highlighted when the user opens
the panel, you can do so by setting the `autoActiveFirstOption` input on the `mat-autocomplete`
component. This behavior can be configured globally using the `MAT_AUTOCOMPLETE_DEFAULT_OPTIONS`
injection token.

如果你希望当用户打开自动完成面板时自动高亮第一个选项，可以设置 `mat-autocomplete` 组件的输入属性 `autoActiveFirstOption`。该行为可以通过依赖注入令牌 `MAT_AUTOCOMPLETE_DEFAULT_OPTIONS` 进行全局配置。

<!-- example(autocomplete-auto-active-first-option) -->

### Attaching the autocomplete panel to a different element

### 把自动完成面板附着到另一个元素上

By default the autocomplete panel will be attached to your input element, however in some cases you
may want it to attach to a different container element. You can change the element that the
autocomplete is attached to using the `matAutocompleteOrigin` directive together with the
`matAutocompleteConnectedTo` input:

默认情况下，自动完成面板将会附着在你的输入控件上，不过，有时候你可能希望把它附着到另一个容器元素上。
你可以使用 `matAutocompleteOrigin` 和 `matAutocompleteConnectedTo` 指令来修改它要附着的元素：

```html
<div class="custom-wrapper-example" matAutocompleteOrigin #origin="matAutocompleteOrigin">
  <input
    matInput
    [formControl]="myControl"
    [matAutocomplete]="auto"
    [matAutocompleteConnectedTo]="origin">
</div>

<mat-autocomplete #auto="matAutocomplete">
  <mat-option *ngFor="let option of options" [value]="option">{{option}}</mat-option>
</mat-autocomplete>
```

### Keyboard interaction

### 键盘交互

- <kbd>DOWN_ARROW</kbd>: Next option becomes active.

  <kbd>DOWN_ARROW</kbd>：激活后一个选项。

- <kbd>UP_ARROW</kbd>: Previous option becomes active.

  <kbd>UP_ARROW</kbd>：激活前一个选项。

- <kbd>ENTER</kbd>: Select currently active item.

  <kbd>ENTER</kbd>：选择当前激活的条目。


### Option groups

### 选项组

`mat-option` can be collected into groups using the `mat-optgroup` element:

可以使用 `mat-optgroup` 元素对 `mat-option` 进行分组：

<!-- example(autocomplete-optgroup) -->


```html
<mat-autocomplete #auto="matAutocomplete">
  <mat-optgroup *ngFor="let group of filteredGroups | async" [label]="group.name">
    <mat-option *ngFor="let option of group.options" [value]="option">
      {{option.name}}
    </mat-option>
  </mat-optgroup>
</mat-autocomplete>
```

### Accessibility

### 可访问性

The input for an autocomplete without text or labels should be given a meaningful label via
`aria-label` or `aria-labelledby`.

对于没有文本或标签的输入框，应该使用 `aria-label` 或 `aria-labelledby` 来为它指定一个有意义的标签。

The autocomplete trigger is given `role="combobox"`. The trigger sets `aria-owns` to the
autocomplete's id, and sets `aria-activedescendant` to the active option's id.

自动完成组件的触发器是 `role="combobox"`。该触发器会把 `aria-owns` 设置为该组件的 id，并把 `aria-activedescendant` 设置为当前活动选项的 id。
