`<mat-list>` is a container component that wraps and formats a series of line items. As the base 
list component, it provides Material Design styling, but no behavior of its own.

`<mat-list>` 是一个容器组件，用于包装和格式化一系列条目。
作为最基本的列表组件，它提供了 Material Design 的样式，但是并没有定义属于自己的行为。

<!-- example(list-overview) -->


### Simple lists

### 简单列表

An `<mat-list>` element contains a number of `<mat-list-item>` elements.

每个 `<mat-list>` 元素包含一组 `<mat-list-item>` 元素。

```html
<mat-list>
 <mat-list-item> Pepper </mat-list-item>
 <mat-list-item> Salt </mat-list-item>
 <mat-list-item> Paprika </mat-list-item>
</mat-list>
```

### Navigation lists

### 导航列表

Use `mat-nav-list` tags for navigation lists (i.e. lists that have anchor tags).

使用 `mat-nav-list` 标记来表示导航列表（即带链接的列表）。

Simple navigation lists can use the `mat-list-item` attribute on anchor tag elements directly:

简单导航列表可以直接把 `mat-list-item` 属性用在链接上：

```html
<mat-nav-list>
   <a mat-list-item href="..." *ngFor="let link of links"> {{ link }} </a>
</mat-nav-list>
```

For more complex navigation lists (e.g. with more than one target per item), wrap the anchor 
element in an `<mat-list-item>`.

对于更复杂的导航列表（比如：每个条目具有多个目标时），可以把链接包裹在 `<mat-list-item>` 中。

```html
<mat-nav-list>
  <mat-list-item *ngFor="let link of links">
     <a matLine href="...">{{ link }}</a>
     <button mat-icon-button (click)="showInfo(link)">
        <mat-icon>info</mat-icon>
     </button>
  </mat-list-item>
</mat-nav-list>
```

### Selection lists

### 选取列表

A selection list provides an interface for selecting values, where each list item is an option.

选取列表提供了一种可以选取值的界面，列表中的每个条目都是一个选项。

<!-- example(list-selection) -->

The options within a selection-list should not contain further interactive controls, such
as buttons and anchors.


选取列表中的选项不应该包含可交互控件，比如按钮或链接。

### Multi-line lists

### 多行列表

For lists that require multiple lines per item, annotate each line with an `matLine` attribute.
Whichever heading tag is appropriate for your DOM hierarchy should be used (not necessarily `<h3>`
as shown in the example).

对于每个条目需要多行内容的列表，可以给每一行标注 `matLine` 属性。
这里应该使用一个在你的 DOM 层次下最恰当的标题标记（不一定要要像下面的例子中这样用 `<h3>`）。

```html
<!-- two line list -->
<mat-list>
  <mat-list-item *ngFor="let message of messages">
    <h3 matLine> {{message.from}} </h3>
    <p matLine>
      <span> {{message.subject}} </span>
      <span class="demo-2"> -- {{message.content}} </span>
    </p>
  </mat-list-item>
</mat-list>

<!-- three line list -->
<mat-list>
  <mat-list-item *ngFor="let message of messages">
    <h3 matLine> {{message.from}} </h3>
    <p matLine> {{message.subject}} </p>
    <p matLine class="demo-2"> {{message.content}} </p>
  </mat-list-item>
</mat-list>
```

### Lists with icons

### 带图标的列表

To add an icon to your list item, use the `matListIcon` attribute.

要想给列表条目添加图标，请使用 `matListIcon` 属性。

```html
<mat-list>
  <mat-list-item *ngFor="let message of messages">
    <mat-icon matListIcon>folder</mat-icon>
    <h3 matLine> {{message.from}} </h3>
    <p matLine>
      <span> {{message.subject}} </span>
      <span class="demo-2"> -- {{message.content}} </span>
    </p>
  </mat-list-item>
</mat-list>
```

### Lists with avatars

### 带头像的列表

To include an avatar image, add an image tag with an `matListAvatar` attribute. 

要包含一个头像，请添加一个带有 `matListAvatar` 属性的图像标记。

```html
<mat-list>
  <mat-list-item *ngFor="let message of messages">
    <img matListAvatar src="..." alt="...">
    <h3 matLine> {{message.from}} </h3>
    <p matLine>
      <span> {{message.subject}} </span>
      <span class="demo-2"> -- {{message.content}} </span>
    </p>
  </mat-list-item>
</mat-list>
```

