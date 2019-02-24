The `scrolling` package provides helpers for directives that react to scroll events.

这个 `scrolling` 包为那些要对滚动事件做出反应的指令提供了辅助设施。

### cdkScrollable and ScrollDispatcher

### cdkScrollable（可滚动的） 和 ScrollDispatcher（滚动派发器）

The `cdkScrollable` directive and the `ScrollDispatcher` service together allow components to
react to scrolling in any of its ancestor scrolling containers.

`cdkScrollable` 指令和 `ScrollDispatcher` 服务一起让组件能对其任意上级滚动容器中的滚动事件做出反应。

The `cdkScrollable` directive should be applied to any element that acts as a scrolling container.
This marks the element as a `Scrollable` and registers it with the `ScrollDispatcher`. The
dispatcher, then, allows components to share both event listeners and knowledge of all of the
scrollable containers in the application.

要把 `cdkScrollable` 指令应用在任何充当滚动容器的元素上。这会把该元素标记为 `Scrollable` 并把它注册到 `ScrollDispatcher` 中。这时派发器允许组件分享这些事件监听器和应用中所有可滚动容器的知识。

### ViewportRuler

The `ViewportRuler` is a service that can be injected and used to measure the bounds of the browser
viewport.

`ViewportRuler`是一种可注入的服务，用于衡量浏览器视口的范围。

### Virtual scrolling

### 虚拟滚动

The `<cdk-virtual-scroll-viewport>` displays large lists of elements performantly by only
rendering the items that fit on-screen. Loading hundreds of elements can be slow in any browser;
virtual scrolling enables a performant way to simulate all items being rendered by making the
height of the container element the same as the height of total number of elements to be rendered,
and then only rendering the items in view. Virtual scrolling is different from strategies like
infinite scroll where it renders a set amount of elements and then when you hit the end renders the
rest.

`<cdk-virtual-scroll-viewport>` 通过仅仅渲染那些屏幕上可见的条目，来高效的显示大型列表。在任何浏览器中加载数百个元素都会很慢，虚拟滚动可以用一种高效的方式模拟渲染全部条目，方法是让容器元素的高度与要渲染的元素的总高度相同，然后才渲染视图中的条目。虚拟滚动不同于无限滚动这样的策略，它会渲染一定数量的元素，然后在你点击两端时渲染剩下的元素。

#### Creating items in the viewport

#### 在视口中创建条目

