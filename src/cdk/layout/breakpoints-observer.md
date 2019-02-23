### BreakpointsModule

When including the CDK's `LayoutModule`, components can inject `BreakpointsObserver` to request
the matching state of a CSS Media Query.

当包含了 CDK 的 `LayoutModule` 后，组件就可以注入 `BreakpointsObserver` 来获取 CSS 媒体查询的匹配状态。

A set of breakpoints is provided based on the Material Design
[breakpoint system](https://material.io/guidelines/layout/responsive-ui.html#responsive-ui-breakpoints).

根据 Material Design [断点体系](https://material.io/guidelines/layout/responsive-ui.html#responsive-ui-breakpoints)，CDK 提供了一组[断点](https://material.io/guidelines/layout/responsive-ui.html#responsive-ui-breakpoints) 。

#### Example

#### 例子

```ts
@Component({ ... })
export class MyWidget {
  isHandset: Observable<BreakpointState>;

  constructor(bm: BreakpointObserver) {
    bm.observe(Handset).subscribe((state: BreakpointState) => {
      if (state.matches) {
        this.makeEverythingFitOnSmallScreen();
      } else {
        this.expandEverythingToFillTheScreen();
      }
    });
  }
}
```
