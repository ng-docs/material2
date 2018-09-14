# Customizing Angular Material component styles

# 自定义 Angular Material 组件的样式

### Styling concepts

### 样式相关的概念

There are 3 questions to keep in mind while customizing the styles of Angular Material
components:

当定制 Angular Material 组件的样式时，要牢记三个问题：

1. Are your styles encapsulated?

   你的样式是封装过的吗？

2. Are your styles more specific than the defaults?

   你的样式是否比默认的更具体？

3. Is the component a child of your component, or does it exist elsewhere in the DOM?

   该组件是始终用作其它组件的子组件，还是可以出现在 DOM 中的任何位置？

##### View encapsulation

##### 视图封装

By default, Angular component styles are scoped to affect the component's view. This means that
the styles you write will affect all the elements in your component template. They will *not*
affect elements that are children of other components within your template. You can read more
about view encapsulation in the
[Angular documentation](https://angular.io/guide/component-styles#view-encapsulation). You may
also wish to take a look at
[_The State of CSS in Angular_](https://blog.angular.io/the-state-of-css-in-angular-4a52d4bd2700)
on the Angular blog.

默认情况下，Angular 组件的样式只会影响该组件的视图本身。也就是说你写的任何样式都只会影响到你这个组件模板中的元素。
它们**不会**影响到你模板中用到的其它组件的任何子元素。你可以到 [Angular 官方文档](https://angular.cn/guide/component-styles#view-encapsulation)中了解关于视图封装的更多知识。还可以到 Angular 官方博客中读一下 [* Angular 中 CSS 的开发状态*](https://blog.angular.io/the-state-of-css-in-angular-4a52d4bd2700)。

##### Selector specificity

##### 选择器的特异度

Each CSS declaration has a level of *specificity* based on the type and number of selectors used.
More specific styles will take precedence over less specific styles. Angular Material uses the
least specific selectors possible for its components in order to make it easy to override them.
You can read more about specificity and how it is calculated on the
[MDN web docs](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity).

每个 CSS 声明都具有一个*特异度*级别，取决于所用到的选择器的类型和数量。
特异度较高的样式也会有较高的优先级。Angular Material 会在组件中使用尽可能小的特异度，以便你更容易覆盖它们。
你可以到 [MDN Web 文档](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity)中深入了解特异度及其计算方法。

##### Component location

##### 组件位置

Some Angular Material components, specifically overlay-based ones like MatDialog, MatSnackbar, etc.,
do not exist as children of your component. Often they are injected elsewhere in the DOM. This is
important to keep in mind, since even using high specificity and shadow-piercing selectors will
not target elements that are not direct children of your component. Global styles are recommended
for targeting such components.

有些 Angular Material 组件（特别是基于浮层的组件，如 MatDialog、MatSnackbar 等）不是以子组件的形式存在的，而是插入到 DOM 中某些别的位置。
这一点一定要记住，因为即使使用了高特异性的和能够穿透 Shadow DOM 的选择器，也没法影响这些不是子元素的元素。对这些元素，建议使用全局样式来定制。

### Styling overlay components

### 为浮层组件定制样式

Overlay-based components have a `panelClass` property (or similar) that can be used to target the
overlay pane. For example, to remove the padding from a dialog:

基于浮层的组件都有一个形如 `panelClass` 的属性，它可用作用于浮层面板。比如，要从对话框中移除衬距：

```scss
// Add this to your global stylesheet after your theme setup
.myapp-no-padding-dialog .mat-dialog-container {
  padding: 0;
}
```

```ts
this.dialog.open(MyDialogComponent, {panelClass: 'myapp-no-padding-dialog'})
```

Since you are adding the styles to your global stylesheet, it is good practice to scope
them appropriately. Try prefixing your selector with your app name or "custom". Also note that
the `mat-dialog-container`'s padding is added by default via a selector with specificity of 1. The
customizing styles have a specificity of 2, so they will always take precedence.

由于你要把这些样式添加到全局样式表中，那么就要尽量把它们限制到最合适的范围。
建议给它们的选择器加上你的应用名或 "custom" 作为前缀。
另外，注意 `mat-dialog-container` 默认的衬距是使用一个特异度为 1 的选择器添加的，而这里的自定义样式使用的特异度是 2，所以这个自定义样式的优先级更高。

### Styling other components

### 为其它组件定制样式

If your component has view encapsulation turned on (default), your component styles will only
affect the top level children in your template. HTML elements belonging to child components cannot
be targeted by your component styles unless you do one of the following:

如果你的组件开启了样式封装（默认行为），那么你的组件样式将只会影响到模板中的顶级子元素。而属于子组件的 HTML 元素不会受到这些组件样式的影响，除非你这样做：

- Add the overriding style to your global stylesheet. Scope the selectors so that it only affects
the specific elements you need it to.

  把用来覆盖的样式添加到全局样式表中。要注意限制这些选择器的范围，让它只影响你希望影响的那些特定元素。

- Turn view encapsulation off on your component. If you do this, be sure to scope your styles
appropriately, or else you may end up incidentally targeting other components elswhere in your
application.

  关闭组件的样式封装特性。如果这样做，要注意给你的样式限定适当的范围，否则它就可能意外影响到你应用中的其它组件。

- Use a deprecated shadow-piercing descendant combinator to force styles to apply to all the child
elements. Read more about this deprecated solution in the
[Angular documentation](https://angular.io/guide/component-styles#deprecated-deep--and-ng-deep).

  使用已弃用的 Shadow DOM 穿透组合器，强制这些样式应用于组件的所有子元素。欲知详情，参见 [Angular 官方文档](https://angular.io/guide/component-styles#deprecated-deep--and-ng-deep)。
