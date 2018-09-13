For help getting started with a new Angular app, check out the
[Angular CLI](https://cli.angular.io/).

要想快速创建一个 Angular 应用，请访问 [Angular CLI](https://cli.angular.io/)。

For existing apps, follow these steps to begin using Angular Material.

对于现存的应用，请遵循下列步骤开始使用 Angular Material。

### Step 1: Install Angular Material, Angular CDK and Angular Animations

### 步骤 1：安装 Angular Material、Angular CDK 和 Angular 动画库 

You can use either the npm or yarn command-line tool to install packages. Use whichever is appropriate for your project in the examples below.

你可以使用 npm 或 yarn 命令行工具来安装这些包。请从下面的例子中任选一个适合你项目需求的。

#### NPM
```bash
npm install --save @angular/material @angular/cdk @angular/animations
```
#### Yarn
```bash
yarn add @angular/material @angular/cdk @angular/animations
```


#### Alternative 1: Snapshot Build

#### 替代方案 1：使用快照（snapshot）构建

A snapshot build with the latest changes from master is also available. Note that this snapshot
build should not be considered stable and may break between releases.

也可以用 master 分支上的最新更改进行快照构建。注意，快照构建不能保证稳定，并且可能在各个发布之间出现破坏性变更。

#### NPM
```bash
npm install --save angular/material2-builds angular/cdk-builds angular/animations-builds
```

#### Yarn
```bash
yarn add angular/material2-builds angular/cdk-builds angular/animations-builds
```
#### Alternative 2: Angular Devkit 6+

#### 替代方案 2：Angular Devkit 6+

Using the Angular CLI `ng add` command will update your Angular project with the correct dependencies, perform configuration changes and execute initialization code. 

使用 Angular CLI 的 `ng add` 命令可以修改你的 Angular 项目，为它添加正确的依赖、执行配置性修改并执行初始化代码。

```bash
ng add @angular/material
```

### Step 2: Configure animations

### 步骤 2：配置动画

Once the animations package is installed, import `BrowserAnimationsModule` into your application to enable animations support.

安装完动画包之后，请在应用中导入 `BrowserAnimationsModule` 以支持动画。

```ts
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

@NgModule({
  ...
  imports: [BrowserAnimationsModule],
  ...
})
export class PizzaPartyAppModule { }
```

Alternatively, you can disable animations by importing `NoopAnimationsModule`.

另外，你还可以通过导入 `NoopAnimationsModule` 来禁用动画。

```ts
import {NoopAnimationsModule} from '@angular/platform-browser/animations';

@NgModule({
  ...
  imports: [NoopAnimationsModule],
  ...
})
export class PizzaPartyAppModule { }
```

### Step 3: Import the component modules

### 步骤 3：导入组件模块

Import the NgModule for each component you want to use:

为你想用的每个组件导入相应的 NgModule：

```ts
import {MatButtonModule, MatCheckboxModule} from '@angular/material';

@NgModule({
  ...
  imports: [MatButtonModule, MatCheckboxModule],
  ...
})
export class PizzaPartyAppModule { }
```

Alternatively, you can create a separate NgModule that imports all of the
Angular Material components that you will use in your application. You can then
include this module wherever you'd like to use the components.

另外，你还可以创建一个单独的 NgModule 来导入应用中要用到的所有 Angular Material 组件。然后只要在其它用到这些组件的模块中导入这个模块就可以了。

```ts
import {MatButtonModule, MatCheckboxModule} from '@angular/material';

@NgModule({
  imports: [MatButtonModule, MatCheckboxModule],
  exports: [MatButtonModule, MatCheckboxModule],
})
export class MyOwnCustomMaterialModule { }
```

Whichever approach you use, be sure to import the Angular Material modules _after_ Angular's
`BrowserModule`, as the import order matters for NgModules.

无论哪种方式，都要确保在 Angular 的 `BrowserModule` 之后再导入 Angular Material 模块，因为 NgModule 的导入顺序很重要。

### Step 4: Include a theme

### 步骤 4：包含一个主题

Including a theme is **required** to apply all of the core and theme styles to your application.

要在应用中使用所有的核心组件和主题样式，都**必须**包含一个主题。

To get started with a prebuilt theme, include one of Angular Material's prebuilt themes globally
in your application. If you're using the Angular CLI, you can add this to your `styles.css`:

要使用一个预构建的主题，只要在应用中全局包含一个 Angular Material 的预构建主题就可以了。如果你在使用 Angular CLI，可以把下列代码添加到你的 `style.css` 中：

```css
@import "~@angular/material/prebuilt-themes/indigo-pink.css";
```

If you are not using the Angular CLI, you can include a prebuilt theme via a `<link>` element in
your `index.html`.

如果你没有使用 Angular CLI，你可以在 `index.html` 中通过 `<link>` 元素来包含一个预构建主题。

For more information on theming and instructions on how to create a custom theme, see the
[theming guide](./theming.md).

要了解更多关于主题的信息以及创建自定义主题的指引，参见[主题指南](./theming.md)。

### Step 5: Gesture Support

### 步骤 5：手势支持

Some components (`mat-slide-toggle`, `mat-slider`, `matTooltip`) rely on
[HammerJS](http://hammerjs.github.io/) for gestures. In order to get the full feature-set of these
components, HammerJS must be loaded into the application.

有些组件（`mat-slide-toggle`、`mat-slider`、`matTooltip`）要依赖 [HammerJS](http://hammerjs.github.io/) 提供手势支持。为了获得这些组件的全部特性，应用中必须加载 HammerJS。

You can add HammerJS to your application via [npm](https://www.npmjs.com/package/hammerjs), a CDN
(such as the [Google CDN](https://developers.google.com/speed/libraries/#hammerjs)), or served
directly from your app.

你可以通过 [npm](https://www.npmjs.com/package/hammerjs)、CDN（比如 [Google CDN](https://developers.google.com/speed/libraries/#hammerjs)）或直接从应用中引入 HammerJS。

To install via npm, use the following command:

要想通过 npm 安装，请使用下列命令：

#### NPM
```bash
npm install --save hammerjs
```

#### Yarn
```bash
yarn add hammerjs
```

After installing, import it on your app's entry point (e.g. `src/main.ts`).

安装完之后，把它导入应用的入口点（比如 `src/main.ts`）。

```ts
import 'hammerjs';
```

### Step 6 (Optional): Add Material Icons

### 步骤 6（可选）：添加 Material 图标集

If you want to use the `mat-icon` component with the official
[Material Design Icons](https://material.io/icons/), load the icon font in your `index.html`.

如果你要使用 `mat-icon` 组件和官方的 [Material Design 图标集](https://material.io/icons/)，请在 `index.html` 中引入它的字体图标。

```html
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
```

For more information on using Material Icons, check out the
[Material Icons Guide](https://google.github.io/material-design-icons/).

要了解 Material 图标的更多信息，参见 [Material Icons 指南](https://google.github.io/material-design-icons/)。

Note that `mat-icon` supports any font or svg icons; using Material Icons is one of many options.

注意，`mat-icon` 支持任何字体图标和 SVG 图标，Material 图标只是众多选项之一。

### Appendix: Configuring SystemJS

### 附录：配置 SystemJS

If your project is using SystemJS for module loading, you will need to add `@angular/material` and
`@angular/cdk` to the SystemJS configuration.

如果你的应用使用 SystemJS 作为模块加载器，还要把 `@angular/material` 和 `@angular/cdk` 添加到 SystemJS 配置中。

The `@angular/cdk` package is organized of multiple entry-points.
Each of these entry-points must be registered individually with SystemJS.

`@angular/cdk` 有多个入口点，每一个都必须单独注册到 SystemJS 中。

Here is a example configuration where `@angular/material`, `@angular/cdk/platform` and
`@angular/cdk/a11y` are used:

下面是使用 `@angular/material`、`@angular/cdk/platform` 和 `@angular/cdk/a11y` 的范例配置：

```js
System.config({
  // Existing configuration options
  map: {
    // ...
    '@angular/material': 'npm:@angular/material/bundles/material.umd.js',

    // CDK individual packages
    '@angular/cdk/platform': 'npm:@angular/cdk/bundles/cdk-platform.umd.js',
    '@angular/cdk/a11y': 'npm:@angular/cdk/bundles/cdk-a11y.umd.js',
    // ...
    'hammerjs': 'npm:hammerjs',
  },
  packages: {
    //...
    hammerjs: {main: './hammer.min.js', defaultExtension: 'js'}
    //...
  }
});
```


### Example Angular Material projects

### Angular Material 范例项目

- [material.angular.io](https://material.angular.io) -
We build our own documentation with Angular Material!

  [material.angular.io](https://material.angular.io) -
  我们这个文档站就是用 Angular Material 构建的。
