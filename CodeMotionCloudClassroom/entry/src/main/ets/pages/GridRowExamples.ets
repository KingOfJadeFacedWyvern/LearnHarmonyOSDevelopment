// 这一节主要介绍网格组件嵌套使用
@Entry
@Component
struct GridRowExamples {
  @State message: string = 'Hello World'

  build() {
    GridRow() {
      // 大布局
      GridCol({ span: 12 }) {
        GridRow() {
          GridCol({ span: 2 }) {
            Text('Left')
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .backgroundColor(Color.Gray)
          .width('100%')
          .height('10%')

          GridCol({ span: 10 }) {
            Text('Right')
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .backgroundColor(Color.Blue)
          .width('100%')
          .height('10%')
        }

      }

      // Footer 小布局
      GridCol({ span: 12 }) {
        Text('Footer')
          .width('100%')
          .height('2%')
          .textAlign(TextAlign.Center)
      }
      .backgroundColor(Color.Pink)

    }
    .width('100%')
    .height(2000)
  }
}