import { CartProductInfo } from '../Common/Entities'
import { addToCart, minusFromCart } from '../Common/Fun'

@Component
export struct CartItem {
  cartProductInfo: CartProductInfo

  build() {
    Row() {
      Image(this.cartProductInfo.picture)
        .width(66)
        .aspectRatio(1)
      Column({ space: 2 }) {
        Text(this.cartProductInfo.name)
          .fontSize(20)
          .maxLines(1) // 显示一行
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontWeight(FontWeight.Bold)

        Row() {
          Text() {
            Span('$ ')
              .fontSize(10)
              .fontColor('#FD4A37')
            Span(`${this.cartProductInfo.price}`)
              .fontSize(15)
              .fontColor('#FD4A37')
          }
          // 加减商品，商品数量
          Row({ space: 5 }) {
            Image($r('app.media.icon_minus'))
              .width(16)
              .aspectRatio(1)
              .onClick(() => {
                minusFromCart(this.cartProductInfo)
              })

            Text(`${this.cartProductInfo.cnt}`)
              .fontSize(12)
            Image($r('app.media.icon_add'))
              .width(16)
              .aspectRatio(1)
              .onClick(() => {
                addToCart(this.cartProductInfo)
              })
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