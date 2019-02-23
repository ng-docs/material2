The `observers` package provides convenience directives built on top of native web platform
observers, such as MutationObserver.

`observers` 包提供了基于原生 Web 平台的观察者 API（比如 MutationObserver） 的便捷指令。

### cdkObserveContent

A directive for observing when the content of the host element changes. An event is emitted when a
mutation to the content is observed.

用于观察宿主元素的内容何时发生变化的指令。当观察到内容变化时，它就会发出一个事件。

```html
<div class="projected-content-wrapper" (cdkObserveContent)="projectContentChanged()">
  <ng-content></ng-content>
</div>
```
