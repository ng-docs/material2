`<mat-expansion-panel>` provides an expandable details-summary view.

`<mat-expansion-panel>` 提供了一个可展开的 "摘要-详情" 型视图。

<!-- example(expansion-overview) -->

### Expansion-panel content

### 可展开面板内容

Each expansion-panel must include a header and may optionally include an action bar.

每个可展开面板都必须包含一个头部，以及一个可选的动作条。

#### Header

#### 头部

The `<mat-expansion-panel-header>` shows a summary of the panel content and acts
as the control for expanding and collapsing. This header may optionally contain an
`<mat-panel-title>` and an `<mat-panel-description>`, which format the content of the
header to align with Material Design specifications.

`<mat-expansion-panel-header>` 用于显示面板内容的摘要，并且用作展开和折叠的控制器。
这个头部可以包含一个可选的 `<mat-panel-title>` 和 `<mat-panel-description>`，它们根据 Material Design 规范来格式化头部的内容。

By default, the expansion-panel header includes a toggle icon at the end of the
header to indicate the expansion state. This icon can be hidden via the
`hideToggle` property.

默认情况下，可展开面板的头部会在头的尾部包含一个开关图标，来表示展开状态。该图标可以通过 `hideToggle` 属性进行隐藏。

```html
<mat-expansion-panel>
  <mat-expansion-panel-header>
    <mat-panel-title>
      This is the expansion title
    </mat-panel-title>
    <mat-panel-description>
      This is a summary of the content
    </mat-panel-description>
  </mat-expansion-panel-header>

  <p>This is the primary content of the panel.</p>

</mat-expansion-panel>
```

#### Action bar

#### 动作条

Actions may optionally be included at the bottom of the panel, visible only when the expansion
is in its expanded state.

面板的底部可以包含一个可选的动作条，只有当它处于展开状态时才可见。

```html
<mat-expansion-panel>
  <mat-expansion-panel-header>
    This is the expansion title
  </mat-expansion-panel-header>

  <p>This is the primary content of the panel.</p>

  <mat-action-row>
    <button mat-button>Click me</button>
  </mat-action-row>
</mat-expansion-panel>
```

#### Disabling a panel

#### 禁用面板

Expansion panels can be disabled using the `disabled` attribute. A disabled expansion panel can't
be toggled by the user, but can still be manipulated programmatically.

可展开面板可以使用 `disabled` 属性来禁用。禁用的可展开面板不能由用户进行切换，但仍然可以通过程序进行切换。

```html
<mat-expansion-panel [disabled]="isDisabled">
  <mat-expansion-panel-header>
    This is the expansion title
  </mat-expansion-panel-header>
  <mat-panel-description>
    This is a summary of the content
  </mat-panel-description>
</mat-expansion-panel>
```


### Accordion

### 手风琴

Multiple expansion-panels can be combined into an accordion. The `multi="true"` input allows the
expansions state to be set independently of each other. When `multi="false"` (default) just one
panel can be expanded at a given time:

多个可展开面板可以组合成一个手风琴。输入属性 `multi="true"` 允许面板的折叠状态与其它面板相互独立。当 `multi="false"` 时（默认值），则同一时刻只能有一个面板处于展开状态：

```html
<mat-accordion>

  <mat-expansion-panel>
    <mat-expansion-panel-header>
      This is the expansion 1 title
    </mat-expansion-panel-header>

    This the expansion 1 content

  </mat-expansion-panel>

  <mat-expansion-panel>
    <mat-expansion-panel-header>
      This is the expansion 2 title
    </mat-expansion-panel-header>

    This the expansion 2 content

  </mat-expansion-panel>

</mat-accordion>
```

### Lazy rendering

### 惰性渲染

By default, the expansion panel content will be initialized even when the panel is closed.
To instead defer initialization until the panel is open, the content should be provided as
an `ng-template`:

默认情况下，即使可展开面板是关闭的，其内容也已经初始化过了。
要想把初始化过程推迟到面板展开时才初始化，则该内容应该在 `ng-template` 中提供：

```html
<mat-expansion-panel>
  <mat-expansion-panel-header>
    This is the expansion title
  </mat-expansion-panel-header>

  <ng-template matExpansionPanelContent>
    Some deferred content
  </ng-template>
</mat-expansion-panel>
```

### Accessibility

### 可访问性

The expansion-panel aims to mimic the experience of the native `<details>` and `<summary>` elements.
The expansion panel header has `role="button"` and also the attribute `aria-controls` with the
expansion panel's id as value.

可展开面板旨在模拟原生元素 `<details>` 和 `<summary>` 的体验。
可展开面板的头部带有 `role="button"` 属性，而 `aria-controls` 属性则以可展开面板的 id 作为值。

The expansion panel headers are buttons. Users can use the keyboard to activate the expansion panel
header to switch between expanded state and collapsed state. Because the header acts as a button,
additional interactive elements should not be put inside of the header.

可展开面板的头部实际上是按钮。用户可以用键盘激活可展开面板的头部，以在展开状态和折叠状态之间切换。由于这个头扮演的是按钮的角色，因此不能在其中放入其它可交互元素。
