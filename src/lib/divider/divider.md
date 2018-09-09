`<mat-divider>` is a component that allows for Material styling of a line separator with various orientation options.

`<mat-divider>` 是一个 Material 风格的分割线组件，支持多种方向选项。

<!-- example(divider-overview) -->


### Simple divider

### 简单分割线

A `<mat-divider>` element can be used on its own to create a horizontal or vertical line styled with a Material theme

`<mat-divider>` 元素可单独使用，以创建一个带有 Material 主题的水平线或垂直线。

```html
<mat-divider></mat-divider>
```

### Inset divider

### 内部分割线

Add the `inset` attribute in order to set whether or not the divider is an inset divider.

添加 `inset` 属性，以设置该分割线是否内部的。

```html
<mat-divider [inset]="true"></mat-divider>
```

### Vertical divider

### 垂直分割线

Add the `vertical` attribute in order to set whether or not the divider is vertically-oriented.

添加 `vertical` 属性，以设置该分割线是否垂直方向的。

```html
<mat-divider [vertical]="true"></mat-divider>
```


### Lists with inset dividers

### 带有内部分割线的列表

Dividers can be added to lists as a means of separating content into distinct sections.
Inset dividers can also be added to provide the appearance of distinct elements in a list without cluttering content
like avatar images or icons. Make sure to avoid adding an inset divider to the last element
in a list, because it will overlap with the section divider.

可以将分割线添加到列表中，来把内容分成不同的部分。
还可以把内部分割线添加到列表中，以在外观上区分不同的元素，以免头像、图标等内容显得乱糟糟的。
请确保不要给列表中最后一个元素添加分割线，因为这样容易和节分割线重叠在一起。

```html
<mat-list>
   <h3 mat-subheader>Folders</h3>
   <mat-list-item *ngFor="let folder of folders; last as last">
      <mat-icon mat-list-icon>folder</mat-icon>
      <h4 mat-line>{{folder.name}}</h4>
      <p mat-line class="demo-2"> {{folder.updated}} </p>
      <mat-divider [inset]="true" *ngIf="!last"></mat-divider>
   </mat-list-item>
   <mat-divider></mat-divider>
   <h3 mat-subheader>Notes</h3>
   <mat-list-item *ngFor="let note of notes">
      <mat-icon mat-list-icon>note</mat-icon>
      <h4 mat-line>{{note.name}}</h4>
      <p mat-line class="demo-2"> {{note.updated}} </p>
   </mat-list-item>
</mat-list>
```
