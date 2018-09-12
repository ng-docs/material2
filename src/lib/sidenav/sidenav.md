Angular Material provides two sets of components designed to add collapsible side content (often
navigation, though it can be any content) alongside some primary content. These are the sidenav and
drawer components.

Angular Material 提供了两组组件，用以给主要内容添加一些可折叠的附属内容（通常是导航，但也可以是任何内容）。它们就是侧边栏（sidenav）和抽屉（drawer）组件。

The sidenav components are designed to add side content to a fullscreen app. To set up a sidenav we
use three components: `<mat-sidenav-container>` which acts as a structural container for our content
and sidenav, `<mat-sidenav-content>` which represents the main content, and `<mat-sidenav>` which
represents the added side content.

侧边栏组件旨在为全屏应用添加附属内容。要建立侧边栏，我们需要用到三个组件：`<mat-sidenav-container>` 用来为主要内容和侧边栏提供一个结构容器；`<mat-sidenav-content>` 用来表示主要内容，而 `<mat-sidenav>` 用于表示附属内容。

<!-- example(sidenav-overview) -->

The drawer component is designed to add side content to a small section of your app. This is
accomplished using the `<mat-drawer-container>`, `<mat-drawer-content>`, and `<mat-drawer>`
components, which are analogous to their sidenav equivalents. Rather than adding side content to the
app as a whole, these are designed to add side content to a small section of your app. They support
almost all of the same features, but do not support fixed positioning.

抽屉组件旨在给应用中的一小部分添加附属内容。这可以使用 `<mat-drawer-container>`、`<mat-drawer-content>` 和 `<mat-drawer>` 来实现，它们分别是各个侧边栏组件的等价物。侧边栏会把应用的附属内容作为整体添加进来，而抽屉只在为应用中的一小部分添加附属内容。
它们所支持的大部分特性都一样，但抽屉不支持固定定位方式。

<!-- example(sidenav-drawer-overview) -->

### Specifying the main and side content

### 指定主内容和附属内容

Both the main and side content should be placed inside of the `<mat-sidenav-container>`, content
that you don't want to be affected by the sidenav, such as a header or footer, can be placed outside
of the container.

无论主内容还是附属内容，都应该放在 `<mat-sidenav-container>` 的内部，而那些你不希望被侧边栏影响到的内容（比如头或脚），可以放在该容器的外部。

The side content should be wrapped in a `<mat-sidenav>` element. The `position` property can be used
to specify which end of the main content to place the side content on. `position` can be either
`start` or `end` which places the side content on the left or right respectively in left-to-right
languages. If the `position` is not set, the default value of `start` will be assumed. A
`<mat-sidenav-container>` can have up to two `<mat-sidenav>` elements total, but only one for any
given side. The `<mat-sidenav>` must be placed as an immediate child of the `<mat-sidenav-container>`.

附属内容应该包装在 `<mat-sidenav>` 元素中。它的 `position` 属性可以指定主内容该放在附属内容的哪一端，它可以是 `start` 或 `end`，在从左到右书写的语言中下，分别表示把主内容放在附属内容的左侧或右侧。
如果没有指定 `position`，则其默认值是 `start`。
`<mat-sidenav-container>` 最多可以拥有两个 `<mat-sidenav>` 元素，但每一侧只能有一个。
`<mat-sidenav>` 必须作为 `<mat-sidenav-container>` 的直属子节点出现。

The main content should be wrapped in a `<mat-sidenav-content>`. If no `<mat-sidenav-content>` is
specified for a `<mat-sidenav-container>`, one will be created implicitly and all of the content
inside the `<mat-sidenav-container>` other than the `<mat-sidenav>` elements will be placed inside
of it.

主要内容应该包裹在 `<mat-sidenav-content>` 中，如果没有为 `<mat-sidenav-container>` 指定 `<mat-sidenav-content>`，则会隐式创建一个，并把 `<mat-sidenav-container>` 中除了 `<mat-sidenav>` 元素之外的内容都放进去。

