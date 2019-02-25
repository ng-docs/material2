Angular Material comes packaged with Angular CLI schematics to make
creating Material applications easier.

Angular Material 带了一份供 Angular CLI 使用的生成器（schematic，原意是原理图），可以让创建 Material 应用更简单些。

### Install Schematics

### 安装生成器

Schematics are included with both `@angular/cdk` and `@angular/material`. Once you install the npm
packages, they will be available through the Angular CLI.

Angular Material 附带了一些生成器，一旦你安装了这个 npm 包，就可以通过 Angular CLI 来使用这些生成器了。

Using the command below will install Angular Material, the [Component Dev Kit](https://material.angular.io/cdk) (CDK),
and [Angular Animations](https://angular.io/guide/animations) in your project. Then it will run the
install schematic.

运行下列命令可以自动为你的项目安装 Angular Material、[组件开发工具](/cdk) (CDK) 和 [Angular 动画库](/guide/animations)，并运行代码生成器。

```
ng add @angular/material
```

In case you just want to install the `@angular/cdk`, there are also schematics for the [Component Dev Kit](https://material.angular.io/cdk)

如果你只想安装 `@angular/cdk`，也可以使用[组件开发工具](/cdk)的专用代码生成器

```
ng add @angular/cdk
```

The Angular Material `ng add` schematic helps you setup an Angular CLI project that uses Material. Running `ng add` will:

Angular Material 的 `ng add` 生成器会帮助你的 Angular CLI 项目配置 Angular Material。运行 `ng add` 将会：

- Ensure [project dependencies](./getting-started#step-1-install-angular-material-angular-cdk-and-angular-animations) are placed in `package.json`

  确保 `package.json` 中具有[项目所需的依赖](./getting-started#step-1-install-angular-material-angular-cdk-and-angular-animations)

- Enable the [BrowserAnimationsModule](./getting-started#step-2-configure-animations) your app module

  为应用启用 [BrowserAnimationsModule](./getting-started#step-2-configure-animations) 模块

- Add either a [prebuilt theme](./theming#using-a-pre-built-theme) or a [custom theme](./theming#defining-a-custom-theme)

  添加一个[预定义的主题](./theming#using-a-pre-built-theme)或一个[自定义主题](./theming#defining-a-custom-theme)

- Add Roboto fonts to your `index.html`

  为 `index.html` 添加 Roboto 字体

- Add the [Material Icon font](./getting-started#step-6-optional-add-material-icons) to your `index.html`

  在 `index.html` 中添加 [Material 图标字体](./getting-started#step-6-optional-add-material-icons)

- Add global styles to

  添加下列全局样式

  - Remove margins from `body`
  
    移除 `body` 的边距（margin）
  
  - Set `height: 100%` on `html` and `body`
  
    为 `html` 和 `body` 设置 `height: 100%`
  
  - Make Roboto the default font of your app
  
    把 Roboto 设置为应用的默认字体
  
- Install and import `hammerjs` for [gesture support](./getting-started#step-5-gesture-support) in your project

  安装并导入 `hammerjs`，来为项目提供[手势支持](./getting-started#step-5-gesture-support)

## Component schematics

## 组件生成器

In addition to the install schematic, Angular Material comes with multiple schematics that can be
used to easily generate Material Design components:

除了用于安装的 schematic 之外，Angular Material 还带有多个生成器，用于轻松生成 Material Design 组件：

| Name           | Description                                                                                            |
| 名称           | 说明                                                                                            |
|----------------|--------------------------------------------------------------------------------------------------------|
| `address-form` | Component with a form group that uses Material Design form controls to prompt for a shipping address   |
| `address-form` | 一个表单组，它使用 Material Design 的多个表单控件接收一个送货地址   |
| `navigation`   | Creates a component with a responsive Material Design sidenav and a toolbar for showing the app name   |
| `navigation`   | 创建一个带有响应式 Material Design 侧边栏组件和一个用于显示应用名称的工具栏组件   |
| `dashboard`    | Component with multiple Material Design cards and menus which are aligned in a grid layout             |
| `dashboard`    | 带有多个 Material Design 卡片和菜单的网格式布局组件             |
| `table`        | Generates a component with a Material Design data table that supports sorting and pagination           |
| `table`        | 生成一个带有 Material Design 并支持排序和分页的数据表组件           |
| `tree`         | Component that interactively visualizes a nested folder structure by using the `<mat-tree>` component  |
| `tree`         | 该组件以 `<mat-tree>` 组件来展示一个可交互的文件夹式结构 |


Additionally the Angular CDK also comes with a collection of component schematics:

此外，Angular CDK 也给出了一些组件的生成器：

| Name           | Description                                                                                        |
| 名称           | 说明                                                                                        |
|----------------|----------------------------------------------------------------------------------------------------|
| `drag-drop`    | Component that uses the `@angular/cdk/drag-drop` directives for creating an interactive to-do list |
| `drag-drop`    | 该组件使用 `@angular/cdk/drag-drop` 指令来创建一个可交互的 to-do 列表 |

#### Address form schematic

#### 地址表单生成器

Running the `address-form` schematic generates a new Angular component that can be used to get
started with a Material Design form group consisting of:

运行 `address-form` 生成器会生成一个新的 Angular 组件，它可用于快速开始一个 Material Design 表单组，其中包括：

* Material Design form fields

  一些 Material Design 表单字段

* Material Design radio controls

  一些 Material Design 单选控件

* Material Design buttons

  一些 Material Design 按钮

```
ng generate @angular/material:address-form <component-name>
```

#### Navigation schematic

#### 导航生成器

The `navigation` schematic will create a new component that includes
a toolbar with the app name and a responsive side nav based on Material
breakpoints.

`navigation` 生成器将会创建一个包括应用名的工具栏和一个能自适应 Material 的断点的侧边栏。

```
ng generate @angular/material:nav <component-name>
```

#### Table schematic

#### 表格生成器

The table schematic will create a component that renders an Angular Material `<table>` which has
been pre-configured with a datasource for sorting and pagination.

表格生成器将创建一个组件，它可以渲染出一个预置了可排序、可分页数据源的 Angular Material `<table>`。

```
ng generate @angular/material:table <component-name>
```

#### Dashboard schematic

#### 仪表盘生成器

The `dashboard` schematic will create a new component that contains
a dynamic grid list of Material Design cards.

`dashboard` 生成器将创建一个新组件，它包含一个由 Material Design 卡片组成的动态网格列表。

```
ng generate @angular/material:dashboard <component-name>
```

#### Tree schematic

#### 树生成器

The `tree` schematic can be used to quickly generate an Angular component that uses the Angular
Material `<mat-tree>` component to visualize a nested folder structure.

`tree` 生成器可用于快速生成一个 Angular 组件，它使用 Angular Material 的 `<mat-tree>` 组件来展示一个嵌套的文件夹式结构。

```
ng generate @angular/material:tree <component-name>
```

#### Drag and Drop schematic

#### 拖放生成器

The `drag-drop` schematic is provided by the `@angular/cdk` and can be used to generate a component
that uses the CDK drag and drop directives.

`drag-drop` 生成器是由 `@angular/cdk` 提供的，它可用来生成带有 CDK 拖放指令的组件。

```
ng generate @angular/cdk:drag-drop <component-name>
```
