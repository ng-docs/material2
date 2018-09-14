Angular Material comes packaged with Angular CLI schematics to make
creating Material applications easier.

Angular Material 带了一份供 Angular CLI 使用的生成器（schematic，原意是原理图），可以让创建 Material 应用更简单些。

## Install Schematics

## 安装生成器

Schematics come packaged with Angular Material, so once you have
installed the npm package, they will be available via the Angular CLI.

Angular Material 附带了一些生成器，一旦你安装了这个 npm 包，就可以通过 Angular CLI 来使用这些生成器了。

If you run it will automatically install Angular Material for you
and run the install schematic.

运行下列命令可以自动安装 Angular Material，并运行供安装用的生成器。

```
ng add @angular/material
```

The install schematic will help you quickly add Material to a new project. 
This schematic will:

"安装" 生成器将会帮助你为新项目快速添加 Material 支持。
该生成器将：

- Ensure project dependencies in `package.json`

  确保 `package.json` 中具有项目所需的依赖

- Ensure project dependencies in your app module

  确保应用模块中有项目依赖

- Adds Prebuilt or Setup Custom Theme

  添加预定义主题或使用自定义主题

- Adds Roboto fonts to your index.html

  向 index.html 中添加 Roboto 字体

- Apply simple CSS reset to body

  使用一些简单的 CSS 来重置 body 元素

## Generator Schematics

## 预定义生成器

In addition to the install schematic Angular Material has three schematics it comes packaged with:

除了 "安装" 生成器之外，Angular Material 还带了三个生成器：

- Navigation

  导航 - Navigation

- Dashboard

  仪表盘 - Dashboard

- Table

  表格 - Table

### Navigation Schematic

### 导航生成器

The navigation schematic will create a new component that includes
a toolbar with the app name and the side nav responsive based on Material
breakpoints.

导航生成器将会创建一个包括应用名的工具栏和一个能自适应 Material 的断点的侧边栏。

```
ng generate @angular/material:material-nav --name <component-name>
```

### Dashboard Schematic

### 仪表盘生成器

The dashboard schematic will create a new component that contains
a dynamic grid list of cards.

仪表盘生成器将会创建一个包含动态卡片网格的新组件。

```
ng generate @angular/material:material-dashboard --name <component-name>
```

### Table Schematic

### 表格生成器

The table schematic will create a new table component pre-configured
with a datasource for sorting and pagination.

表格生成器将会创建一个新的表格组件，它预先配置好了带有排序和分页功能的数据源。

```
ng generate @angular/material:material-table --name <component-name>
```