<!-- example(sidenav-position) -->

The following are examples of valid sidenav layouts:

下面是正确使用侧边栏布局的例子：

```html
<!-- Creates a layout with a left-positioned sidenav and explicit content. -->
<mat-sidenav-container>
  <mat-sidenav>Start</mat-sidenav>
  <mat-sidenav-content>Main</mat-sidenav-content>
</mat-sidenav-container>
```

```html
<!-- Creates a layout with a left and right sidenav and implicit content. -->
<mat-sidenav-container>
  <mat-sidenav>Start</mat-sidenav>
  <mat-sidenav position="end">End</mat-sidenav>
  <section>Main</section>
</mat-sidenav-container>
```

```html
<!-- Creates an empty sidenav container with no sidenavs and implicit empty content. -->
<mat-sidenav-container></mat-sidenav-container>
```

And these are examples of invalid sidenav layouts:

下面是错误使用侧边栏布局的例子：

```html
<!-- Invalid because there are two `start` position sidenavs. -->
<mat-sidenav-container>
  <mat-sidenav>Start</mat-sidenav>
  <mat-sidenav position="start">Start 2</mat-sidenav>
</mat-sidenav-container>
```

```html
<!-- Invalid because there are multiple `<mat-sidenav-content>` elements. -->
<mat-sidenav-container>
  <mat-sidenav-content>Main</mat-sidenav-content>
  <mat-sidenav-content>Main 2</mat-sidenav-content>
</mat-sidenav-container>
```

```html
<!-- Invalid because the `<mat-sidenav>` is outside of the `<mat-sidenav-container>`. -->
<mat-sidenav-container></mat-sidenav-container>
<mat-sidenav></mat-sidenav>
```

These same rules all apply to the drawer components as well.

这些规则也同样适用于抽屉组件。

### Opening and closing a sidenav

### 打开和关闭侧边栏

A `<mat-sidenav>` can be opened or closed using the `open()`, `close()` and `toggle()` methods. Each
of these methods returns a `Promise<boolean>` that will be resolved with `true` when the sidenav
finishes opening or `false` when it finishes closing.

`<mat-sidenav>` 可以使用 `open()`、`close()` 和 `toggle()` 方法来打开或关闭。
它们都会返回一个 `Promise<boolean>`，当侧边栏打开之后它会解析为 `true`，关闭之后解析为 `false`。

The opened state can also be set via a property binding in the template using the `opened` property.
The property supports 2-way binding.

这些打开状态也可以在模板中使用 `opened` 属性进行设置。该属性支持双向绑定。

`<mat-sidenav>` also supports output properties for just open and just close events, The `(opened)`
and `(closed)` properties respectively.

`<mat-sidenav>` 也支持一些输出属性：`(opened)` 表示刚刚打开，`(closed)` 表示刚刚关闭。

<!-- example(sidenav-open-close) -->

All of these properties and methods work on `<mat-drawer>` as well.

所有这些属性和方法也同样可用在 `<mat-drawer>` 上。

### Changing the sidenav's behavior

### 修改侧边栏的行为

The `<mat-sidenav>` can render in one of three different ways based on the `mode` property.

`<mat-sidenav>` 可以根据其 `mode` 属性的值以三种方式之一进行渲染。

| 模式   | 说明                                                                             |
|--------|-----------------------------------------------------------------------------------------|
| `over` | <p translation-result>侧边栏浮在主内容上方，并用一个背景遮住主内容</p><p translation-origin="off">Sidenav floats over the primary content, which is covered by a backdrop</p>
| `push` | <p translation-result>侧边栏把主内容挤出去，并用一个背景遮住主内容</p><p translation-origin="off">Sidenav pushes the primary content out of its way, also covering it with a backdrop</p>
| `side` | <p translation-result>侧边栏和主内容并排显示，并收缩主内容的宽度，给侧边栏腾出空间</p><p translation-origin="off">Sidenav appears side-by-side with the main content, shrinking the main content's width to make space for the sidenav.</p>

