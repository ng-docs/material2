The `overlay` package provides a way to open floating panels on the screen.

`overlay` 包提供了一种在屏幕上打开浮动面板的方法。

### Initial setup

### 初始设置

The CDK overlays depend on a small set of structural styles to work correctly. If you're using
Angular Material, these styles have been included together with the theme, otherwise if you're
using the CDK on its own, you'll have to include the styles yourself. You can do so by importing
the prebuilt styles in your global stylesheet:

CDK 浮层需要依赖一组结构化的样式才能正常工作。如果你正在使用 Angular Material，这些样式就都已经包含在了主题中，否则，如果你是单独使用的 CDK，就必须自己包含这些样式。你可以在全局样式表中导入一些预定义样式：

```scss
@import '~@angular/cdk/overlay-prebuilt.css';
```

### Creating overlays

### 创建浮层

Calling `overlay.create()` will return an `OverlayRef` instance. This instance is a handle for
managing that specific overlay.

调用 `overlay.create()` 将返回一个 `OverlayRef` 实例。该实例用于管理那个特定浮层。

The `OverlayRef` *is* a `PortalOutlet`- once created, content can be added by attaching a `Portal`.
See the documentation on portals for further information.

`OverlayRef` *是*一个 `PortalOutlet`。一旦创建它，就可以为它附加一个 `Portal` 来添加内容。更多信息，请参见关于 portals（）门户的文档。

```ts
const overlayRef = overlay.create();
const userProfilePortal = new ComponentPortal(UserProfile);
overlayRef.attach(userProfilePortal);
```

### Configuring an overlay

### 配置浮层

When creating an overlay, an optional configuration object can be provided.

在创建浮层时，可以提供一个可选的配置对象。

```ts
const overlayRef = overlay.create({
  height: '400px',
  width: '600px',
});
```

The full set of configuration options can be found in the API documentation.

完整的配置选项可以在 API 文档中找到。

#### Position strategies

#### 定位策略

The `positionStrategy` configuration option determines how the overlay will be positioned on-screen.
There are two position strategies available as part of the library: `GlobalPositionStrategy` and
`ConnectedPositionStrategy`.

`positionStrategy` 配置项决定了浮层在屏幕上的定位方式。本库内置了两种定位策略： `GlobalPositionStrategy` 和 `ConnectedPositionStrategy`。

`GlobalPositionStrategy` is used for overlays that require a specific position in the viewport,
unrelated to other elements. This is commonly used for modal dialogs and application-level
notifications.

`GlobalPositionStrategy` 用于需要定位在视口中特定位置的浮层，位置与别的元素无关。这通常用于模态对话框和应用级通知。

`ConnectedPositionStrategy` is used for overlays that are positioned relative to some other "origin"
element on the page. This is commonly used for menus, pickers, and tooltips. When using the
connected strategy, a set of preferred positions is provided; the "best" position will be selected
based on how well the overlay would fit within the viewport.

`ConnectedPositionStrategy` 用于相对于页面中其它 `"origin"`（原点）元素进行定位的浮层。这通常用于菜单、选择器和工具提示。当使用这种连接策略时，会提供一组首选位置，然后根据浮层在视口中的适合程度来选出一个“最佳”位置。

`FlexibleConnectedPositionStrategy` expands upon the functionality from the
`ConnectedPositionStrategy` by adding more advanced features on top of being able to position an
overlay relative to another element on the page. These features include the ability to have an
overlay become scrollable once its content reaches the viewport edge, being able to configure a
margin between the overlay and the viewport edge, having an overlay be pushed into the viewport if
it doesn't fit into any of its preferred positions, as well as configuring whether the overlay's
size can grow while the overlay is open. The flexible position strategy also allows for the
`transform-origin` of an element, inside the overlay, to be set based on the current position using
the `withTransformOriginOn`. This is useful when animating an overlay in and having the animation
originate from the point at which it connects with the origin.

`FlexibleConnectedPositionStrategy` 扩展了 `ConnectedPositionStrategy` 的功能，增加了更高级的功能，它还能相对于页面上的另一个元素定位一个浮层。其特性包括能让浮层在其内容到达视口边缘时变得可滚动；能够在浮层和视口边缘之间配置一个边距；如果浮层不适合任何一个首选位置，还能把它推入到视口中；还可以配置在打开浮层时，其大小是否会增长。这种灵活的定位策略还允许使用 `withTransformOriginOn` 来基于当前位置设置浮层内元素的 `transform-origin`。当浮层中有动画，且动画开始于其原点元素的位置时，这很有用。

