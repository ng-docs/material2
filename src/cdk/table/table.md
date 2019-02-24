The `CdkTable` is an unopinionated, customizable data-table with a fully-templated API, dynamic
columns, and an accessible DOM structure. This component acts as the core upon which anyone can
build their own tailored data-table experience.

`CdkTable` 是一个非自用的、可定制的数据表格格，它包含一个完全模板化的 API、动态列和一个可访问的 DOM 结构。这个组件充当了核心，任何人都可以在此基础上构建自己定制的数据表格格。

The table provides a foundation upon which other features, such as sorting and pagination, can be
built. Because it enforces no opinions on these matters, developers have full control over the
interaction patterns associated with the table.

表格提供了一个基础，可以在这个基础上构建其它特性，比如排序和分页。由于它不强制要求这些琐事，因此开发人员可以完全控制与该表格有关的交互模式。

For a Material Design styled table, see the
[documentation for `MatTable`](https://material.angular.io/components/table) which builds on
top of the CDK data-table.

对于 Material Design 样式的表格，参见 [`MatTable`](https://material.angular.io/components/table) 的[文档](https://material.angular.io/components/table)，它建立在CDK数据表格的基础之上。

<!-- example(cdk-table-basic) -->

### Using the CDK data-table

### 使用 CDK 数据表格

#### Writing your table template

#### 写表格模板

The first step to writing the data-table template is to define the columns.
A column definition is specified via an `<ng-container>` with the `cdkColumnDef` directive, giving
the column a name. Each column definition can contain a header-cell template
(`cdkHeaderCellDef`), data-cell template (`cdkCellDef`), and footer-cell 
template (`cdkFooterCellDef`).

编写数据表格模板的第一步是定义列。列的定义是通过带有 `cdkColumnDef` 指令的 `<ng-container>` 来指定的，并赋予该列一个名字。每个列定义都可以包含一个表头单元格模板（`cdkHeaderCellDef`），一个数据单元格模板（`cdkCellDef`）和一个表尾单元格模板（`cdkFooterCellDef`）。

```html
<ng-container cdkColumnDef="username">
  <th cdk-header-cell *cdkHeaderCellDef> User name </th>
  <td cdk-cell *cdkCellDef="let row"> {{row.a}} </td>
  <td cdk-footer-cell *cdkFooterCellDef> User name </td>
</ng-container>
```

The set of columns defined represent the columns that are *available* to be rendered. The specific
columns rendered in a given row, and their order, are specified on the row (see below).

列定义的集合表示可*供*渲染的列。要渲染的特定列及其顺序可以在本行中指定（稍后讲）。

Note that `cdkCellDef` exports the row context such that the row data can be referenced in the cell
template. The directive also exports the same properties as `ngFor` (index, even, odd, first,
last).

注意，`cdkCellDef` 导出了本行的上下文，以便在单元格模板中引用本行的数据。该指令还导出了一些与 `ngFor` 相同的属性（index，even，odd，first，last）。

The next step is to define the table's header-row (`cdkHeaderRowDef`), data-row (`cdkRowDef`),
and footer-row (`cdkFooterRowDef`). Note that each of these are optional to include, depending on
what type of rows you want rendered (e.g. if you do not need a footer row, simply do not add
its definition).

下一步是定义表格的表头行（`cdkHeaderRowDef`）、数据行（`cdkRowDef`）和表尾行（`cdkFooterRowDef`）。注意，它们都是可选的，具体取决于你要渲染的行类型（例如，如果你不需要一个表尾行，那就不要添加它的定义）。

```html
<tr cdk-header-row *cdkHeaderRowDef="['username', 'age', 'title']"></tr>
<tr cdk-row *cdkRowDef="let row; columns: ['username', 'age', 'title']"></tr>
<tr cdk-footer-row *cdkFooterRowDef="['username', 'age', 'title']"></tr>
```

These row templates accept the specific columns to be rendered via the name given to the
`cdkColumnDef`.

这些行模板通过赋值给 `cdkColumnDef` 的名字来接受要渲染的指定列。

The `cdkRowDef` also exports row context, which can be used for event and property
bindings on the row element. Any content placed *inside* of the header row or data row template
will be ignored, as the rendered content of the row comes from the cell templates described
above.

`cdkRowDef` 也会导出行的上下文，它可以用在这个行元素的事件和属性绑定上。任何放在标题行或数据行模板中的内容都会被忽略，因为该行渲染的内容来自上面描述的单元格模板。

##### Example: table with three columns

##### 示例：带三列的表格

```html
<table cdk-table [dataSource]="dataSource">
  <!-- User name Definition -->
  <ng-container cdkColumnDef="username">
    <th cdk-header-cell *cdkHeaderCellDef> User name </th>
    <td cdk-cell *cdkCellDef="let row"> {{row.username}} </td>
  </ng-container>

  <!-- Age Definition -->
  <ng-container cdkColumnDef="age">
    <th cdk-header-cell *cdkHeaderCellDef> Age </th>
    <td cdk-cell *cdkCellDef="let row"> {{row.age}} </td>
  </ng-container>

  <!-- Title Definition -->
  <ng-container cdkColumnDef="title">
    <th cdk-header-cell *cdkHeaderCellDef> Title </th>
    <td cdk-cell *cdkCellDef="let row"> {{row.title}} </td>
  </ng-container>

  <!-- Header and Row Declarations -->
  <tr cdk-header-row *cdkHeaderRowDef="['username', 'age', 'title']"></tr>
  <tr cdk-row *cdkRowDef="let row; columns: ['username', 'age', 'title']"></tr>
</table>
```

The columns given on the row determine which cells are rendered and in which order. Thus, the
columns can be set via binding to support dynamically changing the columns shown at run-time.

本行给出的这些列决定要渲染哪些单元格以及按什么顺序。因此，可以通过绑定来设置列，以支持动态更改运行时要显示的列。

```html
<tr cdk-row *cdkRowDef="let row; columns: myDisplayedColumns"></tr>
```

It is not required to display all the columns that are defined within the template,
nor use the same ordering. For example, to display the table with only `age`
and `username` and in that order, then the row and header definitions would be written as:

不需要包括显示模板中定义的所有列，也不需要使用与定义时相同的顺序。例如，要显示一个只包含 `age` 和 `username` 的表格，那么行和头的定义就写成：

```html
<tr cdk-row *cdkRowDef="let row; columns: ['age', 'username']"></tr>
```

Event and property bindings can be added directly to the row element.

事件和属性绑定可以直接添加到 row 元素上。

##### Example: table with event and class binding

##### 示例：包含事件和类绑定的表格

```html
<tr cdk-header-row *cdkHeaderRowDef="['age', 'username']"
    (click)="handleHeaderRowClick(row)">
</tr>

<tr cdk-row *cdkRowDef="let row; columns: ['age', 'username']"
    [class.can-vote]="row.age >= 18"
    (click)="handleRowClick(row)">
</tr>
```

##### Styling columns

##### 为列定义样式

Each header and row cell will be provided a CSS class that includes its column. For example,
cells that are displayed in the column `name` will be given the class `cdk-column-name`. This allows
columns to be given styles that will match across the header and rows.

每个表头和数据行中的单元格都会被提供一个包含其列的 CSS 类。例如，`name` 列中显示的单元格将被赋予 `cdk-column-name` 类。这样就可以让列的样式在表头和数据行之间保持一致。

Since columns can be given any string for its name, its possible that it cannot be directly applied
to the CSS class (e.g. `*nameColumn!`). In these cases, the special characters will be replaced by 
the `-` character. For example, cells container in a column named `*nameColumn!` will be given
the class `cdk-column--nameColumn-`.    

由于列的名字可以是任意字符串，所以它可能无法直接用在 CSS 类中（例如 `*nameColumn!` ）。此时，这些特殊字符将替换成 `-` 字符。例如， `*nameColumn!` 列中的单元格容器将会带有 `cdk-column--nameColumn-` 类。

#### Connecting the table to a data source

#### 把表格连接到数据源

Data is provided to the table through a `DataSource`. When the table receives a data source,
it calls the DataSource's `connect()` method which returns an observable that emits an array of data.
Whenever the data source emits data to this stream, the table will render an update.

数据会通过 `DataSource` 提供给表格。当表格接收数据源时，它会调用 DataSource 的 `connect()` 方法，该方法返回一个发出数组型数据的可观察对象。每当数据源向此流中发出数据时，该表格都会重新渲染一次。

Because the *data source* provides this stream, it bears the responsibility of triggering table
updates. This can be based on *anything*: websocket connections, user interaction, model updates,
time-based intervals, etc. Most commonly, updates will be triggered by user interactions like
sorting and pagination.

由于*数据源*提供了这个流，因此它要负责触发表格更新。这可能由*任何事情*触发：websocket 连接、用户交互、模型更新、基于时间间隔等。最常见的是，这些更新将由用户交互（如排序和分页）触发。

##### `trackBy`

To improve performance, a `trackBy` function can be provided to the table similar to Angular’s
[`ngFor` `trackBy`](https://angular.io/api/common/NgForOf#change-propagation). This informs the
table how to uniquely identify rows to track how the data changes with each update.

要想提高性能，可以在表格中提供一个类似于 Angular 的 [`ngFor` `trackBy`](https://angular.io/api/common/NgForOf#change-propagation) 指令。这会告诉表格要如何唯一地标识这些行，用以跟踪每次更新后数据的变化情况。

```html
<table cdk-table [dataSource]="dataSource" [trackBy]="myTrackById">
```

### Alternate HTML to using native table

### 改用原生表格元素的替代 HTML

The CDK table does not require that you use a native HTML table. If you want to have full control
over the style of the table, it may be easier to follow an alternative template approach that does
not use the native table element tags.

CDK 表格并不要求你使用原生 HTML 表格。如果你想完全控制表格的样式，遵循不使用原生表格元素标签的替代模板方法可能会更容易些。

This alternative approach replaces the native table element tags with the CDK table directive
selectors. For example, `<table cdk-table>` becomes `<cdk-table>`; `<tr cdk-row`> becomes 
`<cdk-row>`. The following shows a previous example using this alternative template:

这种替代方法用 CDK 的表格指令选择器替换了原生的表格元素标签。比如，`<table cdk-table>` 变为 `<cdk-table>`、`<tr cdk-row` > 变为 `<cdk-row>`。下面的例子展示了改用这个替代模板实现前一个例子：

```html
<cdk-table [dataSource]="dataSource">
  <!-- User name Definition -->
  <ng-container cdkColumnDef="username">
    <cdk-header-cell *cdkHeaderCellDef> User name </cdk-header-cell>
    <cdk-cell *cdkCellDef="let row"> {{row.username}} </cdk-cell>
  </ng-container>

  <!-- Age Definition -->
  <ng-container cdkColumnDef="age">
    <cdk-header-cell *cdkHeaderCellDef> Age </cdk-header-cell>
    <cdk-cell *cdkCellDef="let row"> {{row.age}} </cdk-cell>
  </ng-container>

  <!-- Title Definition -->
  <ng-container cdkColumnDef="title">
    <cdk-header-cell *cdkHeaderCellDef> Title </cdk-header-cell>
    <cdk-cell *cdkCellDef="let row"> {{row.title}} </cdk-cell>
  </ng-container>

  <!-- Header and Row Declarations -->
  <cdk-header-row *cdkHeaderRowDef="['username', 'age', 'title']"></cdk-header-row>
  <cdk-row *cdkRowDef="let row; columns: ['username', 'age', 'title']"></cdk-row>
</cdk-table>
```

For an example of how to render the structure as a table, see the
[documentation for `<mat-table>`](https://material.angular.io/components/table) which includes
the style support for this approach.

有关如何将此结构渲染为表格的示例，请参阅 [`<mat-table>`](https://material.angular.io/components/table) 的[文档](https://material.angular.io/components/table)，其中包括此方法所需的样式支持。

