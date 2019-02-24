CDK stepper provides a foundation upon which more concrete stepper varities can be built. A
stepper is a wizard-like workflow that divides content into logical steps

CDK 步进器（stepper）提供了一个基础，可以在此基础上构建具体的步进器变体。步进器是一种类似向导的工作流，可以把内容划分为一些逻辑步骤

### Behavior captured by CdkStepper

### CdkStepper 所捕获的行为

The base CDK version of the stepper primarily manages which step is active. This includes handling
keyboard interactions and exposing an API for advancing or rewinding through the workflow.

步进器的 CDK 基础版本主要用来管理哪一步处于活动状态。这包括处理键盘交互，并暴露一个用来在工作流程中前进或后退的 API。

#### Linear stepper

#### 线性步进器

A stepper marked as `linear` requires the user to complete previous steps before proceeding.
For each step, the `stepControl` attribute can be set to the top level `AbstractControl` that
is used to check the validity of the step.

标记为 `linear` 的步进器要求用户在继续下一步之前完成前面的步骤。对于每一个步骤来说，其 `stepControl` 属性都可以设置为顶级的 `AbstractControl`，用于检查该步骤的有效性。

There are two possible approaches. One is using a single form for stepper, and the other is
using a different form for each step.

有两种可能的方式。一种是使用单一表单进行步进，另一种是使用不同的表单进行步进。

Alternatively, if you don't want to use the Angular forms, you can pass in the `completed` property
to each of the steps which won't allow the user to continue until it becomes `true`. Note that if
both `completed` and `stepControl` are set, the `stepControl` will take precedence.

或者，如果你不想使用 Angular 表单，也可以把 `completed` 属性传入每个步骤，这些步骤会阻止用户继续，直到这个属性变为 `true`。注意，如果同时设置了 `completed` 和 `stepControl`，则 `stepControl` 优先。

#### Using a single form for the entire stepper

#### 在整个步进器中使用同一个表单

When using a single form for the stepper, any intermediate next/previous buttons within the steps
must be set to `type="button"` in order to prevent submission of the form before all steps are
complete.

在步进器中使用单一表单时，所有中间步骤的"下一个"/"上一个"按钮都必须设置为 `type="button"`，以防止在完成所有步骤之前提交表单。

#### Using a form for each individual step

#### 每个步骤各自使用一个表单

When using a form for each step, the workflow is advanced whenever one of the forms is submitted.

当每个步骤各自使用一个表单时，只要提交了一个表单，工作流就会向前推进。

### Types of steps

### 步骤的类型

#### Optional step

#### 可选步骤

If completion of a step in linear stepper is not required, then the `optional` attribute can be set
on `CdkStep` in a `linear` stepper.

如果线性步进器中的不要求某个步骤必须完成，那么可以在 `linear` 步进器中的这个 `CdkStep` 上设置 `optional` 属性。

#### Editable step

#### 可编辑的步骤

By default, steps are editable, which means users can return to previously completed steps and
edit their responses. `editable="true"` can be set on `CdkStep` to change the default.

默认情况下，步骤是可编辑的，这意味着用户可以返回之前已完成的步骤并重新编辑他们的响应。可以在 `CdkStep` 上设置 `editable="true"` 来修改默认行为。

#### Completed step

#### 完成步骤

By default, the `completed` attribute of a step returns `true` if the step is valid (in case of
linear stepper) and the user has interacted with the step. The user, however, can also override
this default `completed` behavior by setting the `completed` attribute as needed.

默认情况下，如果步骤有效（在线性步进器的情况下）并且用户已经与该步骤交互过，则该步骤的 `completed` 属性会返回 `true`。但是，用户也可以按需设置 `completed` 属性来覆盖默认的 `completed` 行为。

### Stepper buttons

### 步进按钮

There are two button directives to support navigation between different steps:
`CdkStepperNext` and `CdkStepperPrevious`. When placed inside of a step, these will automatically
add click handlers to advance or rewind the workflow, respectively.

有两个按钮指令可以支持不同步骤之间的导航： `CdkStepperNext` 和 `CdkStepperPrevious`。当放置在某个步骤中时，它们会自动添加点击处理器来分别推进或回退此工作流。

### Resetting a stepper

### 重置步进器的某个步骤

If you want to reset a stepper to its initial state, you can use the `reset` method. Note that
resetting it will call `reset` on the underlying form control which clears the value.

如果要将步进器重置为初始状态，可以使用 `reset` 方法。注意，重置它会在底层表单控件上调用 `reset` 来清除这个值。

### Keyboard interaction

### 键盘互动

- <kbd>LEFT_ARROW</kbd>: Focuses the previous step header

  `LEFT_ARROW`：焦点移到上一步的标题

- <kbd>RIGHT_ARROW</kbd>: Focuses the next step header

  `RIGHT_ARROW` ：焦点移到下一步的标题

- <kbd>ENTER</kbd>, <kbd>SPACE</kbd>: Selects the step that the focus is currently on

  `ENTER`、`SPACE` ：选取具有焦点的当前步骤

- <kbd>TAB</kbd>: Focuses the next tabbable element

  `TAB` ：焦点移到下一个 tabbable 元素

- <kbd>TAB</kbd>+<kbd>SHIFT</kbd>: Focuses the previous tabbable element

  `TAB` + `SHIFT` ：焦点移到上一个 tabbable 元素

### Accessibility

### 无障碍性

The CDK stepper is treated as a tabbed view for accessibility purposes, so it is given
`role="tablist"` by default. The header of step that can be clicked to select the step
is given `role="tab"`, and the content that can be expanded upon selection is given
`role="tabpanel"`. `aria-selected` attribute of step header and `aria-expanded` attribute of
step content is automatically set based on step selection change.

出于无障碍性的目的，CDK 的 stepper 被视为标签视图，所以默认情况下它被赋予 `role="tablist"`。在步骤标题中可以单击，以选取 `role="tab"` 的步骤，并展开每个带有 `role="tabpanel"` 的步骤内容。步骤标题上的 `aria-selected` 属性和步骤内容上的 `aria-expanded` 属性是根据所选步骤的变化自动设置的。

The stepper and each step should be given a meaningful label via `aria-label` or `aria-labelledby`.

步进器及其中的每个步骤都应该通过 `aria-label` 或者 `aria-labelledby` 给出一个有意义的标签。
