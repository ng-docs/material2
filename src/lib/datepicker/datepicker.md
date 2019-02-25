The datepicker allows users to enter a date either through text input, or by choosing a date from
the calendar. It is made up of several components and directives that work together.

日期选择器允许用户通过文本框输入一个日期，或用日历选取一个日期。它由一几个协同工作的组件和指令组成。

<!-- example(datepicker-overview) -->

### Connecting a datepicker to an input

### 把日期选择器关联到一个输入框

A datepicker is composed of a text input and a calendar pop-up, connected via the `matDatepicker`
property on the text input.

日期选择器由一个文本输入框和一个日历弹出框组成，它们通过文本框上的 `matDatepicker` 联系起来。

```html
<input [matDatepicker]="myDatepicker">
<mat-datepicker #myDatepicker></mat-datepicker>
```

An optional datepicker toggle button is available. A toggle can be added to the example above:

还可以使用一个可选的日期选择器切换按钮。可以这样添加切换按钮：

```html
<input [matDatepicker]="myDatepicker">
<mat-datepicker-toggle [for]="myDatepicker"></mat-datepicker-toggle>
<mat-datepicker #myDatepicker></mat-datepicker>
```

This works exactly the same with an input that is part of an `<mat-form-field>` and the toggle
can easily be used as a prefix or suffix on the material input:

当输入框作为 `<mat-form-field>` 的一部分时，也完全一样。
切换按钮可以很容易地作为输入框的前缀或后缀：

```html
<mat-form-field>
  <input matInput [matDatepicker]="myDatepicker">
  <mat-datepicker-toggle matSuffix [for]="myDatepicker"></mat-datepicker-toggle>
  <mat-datepicker #myDatepicker></mat-datepicker>
</mat-form-field>
```

If you want to customize the icon that is rendered inside the `mat-datepicker-toggle`, you can do so
by using the `matDatepickerToggleIcon` directive:

如果你要定制 `mat-datepicker-toggle` 中渲染的图标，可以使用 `matDatepickerToggleIcon` 指令：

<!-- example(datepicker-custom-icon) -->

### Setting the calendar starting view

### 设置日历的起始视图

The `startView` property of `<mat-datepicker>` can be used to set the view that will show up when
the calendar first opens. It can be set to `month`, `year`, or `multi-year`; by default it will open
to month view.

`<mat-datepicker>` 的 `startView` 属性可用来指定当首次打开日历时，应该使用哪个视图。
它可以是 `month`（月）、`year`（年）或 `multi-year`（多年）之一，默认情况下是月。

The month, year, or range of years that the calendar opens to is determined by first checking if any
date is currently selected, if so it will open to the month or year containing that date. Otherwise
it will open to the month or year containing today's date. This behavior can be overridden by using
the `startAt` property of `<mat-datepicker>`. In this case the calendar will open to the month or
year containing the `startAt` date.

此日历中打开的月份、年份或年份的范围，取决于当前是否选择了某个日期。如果选择了，它就会打开包含该日期的月份或年份。否则，它就打开包含当前日期的月份或年份。
这种行为可以用 `<mat-datepicker>` 的 `startAt` 属性来改写。这种情况下，此日历将打开包含 `startAt` 日期的月份或年份。

<!-- example(datepicker-start-view) -->

#### Watching the views for changes on selected years and months

#### 在选择的年份或月份上监听视图的更改

When a year or a month is selected in `multi-year` and `year` views respectively, the `yearSelected`
and `monthSelected` outputs emit a normalized date representing the chosen year or month. By
"normalized" we mean that the dates representing years will have their month set to January and
their day set to the 1st. Dates representing months will have their day set to the 1st of the
month. For example, if `<mat-datepicker>` is configured to work with javascript native Date
objects, the `yearSelected` will emit `new Date(2017, 0, 1)` if the user selects 2017 in
`multi-year` view. Similarly, `monthSelected` will emit `new Date(2017, 1, 1)` if the user
selects **February** in `year` view and the current date value of the connected `<input>` was
set to something like `new Date(2017, MM, dd)` when the calendar was opened (the month and day are
irrelevant in this case).

