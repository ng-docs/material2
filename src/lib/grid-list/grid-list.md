`mat-grid-list` is a two-dimensional list view that arranges cells into grid-based layout.
See Material Design spec [here](https://material.io/design/components/image-lists.html).

`mat-grid-list` 是一个二维列表，用于把一些单元格按基于网格的布局排列。
参见[这里](https://material.io/design/components/image-lists.html)的 Material Design 规范。

<!-- example(grid-list-overview) -->

### Setting the number of columns

### 设置列数

An `mat-grid-list` must specify a `cols` attribute which sets the number of columns in the grid. The
number of rows will be automatically determined based on the number of columns and the number of
items.

`mat-grid-list` 必须指定一个 `cols` 属性，用来设置网格的列数。
行数将会根据列数和条目总数自动确定。

### Setting the row height

### 设置行高

The height of the rows in a grid list can be set via the `rowHeight` attribute. Row height for the
list can be calculated in three ways:

网格列表中的行高可以通过 `rowHeight` 属性来设置。列表的行高会用三种方式计算得出：

1. **Fixed height**: The height can be in `px`, `em`, or `rem`.  If no units are specified, `px`
units are assumed (e.g. `100px`, `5em`, `250`).

   **固定行高**：高度可以为 `px`、`em` 或 `rem`。如果没有指定单位，则默认为 `px`（比如 `100px`、`5em`、`250`）。

2. **Ratio**: This ratio is column-width:row-height, and must be passed in with a colon, not a
decimal (e.g. `4:3`).

   **宽高比**：该比例表示 "列宽:行高"，并须用冒号形式表示（比如 `4:3`），不能用数字。

3. **Fit**:  Setting `rowHeight` to `fit` This mode automatically divides the available height by
the number of rows.  Please note the height of the grid-list or its container must be set.

   **填充**：把 `rowHeight` 设置为 `fit`。该模式将会自动根据行数对有效高度进行分割。请注意，必须设置网格列表的高度或其容器的高度。

If `rowHeight` is not specified, it defaults to a `1:1` ratio of width:height.

如果没有指定 `rowHeight`，则默认为宽高比是 `1:1`。

### Setting the gutter size

### 设置装订尺寸

The gutter size can be set to any `px`, `em`, or `rem` value with the `gutterSize` property.  If no
units are specified, `px` units are assumed. By default the gutter size is `1px`.

装订尺寸可以使用 `gutterSize` 属性来设置为任意 `px`、`em` 或 `rem` 值。
如果没有指定单位，则默认为 `px`。默认的装订尺寸是 `1px`。

### Adding tiles that span multiple rows or columns

### 添加跨多行或多列的瓷砖（指合并后的单元格）

It is possible to set the rowspan and colspan of each `mat-grid-tile` individually, using the
`rowspan` and `colspan` properties. If not set, they both default to `1`. The `colspan` must not
exceed the number of `cols` in the `mat-grid-list`. There is no such restriction on the `rowspan`
however, more rows will simply be added for it the tile to fill.

使用 `rowspan` 和 `colspan` 可以为每个 `mat-grid-tile` 单独设置行合并数或列合并数。如果没设置过，它们默认为 `1`。
`colspan` 不能超过 `mat-grid-list` 中的 `cols` 数。对 `rowspan` 则没有限制，不过，可能会为了满足 `rowspan` 的要求而自动添加一些行。

### Tile headers and footers

### 瓷砖的头部和底部

A header and footer can be added to an `mat-grid-tile` using the `mat-grid-tile-header` and
`mat-grid-tile-footer` elements respectively.

可以用 `mat-grid-tile-header` 和 `mat-grid-tile-footer` 元素来为 `mat-grid-tile` 分别添加头部和尾部。

### Accessibility

### 可访问性

By default, the grid-list assumes that it will be used in a purely decorative fashion and thus sets
no roles, ARIA attributes, or keyboard shortcuts. This is equivalent to having a sequence of `<div>`
elements on the page. Any interactive content within the grid-list should be given an appropriate
accessibility treatment based on the specific workflow of your application.

默认情况下，网格列表纯粹是作为装饰使用的，因此不用设置角色、ARIA 属性或键盘快捷键。这相当于在页面上有一系列 `<div>` 元素。
网格列表中的任何交互式内容都要根据应用程序的工作流进行适当的可访问性处理。

If the grid-list is used to present a list of _non-interactive_ content items, then the grid-list
element should be given `role="list"` and each tile should be given `role="listitem"`.

如果网格列表用来表示一些*非交互式*内容型条目的列表，那么网格列表元素应该带有 `role="list"` 属性，而每个瓷砖应该带有 `role="listitem"` 属性。
