### Theming your custom component with Angular Material's theming system

### 使用 Angular Material 的主题体系为自定义组件应用主题

In order to style your own components with Angular Material's tooling, the component's styles must
be defined with Sass.

要想借助 Angular Material 来为你自己的组件添加样式，必须使用 Sass 来定义该组件的样式。

#### 1. Define all color and typography styles in a "theme file" for the component

#### 1. 在 "主题文件" 中为该组件定义所有颜色和字体风格

First, create a Sass mixin that accepts an Angular Material theme and outputs the color-specific
styles for the component. An Angular Material theme definition is a Sass map.

首先，创建一个 Sass mixin，它接受一个 Angular Material 主题，并为该组件输出一些特定颜色的样式。
Angular Material 的主题定义就是一个 Sass 的 map 结构。

For example, if building a custom carousel component:

比如，如果要构建自定义的轮播（carousel）组件：

```scss
// Import library functions for theme creation.
@import '~@angular/material/theming';

// Define a mixin that accepts a theme and outputs the theme-specific styles.
@mixin candy-carousel-theme($theme) {
  // Extract the palettes you need from the theme definition.
  $primary: map-get($theme, primary);
  $accent: map-get($theme, accent);
  
  // Define any styles affected by the theme.
  .candy-carousel {
    // Use mat-color to extract individual colors a palette.
    background-color: mat-color($primary);
    border-color: mat-color($accent, A400);
  }
}
```

Second, create another Sass mixin that accepts an Angular Material typography definition and outputs
typographic styles. For example:

第二步，创建另一个 Sass mixin，它的参数是 Angular Material 文字定义，输出是一些文字样式。比如：

```scss
@mixin candy-carousel-typography($config) {
  .candy-carousel {
    font: {
      family: mat-font-family($config, body-1);
      size: mat-font-size($config, body-1);
      weight: mat-font-weight($config, body-1);
    }
  }
}
```

See the [typography guide](https://material.angular.io/guide/typography) for more information on
typographic customization.

参见[文字风格指南](/guide/typography)以了解自定义字体的更多信息。

#### 2. Define all remaining styles in a normal component stylesheet.

#### 2. 在标准的组件样式表中定义剩下的所有样式。

Define all styles unaffected by the theme in a separate file referenced directly in the component's
`styleUrl`.  This generally includes everything except for color and typography styles.

在独立的文件中定义所有不受主题影响的样式，并在组件的 `styleUrls` 中直接引用它。

#### 3. Include the theme mixin in your application

#### 3. 在应用中包含主题的 mixin

Use the Sass `@include` keyword to include a component's theme mixin wherever you're already
including Angular Material's built-in theme mixins. 

无论你是否已经包含了 Angular Material 内置的那些主题 mixin，都要使用 Sass 的 `@include` 关键字来包含组件的主题 mixin。

```scss
// Import library functions for theme creation.
@import '~@angular/material/theming';

// Include non-theme styles for core.
@include mat-core();

// Define your application's custom theme.
$primary: mat-palette($mat-indigo);
$accent:  mat-palette($mat-pink, A200, A100, A400);
$theme: mat-light-theme($primary, $accent);

// Include theme styles for Angular Material components.
@include angular-material-theme($theme);

// Include theme styles for your custom components.
@include candy-carousel-theme($theme);
```


#### Note: using the `mat-color` function to extract colors from a palette

#### 注意：要用 `mat-color` 函数来从调色板中提取出各种颜色

You can consume the theming functions and Material Design color palettes from
`@angular/material/theming`. The `mat-color` Sass function extracts a specific color from a palette.
For example:

你可以使用来自 `@angular/material/theming` 的主题函数和 Material Design 调色板变量，还可以用 Sass 函数 `mat-color` 来把指定的颜色从调色板中提取出来。比如：

```scss
// Import theming functions
@import '~@angular/material/theming';

.candy-carousel {
  // Get the default hue for a palette.
  color: mat-color($primary);
  
  // Get a specific hue for a palette. 
  // See https://material.io/archive/guidelines/style/color.html#color-color-palette for hues.
  background-color: mat-color($accent, 300);
  
  // Get a relative color for a hue ('lighter' or 'darker')
  outline-color: mat-color($accent, lighter);

  // Get a constrast color for a hue by adding `-contrast` to any other key.
  border-color: mat-color($primary, '100-constrast');
}
```
