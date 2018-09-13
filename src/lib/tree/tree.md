The `mat-tree` provides a Material Design styled tree that can be used to display hierarchy
data.

`mat-tree` 提供了一个 Material Design 风格的树，它可用于显示层次型数据。

This tree builds on the foundation of the CDK tree and uses a similar interface for its
data source input and template, except that its element and attribute selectors will be prefixed
with `mat-` instead of `cdk-`.

树控件基于 CDK 的树控件构建，并使用相似的接口来表示其数据源和模板。只是它们的元素和属性选择器会用 `mat-` 前缀，而不是 `cdk-` 前缀。

There are two types of trees: Flat tree and nested tree. The DOM structures are different for these
two types of trees.

有两种类型的树：扁平树和嵌套树。这两种树的 DOM 结构是不同的。

#### Flat tree

#### 扁平树

In a flat tree, the hierarchy is flattened; nodes are not rendered inside of each other, but instead are rendered as siblings in sequence. An instance of `TreeFlattener` is used to generate the flat list of items from hierarchical data. The "level" of each tree node is read through the `getLevel` method of the `TreeControl`; this level can be used to style the node such that it is indented to the appropriate level.

在扁平树中，其层次是扁平的，它的节点不会渲染在其它节点内部，而是渲染成兄弟节点。
`TreeFlattener` 的实例用来根据层次型数据生成扁平的条目列表。
每个节点的级别都是从其 `TreeControl` 中的 `getLevel` 方法中读取的；这个级别可用来设置节点样式，使其缩进到适当的级别。

```html
<mat-tree>
  <mat-tree-node> parent node </mat-tree-node>
  <mat-tree-node> -- child node1 </mat-tree-node>
  <mat-tree-node> -- child node2 </mat-tree-node>
</mat-tree>
```

<!-- example(tree-flat-overview) -->

Flat trees are generally easier to style and inspect. They are also more friendly to
scrolling variations, such as infinite or virtual scrolling

扁平树通常更容易设置样式和审查元素。它们对各种滚动更加友好 —— 比如无尽滚动或虚拟滚动。

<!--TODO(tinayuangao): Add a flat tree example here -->

#### Nested tree

#### 嵌套树

In Nested tree, children nodes are placed inside their parent node in DOM. The parent node has an
outlet to keep all the children nodes.

在嵌套树中，子节点会放在其父节点 DOM 元素的内部。父节点有一个出口（outlet），用来存放其所有子节点。

```html
<mat-tree>
   <mat-nested-tree-node>
     parent node
     <mat-nested-tree-node> -- child node1 </mat-nested-tree-node>
     <mat-nested-tree-node> -- child node2 </mat-nested-tree-node>
   </mat-nested-tree-node>
</mat-tree>
```

<!-- example(tree-nested-overview) -->

Nested trees are easier to work with when hierarchical relationships are visually
represented in ways that would be difficult to accomplish with flat nodes.

当以扁平节点的形式难以可视化地表示层次关系时，使用嵌套树会更容易。

<!--TODO(tinayuangao): Add a nested tree example here -->

### Features

### 特性

The `<mat-tree>` itself only deals with the rendering of a tree structure.
Additional features can be built on top of the tree by adding behavior inside node templates
(e.g., padding and toggle). Interactions that affect the
rendered data (such as expand/collapse) should be propagated through the table's data source.

`<mat-tree>` 本身只关心树形结构的渲染工作。通过在节点模板内添加行为（比如填充 `padding` 和切换 `toggle`），可以在标准树的基础上构建附加功能。
那些能影响渲染数据的交互（比如展开/折叠）应该能通过表格的数据源进行传播。

### TreeControl

### 树控件 TreeControl

The `TreeControl` controls the expand/collapse state of tree nodes. Users can expand/collapse a tree
node recursively through tree control. For nested tree node, `getChildren` function need to pass to
the `NestedTreeControl` to make it work recursively. The `getChildren` function may return an 
observable of children for a given node, or an array of children. 
For flattened tree node, `getLevel` and `isExpandable` functions need to pass to the 
`FlatTreeControl` to make it work recursively.

`TreeControl` 控制树节点的展开/折叠状态。用户可以通过数控件来递归的展开/折叠树节点。
对于嵌套树的节点，要把一个 `getChildren` 函数传给 `NestedTreeControl`，来让它能递归使用。
`getChildren` 函数可以返回一个指定节点上子节点的 `Observable`或其子节点的数组。
对于扁平树的节点，要把 `getLevel` 和 `isExpandable` 函数传给 `FlatTreeControl`，来让它能递归使用。

### Toggle

### 开关

A `matTreeNodeToggle` can be added in the tree node template to expand/collapse the tree node. The
toggle toggles the expand/collapse functions in `TreeControl` and is able to expand/collapse a
tree node recursively by setting `[matTreeNodeToggleRecursive]` to `true`.

可以把 `matTreeNodeToggle` 添加到树节点模板中，以展开/折叠树节点。此开关可以切换 `TreeControl` 中的展开/折叠函数，还能把 `[matTreeNodeToggleRecursive]` 设置为 `true` 来递归展开/折叠树节点。

The toggle can be placed anywhere in the tree node, and is only toggled by `click` action.

此开关可以放在树节点中的任何地方，并且只能通过点击（`click`）操作进行切换。

### Padding (Flat tree only)

### 填充（只对扁平树）

The `matTreeNodePadding` can be placed in a flat tree's node template to display the `level`
information of a flat tree node.

`matTreeNodePadding` 可以放在扁平树的节点模板中，以展示扁平树节点的 `level` 信息。

Nested tree does not need this padding since padding can be easily added to the hierarchy
structure in DOM.

嵌套树不需要进行填充，因为 DOM 中的层次结构就能很容易地加上它。

### Accessibility

### 可访问性

Trees without text or labels should be given a meaningful label via `aria-label` or
`aria-labelledby`. The `aria-readonly` defaults to `true` if it's not set.

没有文本或标签的树应该通过 `aria-label` 或 `aria-labelledby` 给出一个有意义的标签。如果没有指定，则 `aria-readonly` 会默认为 `true`。

Tree's role is `tree`.
Parent nodes are given `role="group"`, while leaf nodes are given `role="treeitem"`

树的角色是 `tree`。
父节点会带有 `role="group"`，而叶节点会带有 `role="treeitem"`。

`mat-tree` does not manage any focus/keyboard interaction on its own. Users can add desired
focus/keyboard interactions in their application.

`mat-tree` 不会自行管理任何焦点/键盘交互。
开发者可以根据需求为应用自行添加焦点/键盘交互。