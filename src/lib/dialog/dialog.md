The `MatDialog` service can be used to open modal dialogs with Material Design styling and
animations.

`MatDialog` 服务可用于打开具有 Material Design 样式和动画效果的模态对话框。

<!-- example(dialog-overview) -->

A dialog is opened by calling the `open` method with a component to be loaded and an optional
config object. The `open` method will return an instance of `MatDialogRef`:

通过调用 `open` 方法并传要加载的组件和可选的配置对象可以打开对话框。
`open` 方法将返回一个 `MatDialogRef` 的实例：

```ts
let dialogRef = dialog.open(UserProfileComponent, {
  height: '400px',
  width: '600px',
});
```

The `MatDialogRef` provides a handle on the opened dialog. It can be used to close the dialog and to
receive notification when the dialog has been closed.

`MatDialogRef` 提供了已打开对话框的一个引用。可用它来关闭对话框和接受关闭对话框后的通知。

```ts
dialogRef.afterClosed().subscribe(result => {
  console.log(`Dialog result: ${result}`); // Pizza!
});

dialogRef.close('Pizza!');
```

Components created via `MatDialog` can _inject_ `MatDialogRef` and use it to close the dialog
in which they are contained. When closing, an optional result value can be provided. This result
value is forwarded as the result of the `afterClosed` promise.

通过 `MatDialog` 创建的组件可以*注入* `MatDialogRef`，并用它来关闭包含该组件的对话框。
当关闭时，可以提供一个可选的结果值。该结果值会作为结果转发给 `afterClosed` 事件。

```ts
@Component({/* ... */})
export class YourDialog {
  constructor(public dialogRef: MatDialogRef<YourDialog>) { }

  closeDialog() {
    this.dialogRef.close('Pizza!');
  }
}
```

### Specifying global configuration defaults

### 指定全局默认值

Default dialog options can be specified by providing an instance of `MatDialogConfig` for
MAT_DIALOG_DEFAULT_OPTIONS in your application's root module.

对话框的默认选项可以通过在应用根模块中为 `MAT_DIALOG_DEFAULT_OPTIONS` 令牌提供一个 `MatDialogConfig` 实例来指定。

```ts
@NgModule({
  providers: [
    {provide: MAT_DIALOG_DEFAULT_OPTIONS, useValue: {hasBackdrop: false}}
  ]
})
```

### Sharing data with the Dialog component.

### 与对话框组件共享数据

If you want to share data with your dialog, you can use the `data` option to pass information to the dialog component.

如果要和对话框共享数据，可以通过 `data` 选项把信息传给该组件。

```ts
let dialogRef = dialog.open(YourDialog, {
  data: { name: 'austin' },
});
```

To access the data in your dialog component, you have to use the MAT_DIALOG_DATA injection token:

要在对话框组件中访问此数据，可以使用依赖注入令牌 `MAT_DIALOG_DATA`：

```ts
import {Component, Inject} from '@angular/core';
import {MAT_DIALOG_DATA} from '@angular/material';

@Component({
  selector: 'your-dialog',
  template: 'passed in {{ data.name }}',
})
export class YourDialog {
  constructor(@Inject(MAT_DIALOG_DATA) public data: any) { }
}
```

<!-- example(dialog-data) -->

### Dialog content

### 对话框内容

Several directives are available to make it easier to structure your dialog content:

下面几个指令能让你更轻松地定义对话框内容的结构：

| 名称                  | 说明                                                                                                   |
|-----------------------|---------------------------------------------------------------------------------------------------------------|
| `mat-dialog-title`     | <p translation-result>\[Attr] 对话框标题，应用于标题元素（如 `<h1>`、`<h2>`）</p><p translation-origin="off">\[Attr] Dialog title, applied to a heading element (e.g., `<h1>`, `<h2>`)                                     </p>
| `<mat-dialog-content>` | <p translation-result>对话框中主要的可滚动内容</p><p translation-origin="off">Primary scrollable content of the dialog                                                                      </p>
| `<mat-dialog-actions>` | <p translation-result>对话框底部动作按钮的容器</p><p translation-origin="off">Container for action buttons at the bottom of the dialog                                                      </p>
| `mat-dialog-close`     | <p translation-result>\[Attr] 添加到 `<button>` 上，点击它时会用它绑定的值（可选）作为结果来关闭对话框</p><p translation-origin="off">\[Attr] Added to a `<button>`, makes the button close the dialog with an optional result from the bound value.</p>

For example:

例如：

