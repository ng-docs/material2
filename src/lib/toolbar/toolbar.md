`<mat-toolbar>` is a container for headers, titles, or actions.

`<mat-toolbar>` 是一个具有头、标题或操作的容器。

<!-- example(toolbar-overview) -->

### Single row

### 单行工具栏

In the most situations, a toolbar will be placed at the top of your application and will only 
have a single row that includes the title of your application.

在大多数场景下，工具栏会放在应用的顶部，而且只包含一行应用标题。

```html
<mat-toolbar>
  <span>My Application</span>
</mat-toolbar>
```

### Multiple rows

### 多行工具栏

The Material Design specifications describe that toolbars can also have multiple rows. Creating
toolbars with multiple rows in Angular Material can be done by placing `<mat-toolbar-row>` elements
inside of a `<mat-toolbar>`.

Material Design 规范中说工具栏同样可以是多行的。可以通过把 `<mat-toolbar-row>` 元素放进 `<mat-toolbar>` 中来创建多行工具栏。

```html
<mat-toolbar>  
  <mat-toolbar-row>
    <span>First Row</span>
  </mat-toolbar-row>
  
  <mat-toolbar-row>
    <span>Second Row</span>
  </mat-toolbar-row>
</mat-toolbar>
```

**Note**: Placing content outside of a `<mat-toolbar-row>` when multiple rows are specified is not
supported.

**注意**：当指定了多行工具栏时，不支持把内容放在 `<mat-toolbar-row>` 的外面。

### Positioning toolbar content

### 定位工具栏内容

The toolbar does not perform any positioning of its content. This gives the user full power to 
position the content as it suits their application.

工具栏不会对其内容进行任何定位。这让用户有足够的控制权来按照应用的要求对内容进行定位。

A common pattern is to position a title on the left with some actions on the right. This can be
easily accomplished with `display: flex`:

一种常见的模式是把标题定位在左侧，而另一些操作定位在右侧。这可以使用 `display: flex` 来轻松实现：

```html
<mat-toolbar color="primary">
  <span>Application Title</span>
  
  <!-- This fills the remaining space of the current row -->
  <span class="example-fill-remaining-space"></span>
  
  <span>Right Aligned Text</span>
</mat-toolbar>
```
```scss
.example-fill-remaining-space {
  /* This fills the remaining space, by using flexbox. 
     Every toolbar row uses a flexbox row layout. */
  flex: 1 1 auto;
}
```

### Theming

### 主题

The color of a `<mat-toolbar>` can be changed by using the `color` property. By default, toolbars
use a neutral background color based on the current theme (light or dark). This can be changed to 
`'primary'`, `'accent'`, or `'warn'`.  

`<mat-toolbar>` 的颜色可以使用 `color` 属性进行设置。默认情况下，工具栏根据当前的主题（亮或暗）使用一个中立的背景颜色。
可以把它修改为 `'primary'` `'accent'` 或 `'warn'`。

### Accessibility

### 可访问性

By default, the toolbar assumes that it will be used in a purely decorative fashion and thus sets
no roles, ARIA attributes, or keyboard shortcuts. This is equivalent to having a sequence of `<div>`
elements on the page.

默认情况下，工具栏假设它是纯装饰性的，因此不设置角色、ARIA 属性或键盘快捷键。这时它相当于页面中的一些 `<div>` 元素。

Generally, the toolbar is used as a header where `role="heading"` would be appropriate.

通常，工具栏会用作标题，这时候可以使用 `role="heading"`。

Only if the use-case of the toolbar match that of role="toolbar", the user should add the role and
an appropriate label via `aria-label` or `aria-labelledby`.

只有当工具栏的用例和 `role="toolbar"` 相匹配时，它才应该加上此角色，并通过 `aria-label` 或 `aria-labelledby` 添加一个标签。
