Angular Material buttons are native `<button>` or `<a>` elements enhanced with Material Design
styling and ink ripples.

Angular Material 按钮使用 Material Design 的样式和墨水涟漪等对原生的 `<button>` 或 `<a>` 元素进行增强。

<!-- example(button-overview) -->

Native `<button>` and `<a>` elements are always used in order to provide the most straightforward
and accessible experience for users. A `<button>` element should be used whenever some _action_
is performed. An `<a>` element should be used whenever the user will _navigate_ to another view.

原生的 `<button>` 和 `<a>` 元素经常用来为用户提供最直白、易用的交互体验。
当要执行某些*动作*时，应该使用 `<button>` 元素。
当用户要*导航*到其它视图时，应该使用 `<a>` 元素。

There are several button variants, each applied as an attribute:

按钮有多种变体，每种都用一个属性来定义：

| 属性            | 说明                                                              |
|----------------------|--------------------------------------------------------------------------|
| `mat-button`         | <p translation-result>方形文字按钮 / 无高程（Z 轴位置）</p><p translation-origin="off">Rectangular text button w/ no elevation                                  </p>
| `mat-raised-button`  | <p translation-result>方形填充按钮 / 有高程</p><p translation-origin="off">Rectangular contained button w/ elevation                                </p>
| `mat-flat-button`    | <p translation-result>方形填充按钮 / 无高程</p><p translation-origin="off">Rectangular contained button w/ no elevation                             </p>
| `mat-stroked-button` | <p translation-result>方形外框按钮 / 无高程</p><p translation-origin="off">Rectangular outlined button w/ no elevation                              </p>
| `mat-icon-button`    | <p translation-result>圆形无背景按钮，通常就是个图标</p><p translation-origin="off">Circular button with a transparent background, meant to contain an icon  </p>
| `mat-fab`            | <p translation-result>圆形按钮 / 有高程，默认使用主题中的 accent 颜色</p><p translation-origin="off">Circular button w/ elevation, defaults to theme's accent color           </p>
| `mat-mini-fab`       | <p translation-result>与 `mat-tab` 一样，但更小</p><p translation-origin="off">Same as `mat-fab` but smaller                                            </p>


### Theming

### 主题

Buttons can be colored in terms of the current theme using the `color` property to set the
background color to `primary`, `accent`, or `warn`.

可以通过把 `color` 属性设置为 `primary`、`accent` 或 `warn` 来把按钮的背景色设置当前主题中的颜色。

### capitalization

### 大写化

According to the Material design spec button text has to be capitalized, however we have opted not
to capitalize buttons automatically via `text-transform: uppercase`, because it can cause issues in
certain locales. It is also worth noting that using ALL CAPS in the text itself causes issues for
screen-readers, which will read the text character-by-character. We leave the decision of how to
approach this to the consuming app.

根据 Material Design 规范，按钮文本应该是大写的，不过我们选择不让它自动通过 `text-transform: uppercase` 进行大写化，因为这可能会在某些区域设置下导致问题。
值得注意的是，如果把文字本身写成全大写形式（而不是通过 css），可能会导致某些屏幕阅读器出现问题 —— 它将会一个字符一个字符的把文本读出来。
所以我们决定让应用开发者自己来决定用哪种形式。

### Accessibility

### 可访问性

Angular Material uses native `<button>` and `<a>` elements to ensure an accessible experience by
default. The `<button>` element should be used for any interaction that _performs an action on the
current page_. The `<a>` element should be used for any interaction that _navigates to another
view_.

Angular Material 使用原生的 `<button>` 和 `<a>` 元素，来保留默认的可访问性体验。
当要执行某些*动作*时，应该使用 `<button>` 元素。
当用户要*导航*到其它视图时，应该使用 `<a>` 元素。

Buttons or links containing only icons (such as `mat-fab`, `mat-mini-fab`, and `mat-icon-button`)
should be given a meaningful label via `aria-label` or `aria-labelledby`.

对于那些只含图标的按钮或链接（比如 `mat-fab`、`mat-mini-fab` 和 `mat-icon-button`），应该通过 `aria-label` 或 `aria-labelledby` 给出一个有意义的标签。