```html
<h2 mat-dialog-title>Delete all</h2>
<mat-dialog-content>Are you sure?</mat-dialog-content>
<mat-dialog-actions>
  <button mat-button mat-dialog-close>No</button>
  <!-- The mat-dialog-close directive optionally accepts a value as a result for the dialog. -->
  <button mat-button [mat-dialog-close]="true">Yes</button>
</mat-dialog-actions>
```

Once a dialog opens, the dialog will automatically focus the first tabbable element.

一旦打开了对话框，它就会自动把焦点转给第一个可接受焦点的元素。

You can control which elements are tab stops with the `tabindex` attribute

你可以通过 `tabindex` 属性来控制哪个元素可以接受焦点。

```html
<button mat-button tabindex="-1">Not Tabbable</button>
```

<!-- example(dialog-content) -->

### Configuring dialog content via `entryComponents`

### 通过 `entryComponents` 配置对话框内容

Because `MatDialog` instantiates components at run-time, the Angular compiler needs extra
information to create the necessary `ComponentFactory` for your dialog content component.

由于 `MatDialog` 会在运行期间实例化组件，因此 Angular 编译器需要额外的信息来为对话框的内容组件来创建必要的 `ComponentFactory`。

For any component loaded into a dialog, you must include your component class in the list of
`entryComponents` in your NgModule definition so that the Angular compiler knows to create
the `ComponentFactory` for it.

对于任何加载到对话框中的组件，你都必须把它包含进 NgModule 定义中的 `entryComponents` 列表中，以便 Angular 编译器了解如何为它创建 `ComponentFactory`。

```ts
@NgModule({
  imports: [
    // ...
    MatDialogModule
  ],

  declarations: [
    AppComponent,
    ExampleDialogComponent
  ],

  entryComponents: [
    ExampleDialogComponent
  ],

  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
```

### Accessibility

### 可访问性

By default, each dialog has `role="dialog"` on the root element. The role can be changed to
`alertdialog` via the `MatDialogConfig` when opening.

默认情况下，每个对话框的根元素上都有一个 `role="dialog"` 属性。当打开对话框时，也可以通过 `MatDialogConfig` 参数把该角色修改为 `alertdialog`。

The `aria-label`, `aria-labelledby`, and `aria-describedby` attributes can all be set to the
dialog element via the `MatDialogConfig` as well. Each dialog should typically have a label
set via `aria-label` or `aria-labelledby`.

`aria-label`、`aria-labelledby` 和 `aria-describedby` 属性也同样可以通过 `MatDialogConfig` 参数进行设置。
通常，每个对话框都会通过 `aria-label` 或 `aria-labelledby` 设置一个标签。

When a dialog is opened, it will move focus to the first focusable element that it can find. In
order to prevent users from tabbing into elements in the background, the Material dialog uses
a [focus trap](https://material.angular.io/cdk/a11y/overview#focustrap) to contain focus
within itself. Once a dialog is closed, it will return focus to the element that was focused
before the dialog was opened.

当对话框打开时，会把焦点转给它所能知道的第一个可获得焦点的元素。
为了阻止用户 tab 进背景中的元素，Material 对话框使用[焦点陷阱](https://material.angular.io/cdk/a11y/overview#focustrap)来把焦点困在内部。
当对话框关闭时，它就会把焦点还给打开对话框之前拥有焦点的那个元素。

#### Focus management

#### 焦点管理

By default, the first tabbable element within the dialog will receive focus upon open. This can
be configured by setting the `cdkFocusInitial` attribute on another focusable element.

默认情况下，当打开时，对话框中第一个可 tab 进去的子元素将会接受焦点。
不过，也可以通过为另一个可获得焦点的元素添加 `cdkFocusInitial` 元素来配置它。

Tabbing through the elements of the dialog will keep focus inside of the dialog element,
wrapping back to the first tabbable element when reaching the end of the tab sequence.

在对话框中的各个元素之间 tab 的时候，将会确保焦点始终位于对话框元素的内部，当到达 tab 序列的末尾时，就会回到该序列的头部。

#### Keyboard interaction

#### 键盘交互

By default pressing the escape key will close the dialog. While this behavior can
be turned off via the `disableClose` option, users should generally avoid doing so
as it breaks the expected interaction pattern for screen-reader users.

默认情况下，按 ESC 键就会关闭底部操作表。虽然也可以通过 `disableClose` 选项来禁止此行为，不过一般不应这样做，因为它会打破屏幕阅读器用户所期望的交互模式。
