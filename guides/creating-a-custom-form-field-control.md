# Creating a custom form field control

# 创建自定义表单字段（form field）控件

> placeholder
>
> 译注：本文中的表单字段控件 `form field control` 是指内部负责与用户交互的那个输入框控件，而表单字段 `form field` 是指控件外面的包装，其中可能包括输入框、错误信息、提示信息等。
> 注意：表单字段并不是表单字段控件的缩写，另外要和表单控件 Form Control 区分开。

It is possible to create custom form field controls that can be used inside `<mat-form-field>`. This
can be useful if you need to create a component that shares a lot of common behavior with a form
field, but adds some additional logic.

你可以创建能用于 `<mat-form-field>` 中的自定义表单字段控件。
这种技术能让你创建这样一个控件：它与某个表单字段共享许多常见的行为，但再添加一些额外的逻辑。

For example in this guide we'll learn how to create a custom input for inputting US telephone
numbers and hook it up to work with `<mat-form-field>`. Here is what we'll build by the end of this
guide:

比如，在这份指南中，你将学会如何创建一个用来输入美国的电话号码的自定义输入框，它能和 `<mat-form-field>` 协同工作。
其最终效果如下：

<!-- example(form-field-custom-control) -->

In order to learn how to build custom form field controls, let's start with a simple input component
that we want to work inside the form field. For example, a phone number input that segments the
parts of the number into their own inputs. (Note: this is not intended to be a robust component,
just a starting point for us to learn.)

要学习如何构建自定义表单字段控件，我们先从一个简单的输入框组件开始，我们要让它能用于表单字段中。
比如，一个电话号码输入框应该能把号码拆分后放进它的各个输入属性中。（注意，我们并不打算把它做成一个健壮的组件，只想把它作成学习的起点。）

```ts
class MyTel {
  constructor(public area: string, public exchange: string, public subscriber: string) {}
}

@Component({
  selector: 'my-tel-input',
  template: `
    <div [formGroup]="parts">
      <input class="area" formControlName="area" size="3">
      <span>&ndash;</span>
      <input class="exchange" formControlName="exchange" size="3">
      <span>&ndash;</span>
      <input class="subscriber" formControlName="subscriber" size="4">
    </div>
  `,
  styles: [`
    div {
      display: flex;
    }
    input {
      border: none;
      background: none;
      padding: 0;
      outline: none;
      font: inherit;
      text-align: center;
    }
  `],
})
class MyTelInput {
  parts: FormGroup;

  @Input()
  get value(): MyTel | null {
    let n = this.parts.value;
    if (n.area.length == 3 && n.exchange.length == 3 && n.subscriber.length == 4) {
      return new MyTel(n.area, n.exchange, n.subscriber);
    }
    return null;
  }
  set value(tel: MyTel | null) {
    tel = tel || new MyTel('', '', '');
    this.parts.setValue({area: tel.area, exchange: tel.exchange, subscriber: tel.subscriber});
  }

  constructor(fb: FormBuilder) {
    this.parts =  fb.group({
      'area': '',
      'exchange': '',
      'subscriber': '',
    });
  }
}
```

### Providing our component as a MatFormFieldControl

### 把我们的组件作为 MatFormFieldControl 提供出来

The first step is to provide our new component as an implementation of the `MatFormFieldControl`
interface that the `<mat-form-field>` knows how to work with. To do this, we will have our class
implement `MatFormFieldControl`. Since this is a generic interface, we'll need to include a type
parameter indicating the type of data our control will work with, in this case `MyTel`. We then add
a provider to our component so that the form field will be able to inject it as a
`MatFormFieldControl`.

第一步把我们的组件作为 `MatFormFieldControl` 接口的实现提供出来，而 `<mat-form-field>` 知道该如何与该接口协作。
要做到这一点，我们要创建一个自己的类来实现 `MatFormFieldControl`。由于它是一个泛型接口，我们需要包含一个类型参数来标记出这个控件支持的数据类型，在这里也就是 `MyTel`。然后我们为这个组件添加一个提供商，以便表单字段（form-field）能把它作为 `MatFormFieldControl` 注入进去。

```ts
@Component({
  ...
  providers: [{provide: MatFormFieldControl, useExisting: MyTelInput}],
})
class MyTelInput implements MatFormFieldControl<MyTel> {
  ...
}
```

