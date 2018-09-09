`mat-icon` makes it easier to use _vector-based_ icons in your app.  This directive supports both
icon fonts and SVG icons, but not bitmap-based formats (png, jpg, etc.).

`mat-icon` 让你在应用中使用*矢量*图标变得更容易。
该指令支持字体图标和 SVG 图标，但不支持位图格式（png、jpg 等）。

<!-- example(icon-overview) -->

### Registering icons

### 注册图标

`MatIconRegistry` is an injectable service that allows you to associate icon names with SVG URLs,
HTML strings and to define aliases for CSS font classes. Its methods are discussed below and listed
in the API summary.

`MatIconRegistry` 是一个可注入的服务，它允许你把图标名称和 SVG 的 URL、HTML 字符串 关联起来，还可以为 CSS 字体类定义别名。
具体方式稍后会进行讨论，并列在 API 摘要中。

### Font icons with ligatures

### 带有合字的字体图标

Some fonts are designed to show icons by using
[ligatures](https://en.wikipedia.org/wiki/Typographic_ligature), for example by rendering the text
"home" as a home image. To use a ligature icon, put its text in the content of the `mat-icon`
component.

有些字体是设计来用[合字](https://en.wikipedia.org/wiki/Typographic_ligature)的方式显示图标的，比如把文本格式的 "home" 显示为家的图标。要使用合字图标，请把它对应的文本放进 `mat-icon` 组件的内容中。

By default, `<mat-icon>` expects the
[Material icons font](http://google.github.io/material-design-icons/#icon-font-for-the-web).
(You will still need to include the HTML to load the font and its CSS, as described in the link).
You can specify a different font by setting the `fontSet` input to either the CSS class to apply to
use the desired font, or to an alias previously registered with
`MatIconRegistry.registerFontClassAlias`.

默认情况下，`<mat-icon>` 需要 [Material 字体图标](http://google.github.io/material-design-icons/#icon-font-for-the-web)。
（你可能还要在 HTML 中加载该字体及其 CSS 文件，像链接中所描述的那样）。
你可以将输入属性 `fontSet` 设置为要应用的 CSS 所依赖的字体，也可以设置为以前通过 `MatIconRegistry.registerFontClassAlias` 注册的某个别名。 

### Font icons with CSS

### 带有 CSS 的字体图标

Fonts can also display icons by defining a CSS class for each icon glyph, which typically uses a
`:before` selector to cause the icon to appear.
[FontAwesome](https://fortawesome.github.io/Font-Awesome/examples/) uses this approach to display
its icons. To use such a font, set the `fontSet` input to the font's CSS class (either the class
itself or an alias registered with `MatIconRegistry.registerFontClassAlias`), and set the `fontIcon`
input to the class for the specific icon to show.

字体还可以通过为每个图标字符定义 CSS 类来显示图标，它通常使用 `:before` 选择器来显示图标。
[FontAwesome](https://fortawesome.github.io/Font-Awesome/examples/) 就是通过这种方式显示图标的。
要使用这类字体，请把输入属性 `fontSet` 设置为该字体的 CSS 类（或者它本身的定义类或者通过 `MatIconRegistry.registerFontClassAlias` 注册的别名），并且把输入属性 `fontIcon` 设置为要显示的图标的专有类。

For both types of font icons, you can specify the default font class to use when `fontSet` is not
explicitly set by calling `MatIconRegistry.setDefaultFontSetClass`.

无论对于哪种字体图标，你都可以通过调用 `MatIconRegistry.setDefaultFontSetClass` 来指定一个默认字体类。当没有指定 `fontSet` 时就会使用它。

### SVG icons

### SVG 图标

When an `mat-icon` component displays an SVG icon, it does so by directly inlining the SVG content
into the page as a child of the component. (Rather than using an <img> tag or a div background
image). This makes it easier to apply CSS styles to SVG icons. For example, the default color of the
SVG content is the CSS
[currentColor](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentColor_keyword)
value. This makes SVG icons by default have the same color as surrounding text, and allows you to
change the color by setting the "color" style on the `mat-icon` element.

当 `mat-icon` 显示 SVG 图标时，它通过直接把 SVG 内容内联到页面中来实现。（而不用 <img> 标记或 div 的背景）。
这会让给 SVG 图标应用 CSS 样式变得更容易。比如 SVG 内容的默认颜色是 CSS 的 [currentColor](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#currentColor_keyword) 值。
这个值让 SVG 图标默认和周围的文本具有相同的颜色。你可以通过设置 `mat-icon` 元素的 "color" 样式来修改图标颜色。

In order to prevent XSS vulnerabilities, any SVG URLs and HTML strings passed to the
`MatIconRegistry` must be marked as trusted by using Angular's `DomSanitizer` service.

为了防范 XSS 漏洞，任何传给 `MatIconRegistry` 的 SVG URL 和 HTML 字符串都必须使用
Angular 的 `DomSanitizer` 服务标记为可信的。

Also note that all SVG icons, registered by URL, are fetched via XmlHttpRequest, and due to the
same-origin policy, their URLs must be on the same domain as the containing page, or their servers
must be configured to allow cross-domain access.

还要注意，所有通过 URL 注册的 SVG 图标都会通过 XmlHttpRequest 获取下来，而因为同源策略的限制，它们的 URL 必须和所属页面是同源的，或者它们的服务器就必须设置为允许跨域访问的。

#### Named icons

#### 命名图标

To associate a name with an icon URL, use the `addSvgIcon`, `addSvgIconInNamespace`,
`addSvgIconLiteral` or `addSvgIconLiteralInNamespace` methods of `MatIconRegistry`. After
registering an icon, it can be displayed by setting the `svgIcon` input. For an icon in the
default namespace, use the name directly. For a non-default namespace, use the format
`[namespace]:[name]`.

要把一个名字和图标的 URL 关联起来，请使用 `MatIconRegistry` 的 
`addSvgIcon`、`addSvgIconInNamespace`、`addSvgIconLiteral` 或 `addSvgIconLiteralInNamespace` 方法。
在注册了图标之后，它可以通过设置输入属性 `svgIcon` 进行显示。
对于默认命名空间中的图标，可以直接使用其名字。对于非默认命名空间，可以使用 `[namespace]:[name]` 格式。

#### Icon sets

#### 图标集

Icon sets allow grouping multiple icons into a single SVG file. This is done by creating a single
root `<svg>` tag that contains multiple nested `<svg>` tags in its `<defs>` section. Each of these
nested tags is identified with an `id` attribute. This `id` is used as the name of the icon.

图标集允许把多个图标分组到一个单一的 SVG 文件中。它可以通过创建一个单根 `<svg>` 标记来完成，该标记在其 `<defs>` 部分包含多个内嵌的 `<svg>` 标记。
每个内嵌标记都带有一个 `id` 属性，该属性就会用作图标的名字。

Icon sets are registered using the `addSvgIconSet`, `addSvgIconSetInNamespace`,
`addSvgIconSetLiteral` or `addSvgIconSetLiteralInNamespace` methods of `MatIconRegistry`.
After an icon set is registered, each of its embedded icons can be accessed by their `id`
attributes. To display an icon from an icon set, use the `svgIcon` input in the same way
as for individually registered icons.

图标集使用 `MatIconRegistry` 的 `addSvgIconSet`、`addSvgIconSetInNamespace`、`addSvgIconSetLiteral` 或 `addSvgIconSetLiteralInNamespace` 方法进行注册。
当注册了图标集之后，每个内嵌的图标都可以通过它们的 `id` 属性进行访问。要显示图标集中的某个图标，
只要像单独注册的图标那样使用输入属性 `svgIcon` 就可以了。

Multiple icon sets can be registered in the same namespace. Requesting an icon whose id appears in
more than one icon set, the icon from the most recently registered set will be used.

多个图标集可以注册进同一个命名空间。如果一个图标的 id 出现在多个图标集中，就会使用最近注册的图标集中的图标。

### Theming

### 主题

By default, icons will use the current font color (`currentColor`). this color can be changed to
match the current theme's colors using the `color` attribute. This can be changed to
`'primary'`, `'accent'`, or `'warn'`.

默认情况下，图标会使用当前字体颜色（`currentColor`）。该颜色可以使用 `color` 属性设置为当前主题中的颜色。
它可以修改为 `'primary'`、`'accent'` 或 `'warn'` 之一。

### Accessibility

### 可访问性

Similar to an `<img>` element, an icon alone does not convey any useful information for a
screen-reader user. The user of `<mat-icon>` must provide additional information pertaining to how
the icon is used. Based on the use-cases described below, `mat-icon` is marked as
`aria-hidden="true"` by default, but this can be overriden by adding `aria-hidden="false"` to the
element.

像任何 `<img>` 元素一样，图标本身并不会想屏幕阅读器用户传达任何有用的信息。
`<mat-icon>` 的使用者必须提供一些关于本图标用途的额外信息。根据稍后描述的用例，`mat-icon` 默认标记为 `aria-hidden="true"`，但是可以通过网元素上添加 `aria-hidden="false"` 来覆盖默认行为。

In thinking about accessibility, it is useful to place icon use into one of three categories:

在考察可访问性时，可以将图标归入下面三种类别之一：

1. **Decorative**: the icon conveys no real semantic meaning and is purely cosmetic.

   **装饰性的**：该图标不传达有意义的信息，是个纯粹的点缀。

2. **Interactive**: a user will click or otherwise interact with the icon to perform some action.

   **交互式的**：用户会点击它或用其它方式与此图标互动以执行某些操作。

3. **Indicator**: the icon is not interactive, but it conveys some information, such as a status. This
includes using the icon in place of text inside of a larger message.

   **指示符**：该图标不是交互式的，但传达某些信息，比如状态。这种情况也包括在大型消息的文本中使用图标。

### Bidirectionality

### 双向文字

By default icons in an RTL layout will look exactly the same as in LTR, however certain icons have
to be [mirrored for RTL users](https://material.io/guidelines/usability/bidirectionality.html). If
you want to mirror an icon only in an RTL layout, you can use the `mat-icon-rtl-mirror` CSS class.

默认情况下，在 RTL 布局下的图标和 LTR 布局下是完全一样的，不过某些图标必须[为 RTL 用户进行镜像处理](https://material.io/guidelines/usability/bidirectionality.html)。
如果你只想在 RTL 布局下镜像某个图标，可以使用 `mat-icon-rtl-mirror` 类。

```html
<mat-icon class="mat-icon-rtl-mirror" svgIcon="thumb-up"></mat-icon>
```

#### Decorative icons

#### 装饰性图标

When the icon is purely cosmetic and conveys no real semantic meaning, the `<mat-icon>` element
is marked with `aria-hidden="true"`.

当该图标纯粹是点缀，并且没有传达有意义的信息时，`<mat-icon>` 元素要标记为 `aria-hidden="true"`。

#### Interactive icons

#### 互动式图标

Icons alone are not interactive elements for screen-reader users; when the user would interact with
some icon on the page, a more appropriate  element should "own" the interaction:

图标本身对屏幕阅读器用户不是交互式元素。当用户要和页面中的某个图标交互时，应该让更合适的元素来负责交互：

* The `<mat-icon>` element should be a child of a `<button>` or `<a>` element.

  `<mat-icon>` 元素应该是 `<button>` 或 `<a>` 元素之一。

* The parent `<button>` or `<a>` should either have a meaningful label provided either through
direct text content, `aria-label`, or `aria-labelledby`.

  父元素 `<button>` 或 `<a>` 应该通过文本内容、`aria-label` 或 `aria-labelledby`提供一个有意义的标签。

#### Indicator icons

#### 指示符图标

When the presence of an icon communicates some information to the user whether as an indicator or 
by being inlined into a block of text, that information must also be made available to 
screen-readers. The most straightforward way to do this is to

如果某个图标的存在是为了给用户传达一些信息，那么无论它是作为指示符还是内联到文本块中，该信息都必须可以供屏幕阅读器使用。最直接的实现方式有：

1. Add a `<span>` as an adjacent sibling to the `<mat-icon>` element with text that conveys the same
information as the icon.

   给 `<mat-icon>` 元素添加一个相邻的兄弟 `<span>`，用它传达与图标相同的信息。 

2. Add the `cdk-visually-hidden` class to the `<span>`. This will make the message invisible
on-screen but still available to screen-reader users.

   给 `<span>` 添加一个 `cdk-visually-hidden` 类，这会导致在屏幕上看不见该信息，但屏幕阅读器用户仍然可以读取它。
