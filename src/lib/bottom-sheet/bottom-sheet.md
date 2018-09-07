The `MatBottomSheet` service can be used to open Material Design panels to the bottom of the screen.
These panels are intended primarily as an interaction on mobile devices where they can be used as an
alternative to dialogs and menus.

`MatBottomSheet` 服务可用于在屏幕底部打开一些 Material Design 面板。
这些面板的主要目的是在移动设备上作为对话框和菜单的替代品提供交互体验。

<!-- example(bottom-sheet-overview) -->

You can open a bottom sheet by calling the `open` method with a component to be loaded and an
optional config object. The `open` method will return an instance of `MatBottomSheetRef`:

你可以调用它的 `open` 方法并传入一个要加载的组件和一个可选的配置对象，来打开一个底部操作表：

```ts
const bottomSheetRef = bottomSheet.open(SocialShareComponent, {
  ariaLabel: 'Share on social media'
});
```

The `MatBottomSheetRef` is a reference to the currently-opened bottom sheet and can be used to close
it or to subscribe to events. Note that only one bottom sheet can be open at a time. Any component
contained inside of a bottom sheet can inject the `MatBottomSheetRef` as well.

`MatBottomSheetRef` 是一个到当前打开的底部操作表的引用，可以通过此引用来关闭它或订阅其事件。
注意，同一时间只能打开一个底部操作表。
底部操作表中包含的任何组件也同样可以注入这个 `MatBottomSheetRef` 引用。

```ts
bottomSheetRef.afterDismissed().subscribe(() => {
  console.log('Bottom sheet has been dismissed.');
});

bottomSheetRef.dismiss();
```

### Sharing data with the bottom sheet component.

### 与底部操作表组件共享数据

If you want to pass in some data to the bottom sheet, you can do so using the `data` property:

如果你要把一些数据传给底部操作表，可以使用 `data` 属性：

```ts
const bottomSheetRef = bottomSheet.open(HobbitSheet, {
  data: { names: ['Frodo', 'Bilbo'] },
});
```

Afterwards you can access the injected data using the `MAT_BOTTOM_SHEET_DATA` injection token:

然后，你就可以通过注入令牌 `MAT_BOTTOM_SHEET_DATA` 来访问所注入的这些数据了：

```ts
import {Component, Inject} from '@angular/core';
import {MAT_BOTTOM_SHEET_DATA} from '@angular/material';

@Component({
  selector: 'hobbit-sheet',
  template: 'passed in {{ data.names }}',
})
export class HobbitSheet {
  constructor(@Inject(MAT_BOTTOM_SHEET_DATA) public data: any) { }
}
```

### Configuring bottom sheet content via `entryComponents`

### 通过 `entryComponents` 配置底部操作表的内容

Similarly to `MatDialog`, `MatBottomSheet` instantiates components at run-time. In order for it to
work, the Angular compiler needs extra information to create the necessary `ComponentFactory` for
your bottom sheet content component.

和 `MatDialog` 一样，`MatBottomSheet` 也会在运行期间实例化组件。
为了让它能正常工作，Angular 编译器需要一些额外的信息，以便为你在底部操作表中使用的内容组件创建必要的 `ComponentFactory`。

Any components that are include inside of a bottom sheet have to be added to the `entryComponents`
inside your `NgModule`.

任何要包含在底部操作表中的组件都必须添加到你的 `NgModule` 的 `entryComponents` 数组中。

```ts
@NgModule({
  imports: [
    // ...
    MatBottomSheetModule
  ],

  declarations: [
    AppComponent,
    ExampleBottomSheetComponent
  ],

  entryComponents: [
    ExampleBottomSheetComponent
  ],

  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
```

### Accessibility

### 可访问性

By default, the bottom sheet has `role="dialog"` on the root element and can be labelled using the
`ariaLabel` property on the `MatBottomSheetConfig`.

默认情况下，底部操作表的根元素伤都会有一个 `role="dialog"` 属性，并且可以使用 `MatBottomSheetConfig` 上的 `ariaLabel` 属性标记出来。

When a bottom sheet is opened, it will move focus to the first focusable element that it can find.
In order to prevent users from tabbing into elements in the background, the Material bottom sheet
uses a [focus trap](https://material.angular.io/cdk/a11y/overview#focustrap) to contain focus
within itself. Once a bottom sheet is closed, it will return focus to the element that was focused
before it was opened.

当底部操作表打开时，它就会把焦点移交给所能找到的第一个可获得焦点的子元素。
要阻止用户通过 tab 把焦点移到背景元素上，Material 的底部操作表会用[焦点陷阱](/cdk/a11y/overview#focustrap)把焦点锁在自己的内部。
当底部操作表关闭时，它就会把焦点归还给打开操作表之前的拥有焦点的那个元素。

#### Focus management

#### 焦点管理

By default, the first tabbable element within the bottom sheet will receive focus upon open.
This can be configured by setting the `cdkFocusInitial` attribute on another focusable element.

默认情况下，当打开时，底部工作表中第一个可 tab 进去的子元素将会接受焦点。
不过，也可以通过为另一个可获得焦点的元素添加 `cdkFocusInitial` 元素来配置它。

#### Keyboard interaction

#### 键盘交互

By default pressing the escape key will close the bottom sheet. While this behavior can
be turned off via the `disableClose` option, users should generally avoid doing so
as it breaks the expected interaction pattern for screen-reader users.

默认情况下，按 ESC 键就会关闭底部操作表。虽然也可以通过 `disableClose` 选项来禁止此行为，不过一般不应这样做，因为它会打破屏幕阅读器用户所期望的交互模式。
