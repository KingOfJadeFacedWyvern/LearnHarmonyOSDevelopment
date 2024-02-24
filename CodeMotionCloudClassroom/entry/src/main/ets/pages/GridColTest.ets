@Entry
@Component
struct GridColTest {
  @State message: string = 'Hello World'

  build() {
    GridRow() {
      // 子组件GridCol  GridCol组件作为GridRow组件的子组件，通过给GridCol传参或者设置属性两种方式，设置span（占用列数），offset（偏移列数），order（元素序号）的值。
      // span（占用列数）子组件占栅格布局的列数，决定了子组件的宽度，默认为1。span可以指定为number类型，表示子组件在所有尺寸设备下占用的列数相同。
      // offset（偏移列数）栅格子组件相对于前一个子组件的偏移列数，默认为0。可以指定offset为number类型，表示子组件偏移相同列数。
      GridCol({ order: 5 }) {
        Text('1')
          .width('100%')
          .height(`50VP`)
      }
      .backgroundColor(Color.Green)

      GridCol({ order: 4 }) {
        Text('2')
          .width('100%')
          .height(`50VP`)
      }
      .backgroundColor(Color.Red)

      GridCol({ order: 3 }) {
        Text('3')
          .width('100%')
          .height(`50VP`)
      }
      .backgroundColor(Color.Orange)

      GridCol({ order: 2 }) {
        Text('4')
          .width('100%')
          .height(`50VP`)
      }
      .backgroundColor(Color.Gray)

      GridCol({ order: 1 }) {
        Text('5')
          .width('100%')
          .height(`50VP`)
      }
      .backgroundColor(Color.Pink)

    }
  }
}