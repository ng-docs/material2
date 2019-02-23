The `layout` package provides utilities to build responsive UIs that react to screen-size changes. 

这个 `layout` 包提供了一些工具来构建响应式用户界面，以响应屏幕尺寸的变化。

### BreakpointObserver

`BreakpointObserver` is a utility for evaluating media queries and reacting to their changing.

`BreakpointObserver` 是一个用于对媒体查询进行求值，并对其变化作出反应的实用工具。

#### Evaluate against the current viewport

#### 针对当前视口求值

The `isMatched` method is used to evaluate one or more media queries against the current viewport
size.

`isMatched` 方法用于根据当前视口大小来对一个或多个媒体查询进行求值。

```ts
const isSmallScreen = breakpointObserver.isMatched('(max-width: 599px)');
```

#### React to changes to the viewport

#### 对视口的更改做出反应

The `observe` method is used to get an observable stream that will emit whenever one of the given
media queries would have a different result.

`observe` 方法用于得到一个可观察对象的流，只要其中指定的任何一个媒体查询中有不同的结果，它就会发出事件。

```ts
const layoutChanges = breakpointObserver.observe([
  '(orientation: portrait)',
  '(orientation: landscape)',
]);

layoutChanges.subscribe(result => {
  updateMyLayoutForOrientationChange();
});
```

#### Default breakpoints

#### 默认断点

A set of default media queries are available corresponding to breakpoints for different device
types.

一组默认的媒体查询对应着不同设备类型的断点。

```ts
import {BreakpointObserver, Breakpoints} from '@angular/cdk/layout';

@Component({...})
class MyComponent {
  constructor(breakpointObserver: BreakpointObserver) {
    breakpointObserver.observe([
      Breakpoints.HandsetLandscape,
      Breakpoints.HandsetPortrait
    ]).subscribe(result => {
      if (result.matches) {
        this.activateHandsetLayout();
      }
    });
  }
}
```

The built-in breakpoints based on [Google's Material Design
specification](https://material.io/guidelines/layout/responsive-ui.html#responsive-ui-breakpoints).
The available values are:

内置的断点基于 [Google 的 Material Design 规范](https://material.io/guidelines/layout/responsive-ui.html#responsive-ui-breakpoints) 。可用的值有：

- Handset

  Handset - 手持设备

- Tablet

  Tablet - 平板电脑

- Web
- HandsetPortrait

  HandsetPortrait - 手持设备竖屏

- TabletPortrait

  TabletPortrait - 平板电脑竖屏

- WebPortrait

  WebPortrait - Web 竖屏

- HandsetLandscape

  HandsetLandscape - 手持设备横屏

- TabletLandscape

  TabletLandscape - 平板电脑横屏

- WebLandscape

  WebLandscape - Web 横屏

### MediaMatcher

`MediaMatcher` is a lower-level utility that wraps the native `matchMedia`. This service normalizes
browser differences and serves as a convenient API that can be replaced with a fake in unit tests.
The `matchMedia` method can be used to get a native
[`MediaQueryList`](https://developer.mozilla.org/en-US/docs/Web/API/MediaQueryList).

`MediaMatcher` 是一个较底层的实用工具，它是对原生 `matchMedia` 的包装。该服务规范了浏览器的差异，可以作为一个便利 API 实用，可以在单元测试时用假对象来代替它。`matchMedia` 方法可以用来获取原生的 [`MediaQueryList`](https://developer.mozilla.org/en-US/docs/Web/API/MediaQueryList)。

```ts
@Component({...})
class MyComponent {
  constructor(mediaMatcher: MediaMatcher) {
    const mediaQueryList = mediaMatcher.matchMedia('(min-width: 1px)');
  }
}
```
