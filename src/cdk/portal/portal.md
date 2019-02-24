The `portals` package provides a flexible system for rendering dynamic content into an application.

`portals` 包提供了一个灵活的布局系统，可以把动态内容渲染到应用中。

### Portals

### 门户

A `Portal` is a piece of UI that can be dynamically rendered to an open slot on the page.

`Portal` 是一小块 UI，可以被动态渲染到页面上的空白插槽（slot）中。

The "piece of UI" can be either a `Component` or a `TemplateRef` and the "open slot" is
a `PortalOutlet`.

这“一小块 UI”既可以是 `Component` 也可以是 `TemplateRef`，而“空白的插槽”是指 `PortalOutlet`。

Portals and PortalOutlets are low-level building blocks that other concepts, such as overlays, are
built upon.

各种 Portal 和 PortalOutlet 是建立在其它概念（比如浮层）之上的底层构造块。

##### `Portal<T>`

| Method                    | Description                        |
| ------------------------- | ---------------------------------- |
| 方法                      | 说明                               |
| `attach(PortalOutlet): T` | Attaches the portal to a host.     |
| `attach(PortalOutlet): T` | 把此门户附着到宿主上。           |
| `detach(): void`          | Detaches the portal from its host. |
| `detach(): void`          | 把此门户从宿主上拆除。     |
| `isAttached: boolean`     | Whether the portal is attached.    |
| `isAttached: boolean`     | 此门户是否已附着上。           |

##### `PortalOutlet`

| Method                 | Description                               |
| ---------------------- | ----------------------------------------- |
| 方法                   | 说明                                      |
| `attach(Portal): any`  | Attaches a portal to the host.            |
| `attach(Portal): any`  | 把指定的门户添加到此宿主上。            |
| `detach(): any`        | Detaches the portal from the host.        |
| `detach(): any`        | 把指定的门户从此宿主上拆除。                    |
| `dispose(): void`      | Permanently dispose the host.             |
| `dispose(): void`      | 永久销毁此宿主。                      |
| `hasAttached: boolean` | Whether a portal is attached to the host. |
| `hasAttached: boolean` | 判断是否有门户附着在此宿主上。                  |

#### Portals in practice

#### 门户实战

##### `CdkPortal`

Used to get a portal from an `<ng-template>`. `CdkPortal` *is* a `Portal`.

用于从某个 `<ng-template>` 获取门户。 `CdkPortal` *是*一个 `Portal`。

Usage:

用法：

```html
<ng-template cdkPortal>
  <p>The content of this template is captured by the portal.</p>
</ng-template>

<!-- OR -->

<!-- This result here is identical to the syntax above -->
<p *cdkPortal>
  The content of this template is captured by the portal.
</p>
```

A component can use `@ViewChild` or `@ViewChildren` to get a reference to a
`CdkPortal`.

组件可以使用 `@ViewChild` 或 `@ViewChildren` 来获取对 `CdkPortal` 的引用。

##### `ComponentPortal`

Used to create a portal from a component type. When a component is dynamically created using
portals, it must be included in the `entryComponents` of its `NgModule`.

用于从某个组件类创建门户。当使用门户动态创建组件时，必须把该组件包含在 `NgModule` 的 `entryComponents` 中。

Usage:

用法：

```ts
this.userSettingsPortal = new ComponentPortal(UserSettingsComponent);
```

##### `CdkPortalOutlet`

Used to add a portal outlet to a template. `CdkPortalOutlet` *is* a `PortalOutlet`.

用于向模板中添加一个门户出口（Portal Outlet）。 `CdkPortalOutlet` *是*一个`PortalOutlet`。

Usage:

用法：

```html
<!-- Attaches the `userSettingsPortal` from the previous example. -->
<ng-template [cdkPortalOutlet]="userSettingsPortal"></ng-template>
```
