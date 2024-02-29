@Component
export struct Footer {
  @Link ShowCart: boolean

  build() {
    Row() {
      Row() {
        // 左侧图标背景
        Row() {
          Badge({
            value: '5',
            position: BadgePosition.RightTop,
            style: { badgeSize: 15, badgeColor: '#04B3FF' }
          }) {
            Image($r('app.media.icon_cart'))
              .width(30)
              .aspectRatio(1)
          }
        }
        .height('90%')
        .aspectRatio(1)
        .backgroundColor('#CBCBCB')
        .borderRadius(25)
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .margin({ left: 25, right: 10, bottom: 10 })
        .onClick(() => {
          this.ShowCart = !this.ShowCart
        })
        // 设置礤文字
        Column() {
          Text() {
            Span('￥').fontSize(12)
            Span('20').fontSize(24)
          }

          Text('另需配送费$10')
            .fontSize(12)
            .fontColor('#C1C1C1')
        }
        .alignItems(HorizontalAlign.Start)
        .padding({ left: 15 })
        .layoutWeight(1)

        Text('去结算')
          .padding(10)
          .width(68)
          .backgroundColor('#989898')
          .borderRadius(55)
          .textAlign(TextAlign.Center)

      }
      .margin({ left: 15, right: 15 })
      .layoutWeight(1)

    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.White)
    .border({ width: { top: 0.5 }, color: "#FEF6E5" })
  }
}