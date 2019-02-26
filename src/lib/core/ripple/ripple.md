Connect user input to screen reactions by using ripples to both indicate the point of touch, and to
confirm that touch input was received. For touch or mouse, this occurs at the point of contact.

使用水波可以将用户的输入与屏幕的反应联系起来，以指示触摸点，并确认已收到输入。对于触摸或鼠标，水波都会出现在接触点上。

The `matRipple` attribute directive defines an area in which a ripple animates on user interaction.

属性型指令 `matRipple` 定义了一个区域，当和用户交互时，该区域就会播放一个水波动画。

```html
<div matRipple [matRippleColor]="myColor">
  <ng-content></ng-content>
</div>
```

By default, a ripple is activated when the host element of the `matRipple` directive receives
mouse or touch events. Upon being pressed, a ripple will begin fading in from the point of contact,
radiating to cover the host element. Each ripple will fade out only upon release of the mouse or touch.

默认情况下，当 `matRipple` 指令的宿主元素收到鼠标或触摸事件时，就会激活一个水波。当按下时，一个水波就会从接触点出现并逐渐消失，其辐射范围会覆盖宿主元件。当释放鼠标或结束触摸时，其水波就会淡出。

Ripples can also be triggered programmatically by getting a reference to the MatRipple directive
and calling its `launch` method.

还可以获得对 MatRipple 指令的引用并调用其 `launch` 方法，以编程的方式触发水波。

### Ripple trigger

### 水波触发

By default ripples will fade in on interaction with the directive's host element.
In some situations, developers may want to show ripples on interaction with *some other* element, 
but still want to have the ripples placed in another location. This can be done by specifying
the `matRippleTrigger` option that expects a reference to an `HTMLElement`.

默认情况下，当指令的宿主元素有交互时，水波会淡入。在某些情况下，开发人员可能希望在与*另一个*元素的交互中显示水波，但仍希望把这些水波在特定的位置播放。要做到这一点，可以为 `matRippleTrigger` 选项指定那个元素的 `HTMLElement` 引用。

```html
<div>
  <div matRipple [matRippleTrigger]="trigger" class="my-ripple-container">
    <!-- This is the ripple container, but not the trigger element for ripples. -->
  </div>
  
  <div #trigger></div>
</div>
```

### Manual ripples

### 手动水波

Ripples can be shown programmatically by getting a reference to the `MatRipple` directive.

通过引用 `MatRipple` 指令，可以用编程的方式显示水波。

```ts
class MyComponent {

  /** Reference to the directive instance of the ripple. */
  @ViewChild(MatRipple) ripple: MatRipple;
  
  /** Shows a centered and persistent ripple. */
  launchRipple() {
    const rippleRef = this.ripple.launch({
      persistent: true,
      centered: true
    });
    
    // Fade out the ripple later.
    rippleRef.fadeOut();
  }
}
```

In the example above, no specific coordinates have been passed, because the `centered`
ripple option has been set to `true` and the coordinates would not matter.

在上面的例子中，并没有传递特定的坐标，因为水波的 `centered` 选项已设置为 `true`，这时坐标就无关紧要了。

Ripples that are being dispatched programmatically can be launched with the `persistent` option.
This means that the ripples will not fade out automatically, and need to be faded out using
the `RippleRef` (*useful for focus indicators*).

那些以编程方式触发的水波可以通过 `persistent` 选项来启动。这意味着水波将不会自动淡出，而是需要使用 `RippleRef` 来让它淡出（*这对焦点指示器很有用*）。

In case, developers want to launch ripples at specific coordinates within the element, the
`launch()` method also accepts `x` and `y` coordinates as parameters. Those coordinates
are relative to the ripple container element.

如果开发人员希望在该元素内的指定坐标处启动水波，那么 `launch()` 方法也会接受 `x` 和 `y` 坐标作为参数。这些坐标是相对于该水波的容器元素的。

```ts
const rippleRef = this.ripple.launch(10, 10, {persistent: true});
```

### Global options

### 全局选项

Developers are able to specify options for all ripples inside of their application.

开发人员可以为应用中的所有水波指定一些选项。

The speed of the ripples can be adjusted and the ripples can be disabled globally as well.

可以调节水波的速度，也可以全局禁用它。

Global ripple options can be specified by setting the `MAT_RIPPLE_GLOBAL_OPTIONS` provider.

可以通过设置 `MAT_RIPPLE_GLOBAL_OPTIONS` 提供符来指定全局的水波选项。

```ts
const globalRippleConfig: RippleGlobalOptions = {
  disabled: true,
  animation: {
    enterDuration: 300,
    exitDuration: 0
  }
};

@NgModule({
  providers: [
    {provide: MAT_RIPPLE_GLOBAL_OPTIONS, useValue: globalRippleConfig} 
  ]
})
```

All available global options can be seen in the `RippleGlobalOptions` interface.

所有可用的全局选项都能在 `RippleGlobalOptions` 接口中找到。

### Disabling animation

### 禁用动画

The animation of ripples can be disabled by using the `animation` global option. If the 
`enterDuration` and `exitDuration` is being set to `0`, ripples will just appear without any
animation.

使用全局选项 `animation` 可以禁用水波的动画。如果 `enterDuration` 和 `exitDuration` 被设置为 `0`，那么当出现水波时就不会产生任何动画。

This is specifically useful in combination with the `disabled` global option, because globally
disabling ripples won't affect the focus indicator ripples. If someone still wants to disable
those ripples for performance reasons, the duration can be set to `0`, to remove the ripple feel.

这在与全局选项 `disabled` 共同出现的时候特别有用，因为全局禁用水波不会影响焦点指示器的水波效果。如果出于性能原因，有人仍要禁用这些水波，那么可以把持续时间设置为 `0`，以消除水波效果。

```ts
const globalRippleConfig: RippleGlobalOptions = {
  disabled: true,
  animation: {
    enterDuration: 0,
    exitDuration: 0
  }
};
```

**Note**: Ripples will also have no animation if the `NoopAnimationsModule` is being used. This
also means that the durations in the `animation` configuration won't be taken into account.

**注意**：如果正在使用 `NoopAnimationsModule `水波也不会有动画。这意味着不必考虑 `animation` 配置中的持续时间。

### Animation behavior

### 动画行为

There are two different animation behaviors for the fade-out of ripples shown in the Material
Design specifications.

Material Design 规范中所展示的水波淡出有两种不同的动画行为。

By default, all ripples will start fading out if the mouse or touch is released and the enter
animation completed. The second possible behavior, which is also shown in the specifications, is
that ripples start to fade out immediately on mouse or touch release.

默认情况下，如果释放鼠标或触摸并且已完成进场动画，那么所有水波都会淡出。另一种可能的行为，就是在放开鼠标或结束触摸时，水波也会立即淡出，正如规范中所要求的那样。

In some scenarios, developers might prefer that behavior over the default and would like to have
the same for Angular Material. This behavior can be activated by specifying the
`terminateOnPointerUp` global ripple option.

在某些情况下，开发人员可能更喜欢覆盖默认行为，并希望 Angular Material 也这样做。这时可以通过指定全局选项 `terminateOnPointerUp` 来激活第二种行为。

```ts
const globalRippleConfig: RippleGlobalOptions = {
  terminateOnPointerUp: true
};
```
