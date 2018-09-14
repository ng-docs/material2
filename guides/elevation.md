Angular Material's elevation classes and mixins allow you to add separation between elements along
the z-axis. All material design elements have resting elevations. In addition, some elements may
change their elevation in response to user interaction. The
[Material Design spec](https://material.io/design/environment/elevation.html)
explains how to best use elevation.

Angular Material 的高程（elevation）类和混入器（mixin）让你可以沿着 Z 轴区分开各个元素。所有的 Material Design 元素都有一个静止状态的高程。此外，有些元素可能会改变它们的高程，以响应用户操作。
[Material Design 规范](https://material.io/design/environment/elevation.html)解释了关于高程的最佳实践。

Angular Material provides two ways to control the elevation of elements: predefined CSS classes
and mixins.

Angular Material 提供了两种方式来控制元素的高程：预定义的 CSS 类和混入器。

### Predefined CSS classes

### 预定义 CSS 类

The easiest way to add elevation to an element is to simply add one of the predefined CSS classes
`mat-elevation-z#` where `#` is the elevation number you want, 0-24. Dynamic elevation can be
achieved by switching elevation classes:

为元素添加高程的最简单方式是为其添加预定义的 CSS 类 `mat-elevation-z#`，这里的 `#` 是你要用的高程数字，介于 0~24 之间。
可以通过切换高程类来实现动态高程：

```html
<div [class.mat-elevation-z2]="!isActive" [class.mat-elevation-z8]="isActive"></div>
```

<!-- example(elevation-overview) -->

### Mixins

### 混入器

Elevations can also be added in CSS via the `mat-elevation` mixin, which takes a number 0-24
indicating the elevation of the element as well as optional arguments for the elevation shadow's
color tone and opacity.

还可以在 CSS 中使用 `mat-elevation` 混入器来添加高程，它接受一个介于 0~24 之间的高程数，还有一个可选的参数用于表示高程投影的色调和透明度。

Since an elevation shadow consists of multiple shadow components of varying opacities, the
`$opacity` argument of the mixin is considered a factor by which to scale these initial values
rather than an absolute value.

高程投影由多个具有不同透明度的投影组件构成，这个混入器的 `$opacity` 参数会作为一个缩放初始值的因子，而不是作为绝对值。

In order to use the mixin, you must import `~@angular/material/theming`:

要使用这个混入器，你必须导入 `~@angular/material/theming`：

```scss
@import '~@angular/material/theming';

.my-class-with-default-shadow {
  // Adds a shadow for elevation level 2 with default color and full opacity:
  @include mat-elevation(2);
}

.my-class-with-custom-shadow {
  // Adds a shadow for elevation level 2 with color #e91e63 and 80% of the default opacity:
  @include mat-elevation(2, #e91e63, 0.8);
}
```

For convenience, you can use the `mat-elevation-transition` mixin to add a transition when the
elevation changes:

当高程变化时，你可以用 `mat-elevation-transition` 混入器来简便的添加转场动画：

```scss
@import '~@angular/material/theming';

.my-class {
  @include mat-elevation-transition;
  @include mat-elevation(2);

  &:active {
    @include mat-elevation(8);
  }
}
```