If no `mode` is specified, `over` is used by default.

如果没有指定 `mode`，则默认为 `over`。

<!-- example(sidenav-mode) -->

The `over` and `push` sidenav modes show a backdrop by default, while the `side` mode does not. This
can be customized by setting the `hasBackdrop` property on `mat-sidenav-container`. Explicitly
setting `hasBackdrop` to `true` or `false` will override the default backdrop visibility setting for
all sidenavs regadless of mode. Leaving the property unset or setting it to `null` will use the
default backdrop visibility for each mode.

侧边栏的 `over` 和 `push` 模式默认会显示一个背景，但 `side` 模式不会。这可以通过 `mat-sidenav-container` 上的
`hasBackdrop` 属性进行设置。显式把 `hasBackdrop` 设置为 `true` 或 `false` 将会为侧边栏改写默认的背景可见性，而不管处在什么模式下。不设置该属性或把它设置为 `null` 将会使用每种模式下默认的背景可见性。

<!-- example(sidenav-backdrop) -->

`<mat-drawer>` also supports all of these same modes and options.

`<mat-drawer>` 也同样支持这些模式和选项。

### Disabling automatic close

### 禁用自动关闭功能

Clicking on the backdrop or pressing the <kbd>Esc</kbd> key will normally close an open sidenav.
However, this automatic closing behavior can be disabled by setting the `disableClose` property on
the `<mat-sidenav>` or `<mat-drawer>` that you want to disable the behavior for.

点击背景或按下 <kbd>Esc</kbd> 键通常会关闭侧边栏。
不过，可以通过设置 `<mat-sidenav>` 或 `<mat-drawer>` 上的 `disableClose` 属性来禁用这种自动关闭的行为。

Custom handling for <kbd>Esc</kbd> can be done by adding a keydown listener to the `<mat-sidenav>`.
Custom handling for backdrop clicks can be done via the `(backdropClick)` output property on
`<mat-sidenav-container>`.

可以通过给 `<mat-sidenav>` 添加 `keydown` 监听器来定制 <kbd>Esc</kbd> 处理器。
可以通过 `<mat-sidenav-container>` 的输出属性 `(backdropClick)` 来定制点击背景的处理器。

<!-- example(sidenav-disable-close) -->

### Resizing an open sidenav

### 调整打开侧边栏的大小

By default, Material will only measure and resize the drawer container in a few key moments
(on open, on window resize, on mode change) in order to avoid layout thrashing, however there
are cases where this can be problematic. If your app requires for a drawer to change its width
while it is open, you can use the `autosize` option to tell Material to continue measuring it.
Note that you should use this option **at your own risk**, because it could cause performance
issues.

默认情况下，Material 只会在一些关键时刻（打开、窗口调整大小、模式改变）测量和调整容器的大小，以避免布局颠簸。
但是在某些情况下这可能会有问题。如果你希望在打开抽屉时更改其宽度，可以使用 `autosize` 选项来告诉 Material 继续测量它。
注意，使用该选项时应该**风险自担**，因为它可能会导致性能问题。

<!-- example(sidenav-autosize) -->

### Setting the sidenav's size

### 设置侧边栏大小

The `<mat-sidenav>` and `<mat-drawer>` will, by default, fit the size of its content. The width can
be explicitly set via CSS:

默认情况下，`<mat-sidenav>` 和 `<mat-drawer>` 应该自适应其内容的尺寸。不过也可以通过 CSS 来显式指定宽度：

```css
mat-sidenav {
  width: 200px;
}
```

Try to avoid percent based width as `resize` events are not (yet) supported.

避免使用基于百分比的宽度，因为 `resize` 事件尚未支持它。

### Fixed position sidenavs

### 固定定位的侧边栏