This sets up our component so it can work with `<mat-form-field>`, but now we need to implement the
various methods and properties declared by the interface we just implemented. To learn more about
the `MatFormFieldControl` interface, see the
[form field API documentation](https://material.angular.io/components/form-field/api).

这将准备好我们的组件，以便它能和 `<mat-form-field>` 协作。接下来我们还要实现该接口中声明的各个方法和属性。
要深入了解 `MatFormFieldControl` 接口，参见[表单字段的 API 文档](/components/form-field/api)。

### Implementing the methods and properties of MatFormFieldControl

### 实现 MatFormFieldControl 的各个方法和属性

#### `value`

This property allows someone to set or get the value of our control. Its type should be the same
type we used for the type parameter when we implemented `MatFormFieldControl`. Since our component
already has a value property, we don't need to do anything for this one.

该属性能让别人设置或获取我们这个控件的值。它的类型应该与我们要实现的 `MatFormFieldControl` 中的类型参数保持一致。
由于我们的组件已经有了 `value` 属性，所以这里不用再做任何事。

#### `stateChanges`

Because the `<mat-form-field>` uses the `OnPush` change detection strategy, we need to let it know
when something happens in the form field control that may require the form field to run change
detection. We do this via the `stateChanges` property. So far the only thing the form field needs to
know about is when the value changes. We'll need to emit on the stateChanges stream when that
happens, and as we continue flushing out these properties we'll likely find more places we need to
emit. We should also make sure to complete `stateChanges` when our component is destroyed.

由于 `<mat-form-field>` 使用 `OnPush` 变更检查策略，所以当这个表单字段控件中发生变化时，我们需要通知表单字段执行变更检测。我们可以用 `stateChanges` 属性实现这一点。到目前为止，表单字段唯一需要知道的是值变化的时机。当值变化时，我们就要发出 `stateChanges` 流，后面我们还会发现更多的时间点。当我们的组件被销毁时，我们一定要结束（`complete()`）这个 `stateChanges` 流。

```ts
stateChanges = new Subject<void>();

set value(tel: MyTel | null) {
  ...
  this.stateChanges.next();
}

ngOnDestroy() {
  this.stateChanges.complete();
}
```

#### `id`

This property should return the ID of an element in the component's template that we want the
`<mat-form-field>` to associate all of its labels and hints with. In this case, we'll use the host
element and just generate a unique ID for it.

该属性应该返回元素在组件模板中的 ID，这样 `<mat-form-field>` 才能把它所有的标签和提示都与我们的控件关联起来。
这种情况下，我们可以使用宿主元素，并自动为它生成一个具有唯一性的 ID。

```ts
static nextId = 0;

@HostBinding() id = `my-tel-input-${MyTelInput.nextId++}`;
```

#### `placeholder`

This property allows us to tell the `<mat-form-field>` what to use as a placeholder. In this
example, we'll do the same thing as `matInput` and `<mat-select>` and allow the user to specify it
via an `@Input()`. Since the value of the placeholder may change over time, we need to make sure to
trigger change detection in the parent form field by emitting on the `stateChanges` stream when the
placeholder changes.

该属性让我们能告诉 `<mat-form-field>` 该把什么用作占位符。在这个例子中，我们的做法和 `matInput`、`<mat-select>` 一样，允许用户通过 `@Input()` 来指定它。
由于占位符的值以后可能还会改变，所以，当它变化时，我们一定要通过 `stateChanges` 流发出事件，以触发表单字段的变更检测。

```ts
@Input()
get placeholder() {
  return this._placeholder;
}
set placeholder(plh) {
  this._placeholder = plh;
  this.stateChanges.next();
}
private _placeholder: string;
```

#### `ngControl`

This property allows the form field control to specify the `@angular/forms` control that is bound to this component. Since we haven't set up our component to act as a `ControlValueAccessor`, we'll just set this to `null` in our component.

该属性能为表单字段控件指定一个 `@angular/forms` 中的表单控件，以绑定到本控件。由于我们还没有把本组件实现为 `ControlValueAccessor`，所以我们先把它设置为 `null`。

```ts
ngControl: NgControl = null;
```

It is likely you will want to implement `ControlValueAccessor` so that your component can work with `formControl` and `ngModel`. If you do implement `ControlValueAccessor` you will need to get a reference to the `NgControl` associated with your control and make it publicly available.

看样子你还要实现 `ControlValueAccessor`，以便你的组件可以跟 `formControl` 和 `ngModel` 协同工作。要想实现 `ControlValueAccessor`，你就要获得一个关联到此控件的 `NgControl`，并把它公开。

The easy way is to add it as a public property to your constructor and let dependency injection handle it:

最简单的方式是把它添加为构造函数中的一个公共属性，并交给依赖注入体系来处理它：

```ts
constructor(
  ...,
  @Optional() @Self() public ngControl: NgControl,
  ...,
) { }
```

Note that if your component implements `ControlValueAccessor`, it may already be set up to provide `NG_VALUE_ACCESSOR` (in the `providers` part of the component's decorator, or possibly in a module declaration). If so you may get a *cannot instantiate cyclic dependency* error.

注意，如果你的组件实现了 `ControlValueAccessor`，那么它可能已经作为 `NG_VALUE_ACCESSOR` 提供出去了（在组件装饰器的 `providers` 部分，或模块声明中）。如果是这样，可能会导致*cannot instantiate cyclic dependency（不能实例化循环依赖）*错误。

To resolve this, remove the `NG_VALUE_ACCESSOR` provider and instead set the value accessor directly:

要解决这个问题，请移除 `NG_VALUE_ACCESSOR` 提供商，改为直接设置 Value Accessor 的值：

```ts
constructor(
  ...,
  @Optional() @Self() public ngControl: NgControl,
  ...,
) {
  // Setting the value accessor directly (instead of using
  // the providers) to avoid running into a circular import.
  if (this.ngControl != null) { this.ngControl.valueAccessor = this; }
}
```

For additional information about `ControlValueAccessor` see the [API docs](https://angular.io/api/forms/ControlValueAccessor).

要深入了解 `ControlValueAccessor`，参见其 [API 文档](https://angular.io/api/forms/ControlValueAccessor)。

#### `focused`

This property indicates whether or not the form field control should be considered to be in a
focused state. When it is in a focused state, the form field is displayed with a solid color
underline. For the purposes of our component, we want to consider it focused if any of the part
inputs are focused. We can use the `FocusMonitor` from `@angular/cdk` to easily check this. We also
need to remember to emit on the `stateChanges` stream so change detection can happen.

该属性表示该表单字段控件是否要被视为有焦点状态。当处于有焦点状态时，表单字段会显示一个实下划线。
对于这个组件，我们希望当其中的任何一个输入框拥有焦点时，我们就认为该组件拥有焦点。我们可以使用来自 `@angular/cdk` 中的
`FocusMonitor` 来轻松地检查它。另外，别忘了在 `stateChanges` 流上发出事件，以便触发变更检测。

```ts
focused = false;

constructor(fb: FormBuilder, private fm: FocusMonitor, private elRef: ElementRef<HTMLElement>) {
  ...
  fm.monitor(elRef.nativeElement, true).subscribe(origin => {
    this.focused = !!origin;
    this.stateChanges.next();
  });
}

ngOnDestroy() {
  ...
  this.fm.stopMonitoring(this.elRef.nativeElement);
}
```

#### `empty`

This property indicates whether the form field control is empty. For our control, we'll consider it
empty if all of the parts are empty.

该属性表示这个表单字段控件是否空的。对于这个控件来说，当它所有的部分都是空的时，我们才认为它是空的。

```ts
get empty() {
  let n = this.parts.value;
  return !n.area && !n.exchange && !n.subscriber;
}
```

#### `shouldLabelFloat`

This property is used to indicate whether the label should be in the floating position. We'll
use the same logic as `matInput` and float the placeholder when the input is focused or non-empty.
Since the placeholder will be overlapping our control when when it's not floating, we should hide
the `–` characters when it's not floating.

该属性表示是否应该把标签显示在浮动位置。它和 `matInput` 在输入框有焦点或非空时上浮占位符的逻辑是一样的。
当不浮动时，该占位符将会遮住我们的控件，所以这种情况下我们应该隐藏 `-` 字符。


```ts
@HostBinding('class.floating')
get shouldLabelFloat() {
  return this.focused || !this.empty;
}
```
```css
span {
  opacity: 0;
  transition: opacity 200ms;
}
:host.floating span {
  opacity: 1;
}
```

#### `required`

This property is used to indicate whether the input is required. `<mat-form-field>` uses this
information to add a required indicator to the placeholder. Again, we'll want to make sure we run
change detection if the required state changes.

该属性表示此输入框是必填的。`<mat-form-field>` 会据此给占位符添加必填项指示器。
同样的，当必填状态发生了变化时，我们要确保触发变更检测。

```ts
@Input()
get required() {
  return this._required;
}
set required(req) {
  this._required = coerceBooleanProperty(req);
  this.stateChanges.next();
}
private _required = false;
```

#### `disabled`

This property tells the form field when it should be in the disabled state. In addition to reporting
the right state to the form field, we need to set the disabled state on the individual inputs that
make up our component.

该属性告诉表单字段它何时应该处于禁用状态。除了向表单字段汇报正确的状态之外，我们还要据此来设置内部各个独立控件的禁用状态。

```ts
@Input()
get disabled() {
  return this._disabled;
}
set disabled(dis) {
  this._disabled = coerceBooleanProperty(dis);
  this.stateChanges.next();
}
private _disabled = false;
```
```html
<input class="area" formControlName="area" size="3" [disabled]="disabled">
<span>&ndash;</span>
<input class="exchange" formControlName="exchange" size="3" [disabled]="disabled">
<span>&ndash;</span>
<input class="subscriber" formControlName="subscriber" size="4" [disabled]="disabled">
```

#### `errorState`

This property indicates whether the associated `NgControl` is in an error state. Since we're not
using an `NgControl` in this example, we don't need to do anything other than just set it to `false`.

该属性表示相关的 `NgControl` 是否处于错误状态。由于我们这个例子中没有用到 `NgControl`，所以只要把它设置为 `false` 就行了。

```ts
errorState = false;
```

#### `controlType`

This property allows us to specify a unique string for the type of control in form field. The
`<mat-form-field>` will add an additional class based on this type that can be used to easily apply
special styles to a `<mat-form-field>` that contains a specific type of control. In this example
we'll use `my-tel-input` as our control type which will result in the form field adding the class
`mat-form-field-my-tel-input`.

该属性可以让我们指定一个具有唯一性的字符串，以便在表单字段中表示该控件的类型。
`<mat-form-field>` 将会据此添加一个附加类，可用于为包含指定控件类型的 `<mat-form-field>` 指定一些特殊样式。
在这个例子中，我们要用 `my-tel-input` 作为我们的控件类型，这将给包含它的表单字段加上 `mat-form-field-my-tel-input` 类。

```ts
controlType = 'my-tel-input';
```

#### `setDescribedByIds(ids: string[])`

This method is used by the `<mat-form-field>` to specify the IDs that should be used for the
`aria-describedby` attribute of your component. The method has one parameter, the list of IDs, we
just need to apply the given IDs to our host element.

`<mat-form-field>` 会使用该方法来指定一些 ID，将其用作该组件的 `aria-describedby` 属性。
该方法具有一个参数，也就是 ID 的列表，我们要做的就是把这些 ID 应用到组件的宿主元素上。

```ts
@HostBinding('attr.aria-describedby') describedBy = '';

setDescribedByIds(ids: string[]) {
  this.describedBy = ids.join(' ');
}
```

#### `onContainerClick(event: MouseEvent)`

This method will be called when the form field is clicked on. It allows your component to hook in
and handle that click however it wants. The method has one parameter, the `MouseEvent` for the
click. In our case we'll just focus the first `<input>` if the user isn't about to click an
`<input>` anyways.

当用户点击表单字段时就会调用该方法。它让你的组件可以按需挂接并处理点击事件。该方法只有一个参数，也就是点击时的 `MouseEvent`。
在这个例子中，如果用户没有直接点击某一个 `<input>`，则我们只要对第一个 `<input>` 设置焦点就可以了。

```ts
onContainerClick(event: MouseEvent) {
  if ((event.target as Element).tagName.toLowerCase() != 'input') {
    this.elRef.nativeElement.querySelector('input').focus();
  }
}
```

### Trying it out

### 试试看

Now that we've fully implemented the interface, we're ready to try our component out! All we need to
do is place it inside of a `<mat-form-field>`

现在，我们已经完整的实现了该接口，来试试它！我们要做的一切就是把它扔进 `<mat-form-field>` 中：

```html
<mat-form-field>
  <my-tel-input></my-tel-input>
</mat-form-field>
```

We also get all of the features that come with `<mat-form-field>` such as floating placeholder,
prefix, suffix, hints, and errors (if we've given the form field an `NgControl` and correctly report
the error state).

我们还获得了 `<mat-form-field>` 的所有特性，比如上浮占位符、前缀、后缀、提示和错误（前提是我们给了表单字段一个 `NgControl`，并正确的报告了错误状态）。

```html
<mat-form-field>
  <my-tel-input placeholder="Phone number" required></my-tel-input>
  <mat-icon matPrefix>phone</mat-icon>
  <mat-hint>Include area code</mat-hint>
</mat-form-field>
```