A custom position strategy can be created by implementing the `PositionStrategy` interface.
Each `PositionStrategy` defines an `apply` method that is called whenever the overlay's position
should be updated. A custom position strategy can additionally expose any other APIs necessary as
related to the positioning of the overlay element.

可以通过实现 `PositionStrategy` 接口来创建自定义位置策略。每个 `PositionStrategy` 都定义了一个 `apply` 方法，每当应该更新该浮层的位置时，都会调用此方法。自定义位置策略还可以暴露一些与浮层元素定位有关的必要API。

#### Scroll strategies

#### 滚动策略

The `scrollStrategy` configuration option determines how the overlay will react to scrolling outside
the overlay element. There are four scroll strategies available as part of the library.

`scrollStrategy` 配置项决定了浮层如何响应浮层元素外部的滚动。本库内置了四种可用的滚动策略。

`NoopScrollStrategy` is the default option. This strategy does nothing.

`NoopScrollStrategy` 是默认选项。该策略什么都不做。

`CloseScrollStrategy` will automatically close the overlay when scrolling occurs.

`CloseScrollStrategy` 会在滚动时自动关闭浮层。

`BlockScrollStrategy` will block page scrolling while the overlay is open. Note that some
applications may implement special or customized page scrolling; if the `BlockScrollStrategy`
conflicts with this kind of situation, it can be overriden by re-providing `BlockScrollStrategy`
with a custom implementation.

当浮层打开时，`BlockScrollStrategy` 会阻止页面滚动。注意，某些应用可能会实现特殊或自定义的页面滚动；如果`BlockScrollStrategy` 与这种情况冲突，可以通过重新提供带有自定义实现的 `BlockScrollStrategy` 来覆盖它。

`RepositionScrollStrategy` will re-position the overlay element on scroll. Note that this will have
some performance impact on scrolling- users should weigh this cost in the context of each specific
application.

`RepositionScrollStrategy` 会在滚动时重新定位浮层元素。注意，这会对滚动带来一些性能影响 - 用户应该在每个具体应用的上下文中权衡这种代价。

A custom scroll strategy can be created by implementing the `ScrollStrategy` interface. Each
strategy will typically inject `ScrollDispatcher` (from `@angular/cdk/scrolling`) to be notified
of when scrolling takes place. See the documentation for `ScrollDispatcher` for more information
on how scroll events are detected and dispatched.

可以通过实现 `ScrollStrategy` 接口来创建自定义滚动策略。每个策略都会注入 `ScrollDispatcher`（来自 `@angular/cdk/scrolling`），以便在发生滚动时得到通知。关于如何检测和派发滚动事件的更多信息，请参阅 `ScrollDispatcher` 的文档。

### The overlay container

### 浮层容器

The `OverlayContainer` provides a handle to the container element in which all individual overlay
elements are rendered. By default, the overlay container is appended directly to the document body
so that an overlay is never clipped by an `overflow: hidden` parent.

`OverlayContainer` 提供了一个容器元素的引用，浮层中的每个元素都渲染在其中。默认情况下，浮层容器会直接附加到文档的 body 中，这样就不会被带有 `overflow: hidden` 的父元素裁剪掉了。

#### Full-screen overlays

#### 全屏浮层

The `FullscreenOverlayContainer` is an alternative to `OverlayContainer` that supports correct
displaying of overlay elements in
[fullscreen mode](https://developer.mozilla.org/en-US/docs/Web/API/Element/requestFullScreen).

`FullscreenOverlayContainer` 是 `OverlayContainer` 的替代品，它支持在[全屏模式下](https://developer.mozilla.org/en-US/docs/Web/API/Element/requestFullScreen)正确显示浮层元素。

`FullscreenOverlayContainer` can be enabled by providing it in your `NgModule`:

可以在你的 `NgModule` 中提供 `FullscreenOverlayContainer` 来启用它：

```ts
@NgModule({
  providers: [{provide: OverlayContainer, useClass: FullscreenOverlayContainer}],
  // ...
})
export class MyModule { }
```
