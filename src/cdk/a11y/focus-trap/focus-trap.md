### FocusTrap

### FocusTrap（焦点陷阱）

The `cdkTrapFocus` directive traps <kbd>Tab</kbd> key focus within an element. This is intended to
be used to create accessible experience for components like
[modal dialogs](https://www.w3.org/TR/wai-aria-practices-1.1/#dialog_modal), where focus must be
constrained.

`cdkTrapFocus` 指令用于捕获一个元素中的 `Tab` 键焦点。这可以用来创建[模态对话框](https://www.w3.org/TR/wai-aria-practices-1.1/#dialog_modal)等组件的无障碍体验，这时候必须限制焦点的移动。

This directive is declared in `A11yModule`.

该指令声明在 `A11yModule` 中。

#### Example

#### 例子

```html
<div class="my-inner-dialog-content" cdkTrapFocus>
  <!-- Tab and Shift + Tab will not leave this element. -->
</div>
```
