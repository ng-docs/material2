# Scroll strategies

# 滚动策略

## What is a scroll strategy?

## 什么是滚动策略？

A scroll strategy is a way of describing how an overlay should behave if the user scrolls
while the overlay is open. The strategy has a reference to the `OverlayRef`, allowing it to
recalculate the position, close the overlay, block scrolling, etc.

滚动策略是一种描述浮层处于打开状态时，当用户滚动浮层的行为方式。该策略带有一个 `OverlayRef` 的引用，这样它就可以重新计算位置、关闭浮层、阻止滚动等。

## Usage

## 用法

To associate an overlay with a scroll strategy, you have to pass in a function, that returns a
scroll strategy, to the `OverlayConfig`. By default, all overlays will use the `noop` strategy which
doesn't do anything. The other available strategies are `reposition`, `block` and `close`:

要把浮层与滚动策略相关联，就必须把一个返回滚动策略的函数传递给 `OverlayConfig` 。默认情况下，所有浮层都会使用 `noop` 策略，它不执行任何操作。其它可用的策略有 `reposition`、`block` 和 `close`：

```ts
let overlayConfig = new OverlayConfig({
  scrollStrategy: overlay.scrollStrategies.block()
});

this._overlay.create(overlayConfig).attach(yourPortal);
```

## Creating a custom scroll strategy

## 创建自定义滚动策略

To set up a custom scroll strategy, you have to create a class that implements the `ScrollStrategy`
interface. There are three stages of a scroll strategy's life cycle:

要设置自定义滚动策略，你必须创建一个实现 `ScrollStrategy` 接口的类。滚动策略的生命周期分为三个阶段：

1. When an overlay is created, it'll call the strategy's `attach` method with a reference to itself.

   在创建浮层的时候，会调用该策略的 `attach` 方法并传入浮层自身的引用。

1. When an overlay is attached to the DOM, it'll call the `enable` method on its scroll strategy,

   当浮层附加到 DOM 中时，它会调用其滚动策略中的 `enable` 方法，

1. When an overlay is detached from the DOM or destroyed, it'll call the `disable` method on its
   scroll strategy, allowing it to clean up after itself.

   当一个浮层从 DOM 中分离出来或者被销毁时，它会调用滚动策略的 `disable` 方法，让它在自己清理完之后做一些清理工作。

Afterwards you can pass in the new scroll strategy to your overlay state:

之后你可以把这个新的滚动策略传给浮层了：

```ts
// Your custom scroll strategy.
export class CustomScrollStrategy implements ScrollStrategy {
  // your implementation
}

overlayConfig.scrollStrategy = new CustomScrollStrategy();
this._overlay.create(overlayConfig).attach(yourPortal);
```
