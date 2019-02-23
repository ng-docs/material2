### LiveAnnouncer

`LiveAnnouncer` is used to announce messages for screen-reader users using an `aria-live` region.
See [the W3C's WAI-ARIA](https://www.w3.org/TR/wai-aria/states_and_properties#aria-live)
for more information on aria-live regions.

`LiveAnnouncer` 用于通过 `aria-live` 区域为屏幕阅读器用户播报信息。关于 `aria-live` 区域的详细信息，请参见 [W3C 的 WAI-ARIA](https://www.w3.org/TR/wai-aria/states_and_properties#aria-live) 。

#### Methods

#### 方法

##### `announce(message: string, politeness?: 'off' | 'polite' | 'assertive'): void`

Announce the given message via aria-live region. The politeness argument determines the 
`aria-live` attribute on the announcer element, defaulting to 'polite'.

通过 aria-live 区域播报指定的消息。politeness 参数决定了是否不管这个播报员（announcer）元素的 `aria-live` 属性，默认为 'polite'。

#### Examples

#### 例子

The LiveAnnouncer is injected into a component:

把 LiveAnnouncer 注入到一个组件中：

```ts
@Component({
  selector: 'my-component'
  providers: [LiveAnnouncer]
})
export class MyComponent {

 constructor(liveAnnouncer: LiveAnnouncer) {
   liveAnnouncer.announce("Hey Google");
 }

}
```
