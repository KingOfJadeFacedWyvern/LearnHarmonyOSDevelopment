import colorSpaceManager from '@ohos.graphics.colorSpaceManager'

@Component
export struct Navigation1 {
  @Builder NavigatorItem(isSelectes: boolean, title: string, subTitle?: string) {
    Column() {
      // Badge包裹文字
      Badge({
        value: subTitle,
        position: BadgePosition.RightTop,
        style: {
          color: '#CBCBCB',
          fontSize: 8,
          badgeSize: 8,
          badgeColor: Color.Transparent
        }
      }) {
        Text(title)
          .fontSize(12)
          .fontWeight(isSelectes ? FontWeight.Bold : FontWeight.Normal)
      }
      .layoutWeight(1)
      //   红色线条
      Text()
        .width(16)
        .height(1)
        .backgroundColor(isSelectes ? Color.Red : '#FBFBFB')
        .borderRadius(10)
    }
    .width(55)
    .margin({ top: 15, bottom: 10 })
  }

  build() {
    Row() {
      this.NavigatorItem(true, '点餐')
      this.NavigatorItem(false, '评价', '1024')
      this.NavigatorItem(false, '品牌', '故事')
      Text('好友接单')
        .fontSize(12)
        .fontColor("#E3002B")
        .fontWeight(FontWeight.Bold)
        .width(55)
        .height(20)
        .border({ width: 1, color: "#E3002B" })
        .borderRadius(15)
        .textAlign(TextAlign.Center)
        .margin({ left: 100 })
    }
    .width('100%')
    .height(45)
    .backgroundColor('#FBFBFB')
  }
}