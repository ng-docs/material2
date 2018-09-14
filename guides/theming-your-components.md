# Theming your custom components

# 为你的自定义组件添加样式

In order to style your own components with Angular Material's tooling, the component's styles must be defined with Sass.

为了用 Angular Material 的工具来设置自己的组件样式，你必须使用 Sass。

### Using `@mixin` to automatically apply a theme

### 使用 `@mixin` 来自动应用主题

#### Why using `@mixin`

#### 为何使用 `@mixin`

The advantage of using a `@mixin` function is that when you change your theme, every file that uses it will be automatically updated.
Calling the `@mixin` with a different theme argument allows multiple themes within the app or component.

使用 `@mixin` 函数的优点是，当你修改主题时，用到它的每个文件都会自动修改。
调用 `@mixin` 并传给它不同的主题参数，将会为应用或组件应用多重主题。

#### How to use `@mixin`

#### 如何使用 `@mixin`

We can better theme our custom components by adding a `@mixin` function to its theme file, and then call this function to apply a theme.

通过往主题文件中添加 `@mixin` 函数，并调用它来应用主题，我们可以更好地为自定义组件设置主题。

All you need is to create a `@mixin` function in the custom-component-theme.scss

你要做的一切就是在 `custom-component-theme.scss` 文件中创建一个 `@mixin` 函数。

```scss
// Import all the tools needed to customize the theme and extract parts of it
@import '~@angular/material/theming';

// Define a mixin that accepts a theme and outputs the color styles for the component.
@mixin candy-carousel-theme($theme) {
  // Extract whichever individual palettes you need from the theme.
  $primary: map-get($theme, primary);
  $accent: map-get($theme, accent);

  // Use mat-color to extract individual colors from a palette as necessary.
  .candy-carousel {
    background-color: mat-color($primary);
    border-color: mat-color($accent, A400);
  }
}
```

Now you just have to call the `@mixin` function to apply the theme:

现在，你只要调用 `@mixin` 函数来应用此主题就可以了：

```scss
// Import a pre-built theme
@import '~@angular/material/prebuilt-themes/deeppurple-amber.css';
// Import your custom input theme file so you can call the custom-input-theme function
@import 'app/candy-carousel/candy-carousel-theme.scss';

// Using the $theme variable from the pre-built theme you can call the theming function
@include candy-carousel-theme($theme);
```

For more details about the theming functions, see the comments in the
[source](https://github.com/angular/material2/blob/master/src/lib/core/theming/_theming.scss).

要了解关于主题函数的更多知识，可参见[源码](https://github.com/angular/material2/blob/master/src/lib/core/theming/_theming.scss)中的注释。

#### Best practices using `@mixin`

#### 使用 `@mixin` 的最佳实践

When using `@mixin`, the theme file should only contain the definitions that are affected by the passed-in theme.

当使用 `@mixin` 时，主题文件中应该只包含受传入的主题影响的那些样式定义。

All styles that are not affected by the theme should be placed in a `candy-carousel.scss` file.
This file should contain everything that is not affected by the theme like sizes, transitions...

所有不会受主题影响的样式都应该放进 `candy-carousel.scss` 文件中。
这个文件可以包含不受主题影响的任何东西，比如尺寸、过渡等。

Styles that are affected by the theme should be placed in a separated theming file as
`_candy-carousel-theme.scss` and the file should have a `_` before the name. This file should
contain the `@mixin` function responsible for applying the theme to the component.

所有受主题影响的样式应该放进一个独立的主题文件中，如 `_candy-carousel-theme.scss`，该文件的名字应该带有一个 `_` 前缀。
该文件应该包含一个负责把主题应用到组件上的 `@mixin` 函数。

### Using colors from a palette

### 从调色板中使用颜色

You can consume the theming functions and Material palette variables from
`@angular/material/theming`. You can use the `mat-color` function to extract a specific color
from a palette. For example:

你可以使用来自 `@angular/material/theming` 的主题函数和调色板变量，还可以用 `mat-color` 函数来把指定的颜色从调色板中提取出来。比如：

```scss
// Import theming functions
@import '~@angular/material/theming';
// Import your custom theme
@import 'src/unicorn-app-theme.scss';

// Use mat-color to extract individual colors from a palette as necessary.
// The hue can be one of the standard values (500, A400, etc.), one of the three preconfigured
// hues (default, lighter, darker), or any of the aforementioned prefixed with "-contrast".
// For example a hue of "darker-contrast" gives a light color to contrast with a "darker" hue.
// Note that quotes are needed when using a numeric hue with the "-contrast" modifier.
// Available color palettes: https://material.io/design/color/
.candy-carousel {
  background-color: mat-color($candy-app-primary);
  border-color: mat-color($candy-app-accent, A400);
  color: mat-color($candy-app-primary, '100-contrast');
}
```