如果在 `multi-year` / `year` 视图中选择年 / 月时，输出属性 `yearSelected` / `monthSelected` 将会发出一个表示所选年 / 月的标准化日期。
这里 "标准化" 的意思是：对于年，它会设置为当年的一月一日；对于月，它会设置为当月的第一天。例如：
如果 `<mat-datepicker>` 配置为和 JavaScript 的原生 Date 对象协同工作，则当用户在 `multi-year` 视图中选中 2017 年时，`yearSelected` 将发出 `new Date(2017, 0, 1)`。
同样，如果用户在 `year` 视图中选中了二月，则 `monthSelected` 将会发出 `new Date(2017, 1, 1)`。而当打开日历时相关 `<input>` 的当前日期值会设置为某个类似 `new Date(2017, MM, dd)` 的值（这种情况下月和日是无关的）。

Notice that the emitted value does not affect the current value in the connected `<input>`, which
is only bound to the selection made in the `month` view. So if the end user closes the calendar
after choosing a year in `multi-view` mode (by pressing the `ESC` key, for example), the selected
year, emitted by `yearSelected` output, will not cause any change in the value of the date in the
associated `<input>`.

注意，发出的值不会影响相关 `<input>` 的当前值，当前值只跟你在 `month` 视图中所做选的日期有关。
所以，如果最终用户在 `multi-year` 视图下选择了某一年后关闭了日历（比如通过按下 ESC 键），则由 `yearSelected` 发出的选定年份不会给相关 `<input>` 中的日期值带来任何变化。

