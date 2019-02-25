# Angular Material typography

# Angular Material 的排版

### What is typography?

### 什么是排版？

Typography is a way of arranging type to make text legible, readable, and appealing when displayed.
Angular Material's typography is based on the guidelines from the [Material Design spec][1] and is
arranged into typography levels. Each level has a `font-size`, `line-height` and `font-weight`. The
available levels are:

排版是一种排列字型的方式，它让文本在显示时更加清晰、易读、富有吸引力。Angular Material 的排版基于 [Material Design 规范][1]中给出的指导原则，并按排版等级进行排列。每个等级都有自己的 `font-size`、`line-height` 和 `font-weight`。
有效的等级包括：

| Name            | CSS classes                      | Description                                                                 |
|-----------------|----------------------------------|-----------------------------------------------------------------------------|
| 名称            | CSS 类                      | 说明                                                                 |
| `display-4`     | `.mat-display-4`                 | Large, one-off header, usually at the top of the page (e.g. a hero header). |
| `display-4`     | `.mat-display-4`                 | 大型的，只出现一次的头，通常位于页面的顶部（比如 hero 的头部） |
| `display-3`     | `.mat-display-3`                 | Large, one-off header, usually at the top of the page (e.g. a hero header). |
| `display-3`     | `.mat-display-3`                 | 大型的，只出现一次的头，通常位于页面的顶部（比如 hero 的头部） |
| `display-2`     | `.mat-display-2`                 | Large, one-off header, usually at the top of the page (e.g. a hero header). |
| `display-2`     | `.mat-display-2`                 | 大型的，只出现一次的头，通常位于页面的顶部（比如 hero 的头部） |
| `display-1`     | `.mat-display-1`                 | Large, one-off header, usually at the top of the page (e.g. a hero header). |
| `display-1`     | `.mat-display-1`                 | 大型的，只出现一次的头，通常位于页面的顶部（比如 hero 的头部） |
| `headline`      | `.mat-h1`, `.mat-headline`       | Section heading corresponding to the `<h1>` tag.                            |
| `headline`      | `.mat-h1`, `.mat-headline`       | 与 `<h1>` 标签对应的小节的头部 |
| `title`         | `.mat-h2`, `.mat-title`          | Section heading corresponding to the `<h2>` tag.                            |
| `title`         | `.mat-h2`, `.mat-title`          | 与 `<h2>` 标签对应的小节的头部 |
| `subheading-2`  | `.mat-h3`, `.mat-subheading-2`   | Section heading corresponding to the `<h3>` tag.                            |
| `subheading-2`  | `.mat-h3`, `.mat-subheading-2`   | 与 `<h3>` 标签对应的小节的头部 |
| `subheading-1`  | `.mat-h4`, `.mat-subheading-1`   | Section heading corresponding to the `<h4>` tag.                            |
| `subheading-1`  | `.mat-h4`, `.mat-subheading-1`   | 与 `<h4>` 标签对应的小节的头部 |
| `body-1`        | `.mat-body`, `.mat-body-1`       | Base body text.                                                             |
| `body-1`        | `.mat-body`, `.mat-body-1`       | 基本的正文文本。 |
| `body-2`        | `.mat-body-strong`, `.mat-body-2`| Bolder body text.                                                           |
| `body-2`        | `.mat-body-strong`, `.mat-body-2`| 较粗的正文文本。 |
| `caption`       | `.mat-small`, `.mat-caption`     | Smaller body and hint text.                                                 |
| `caption`       | `.mat-small`, `.mat-caption`     | 较小的正文文本和提示文本。 |
| `button`        | None. Used only in components.   | Buttons and anchors.                                                        |
| `button`        | 无。只用于组件中。  | 按钮与链接。 |
| `input`         | None. Used only in components.   | Form input fields.                                                          |
| `input`         | 无。只用于组件中。 | 表单输入字段。 |

The typography levels are collected into a typography config which is used to generate the CSS.

这些排版等级都收集到了一个用来生成 CSS 的排版配置对象中。

### Usage

### 用法

To get started, you first include the `Roboto` font with the 300, 400 and 500 weights.
You can host it yourself or include it from [Google Fonts][2]:

在开始之前，你要先把 300、400 和 500 磅字重的 `Roboto` 字体包含进来。
你可以自己提供它，也可以从 [Google Fonts][2] 中包含它。

```html
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
```

Now you can add the appropriate CSS classes to the elements that you want to style:

现在，你就可以为想设置样式的元素添加一些适当的 CSS 类了。

```html
<h1 class="mat-display-1">Jackdaws love my big sphinx of quartz.</h1>
<h2 class="mat-h2">The quick brown fox jumps over the lazy dog.</h2>
```

By default, Angular Material doesn't apply any global CSS. To apply the library's typographic styles
more broadly, you can take advantage of the `mat-typography` CSS class. This class will style all
descendant native elements.

