The `collections` package provides a set of utilities for managing collections.

`collections` 包提供了一组用来管理集合的实用工具。

### `SelectionModel`

`SelectionModel` is a utility for powering selection of one or more options from a list.
This model is used in components such as the selection list, table selections and chip lists.

`SelectionModel` 是一个实用工具，可以从列表中选择一个或多个选项。该模型用于组件，如可选列表，可选表格和芯片列表。

#### Basic Usage

#### 基本用法

```javascript
const model = new SelectionModel(
  true,   // multiple selection or not
  [2,1,3] // initial selected values
);

// select a value
model.select(4);
console.log(model.selected.length) //->  4

// deselect a value
model.deselect(4);
console.log(model.selected.length) //->  3

// toggle a value
model.toggle(4);
console.log(model.selected.length) //->  4

// check for selection
console.log(model.isSelected(4)) //-> true

// sort the selections
console.log(model.sort()) //-> [1,2,3,4]

// listen for changes
model.changed.subscribe(s => console.log(s));
```
