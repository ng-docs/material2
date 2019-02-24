The `<cdk-tree>` enables developers to build a customized tree experience for structured data. The
`<cdk-tree>` provides a foundation to build other features such as filtering on top of tree.
For a Material Design styled tree, see `<mat-tree>` which builds on top of the `<cdk-tree>`.

`<cdk-tree>` 让开发人员能够为结构化数据构建自定义的树型体验。`<cdk-tree>` 为构建其它特性提供了基础，比如对树进行过滤。对于 Material Design 风格的树，参见基于 `<cdk-tree>` 构建的 `<mat-tree>`。

There are two types of trees: flat tree and nested Tree. The DOM structures are different for
these two types of trees.

树有两种类型：扁平树和嵌套树。这两种树的 DOM 结构是不同的。

#### Flat tree

#### 扁平树

<!-- example(cdk-tree-flat) -->

In a flat tree, the hierarchy is flattened; nodes are not rendered inside of each other, but instead
are rendered as siblings in sequence. An instance of `TreeFlattener` is used to generate the flat
list of items from hierarchical data. The "level" of each tree node is read through the `getLevel`
method of the `TreeControl`; this level can be used to style the node such that it is indented to
the appropriate level.

在扁平树中，其层次结构是扁平的，这些节点并没有渲染在其它节点内部，而是依次渲染兄弟节点。`TreeFlattener` 的实例用于从带层次结构的数据中生成一个扁平的条目列表。每个树节点的“级别”都是通过 `getLevel` 方法读取的。这种级别可用来为节点设置样式，以便让其显示出有合适的缩进级别。

```html
<cdk-tree>
  <cdk-tree-node> parent node </cdk-tree-node>
  <cdk-tree-node> -- child node1 </cdk-tree-node>
  <cdk-tree-node> -- child node2 </cdk-tree-node>
</cdk-tree>
```

Flat trees are generally easier to style and inspect. They are also more friendly to scrolling
variations, such as infinite or virtual scrolling.

扁平的树通常更容易设置样式和进行探查。它们对各种滚动（如无限滚动或虚拟滚动）也更友好。

#### Nested tree

#### 嵌套的树

<!-- example(cdk-tree-nested) -->

In nested tree, children nodes are placed inside their parent node in DOM. The parent node contains
a node outlet into which children are projected.

对于嵌套树，在 DOM 树中的子节点会放在父节点内部。父节点包含一个用于投射（project）子节点内容的节点出口。

```html
<cdk-tree>
  <cdk-nested-tree-node>
    parent node
    <cdk-nested-tree-node> -- child node1 </cdk-nested-tree-node>
    <cdk-nested-tree-node> -- child node2 </cdk-nested-tree-node>
  </cdk-nested-tree-node>
</cdk-tree>
```

Nested trees are easier to work with when hierarchical relationships are visually represented in
ways that would be difficult to accomplish with flat nodes.

当需要以可视的方式来表示层次关系时，用嵌套树会比用扁平树更容易。

### Using the CDK tree

### 使用 CDK 树

#### Writing your tree template

#### 编写你的树模板

The only thing you need to define is the tree node template. There are two types of tree nodes,
`<cdk-tree-node>` for flat tree and `<cdk-tree-nested-node>` for nested tree. The tree node
template defines the look of the tree node, expansion/collapsing control and the structure for
nested children nodes.

唯一需要定义的是树节点模板。有两种类型的树节点，对于扁平树有 `<cdk-tree-node>`，对于嵌套树有 `<cdk-tree-nested-node>`。树节点的模板定义了树节点的外观、展开/折叠控件以及用来嵌套子节点的结构。

A node definition is specified via any element with `cdkNodeDef`. This directive exports the node
data to be used in any bindings in the node template.

任何带 `cdkNodeDef` 的元素都会指定一个节点定义。该指令会导出要在节点模板中的各个绑定所需的节点数据。

```html
<cdk-tree-node *cdkNodeDef="let node">
  {{node.key}}: {{node.value}}
</cdk-tree-node>
```

##### Flat tree node template

##### 扁平树节点模板

Flat tree uses each node's `level` to render the hierarchy of the nodes.
The "indent" for a given node is accomplished by adding spacing to each node based on its level.
Spacing can be added either by applying the `cdkNodePadding` directive or by applying custom styles.

扁平树使用每个节点的 `level` 来渲染节点的层次结构。指定节点的“缩进（indent）”是通过根据每个节点的级别为其增加间距来完成的。可以通过应用 `cdkNodePadding` 指令或自定义样式来添加间距。

##### Nested tree node template

##### 嵌套树节点模板

When using nested tree nodes, the node template must contain a `cdkTreeNodeOutlet`, which marks
where the children of the node will be rendered.

当使用嵌套树节点时，该节点模板中必须包含一个 `cdkTreeNodeOutlet`，用于标记该节点的子节点要渲染到的位置。

```html
<cdk-nested-tree-node *cdkNodeDef="let node">
  {{node.value}}
  <ng-container cdkTreeNodeOutlet></ng-container>
</cdk-nested-tree-node>
```

#### Adding expand/collapse