The following example uses `yearSelected` and `monthSelected` outputs to emulate a month and year
picker (if you're not familiar with the usage of `MomentDateAdapter` and `MAT_DATE_FORMATS`
you can [read more about them](#choosing-a-date-implementation-and-date-format-settings) below in
this document to fully understand the example).

下面的例子使用输出属性 `yearSelected` 和 `monthSelected` 来模拟月和年的选择器（如果你对 `MomentDateAdapter` 和 `MAT_DATE_FORMATS` 的用法还不熟，可以在稍后部分[阅读它们](#choosing-a-date-implementation-and-date-format-settings)以更好地理解该范例）。

<!-- example(datepicker-views-selection) -->

### Setting the selected date

### 设置选定日期

The type of values that the datepicker expects depends on the type of `DateAdapter` provided in your
application. The `NativeDateAdapter`, for example, works directly with plain JavaScript `Date`
objects. When using the `MomentDateAdapter`, however, the values will all be Moment.js instances.
This use of the adapter pattern allows the datepicker component to work with any arbitrary date
representation with a custom `DateAdapter`.
See [_Choosing a date implementation_](#choosing-a-date-implementation-and-date-format-settings)
for more information.

Datepicker 的值类型取决于你提供的 `DateAdapter` 的类型。
比如，`NativeDateAdapter` 会直接使用普通的 JavaScript `Date` 对象；而使用 `MomentDateAdapter` 时，所有的值都会是 Moment.js 的实例。
这种适配器模式，可以让 Datepicker 组件借助自定义 `DateAdapter` 来处理日期的任何一种表示法。

Depending on the `DateAdapter` being used, the datepicker may automatically deserialize certain date
formats for you as well. For example, both the `NativeDateAdapter` and `MomentDateAdapter` allow
[ISO 8601](https://tools.ietf.org/html/rfc3339) strings to be passed to the datepicker and
automatically converted to the proper object type. This can be convenient when binding data directly
from your backend to the datepicker. However, the datepicker will not accept date strings formatted
in user format such as `"1/2/2017"` as this is ambiguous and will mean different things depending on
the locale of the browser running the code.

根据所使用的 `DateAdapter`，日期选择器还可以自动重新序列化某些日期格式。例如：`NativeDateAdapter` 和 `MomentDateAdapter` 都允许把 [ISO 8601](https://tools.ietf.org/html/rfc3339) 字符串传给日期选择器，
并自动转换成合适的对象类型。
当直接把后端数据类型绑定到日期选择器时，这很方便。不过，日期选择器不接受用户格式的日期字符串（比如 `"1/2/2017"`），
因为它是有二义性的，它会根据执行代码的浏览器的时区设置不同而代表不同的日期。

As with other types of `<input>`, the datepicker works with `@angular/forms` directives such as
`formGroup`, `formControl`, `ngModel`, etc.

像 `<input>` 的其它类型一样，日期选择器也能和 `@angular/forms` 中的指令协同工作，比如 `formGroup`、`formControl`、`ngModel` 等。 

<!-- example(datepicker-value) -->

### Changing the datepicker colors

### 修改日期选择器的颜色

The datepicker popup will automatically inherit the color palette (`primary`, `accent`, or `warn`)
from the `mat-form-field` it is attached to. If you would like to specify a different palette for
the popup you can do so by setting the `color` property on `mat-datepicker`.

当日期选择器弹出时，它会自动继承所附着的 `mat-form-field` 的调色板（`primary`、`accent` 或 `warn`）。
如果你要为弹出框另行指定一个调色板，可以设置 `mat-datepicker` 的 `color` 属性。

<!-- example(datepicker-color) -->

### Date validation

### 日期验证

There are three properties that add date validation to the datepicker input. The first two are the
`min` and `max` properties. In addition to enforcing validation on the input, these properties will
disable all dates on the calendar popup before or after the respective values and prevent the user
from advancing the calendar past the `month` or `year` (depending on current view) containing the
`min` or `max` date.

有三个属性可以为日期选择器添加日期验证。前两个是 `min` 和 `max` 属性。除了对输入执行验证之外，这些属性还会禁用日期弹出框中相应值之前或之后的所有日期，并阻止用户将日历推进到包含 `min` 或 `max` 日期之外的 `month` 或 `year`（取决于当前视图）。

<!-- example(datepicker-min-max) -->

The second way to add date validation is using the `matDatepickerFilter` property of the datepicker
input. This property accepts a function of `<D> => boolean` (where `<D>` is the date type used by
the datepicker, see
[_Choosing a date implementation_](#choosing-a-date-implementation-and-date-format-settings)).
A result of `true` indicates that the date is valid and a result of `false` indicates that it is
not. Again this will also disable the dates on the calendar that are invalid. However, one important
difference between using `matDatepickerFilter` vs using `min` or `max` is that filtering out all
dates before or after a certain point, will not prevent the user from advancing the calendar past
that point.

添加验证器的第二种方式是使用日期选择器输入框的 `matDatepickerFilter` 属性。
该属性接受一个 `<D> => boolean` 型的函数（这里的 `<D>` 是日期选择器所用的日期类型，参见[*选择一个日期实现类*](#choosing-a-date-implementation-and-date-format-settings)）。
如果结果是 `true` 则表示该日期是有效的，如果为 `false` 则表示无效。同样，这也会禁用日历上那些无效的日期。
不过，`matDatepickerFilter` 和 `min` 或 `max` 之间有一个重要的差异 —— 如果过滤掉了特定时间点之前或之后的所有日期，并不会阻止用户把日历推进到无效的日期范围内。

<!-- example(datepicker-filter) -->

In this example the user can back past 2005, but all of the dates before then will be unselectable.
They will not be able to go further back in the calendar than 2000. If they manually type in a date
that is before the min, after the max, or filtered out, the input will have validation errors.

在这个例子中（译注：这个例子有问题），用户可以回到 2005 年之前，但那之前的所有日期都是不可选取的。
但日历不能回到 2000 年之前。如果用户手动输入一个 `min` 之前或 `max` 之后或过滤掉的日期，该输入框就会发生有效性错误。

Each validation property has a different error that can be checked:

每个验证属性可以检查出不同的错误：

 * A value that violates the `min` property will have a `matDatepickerMin` error.
 
   违反 `min` 属性的值将给出 `matDatepickerMin` 错误。
 
 * A value that violates the `max` property will have a `matDatepickerMax` error.
 
   违反 `max` 属性的值将给出 `matDatepickerMax` 错误。
 
 * A value that violates the `matDatepickerFilter` property will have a `matDatepickerFilter` error.
 
   违反 `matDatepickerFilter` 属性的值将给出 `matDatepickerFilter` 错误。

### Input and change events

### 输入（`input`）事件与变更（`change`）事件

The input's native `(input)` and `(change)` events will only trigger due to user interaction with
the input element; they will not fire when the user selects a date from the calendar popup.
Therefore, the datepicker input also has support for `(dateInput)` and `(dateChange)` events. These
trigger when the user interacts with either the input or the popup.

输入框原生的 `(input)` 和 `(change)` 事件只会因为用户和输入框元素的交互而触发；当用户在日历弹出框中选择日期时则不会触发。
因此，日期选择框的输入还支持 `(dateInput)` 和 `(dateChange)` 事件。无论用户输入还是在弹出框中选择都会触发这两个事件。

The `(dateInput)` event will fire whenever the value changes due to the user typing or selecting a
date from the calendar. The `(dateChange)` event will fire whenever the user finishes typing input
(on `<input>` blur), or when the user chooses a date from the calendar.

每当用户正在输入或正在日历中点选日期时都会触发 `(dateInput)` 事件。
而当用户结束了输入（`<input>` 失去焦点）或在日历中选好了日期时，就会触发 `(dateChange)` 事件。

<!-- example(datepicker-events) -->

### Disabling parts of the datepicker

### 部分禁用日期选择框

As with any standard `<input>`, it is possible to disable the datepicker input by adding the
`disabled` property. By default, the `<mat-datepicker>` and `<mat-datepicker-toggle>` will inherit
their disabled state from the `<input>`, but this can be overridden by setting the `disabled`
property on the datepicker or toggle elements. This can be useful if you want to disable text input
but allow selection via the calendar or vice-versa.

像任何标准的 `<input>` 一样，也可以通过添加 `disabled` 属性来禁用日期选择器的输入框。
默认情况下，`<mat-datepicker>` 和 `<mat-datepicker-toggle>` 将会从 `<input>` 中继承禁用状态，不过也可以通过设置日期选择器或开关元素的 `disabled` 属性来覆盖它。
如果你想禁用文本框却允许通过日历进行选取（或反之）时，这会很有用。

<!-- example(datepicker-disabled) -->

### Touch UI mode

### 触屏 UI 模式

The datepicker normally opens as a popup under the input. However this is not ideal for touch
devices that don't have as much screen real estate and need bigger click targets. For this reason
`<mat-datepicker>` has a `touchUi` property that can be set to `true` in order to enable a more
touch friendly UI where the calendar opens in a large dialog.

正常情况下，日期选择器会在输入框下方打开一个弹出框。不过，这对于触屏设备很不理想，它们屏幕较小，并且需要更大的点击目标。
出于这个原因，`<mat-datepicker>` 有一个 `touchUi` 属性，它可以设置为 `true` 以便在大对话框中打开日历时启用更加友好的 UI。

<!-- example(datepicker-touch) -->

### Manually opening and closing the calendar

### 手动打开和关闭日历

The calendar popup can be programmatically controlled using the `open` and `close` methods on the
`<mat-datepicker>`. It also has an `opened` property that reflects the status of the popup.

日历弹出框可以使用 `<mat-datepicker>` 的 `open` 和 `close` 方法进行程序化控制。
它还有一个 `opened` 属性来反应弹出框的状态。

<!-- example(datepicker-api) -->

### Internationalization

### 国际化

Internationalization of the datepicker is configured via four aspects:

日期选择器的国际化配置包括四个方面：

 1. The date locale.
 
    日期区域设置。
 
 2. The date implementation that the datepicker accepts.
 
    日期选择器所能接受的日期对象实现。
 
 3. The display and parse formats used by the datepicker.

    日期选择器所用的显示和解析格式。

 4. The message strings used in the datepicker's UI.
 
    在日期选择器 UI 中使用的各种消息字符串。

#### Setting the locale code

#### 设置区域代码

By default, the `MAT_DATE_LOCALE` injection token will use the existing `LOCALE_ID` locale code
from `@angular/core`. If you want to override it, you can provide a new value for the
`MAT_DATE_LOCALE` token:

默认情况下，依赖注入令牌 `MAT_DATE_LOCALE` 将会使用来自 `@angular/core` 中的 `LOCALE_ID` 表示的区域代码。
如果你要覆盖它，可以为  `MAT_DATE_LOCALE` 令牌提供一个新值：

```ts
@NgModule({
  providers: [
    {provide: MAT_DATE_LOCALE, useValue: 'en-GB'},
  ],
})
export class MyApp {}
```

It's also possible to set the locale at runtime using the `setLocale` method of the `DateAdapter`.

还可以在运行期间使用 `DateAdapter` 的 `setLocale` 方法设置区域代码。

<!-- example(datepicker-locale) -->

#### Choosing a date implementation and date format settings

#### 选择日期的实现和日期格式设置

The datepicker was built to be date implementation agnostic. This means that it can be made to work
with a variety of different date implementations. However it also means that developers need to make
sure to provide the appropriate pieces for the datepicker to work with their chosen implementation.
The easiest way to ensure this is just to import one of the pre-made modules:

日期选择器是和日期的具体实现无关的，也就是说它可以和多种不同的日期协同工作。不过，这也意味着开发者要确保为日期选择器提供恰当的实现来支持所选的日期实现。要做到这一点，最简单的方式是导入一个预先做好的模块：

|模块 | 日期类型 | 所支持的区域 |依赖                      |从哪里导入                       |
|---------------------|---------|-----------------------------------------------------------------------|----------------------------------|----------------------------------|
|`MatNativeDateModule`|`Date`   |en-US                                                                  | 不需要                              |`@angular/material`               |
|`MatMomentDateModule`|`Moment` |[参见此项目](https://github.com/moment/moment/tree/develop/src/locale)|[Moment.js](https://momentjs.com/)|`@angular/material-moment-adapter`|

*Please note: `MatNativeDateModule` is based off of the functionality available in JavaScript's
native `Date` object, and is thus not suitable for many locales. One of the biggest shortcomings of
the native `Date` object is the inability to set the parse format. We highly recommend using the
`MomentDateAdapter` or a custom `DateAdapter` that works with the formatting/parsing library of your
choice.*

*注意：`MatNativeDateModule` 基于 JavaScript 的原生 `Date` 对象提供的功能，因此不适合多语言环境。原生 `Date` 对象最大的缺点是不能设置解析格式。我们强烈建议使用能和你所选的格式化 / 解析库协同使用的 `MomentDateAdapter` 或自定义 `DateAdapter`。*

These modules include providers for `DateAdapter` and `MAT_DATE_FORMATS`

这些模块包括了 `DateAdapter` 和 `MAT_DATE_FORMATS` 的服务提供商

```ts
@NgModule({
  imports: [MatDatepickerModule, MatNativeDateModule],
})
export class MyApp {}
```

Because `DateAdapter` is a generic class, `MatDatepicker` and `MatDatepickerInput` also need to be
made generic. When working with these classes (for example as a `ViewChild`) you should include the
appropriate generic type that corresponds to the `DateAdapter` implementation you are using. For
example:

因为 `DateAdapter` 是一个泛型类，所以 `MatDatepicker` 和 `MatDatepickerInput` 也要做成泛型的。
当使用这些类时（比如作为 `ViewChild`），你要包含与所用的 `DateAdapter` 实现相对应的泛型类。
比如：

```ts
@Component({...})
export class MyComponent {
  @ViewChild(MatDatepicker) datepicker: MatDatepicker<Date>;
}
```

<!-- example(datepicker-moment) -->

By default the `MomentDateAdapter` will creates dates in your time zone specific locale. You can change the default behaviour to parse dates as UTC by providing the `MAT_MOMENT_DATE_ADAPTER_OPTIONS` and setting it to `useUtc: true`.

默认情况下，`MomentDateAdapter` 将在时区设置中指定的时区上创建日期。
你可以通过提供 `MAT_MOMENT_DATE_ADAPTER_OPTIONS` 并把它设置为 `useUtc: true`来把默认行为修改为按照 UTC 格式解析日期。

```ts
@NgModule({
  imports: [MatDatepickerModule, MatMomentDateModule],
  providers: [
    { provide: MAT_MOMENT_DATE_ADAPTER_OPTIONS, useValue: { useUtc: true } }
  ]
})
```

It is also possible to create your own `DateAdapter` that works with any date format your app
requires. This is accomplished by subclassing `DateAdapter` and providing your subclass as the
`DateAdapter` implementation. You will also want to make sure that the `MAT_DATE_FORMATS` provided
in your app are formats that can be understood by your date implementation. See
[_Customizing the parse and display formats_](#customizing-the-parse-and-display-formats)for more
information about `MAT_DATE_FORMATS`. <!-- TODO(mmalerba): Add a guide about this -->

你还可以创建和应用所需的任何日期格式协同工作的自定义 `DateAdapter`。这可以通过创建 `DateAdapter` 的子类并把它作为 `DateAdapter` 的实现来完成。
你还要确保应用中所提供的 `MAT_DATE_FORMATS` 都是你的日期实现所能理解的格式。要了解关于 `MAT_DATE_FORMATS` 的更多信息，参见[*自定义解析和显示格式*](#customizing-the-parse-and-display-formats)。

```ts
@NgModule({
  imports: [MatDatepickerModule],
  providers: [
    {provide: DateAdapter, useClass: MyDateAdapter},
    {provide: MAT_DATE_FORMATS, useValue: MY_DATE_FORMATS},
  ],
})
export class MyApp {}
```

#### Customizing the parse and display formats

#### 自定义解析和显示格式

The `MAT_DATE_FORMATS` object is just a collection of formats that the datepicker uses when parsing
and displaying dates. These formats are passed through to the `DateAdapter` so you will want to make
sure that the format objects you're using are compatible with the `DateAdapter` used in your app.

`MAT_DATE_FORMATS` 对象是一组日期选择器在解析和显示日期时所能使用的格式。这些格式都会传给 `DateAdapter`，所以你要确保这些格式对象能和应用中所用的 `DateAdapter` 兼容。

If you want use one of the `DateAdapters` that ships with Angular Material, but use your own
`MAT_DATE_FORMATS`, you can import the `NativeDateModule` or `MomentDateModule`. These modules are
identical to the "Mat"-prefixed versions (`MatNativeDateModule` and `MatMomentDateModule`) except
they do not include the default formats. For example:

如果你要使用随 Angular Material 发布的 `DateAdapter` 之一和自己的 `MAT_DATE_FORMATS`，你可以导入 `NativeDateModule` 或 `MomentDateModule`。
这些模块都具有 "Mat" 前缀（`MatNativeDateModule` 和 `MatMomentDateModule`），除非它们不包含默认格式。比如：

```ts
@NgModule({
  imports: [MatDatepickerModule, NativeDateModule],
  providers: [
    {provide: MAT_DATE_FORMATS, useValue: MY_NATIVE_DATE_FORMATS},
  ],
})
export class MyApp {}
```

<!-- example(datepicker-formats) -->

#### Customizing the calendar header

#### 自定义日历头

The header section of the calendar (the part containing the view switcher and previous and next
buttons) can be replaced with a custom component if desired. This is accomplished using the
`calendarHeaderComponent` property of `<mat-datepicker>`. It takes a component class and constructs
an instance of the component to use as the header.

你可以用自定义组件代替日历的头部（也就是包含视图切换器、向前和向后按钮的地方）。
这可以通过 `<mat-datepicker>` 的 `calendarHeaderComponent` 属性来实现。
它接受一个组件类，并构建一个该组件的实例，将其用作日历头。

In order to interact with the calendar in your custom header component, you can inject the parent
`MatCalendar` in the constructor. To make sure your header stays in sync with the calendar,
subscribe to the `stateChanges` observable of the calendar and mark your header component for change
detection.

要想在自定义的日历头组件中和日历互动，你可以在它的构造函数中注入父 `MatCalendar`。
要确保你的日历头与日历保持同步，请订阅此日历的 `stateChanges` 事件，并把你的日历头组件标记为已更改的。

<!-- example(datepicker-custom-header) -->

#### Localizing labels and messages

#### 本地化各个标签和消息

The various text strings used by the datepicker are provided through `MatDatepickerIntl`.
Localization of these messages can be done by providing a subclass with translated values in your
application root module.

日期选择器中所用的多种文本字符串都可以由 `MatDatepickerIntl` 提供。
这些消息可以通过在应用的根模块中提供一个带有已翻译内容的子类来进行本地化。

```ts
@NgModule({
  imports: [MatDatepickerModule, MatNativeDateModule],
  providers: [
    {provide: MatDatepickerIntl, useClass: MyIntl},
  ],
})
export class MyApp {}
```

#### Highlighting specific dates
If you want to apply one or more CSS classes to some dates in the calendar (e.g. to highlight a
holiday), you can do so with the `dateClass` input. It accepts a function which will be called
with each of the dates in the calendar and will apply any classes that are returned. The return
value can be anything that is accepted by `ngClass`.

<!-- example(datepicker-date-class) -->

### Accessibility

### 无障碍性

The `MatDatepickerInput` and `MatDatepickerToggle` directives add the `aria-haspopup` attribute to
the native input and toggle button elements respectively, and they trigger a calendar dialog with
`role="dialog"`.

`MatDatepickerInput` 和 `MatDatepickerToggle` 会给原生输入框和开关按钮分别加上 `aria-haspopup` 属性，而它们触发的日历弹出框则会带有 `role="dialog"` 属性。

`MatDatepickerIntl` includes strings that are used for `aria-label`s. The datepicker input
should have a placeholder or be given a meaningful label via `aria-label`, `aria-labelledby` or
`MatDatepickerIntl`.

`MatDatepickerIntl` 包含一些要用作 `aria-label` 的字符串。日期选择器的输入框应该具有一个占位符或通过 
`aria-label`、`aria-labelledby` 或 `MatDatepickerIntl` 提供一个有意义的标签。

#### Keyboard shortcuts

#### 键盘快捷键

The datepicker supports the following keyboard shortcuts:

日期选择器支持下列键盘快捷键：

| Shortcut             | Action                                    |
|----------------------|-------------------------------------------|
| 快捷键             | 操作                                    |
| `ALT` + `DOWN_ARROW` | Open the calendar pop-up |
| `ALT` + `DOWN_ARROW` | 打开日历弹出框 |
| `ESCAPE`             | Close the calendar pop-up |
| `ESCAPE`             | 关闭日历弹出框 |

In month view:

在月份视图中：

| Shortcut             | Action                                    |
|----------------------|-------------------------------------------|
| 快捷键             | 操作                                    |
| `LEFT_ARROW`         | Go to previous day |
| `LEFT_ARROW`         | 转到上一天 |
| `RIGHT_ARROW`        | Go to next day |
| `RIGHT_ARROW`        | 转到下一天 |
| `UP_ARROW`           | Go to same day in the previous week |
| `UP_ARROW`           | 转到上周的同一天 |
| `DOWN_ARROW`         | Go to same day in the next week |
| `DOWN_ARROW`         | 转到下周的同一天 |
| `HOME`               | Go to the first day of the month |
| `HOME`               | 转到本月初 |
| `END`                | Go to the last day of the month |
| `END`                | 转到本月末 |
| `PAGE_UP`            | Go to the same day in the previous month |
| `PAGE_UP`            | 转到上月的同一天 |
| `ALT` + `PAGE_UP`    | Go to the same day in the previous year |
| `ALT` + `PAGE_UP`    | 转到去年的同一天 |
| `PAGE_DOWN`          | Go to the same day in the next month |
| `PAGE_DOWN`          | 转到下月的同一天 |
| `ALT` + `PAGE_DOWN`  | Go to the same day in the next year |
| `ALT` + `PAGE_DOWN`  | 转到明年的同一天 |
| `ENTER`              | Select current date |
| `ENTER`              | 选择当前日期 |

In year view:

在年份视图中：

| Shortcut             | Action                                    |
|----------------------|-------------------------------------------|
| 快捷键             | 操作                                    |
| `LEFT_ARROW`         | Go to previous month |
| `LEFT_ARROW`         | 转到上月 |
| `RIGHT_ARROW`        | Go to next month |
| `RIGHT_ARROW`        | 转到下月 |
| `UP_ARROW`           | Go up a row (back 4 months) |
| `UP_ARROW`           | 转到上一行（回退四个月） |
| `DOWN_ARROW`         | Go down a row (forward 4 months) |
| `DOWN_ARROW`         | 转到下一行（前进四个月） |
| `HOME`               | Go to the first month of the year |
| `HOME`               | 转到今年的第一个月 |
| `END`                | Go to the last month of the year |
| `END`                | 转到今年的最后一月 |
| `PAGE_UP`            | Go to the same month in the previous year |
| `PAGE_UP`            | 转到去年的同一月 |
| `ALT` + `PAGE_UP`    | Go to the same month 10 years back |
| `ALT` + `PAGE_UP`    | 转到十年前的同一月 |
| `PAGE_DOWN`          | Go to the same month in the next year |
| `PAGE_DOWN`          | 转到明年的同一月 |
| `ALT` + `PAGE_DOWN`  | Go to the same month 10 years forward |
| `ALT` + `PAGE_DOWN`  | 转到十年后的同一月 |
| `ENTER`              | Select current month |
| `ENTER`              | 选择当前月份 |

In multi-year view:

在多年视图中：

| Shortcut             | Action                                    |
|----------------------|-------------------------------------------|
| 快捷键             | 操作                                    |
| `LEFT_ARROW`         | Go to previous year |
| `LEFT_ARROW`         | 转到去年 |
| `RIGHT_ARROW`        | Go to next year |
| `RIGHT_ARROW`        | 转到明年 |
| `UP_ARROW`           | Go up a row (back 4 years) |
| `UP_ARROW`           | 转到上一行（后退四年） |
| `DOWN_ARROW`         | Go down a row (forward 4 years) |
| `DOWN_ARROW`         | 转到下一行（前进四年） |
| `HOME`               | Go to the first year in the current range |
| `HOME`               | 转到当前范围内的第一年 |
| `END`                | Go to the last year in the current range |
| `END`                | 转到当前范围内的最后一年 |
| `PAGE_UP`            | Go back 24 years |
| `PAGE_UP`            | 后退 24 年 |
| `ALT` + `PAGE_UP`    | Go back 240 years |
| `ALT` + `PAGE_UP`    | 后退 240 年 |
| `PAGE_DOWN`          | Go forward 24 years |
| `PAGE_DOWN`          | 前进 24 年 |
| `ALT` + `PAGE_DOWN`  | Go forward 240 years |
| `ALT` + `PAGE_DOWN`  | 前进 240 年 |
| `ENTER`              | Select current year |
| `ENTER`              | 选择当前年份 |

### Troubleshooting

### 排查问题

#### Error: MatDatepicker: No provider found for DateAdapter/MAT_DATE_FORMATS

#### Error: MatDatepicker: No provider found for DateAdapter/MAT_DATE_FORMATS <br>（未找到 DateAdapter/MAT_DATE_FORMATS 的提供商）

This error is thrown if you have not provided all of the injectables the datepicker needs to work.
The easiest way to resolve this is to import the `MatNativeDateModule` or `MatMomentDateModule` in
your application's root module. See
[_Choosing a date implementation_](#choosing-a-date-implementation-and-date-format-settings)) for
more information.

如果你没有提供日期选择器所需的全部可注入对象，就会抛出本错误。
最简单的解决方式是在应用的根模块中导入 `MatNativeDateModule` 或 `MatMomentDateModule` 模块。欲知详情，参见[选择日期的一个实现](#choosing-a-date-implementation-and-date-format-settings)。

#### Error: A MatDatepicker can only be associated with a single input

#### Error: A MatDatepicker can only be associated with a single input <br>（一个 MatDatepicker 只能关联一个输入框）

This error is thrown if more than one `<input>` tries to claim ownership over the same
`<mat-datepicker>` (via the `matDatepicker` attribute on the input). A datepicker can only be
associated with a single input.

如果多个 `<input>` 视图（通过 `matDatepicker` 属性）获取同一个 `<mat-datepicker>` 的所有权，就会抛出本错误。
一个日期选择器只能和一个输入框相关联。

#### Error: Attempted to open an MatDatepicker with no associated input.

#### Error: Attempted to open an MatDatepicker with no associated input. <br>（试图打开一个没有关联到输入框的 MatDatepicker）

This error occurs if your `<mat-datepicker>` is not associated with any `<input>`. To associate an
input with your datepicker, create a template reference for the datepicker and assign it to the
`matDatepicker` attribute on the input:

如果没有给 `<mat-datepicker>` 关联任何 `<input>`，就会发生本错误。
要想把一个输入框和日期选择器关联起来，请创建一个到该日期选择器的模板引用，并把它赋值给输入框上的 `matDatepicker` 属性：

```html
<input [matDatepicker]="picker">
<mat-datepicker #picker></mat-datepicker>
```
