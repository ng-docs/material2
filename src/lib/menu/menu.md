`<mat-menu>` is a floating panel containing list of options.

`<mat-menu>` 是一个包含选项列表的浮动面板。

<!-- example(menu-overview) -->

By itself, the `<mat-menu>` element does not render anything. The menu is attached to and opened
via application of the `matMenuTriggerFor` directive:

`<mat-menu>` 元素本身不会渲染任何东西。要用 `matMenuTriggerFor` 指令来附着到所属元素并打开此菜单：

```html
<mat-menu #appMenu="matMenu">
  <button mat-menu-item>Settings</button>
  <button mat-menu-item>Help</button>
</mat-menu>

<button mat-icon-button [matMenuTriggerFor]="appMenu">
  <mat-icon>more_vert</mat-icon>
</button>
```

### Toggling the menu programmatically

### 以编程方式切换菜单

The menu exposes an API to open/close programmatically. Please note that in this case, an
`matMenuTriggerFor` directive is still necessary to attach the menu to a trigger element in the DOM.

菜单对外暴露了一个 API，用于以编程的方式打开/关闭它。注意，在这种情况下，仍然必须用 `matMenuTriggerFor` 来把菜单附着到 DOM 中的某个触发器元素上。

```ts
class MyComponent {
  @ViewChild(MatMenuTrigger) trigger: MatMenuTrigger;

  someMethod() {
    this.trigger.openMenu();
  }
}
```

### Icons

### 图标

Menus support displaying `mat-icon` elements before the menu item text.

菜单支持在菜单项的文本之前显示 `mat-icon` 元素上。

*my-comp.html*
```html
<mat-menu #menu="matMenu">
  <button mat-menu-item>
    <mat-icon>dialpad</mat-icon>
    <span>Redial</span>
  </button>
  <button mat-menu-item disabled>
    <mat-icon>voicemail</mat-icon>
    <span>Check voicemail</span>
  </button>
  <button mat-menu-item>
    <mat-icon>notifications_off</mat-icon>
    <span>Disable alerts</span>
  </button>
</mat-menu>
```

### Customizing menu position

### 自定义菜单位置

By default, the menu will display below (y-axis), after (x-axis), and overlapping its trigger.
The position can be changed using the `xPosition` (`before | after`) and `yPosition`
(`above | below`) attributes. The menu can be be forced to not overlap the trigger using
`[overlapTrigger]="false"` attribute.

默认情况下，菜单将会显示在触发器的下方（Y 轴）、后方（X 轴）并与触发器元素重叠。
此位置可以使用 `xPosition` (`before | after`) 和 `yPosition` (`above | below`) 属性进行修改。
还可以用 `[overlapTrigger]="false"` 属性来强迫菜单不要与触发器重叠。

```html
<mat-menu #appMenu="matMenu" yPosition="above">
  <button mat-menu-item>Settings</button>
  <button mat-menu-item>Help</button>
</mat-menu>

<button mat-icon-button [matMenuTriggerFor]="appMenu">
  <mat-icon>more_vert</mat-icon>
</button>
```

### Nested menu

### 内嵌菜单

Material supports the ability for an `mat-menu-item` to open a sub-menu. To do so, you have to define
your root menu and sub-menus, in addition to setting the `[matMenuTriggerFor]` on the `mat-menu-item`
that should trigger the sub-menu:

Material 支持让 `mat-menu-item` 再打开子菜单。要做到这一点，你要先定义根菜单和子菜单，然后在 `mat-menu-item` 上设置 `[matMenuTriggerFor]` 以触发子菜单：

```html
<mat-menu #rootMenu="matMenu">
  <button mat-menu-item [matMenuTriggerFor]="subMenu">Power</button>
  <button mat-menu-item>System settings</button>
</mat-menu>

<mat-menu #subMenu="matMenu">
  <button mat-menu-item>Shut down</button>
  <button mat-menu-item>Restart</button>
  <button mat-menu-item>Hibernate</button>
</mat-menu>

<button mat-icon-button [matMenuTriggerFor]="rootMenu">
  <mat-icon>more_vert</mat-icon>
</button>
```

<!-- example(nested-menu) -->

### Lazy rendering

### 惰性渲染

By default, the menu content will be initialized even when the panel is closed. To defer
initialization until the menu is open, the content can be provided as an `ng-template`
with the `matMenuContent` attribute:

默认情况下，即使菜单面板是关闭的，其内容也会被初始化。要想等到菜单打开时才进行初始化，可以用一个带 `matMenuContent` 属性的 `ng-template` 来提供其内容：

```html
<mat-menu #appMenu="matMenu">
  <ng-template matMenuContent>
    <button mat-menu-item>Settings</button>
    <button mat-menu-item>Help</button>
  </ng-template>
</mat-menu>

<button mat-icon-button [matMenuTriggerFor]="appMenu">
  <mat-icon>more_vert</mat-icon>
</button>
```

### Passing in data to a menu

### 给菜单传入数据

When using lazy rendering, additional context data can be passed to the menu panel via
the `matMenuTriggerData` input. This allows for a single menu instance to be rendered
with a different set of data, depending on the trigger that opened it:

当使用惰性渲染时，可以通过输入属性 `matMenuTriggerData` 来把额外的上下文数据传给菜单。
这会允许使用不同的数据集渲染同一个菜单实例 —— 取决于在哪个触发器上打开它：

```html
<mat-menu #appMenu="matMenu">
  <ng-template matMenuContent let-name="name">
    <button mat-menu-item>Settings</button>
    <button mat-menu-item>Log off {{name}}</button>
  </ng-template>
</mat-menu>

<button mat-icon-button [matMenuTriggerFor]="appMenu" [matMenuTriggerData]="{name: 'Sally'}">
  <mat-icon>more_vert</mat-icon>
</button>

<button mat-icon-button [matMenuTriggerFor]="appMenu" [matMenuTriggerData]="{name: 'Bob'}">
  <mat-icon>more_vert</mat-icon>
</button>
```

### Keyboard interaction

### 键盘交互

- <kbd>DOWN_ARROW</kbd>: Focuses the next menu item

  <kbd>DOWN_ARROW</kbd>：焦点移到下一个菜单项


- <kbd>UP_ARROW</kbd>: Focuses previous menu item

  <kbd>UP_ARROW</kbd>：焦点移到上一个菜单项


- <kbd>RIGHT_ARROW</kbd>: Opens the menu item's sub-menu

  <kbd>RIGHT_ARROW</kbd>：打开当前菜单项的子菜单


- <kbd>LEFT_ARROW</kbd>: Closes the current menu, if it is a sub-menu.

  <kbd>LEFT_ARROW</kbd>：关闭当前菜单项的子菜单（如果有）。


- <kbd>ENTER</kbd>: Activates the focused menu item

  <kbd>ENTER</kbd>：激活当前有焦点的菜单项



### Accessibility

### 可访问性

Menu triggers or menu items without text or labels should be given a meaningful label via
`aria-label` or `aria-labelledby`.

没有文字或标签的菜单触发器或菜单项应该通过 `aria-label` 或 `aria-labelledby` 给出一个有意义的标签。
