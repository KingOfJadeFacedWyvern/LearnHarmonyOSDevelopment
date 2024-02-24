// 网格布局 GridRow


@Entry
@Component
struct GridRowTest {
  bgColor: Color[] = [
  Color.Green,
  Color.Blue,
  Color.Brown,
  Color.Orange,
  Color.Green,
  Color.Blue,
  Color.Brown,
  Color.Orange,
  Color.Green,
  Color.Blue,
  Color.Brown,
  Color.Orange,
  Color.Gray

  ]

  build() {
    GridRow({ columns: 8 }) {
      ForEach(this.bgColor, (item: any, index: number) => {
        GridCol({ offset: 2 }) {
          Text(`${index + 1}`)
        }
        .width('100%')
        .height(50)
        .backgroundColor(item)

      })

    }
  }
}