For `<mat-sidenav>` only (not `<mat-drawer>`) fixed positioning is supported. It can be enabled by
setting the `fixedInViewport` property. Additionally, top and bottom space can be set via the
`fixedTopGap` and `fixedBottomGap`. These properties accept a pixel value amount of space to add at
the top or bottom.

`<mat-sidenav>` 只支持固定定位方式（`<mat-drawer>` 不限）。它可以通过设置 `fixedInViewport` 属性进行启用。
另外，还可以通过 `fixedTopGap` 和 `fixedBottomGap` 来设置顶部和底部的空白。这些属性可以接受一个像素值来指定要加到顶部或底部的空白尺寸。

<!-- example(sidenav-fixed) -->

### Creating a responsive layout for mobile & desktop

### 为移动端和桌面创建响应式布局

A sidenav often needs to behave differently on a mobile vs a desktop display. On a desktop, it may
make sense to have just the content section scroll. However, on mobile you often want the body to be
the element that scrolls; this allows the address bar to auto-hide. The sidenav can be styled with
CSS to adjust to either type of device.

侧边栏通常要在移动端和桌面端提供不同的行为。在桌面端，只允许内容区滚动是合理的；在移动端，你通常会希望滚动整个 `body`，这样就能让浏览器自动隐藏地址栏。侧边栏可以使用 CSS 来设置样式，以针对不同类型的设备进行调整。

<!-- example(sidenav-responsive) -->

### Reacting to scroll events inside the sidenav container

### 响应侧边栏内部的滚动事件

To react to scrolling inside the `<mat-sidenav-container>`, you can get a hold of the underlying
`CdkScrollable` instance through the `MatSidenavContainer`.

要响应 `<mat-sidenav-container>` 内部的滚动事件，你可以通过 `MatSidenavContainer` 来获取一个底层的 `CdkScrollable` 实例。

```ts
class YourComponent {
  @ViewChild(MatSidenavContainer) sidenavContainer: MatSidenavContainer;

  constructor() {
    this.sidenavContainer.scrollable.elementScrolled().subscribe(() => /* react to scrolling */);
  }
}
```

### Accessibility

### 可访问性

The `<mat-sidenav>` an `<mat-sidenav-content>` should each be given an appropriate `role` attribute
depending on the context in which they are used.

`<mat-sidenav>` 和 `<mat-sidenav-content>` 都应该根据它们的上下文给出一个合适的 `role` 属性。

For example, a `<mat-sidenav>` that contains links
to other pages might be marked `role="navigation"`, whereas one that contains a table of
contents about might be marked as `role="directory"`. If there is no more specific role that
describes your sidenav, `role="region"` is recommended.

比如，包含到其它页面的链接的 `<mat-sidenav>` 可以标记为 `role="navigation"`，而包含目录的则应该标记为 `role="directory"`。
如果没有什么特别的角色来描述这个侧边栏，建议使用 `role="region"`。

Similarly, the `<mat-sidenav-content>` should be given a role based on what it contains. If it
represents the primary content of the page, it may make sense to mark it `role="main"`. If no more
specific role makes sense, `role="region"` is again a good fallback.

同样，`<mat-sidenav-content>` 也应该基于其包含的内容来指定角色。如果它表示页面的主要内容，就应该标记为 `role="main"`。
如果没办法指定合理的角色，同样可以用 `role="region"` 作为回退值。

### Troubleshooting

### 排查问题

#### Error: A drawer was already declared for 'position="..."'

#### Error: A drawer was already declared for 'position="..."'（指定的 'position="..."' 处已经声明了一个抽屉）

This error is thrown if you have more than one sidenav or drawer in a given container with the same
`position`. The `position` property defaults to `start`, so the issue may just be that you forgot to
mark the `end` sidenav with `position="end"`.

如果在指定容器的同一个 `position` 有多个侧边栏或抽屉，就会抛出本错误。
由于 `position` 属性默认为 `start`，所以出现该问题可能只是因为你忘了给 `end` 侧边栏标记上 `position="end"`。 