#### 添加展开/折叠器

A `cdkTreeNodeToggle` can be added in the tree node template to expand/collapse the tree node.
The toggle toggles the expand/collapse functions in TreeControl and is able to expand/collapse
a tree node recursively by setting `[cdkTreeNodeToggleRecursive]` to true.

可以在这个树节点模板中添加 `cdkTreeNodeToggle` 来展开/折叠此节点。这个切换开关切换了 TreeControl 的 `expand`/`collapse` 函数，还可以把 `[cdkTreeNodeToggleRecursive]` 设置为 `true` 来递归展开/折叠某个树节点。

```html
<cdk-tree-node *cdkNodeDef="let node" cdkTreeNodeToggle [cdkTreeNodeToggleRecursive]="true">
    {{node.value}}
</cdk-tree-node>
```

The toggle can be placed anywhere in the tree node, and is only toggled by click action.
For best accessibility, `cdkTreeNodeToggle` should be on a button element and have an appropriate
`aria-label`.

这个切换开关可以放在树节点中的任意位置，而且只能通过点击动作进行切换。为了获得最佳的无障碍性，`cdkTreeNodeToggle` 应该放在一个 button 元素上，并拥有一个合适的`aria-label` 。

```html
<cdk-tree-node *cdkNodeDef="let node">
  <button cdkTreeNodeToggle aria-label="toggle tree node" [cdkTreeNodeToggleRecursive]="true">
    <mat-icon>expand</mat-icon>
  </button>
  {{node.value}}
</cdk-tree-node>
```

#### Padding (Flat tree only)

#### 填充（仅限扁平树）

The cdkTreeNodePadding can be placed in a flat tree's node template to display the level
information of a flat tree node.

`cdkTreeNodePadding` 可以放在扁平树的节点模板中，以显示扁平树节点的级别信息。

```html
<cdk-tree-node *cdkNodeDef="let node" cdkNodePadding>
  {{node.value}}
</cdk-tree-node>
```

Nested tree does not need this padding since padding can be easily added to the hierarchy structure
in DOM.

嵌套树不需要这种填充，因为 `padding` 可以很容易地添加到 DOM 中的层次结构上。

#### Conditional template

#### 条件模板

The tree may include multiple node templates, where a template is chosen
for a particular data node via the `when` predicate of the template.

树可以包括多个节点模板，并通过模板的 `when` 谓词为特定的数据节点选择模板。

```html
<cdk-tree-node *cdkNodeDef="let node" cdkTreeNodePadding>
  {{node.value}}
</cdk-tree-node>
<cdk-tree-node *cdkNodeDef="let node; when: isSpecial" cdkTreeNodePadding>
  [ A special node {{node.value}} ]
</cdk-tree-node>
```

### Data Source

### 数据源

#### Connecting the tree to a data source

#### 把树连接到数据源

Similar to `cdk-table`, data is provided to the tree through a `DataSource`. When the tree receives
a `DataSource` it will call its `connect()` method which returns an observable that emits an array
of data. Whenever the data source emits data to this stream, the tree will render an update.

类似于 `cdk-table`，数据也通过 `DataSource` 提供给树。当树接收到一个 `DataSource` 时，就会调用数据源的 `connect()` 方法，该方法返回一个发出数组型数据的可观察对象。只要数据源向此流中发出数据，该树就会渲染出这些更新。

Because the data source provides this stream, it bears the responsibility of toggling tree
updates. This can be based on anything: tree node expansion change, websocket connections, user
interaction, model updates, time-based intervals, etc.

由于数据源提供了这个流，因此它要负责切换树的更新。这可以来源于任何事：树节点的展开状态变化了、websocket 连接、用户交互、模型更新、基于时间间隔等。

#### Flat tree

#### 扁平树

The flat tree data source is responsible for the node expansion/collapsing events, since when
the expansion status changes, the data nodes feed to the tree are changed. A new list of visible
nodes should be sent to tree component based on current expansion status.

扁平树的数据源要负责节点的展开/折叠事件，因为当其展开状态发生变化时，该树的数据节点也会随之变化。这些可视节点的新列表应该把当前的展开状态发送给树的组件。

#### Nested tree

#### 嵌套树

The data source for nested tree has an option to leave the node expansion/collapsing event for each
tree node component to handle.

嵌套树的数据源有一个选项，可让每个树节点组件处理该节点的展开/折叠事件。

##### `trackBy`

To improve performance, a `trackBy` function can be provided to the tree similar to Angular’s
[`ngFor` `trackBy`](https://angular.io/api/common/NgForOf#change-propagation). This informs the
tree how to uniquely identify nodes to track how the data changes with each update.

为了提高性能，可以为树提供一个类似于 Angular 的 [`ngFor` `trackBy`](https://angular.io/api/common/NgForOf#change-propagation)的[`ngFor` `trackBy`](https://angular.io/api/common/NgForOf#change-propagation) 指令。这会告诉树要如何唯一地标识节点，以跟踪每次更新时数据的变化情况。

```html
<cdk-tree [dataSource]="dataSource" [treeControl]="treeControl" [trackBy]="trackByFn">
```
