@Entry
@Component
struct TabsDemo {
  @State message: string = 'Hello World'

  build() {
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Text('首页内容')
          .fontSize(30)
      }.tabBar('Home')
      .backgroundColor(Color.Pink)

      TabContent() {
        Text('推荐内容')
          .fontSize(30)
      }.tabBar('Recom')
      .backgroundColor(Color.Blue)

      TabContent() {
        Text('发现内容')
          .fontSize(30)
      }.tabBar('Found')
      .backgroundColor(Color.Pink)


      TabContent() {
        Text('你的内容')
          .fontSize(30)
      }.tabBar('Yours')
      .backgroundColor(Color.Orange)
    }
    .vertical(true)
    .barWidth(100)
    .barHeight(200)
  }
}