### Dense lists

### 密集列表

Lists are also available in "dense layout" mode, which shrinks the font size and height of the list
to suit UIs that may need to display more information. To enable this mode, add a `dense` attribute
to the main `mat-list` tag.

列表还能用在 "密集布局" 模式下，该模式会缩小列表的字体大小和高度，以适应那些需要显示更多信息的 UI。
要启用此模式，请给主标记 `mat-list` 添加 `dense` 属性。

```html
<mat-list dense>
 <mat-list-item> Pepper </mat-list-item>
 <mat-list-item> Salt </mat-list-item>
 <mat-list-item> Paprika </mat-list-item>
</mat-list>
```


### Lists with multiple sections

### 带有多个分区的列表

Subheader can be added to a list by annotating a heading tag with an `matSubheader` attribute. 
To add a divider, use `<mat-divider>`.

可以通过带 `matSubheader` 属性的标题标记来为列表添加子标题。
要想添加分隔符，可以用 `<mat-divider>`。

```html
<mat-list>
   <h3 matSubheader>Folders</h3>
   <mat-list-item *ngFor="let folder of folders">
      <mat-icon matListIcon>folder</mat-icon>
      <h4 matLine>{{folder.name}}</h4>
      <p matLine class="demo-2"> {{folder.updated}} </p>
   </mat-list-item>
   <mat-divider></mat-divider>
   <h3 matSubheader>Notes</h3>
   <mat-list-item *ngFor="let note of notes">
      <mat-icon matListIcon>note</mat-icon>
      <h4 matLine>{{note.name}}</h4>
      <p matLine class="demo-2"> {{note.updated}} </p>
   </mat-list-item>
</mat-list>
```

### Accessibility

### 可访问性

The type of list used in any given situation depends on how the end-user will be interacting with
the it.

在给定的场景下使用哪种列表，取决于最终用户将如何与之交互。

#### Navigation

#### 导航

When the list-items navigate somewhere, `<mat-nav-list>` should be used with `<a mat-list-item>`
elements as the list items. The nav-list will be rendered using `role="navigation"` and can be
given an `aria-label` to give context on the set of navigation options presented. Additional
interactive content, such as buttons, should _not_ be added inside the anchors.

当列表条目导航到某处时，`<mat-nav-list>` 应该和 `<a mat-list-item>` 元素一起使用。
导航列表将使用 `role="navigation"` 进行渲染，并通过 `aria-label` 来为导航列表的选项集提供上下文。
*不要*把额外的交互内容（比如按钮）填加到链接内部。

#### Selection

#### 选取

When the list is primarily used to select one or more values, a `<mat-selection-list>` should be
used with `<mat-list-option>`, which map to `role="listbox"` and `role="option"`, respectively. The
list should be given an `aria-label` that describes the value or values being selected. Each option
should _not_ contain any additional interactive elements, such as buttons.

当列表主要用于选择一个或多个值时，`<mat-selection-list>` 应该和 `<mat-list-option>` 一起使用，它们会分别映射到 `role="listbox"` 和 `role="option"`。
这种列表应该给出一个 `aria-label` 以描述供选择的一个或多个值。
每个选项都*不*应该包含任何额外的交互元素（比如按钮）。

#### Custom scenarios

#### 自定义方案

By default, the list assumes that it will be used in a purely decorative fashion and thus sets no
roles, ARIA attributes, or keyboard shortcuts. This is equivalent to having a sequence of `<div>`
elements on the page. Any interactive content within the list should be given an appropriate
accessibility treatment based on the specific workflow of your application.

默认情况下，列表组件假定自己是纯装饰性的，因此不设置任何角色、ARIA 属性或键盘快捷键。
这相当于页面上有一系列 `<div>` 元素。列表内部的任何交互式内容都应该根据应用程序的特定工作流进行适当的可访问性处理。

If the list is used to present a list of non-interactive content items, then the list element should
be given `role="list"` and each list item should be given `role="listitem"`.

如果列表组件用于呈现非交互式内容项的列表，那么列表元素应该带有 `role="list"` 属性，并且每个列表条目都应该带有 `role="listitem"` 属性。
