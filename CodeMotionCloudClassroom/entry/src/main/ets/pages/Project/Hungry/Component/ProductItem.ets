import { ProductInfo } from '../Common/Entities'
import { addToCart } from '../Common/Fun'
import promptAction from '@ohos.promptAction'

@Component
export struct ProductItem {
  ProductInfo: ProductInfo

  build() {
    Row() {
      Image($r('app.media.product1'))
        .width(`90VP`)
        .aspectRatio(1)
        .borderRadius(11)
      Column({ space: 2 }) {
        Text(this.ProductInfo.name)
          .fontSize(20)
          .maxLines(1) // 显示一行
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontWeight(FontWeight.Bold)
        Text(this.ProductInfo.tag)
          .fontSize(12)
          .maxLines(1) // 显示一行
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontColor('#895F39')
          .backgroundColor('#FFF4E6')
          .padding({ left: 5, top: 2, right: 5, bottom: 2 })
          .borderRadius(2)
        Text(this.ProductInfo.desc)
          .maxLines(1) // 显示一行
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontSize(15)
          .fontColor('#A1A1A1')
        Text() {
          Span(`朋售 ${this.ProductInfo.month_sale}`)
          Span(' ')
          Span(`好评率${this.ProductInfo.like_rate}`)
        }
        .fontSize(12)
        .fontColor('#A1A1A1')

        Row() {
          Text() {
            Span('$ ')
              .fontSize(10)
              .fontColor('#FD4A37')
            Span(`${this.ProductInfo.price}`)
              .fontSize(15)
              .fontColor('#FD4A37')
          }

          Image($r('app.media.icon_add'))
            .width(16)
            .aspectRatio(1)
            .onClick(() => {
              addToCart(this.ProductInfo)
              promptAction.showToast({ message: 'Add ShoppingCart Success'})
            })


        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .margin({ left: 10, right: 10 })
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
    .padding(10)

  }
}