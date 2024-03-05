import { CartProductInfo } from '../Common/Entities'
import promptAction from '@ohos.promptAction'

@Component
export struct Footer {
  @Link ShowCart: boolean
  @Link cartProductList: CartProductInfo[]
  // @State Count: string = this.cartProductList.reduce((totalCnt: number, item: CartProductInfo) => {
  //   promptAction.showToast({ "message": totalCnt.toString() })
  //   totalCnt += item.cnt
  //   return totalCnt
  // }, 0).toString()
  // @State Count1: number = this.cartProductList.reduce((totalPrice: number, item: CartProductInfo) => {
  //   totalPrice += item.cnt * item.price
  //   return Number(totalPrice.toFixed(2))
  // }, 0)

  build() {
    Row() {
      Row() {
        // 左侧图标背景
        Row() {
          Badge({
            value: this.cartProductList.reduce((totalCnt: number, item: CartProductInfo) => {
              totalCnt += item.cnt
              return totalCnt
            }, 0).toString(),
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
        .backgroundColor(this.cartProductList.length === 0 ? '#CBCBCB' : '#E70015')
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
            // Span(this.Count1.toString())
            //   .fontSize(24)
            Span(`${this.cartProductList.reduce((totalPrice: number, item: CartProductInfo) => {
              totalPrice += item.cnt * item.price
              return Number(totalPrice.toFixed(2))
            }, 0)}`).fontSize(24)


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
          .backgroundColor(this.cartProductList.length === 0 ? '#CBCBCB' : Color.Pink)
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