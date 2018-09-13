The `matSort` and `mat-sort-header` are used, respectively, to add sorting state and display
to tabular data.

`matSort` 和 `mat-sort-header` 用于为表格型数据添加排序状态并显示出来。

<!-- example(sort-overview) -->

### Adding sort to table headers

### 为表头添加排序功能

To add sorting behavior and styling to a set of table headers, add the `<mat-sort-header>` component
to each header and provide an `id` that will identify it. These headers should be contained within a
parent element with the `matSort` directive, which will emit an `matSortChange` event when the user
 triggers sorting on the header.

要想为表头添加排序行为和样式，请把 `<mat-sort-header>` 组件添加到每个表头中，并提供一个 `id` 来标识它。
这些表头应该包含在一个带有 `matSort` 指令的父元素中，当用户在表头上触发排序时，该指令将会发出一个 `matSortChange` 事件。

Users can trigger the sort header through a mouse click or keyboard action. When this happens, the
`matSort` will emit an `matSortChange` event that contains the ID of the header triggered and the
direction to sort (`asc` or `desc`).

用户可以通过鼠标点击或键盘动作来为表头触发排序。这时，`matSort` 就会发出一个 `matSortChange` 事件，其中包含触发排序的表头和排序的方向（`asc` 或 `desc`）。

#### Changing the sort order

#### 修改排序方向

By default, a sort header starts its sorting at `asc` and then `desc`. Triggering the sort header
after `desc` will remove sorting.

默认情况下，排序表头的排序方向先从 `asc` 开始，再点就变成 `desc`，再点一次则会移除排序。

To reverse the sort order for all headers, set the `matSortStart` to `desc` on the `matSort`
directive. To reverse the order only for a specific header, set the `start` input only on the header
instead.

要想逆转所有表头的排序顺序，请把 `matSort` 指令的 `matSortStart` 属性设置为 `desc`。
如果要对某个特定的表头逆转排序顺序，请设置那个表头自身的输入属性 `start`。

To prevent the user from clearing the sort sort state from an already sorted column, set
`matSortDisableClear` to `true` on the `matSort` to affect all headers, or set `disableClear` to
`true` on a specific header.

要想阻止该用户从已经排序的列上清除排序状态，请把 `matSort` 的 `matSortDisableClear` 属性设置为 `true` 来影响所有表头，如果只想针对特定的表头，请把该表头的 `disableClear` 设置为 `true`。

#### Disabling sorting

#### 禁用排序

If you want to prevent the user from changing the sorting order of any column, you can use the
`matSortDisabled` binding on the `mat-sort`, or the `disabled` on an single `mat-sort-header`.

如果你要阻止用户修改所有列的排序状态，可以绑定 `mat-sort` 的 `matSortDisabled` 属性；如果只想针对单个 `mat-sort-header`，请绑定它的 `disabled` 属性。

#### Using sort with the mat-table

#### 在 mat-table 上使用排序

When used on an `mat-table` header, it is not required to set an `mat-sort-header` id on because
by default it will use the id of the column.

当使用 `mat-table` 中的表头时，不需要为它设置 `mat-sort-header`，因为默认情况下它将会使用列本身的 id。

<!-- example(table-sorting) -->

### Accessibility

### 可访问性

The `aria-label` for the sort button can be set in `MatSortHeaderIntl`.

可以在 `MatSortHeaderIntl` 中为排序按钮设置 `aria-label`。
