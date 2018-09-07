Badges are small status descriptors for UI elements. A badge consists of a small circle, 
typically containing a number or other short set of characters, that appears in proximity to
another object.

徽章是对 UI 元素的小型状态描述器。徽章包括一个小圆圈，通常还包括一个数字或一组其它短字符。
徽章通常会出现在另一个对象附近。

<!-- example(badge-overview) -->

### Badge position

### 徽章位置

By default, the badge will be placed `above after`. The direction can be changed by defining
the attribute `matBadgePosition` follow by `above|below` and `before|after`.

默认情况下，徽章会出现在右上方（`above after`）。要修改此方位，可以定义 `matBadgePosition` 属性，并将其赋值为 `above|below` 和 `before|after` 的组合。

```html
<mat-icon matBadge="22" matBadgePosition="above after">home</mat-icon>
```

The overlap of the badge in relation to its inner contents can also be defined
using the `matBadgeOverlap` tag. Typically, you want the badge to overlap an icon and not
a text phrase. By default it will overlap.


还可以用 `matBadgeOverlap` 属性来定义此徽章与其内容的重叠度。
通常，你会希望徽章与图标重叠，而不要与文本重叠。默认情况下它会重叠。

```html
<h1 matBadge="11" matBadgeOverlap="false">
  Email
</h1>
```

### Badge sizing

### 徽章尺寸

The badge has 3 sizes: `small`, `medium` and `large`. By default, the badge is set to `medium`.
You can change the size by adding `matBadgeSize` to the host element.

徽章有三种尺寸：`small`（小）、`medium`（中）和 `large`（大）。默认情况下，徽章尺寸是 `medium`。
你可以在宿主元素上添加 `matBadgeSize` 属性来改变徽章尺寸。

```html
<h1 matBadge="11" matBadgeSize="large">
  Email
</h1>
```

### Badge visibility

### 徽章可见性

The badge visibility can be toggled programmatically by defining `matBadgeHidden`.

徽章的可见性可以通过定义 `matBadgeHidden` 属性来在程序控制下进行切换。

```html
<h1 matBadge="11" [matBadgeHidden]="!visible">
  Email
</h1>
```

### Theming

### 主题

Badges can be colored in terms of the current theme using the `matBadgeColor` property to set the
background color to `primary`, `accent`, or `warn`.

徽章可以通过把 `matBadgeColor` 属性设置为 `primary`、`accent` 或 `warn` 之一来指定在它当前主题下的背景色。 

```html
<mat-icon matBadge="22" matBadgeColor="accent">
  home
</mat-icon>
```

### Accessibility

### 可访问性

Badges should be given a meaningful description via `matBadgeDescription`. This description will be
applied, via `aria-describedby` to the element decorated by `matBadge`.

徽章应该通过 `matBadgeDescription` 来给出一个有意义的描述信息。该描述信息将会通过 `aria-describedby` 属性应用到 `matBadge` 所修饰的元素上。

When applying a badge to a `<mat-icon>`, it is important to know that the icon is marked as
`aria-hidden` by default. If the combination of icon and badge communicates some meaningful
information, that information should be surfaced in another way. [See the guidance on indicator
icons for more information](https://material.angular.io/components/icon/overview#indicator-icons).

当给 `<mat-icon>` 添加徽章时，一定要知道一点：此图标默认是标记为 `aria-hidden` 的。
如果要通过图标和徽章的组合表达某些信息，那么该信息就要通过其它方式表现出来。[欲知详情，参见指示器图标的指南](/components/icon/overview#indicator-icons)