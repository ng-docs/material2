The `bidi` package provides a common system for components to get and respond to change in the
application's LTR/RTL layout direction. 

`bidi` 包为组件提供了一个通用的体系，来获取和响应该应用的 LTR（从左到右）/RTL（从右到左）布局方向的变化。

### Directionality

### 方向性

When including the CDK's `BidiModule`, components can inject `Directionality` to get the current
text direction (RTL or LTR);

当包含 CDK 的 `BidiModule` 时，组件中就可以注入 `Directionality` 来获取当前的文本方向了（RTL或者LTR）;

#### Example

#### 例子

```ts
@Component({ ... }) 
export class MyWidget implements OnDestroy {

  /** Whether the widget is in RTL mode or not. */
  private isRtl: boolean;
  
  /** Subscription to the Directionality change EventEmitter. */
  private _dirChangeSubscription = Subscription.EMPTY;  
  
  constructor(dir: Directionality) {
    this.isRtl = dir.value === 'rtl';
    
    _dirChangeSubscription = dir.change.subscribe(() => {
      this.flipDirection();
    });
  }
  
  ngOnDestroy() {
    this._dirChangeSubscription.unsubscribe();
  }
}  
```

### The `Dir` directive

### `Dir` 指令

The `BidiModule` also includes a directive that matches any elements with a `dir` attribute. This
directive has the same API as Directionality and provides itself *as* `Directionality`. By doing
this, any component that injects `Directionality` will get the closest ancestor layout direction
context.

`BidiModule` 还包含一个指令，用来匹配所有带 `dir` 属性的元素。该指令与 Directionality 具有相同的API，并将自身*作为* `Directionality` 的服务提供商。这样一来，任何注入了 `Directionality` 的组件都会得到关于最近祖先的布局方向上下文。