默认情况下，Angular Material 不会应用任何全局 CSS。要更广泛的应用本库中的排版风格，你可以使用 `mat-typography` CSS 类。
这个类会为所有下属的原生元素设置样式。

```html
<!-- By default, Angular Material applies no global styles to native elements. -->
<h1>This header is unstyled</h1>

<!-- Applying the mat-tyography class adds styles for native elements. -->
<section class="mat-typography">
  <h1>This header will be styled</h1>
</section>
```

### Customization

### 自定义

Typography customization is an extension of Angular Material's Sass-based theming. Similar to
creating a custom theme, you can create a custom **typography configuration**.

排版定制是 Angular Material 的一个基于 Sass 的扩展方式。
和创建自定义主题类似，你也可以创建一个自定义的**排版配置**。

```scss
@import '~@angular/material/theming';

// Define a custom typography config that overrides the font-family as well as the
// `headlines` and `body-1` levels.
$custom-typography: mat-typography-config(
  $font-family: 'Roboto, monospace',
  $headline: mat-typography-level(32px, 48px, 700),
  $body-1: mat-typography-level(16px, 24px, 500)
);
```

As the above example demonstrates, a typography configuration is created by using the
`mat-typography-config` function, which is given both the font-family and the set of typographic
levels described earlier. Each typographic level is defined by the `mat-typography-level` function,
which requires a `font-size`, `line-height`, and `font-weight`. **Note** that the `font-family`
has to be in quotes.

正如上面这个例子所演示的，排版配置是使用 `mat-typography-config` 函数创建的，它会同时给出字体家族和一组前面讲过的排版等级。
每个排版等级都是用 `mat-typography-level` 函数定义的，它需要 `font-size`、`line-height` 和 `font-weight`。
**注意**，`font-family` 的值必须带引号。

Once the custom typography definition is created, it can be consumed to generate styles via
different Sass mixins.

一旦创建了自定义的排版定义对象，就可以借助不同的 Sass 混入器来用它生成样式了。

```scss
// Override typography CSS classes (e.g., mat-h1, mat-display-1, mat-typography, etc.).
@include mat-base-typography($custom-typography);

// Override typography for a specific Angular Material components.
@include mat-checkbox-typography($custom-typography);

// Override typography for all Angular Material, including mat-base-typography and all components.
@include angular-material-typography($custom-typography);
```

If you're using Material's theming, you can also pass in your typography config to the
`mat-core` mixin:

如果你在使用 Material 的主题，还可以把你的排版配置对象传给 `mat-core` 混入器：

```scss
// Override the typography in the core CSS.
@include mat-core($custom-typography);
```

For more details about the typography functions and default config, see the
[source](https://github.com/angular/material2/blob/master/src/lib/core/typography/_typography.scss).

要了解排版函数的详情及其默认配置，参见[源码](https://github.com/angular/material2/blob/master/src/lib/core/typography/_typography.scss)。

### Material typography in your custom CSS

### 在自定义 CSS 中使用 Material 排版

Angular Material includes typography utility mixins and functions that you can use to customize your
own components:

Angular Material 包含一些排版工具的混入器和函数，你可以用它们来定制自己的组件：

* `mat-font-size($config, $level)` - Gets the `font-size`, based on the provided config and level.

  `mat-font-size($config, $level)` - 根据所提供的配置和等级，获取 `font-size`。

* `mat-font-family($config)` - Gets the `font-family`, based on the provided config.

  `mat-font-family($config)` - 根据所提供的配置，获取 `font-family`。

* `mat-line-height($config, $level)` - Gets the `line-height`, based on the provided
config and level.

  `mat-line-height($config, $level)` - 根据所提供的配置和等级，获取 `line-height`。

* `mat-font-weight($config, $level)` - Gets the `font-weight`, based on the provided
config and level.

  `mat-font-weight($config, $level)` - 根据所提供的配置和等级，获取 `font-weight`。

* `mat-typography-level-to-styles($config, $level)` - Mixin that takes in a configuration object
and a typography level, and outputs a short-hand CSS `font` declaration.

  `mat-typography-level-to-styles($config, $level)` - 这个混入器接受一个配置对象和一个排版等级，并输出一个简短的 CSS `font` 声明。


```scss
@import '~@angular/material/theming';

// Create a config with the default typography levels.
$config: mat-typography-config();

// Custom header that uses only the Material `font-size` and `font-family`.
.unicorn-header {
  font-size: mat-font-size($config, headline);
  font-family: mat-font-family($config);
}

// Custom title that uses all of the typography styles from the `title` level.
.unicorn-title {
  @include mat-typography-level-to-styles($config, title);
}
```


[1]: https://material.io/archive/guidelines/style/typography.html
[2]: https://fonts.google.com/
