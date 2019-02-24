# Rendering Data Rows

# 渲染数据行

The table's primary responsibility is to render rows of cells. The types of rows that may be rendered are header,
footer, and data rows. This document focuses on how the table tries to efficienctly render the data rows.

表格的主要职责是渲染多行上的多个单元格。可以渲染的行类型有表头、表尾和数据行。本文档重点介绍表格要如何高效地渲染数据行。

## Background

## 背景

Each table's template is defined as a set of row and column templates. The row template defines the template that should
be rendered for a header, footer, or data row. The column templates include the cell templates that will be inserted
into each rendered row.

每个表格的模板都会定义成一组行模板和列模板。行模板定义了那些应该为表头、表尾或数据渲染的模板。列模板中包含了那些将插入到每个要渲染的行中的单元格模板。

Each data object may be rendered with one or more row templates. When new data in provided to the table, the table
determines which rows need to be rendered. In order to be efficient, the table attempts to understand how the new list
of rendered rows differs from the previous list of rendered rows so that it can re-use the current list of rendered rows
if possible.

每个数据对象都可以使用一个或多个行模板进行渲染。当表格中提供了新数据时，该表格会确定需要渲染哪些行。为了提高效率，该表试图理解渲染的新的行列表与以前的行列表的差异点，以便尽可能复用已渲染的行列表。

## Rendering

## 渲染

Each time data is provided, the table needs to create the list of rows that will be rendered and keep track of which
data object will be provided as context for each row. For each item in the list, this pair is combined into an object
that uses the `RenderRow` interface. The interface also helps keep track of the data object's index in the provided
data array input.

每当提供数据时，表格都要创建一些待渲染的行列表，并为每行跟踪所提供的数据对象作为上下文。对于列表中的每一项，它们会被组合成一个使用 `RenderRow` 接口的对象。该接口还有助于在所提供的数组型输入数据中跟踪数据对象的索引。

```ts
export interface RenderRow<T> {
  data: T;
  dataIndex: number;
  rowDef: CdkRowDef<T>;
}
```

When possible, `RenderRow` objects are re-used from the previous rendering. That is, if a particular data object and row
template pairing was previously rendered, it should be used for the new list as well. This makes sure that the
differ can use check-by-reference logic to find the changes between two lists. Note that if a `RenderRow` object is
reused, it should be updated with the correct data index, in case it has moved since last used.

只要可能，`RenderRow` 对象就会从以前渲染过的行中复用。也就是说，如果之前渲染过一个特定的数据对象及其配套的行模板，它也应该用在新的列表中。这可以确保条目比较器可以使用"按引用检查"的逻辑来查找两个列表之间发生了哪些变化。注意，如果要复用一个 `RenderRow` 对象，就应该把它修改为正确的数据索引，以防它自上次使用以来被移动过。

Once the list of `RenderRow` objects has been created, it should be compared to the previous list of `RenderRow`
objects to find the difference in terms of inserts/deletions/moves. This is trivially done using the `IterableDiffer`
logic provided by Angular Core.

一旦创建了 `RenderRow` 对象列表，就应该把它与之前的 `RenderRow` 对象列表进行比较，以找出插入/删除/移动等差异。这可以通过 Angular 内核所提供的 `IterableDiffer` 逻辑来完成。

Finally, the table uses the list of operations and manipulates the rows through add/remove/move operations.

最后，该表格会根据这个操作列表，通过添加/删除/移动操作来操纵这些行。

## Caching `RenderRow` objects

## 缓存 `RenderRow` 对象

Each `RenderRow` should be cached such that it is a constant-time lookup and retrieval based on the data object and
row template pairing.

每个 `RenderRow` 都可能被缓存，以便根据数据对象和行模板的配对来进行常数时间的查找和检索。

In order to achieve this, the cache is built as a map of maps where the key of the outer map is the data object and
the key of the inner map is the row template. The value of the inner map should be an array of the matching cached
`RenderRow` objects that were previously rendered.

为了达到这个目的，缓存是作为一个映射表来构建的，其中外层映射表的键是数据对象，内层映射表的键是行模板。内层映射表的值是先前渲染过的与缓存 `RenderRow` 对象配对的数组。