`*cdkVirtualFor` replaces `*ngFor` inside of a `<cdk-virtual-scroll-viewport>`, supporting the exact
same API as [`*ngFor`](https://angular.io/api/common/NgForOf). The simplest usage just specifies the
list of items (note that the `itemSize` property on the viewport must be set):

`*cdkVirtualFor` 替换了 `<cdk-virtual-scroll-viewport>` 中的 [`*ngFor`](https://angular.io/api/common/NgForOf)，它支持与 [`*ngFor`](https://angular.io/api/common/NgForOf) 完全相同的API。最简单的用法就是指定条目列表（注意，必须在视口中设置 `itemSize` 属性）：

<!-- example(cdk-virtual-scroll-overview) -->

`*cdkVirtualFor` makes the following context variables available to the template:

`*cdkVirtualFor` 让模板中可以使用这些上下文变量：

| Context variable | Description                                        |
| ---------------- | -------------------------------------------------- |
| 上下文变量       | 说明                                               |
| `index`          | The index of the item in the data source.          |
| `index`          | 该条目在数据源中的索引。                               |
| `count`          | The total number of items in the data source.      |
| `count`          | 数据源中的条目总数。                               |
| `first`          | Whether this is the first item in the data source. |
| `first`          | 这是否是数据源中的第一个条目。                         |
| `last`           | Whether this is the last item in the data source.  |
| `last`           | 这是否是数据源中的最后一个条目。                       |
| `even`           | Whether the `index` is even.                       |
| `even`           | 该 `index` 是否为偶数。                                  |
| `odd`            | Whether the `index` is odd.                        |
| `odd`            | 该 `index` 是否为奇数。                              |

All of these apply to the index of the item in the data source, not the index in the rendered
portion of the data.

所有这些都是本条目在数据源中的索引，而不是在要渲染的那部分数据的索引。

<!-- example(cdk-virtual-scroll-context) -->

A `trackBy` function can be specified and works the same as the `*ngFor` `trackBy`. The `index`
passed to the tracking function will be the index in the data source, not the index in the rendered
portion.

像 `*ngFor` 的 `trackBy` 一样，这里也可以指定 `trackBy` 函数，工作方式也都一样。传给这个 `trackBy` 的 `index` 是在数据源中的索引，而不是在要渲染的这部分数据中的索引。

##### View recycling

##### 视图回收

To improve rendering performance, `*cdkVirtualFor` caches previously created views after
they are no longer needed. When a new view would normally be created, a cached view
is reused instead. The size of the view cache can be adjusted via the `templateCacheSize`
property; setting this size to `0` disables caching. If your templates are expensive in terms of
memory you may wish to reduce this number to avoid spending too much memory on the template cache.

为了提高渲染性能， `*cdkVirtualFor` 会缓存那些曾经创建过但不再需要的视图。当要创建一个新视图时，会转而重用一个已缓存的视图。可以通过 `templateCacheSize` 属性来调整视图缓存的大小。把这个大小设置为 `0` 会禁用缓存。如果你的模板在内存方面很昂贵，你可能会希望减小这个数字，以免在模板缓存上花费太多内存。

<!-- example(cdk-virtual-scroll-template-cache) -->

##### Specifying data

##### 指定数据

`*cdkVirtualFor` accepts data from an `Array`, `Observable<Array>`, or `DataSource`. The
`DataSource` for the virtual scroll is the same one used by the table and tree components. A
`DataSource` is simply an abstract class that has two methods: `connect` and `disconnect`. The
`connect` method will be called by the virtual scroll viewport to receive a stream that emits the
data array that should be rendered. The viewport will call `disconnect` when the viewport is
destroyed, which may be the right time to clean up any subscriptions that were registered during the
connect process.

`*cdkVirtualFor` 接受来自 `Array`、`Observable<Array>` 或 `DataSource` 的数据。虚拟滚动的 `DataSource` 与表格和树组件所用的 `DataSource` 是同一个。 `DataSource` 只是一个抽象类，它有两个方法：`connect` 和 `disconnect`。虚拟滚动视口将调用这个 `connect` 方法，以接收一个流，这个流会发出要渲染的数据数组。当 viewport 被销毁时，视口会调用 `disconnect`，这可能是清理连接过程中注册进来的所有订阅的最佳时机。

<!-- example(cdk-virtual-scroll-data-source) -->

#### Scrolling over fixed size items

#### 滚动那些固定大小的条目

When all items are the same fixed size, you can use the `FixedSizeVirtualScrollStrategy`. This can
be easily added to your viewport using the `itemSize` directive. The advantage of this constraint is
that it allows for better performance, since items do not need to be measured as they are rendered. 

当所有条目都是固定大小时，你可以使用 `FixedSizeVirtualScrollStrategy`。可以用 `itemSize` 指令轻松地将它添加到视口中。这种约束的优点是它可以提供更好的性能，因为在渲染条目时不需要进行测量。

The fixed size strategy also supports setting a couple of buffer parameters that determine how much
extra content is rendered beyond what is visible in the viewport. The first of these parameters is
`minBufferPx`. The `minBufferPx` is the minimum amount of content buffer (in pixels) that the
viewport must render. If the viewport ever detects that there is less buffered content it will
immediately render more. The second buffer parameter is `maxBufferPx`. This tells the viewport how 
much buffer space to render back up to when it detects that more buffer is required.

固定大小的策略也支持设置一些缓冲区参数，用来决定渲染多少额外内容，也就是视口可见内容之外的部分。第一个参数是 `minBufferPx`。 `minBufferPx` 是视口必须渲染的最小内容缓冲区数量（以像素为单位）。如果视口检测到要缓冲的内容小于这个数量（未填满），就会立即渲染更多内容。 第二个参数是 `maxBufferPx`。它会告诉视口当检测到需要更多缓冲区的时候要渲染多少个备用缓冲区空间。

The interaction of these two buffer parameters can be best illustrated with an example. Supposed 
that we have the following parameters: `itemSize = 50`, `minBufferPx = 100`, `maxBufferPx = 250`. As
the user is scrolling through the content the viewport detects that there is only `90px` of buffer
remaining. Since this is below `minBufferPx` the viewport must render more buffer. It must render at
least enough buffer to get back to `maxBufferPx`. In this case, it renders 4 items (an additional
`200px`) to bring the total buffer size to `290px`, back above `maxBufferPx`.

这两个缓冲区参数的作用可以用一个例子来说明。假设我们有以下参数：`itemSize = 50`、`minBufferPx = 100`、`maxBufferPx = 250`。当用户滚动浏览内容时，视口就会检测到只剩下 `90px` 的缓冲区。由于它小于 `minBufferPx`，所以视口必须渲染更多缓冲区。它必须渲染足够数量的缓冲区，直到其大于等于 `maxBufferPx`。在这种情况下，它渲染了4个条目（额外的 `200px`），使缓冲区总大小达到`290px`，略高于`maxBufferPx` 。

<!-- example(cdk-virtual-scroll-fixed-buffer) -->

Other virtual scrolling strategies can be implemented by extending `VirtualScrollStrategy`. An
autosize strategy that works on elements of differing sizes is currently being developed in
`@angular/cdk-experimental`, but it is not ready for production use yet. 

其他虚拟滚动策略可以通过扩展 `VirtualScrollStrategy` 来实现。目前正在 `@angular/cdk-experimental` 开发一种适用于不同大小元素的自动调整策略，但还没有准备好用于生产环境。

### Viewport orientation

### 视口方向

The virtual-scroll viewport defaults to a vertical orientation, but can also be set to
`orientation="horizontal"`. When changing the orientation, ensure that the item are laid
out horizontally via CSS. To do this you may want to target CSS at
`.cdk-virtual-scroll-content-wrapper` which is the wrapper element that contains the rendered
content.

虚拟滚动视口默认为垂直方向，也可以设置为 `orientation="horizontal"`。在改变方向时，要确保该条目是用 CSS 进行水平布局的。要做到这一点，你可能希望把 `.cdk-virtual-scroll-content-wrapper` 类作为 CSS 的目标，它是包含待渲染内容的包装元素。

<!-- example(cdk-virtual-scroll-horizontal) -->

### Elements with parent tag requirements

### 那些对父标签有特定要求的元素

Some HTML elements such as `<tr>` and `<li>` have limitations on the kinds of parent elements they
can be placed inside. To enable virtual scrolling over these type of elements, place the elements in
their proper parent, and then wrap the whole thing in a `cdk-virtual-scroll-viewport`. Be careful
that the parent does not introduce additional space (e.g. via `margin` or `padding`) as it will
interfere with the scrolling.

某些HTML元素（如 `<tr>` 和 `<li>`）对它们所在的父元素种类有一些限制。要想对这些类型的元素进行虚拟滚动操作，就要把它们放在合适的父元素中，然后把它们共同包装在 `cdk-virtual-scroll-viewport` 中。请注意，父组件中不要引入额外的空白区（比如通过 `margin` 或 `padding`），因为这样会干扰滚动。

<!-- example(cdk-virtual-scroll-dl) -->

### Scrolling strategies

### 滚动策略

In order to determine how large the overall content is and what portion of it actually needs to be
rendered at any given time the viewport relies on a `VirtualScrollStrategy` being provided. The
simplest way to provide it is to use the `itemSize` directive on the viewport
(e.g. `<cdk-virtual-scroll-viewport itemSize="50">`). However it is also possible to provide a 
custom strategy by creating a class that implements the `VirtualScrollStrategy` interface and
providing it as the `VIRTUAL_SCROLL_STRATEGY` on the component containing your viewport.

为了确定整个内容的大小以及它在任何时刻需要实际渲染的内容，视口依赖于所提供的一个 `VirtualScrollStrategy`。提供它的最简单方式是在视口上使用 `itemSize` 指令（例如 `<cdk-virtual-scroll-viewport itemSize="50">`）。但是，也可以通过创建一个实现 `VirtualScrollStrategy` 接口的类来提供自定义策略，并在包含此视口的组件上把它提供为 `VIRTUAL_SCROLL_STRATEGY`。

<!-- example(cdk-virtual-scroll-custom-strategy) -->
