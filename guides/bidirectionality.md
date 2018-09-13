# Angular Material bi-directionality

# Angular Material 的双向文字

### Setting a text-direction for your application

### 设置应用的文字方向

The [`dir` attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
is typically applied to `<html>` or `<body>` element of a page. However, it can be used on any
element, within your Angular app, to apply a text-direction to a smaller subset of the page.

[`dir` attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir) 通常会应用于页面的 `<html>` 或 `<body>` 元素上。
不过，它也可以用在应用中的任何元素上，以为页面中一个小型子集指定文字方向。

All Angular Material components automatically reflect the LTR/RTL direction
of their container.

所有 Angular Material 组件都会自动跟随其容器的 LTR/RTL 方向。

### Reading the text-direction in your own components

### 在自己的组件中读取文字方向

`@angular/cdk/bidi` provides a `Directionality` injectable that can be used by any component
in your application. To consume it, you must import `BidiModule` from `@angular/cdk/bidi`.

`@angular/cdk/bidi` 提供了一个可注入对象 `Directionality`，它可以供应用中的任何一个组件使用。
要使用该服务，你必须从 `@angular/cdk/bidi` 中导入 `BidiModule`。

`Directionality` provides two useful properties:

`Directionality` 提供了两个有用的属性：

* `value`: the current text direction, either `'ltr'` or `'rtl'`.

  `value`：当前的文字方向，或者是 `'ltr'` 或者是 `'rtl'`。

* `change`: an `Observable` that emits whenever the text-direction changes. Note that this only
captures changes from `dir` attributes _inside the Angular application context_. It will not
emit for changes to `dir` on `<html>` and `<body>`, as they are assumed to be static.

  `change` 一个 `Observable`，当文字方向改变时就会发出事件。注意，它只会捕获*Angular 应用上下文内部*的 `dir` 属性变更。
  它不会报告 `<html>` 和 `<body>` 上的 `dir` 属性的变更，我们可以假设它们都是静态的。

#### Example

#### 范例

```ts
@Component({ /* ... */ })
export class MyCustomComponent {
  private dir: Direction;

  constructor(directionality: Directionality) {
    this.dir = directionality.value;

    directionality.change.subscribe(() => {
       this.dir = directionality.value;
    });
  }
}
```
