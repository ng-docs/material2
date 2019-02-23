### MediaMatcher

When including the CDK's `LayoutModule`, components can inject `MediaMatcher` to access the 
matchMedia method, if available on the platform.

当包含了 CDK 的 `LayoutModule` 时，组件就可以注入 `MediaMatcher` 来访问 matchMedia 方法（如果在该平台上可用的话）。

#### Example

#### 例子

```ts
@Component({ ... }) 
export class MyWidget {  
  constructor(mm: MediaMatcher) {
    mm.matchMedia('(orientation: landscape)').matches ? 
      this.setLandscapeMode() :
      this.setPortraitMode();
  }
}  
```
