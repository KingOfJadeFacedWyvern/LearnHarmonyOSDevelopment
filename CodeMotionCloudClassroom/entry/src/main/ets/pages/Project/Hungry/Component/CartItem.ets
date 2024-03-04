@Component
export struct CartItem {
  build() {
    Row() {
      Image("https://i.postimg.cc/QFDs9gfw/product3.jpg")
        .width(66)
        .aspectRatio(1)
      Column({ space: 2 }) {
        Text('香辣鸡腿堡')
          .fontSize(20)
          .maxLines(1) // 显示一行
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontWeight(FontWeight.Bold)

        Row() {
          Text() {
            Span('$ ')
              .fontSize(10)
              .fontColor('#FD4A37')
            Span(`9.9`)
              .fontSize(15)
              .fontColor('#FD4A37')
          }
          // 加减商品，商品数量
          Row({ space: 5 }) {
            Image($r('app.media.icon_minus'))
              .width(16)
              .aspectRatio(1)
            Text(`10`)
              .fontSize(12)
            Image($r('app.media.icon_add'))
              .width(16)
              .aspectRatio(1)
          }
        }
        .width('90%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .margin({ left: 10, right: 10 })
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
    .margin({ left: 15, right: 15 })
  }
}