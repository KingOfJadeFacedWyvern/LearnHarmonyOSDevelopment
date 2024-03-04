import { CartItem } from './CartItem'

@Component
export struct Cart {
  build() {
    Column() {
      Column() {
        // 购物车头部
        Row() {
          Text('已选商品')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
          Row() {
            Image($r('app.media.icon_delete'))
              .width(12)
              .aspectRatio(1)
            Text('清空')
              .fontSize(12)
              .fontColor('#A1A1A1')
          }
        }
        .width('90%')
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top: 10, bottom: 10 })
        .border({ width: { bottom: 0.5 }, color: '#FEF6E5' })

        // 购物车商品列表
        List() {
          ListItem() {
            CartItem()
          }
          //
          // ListItem() {
          //   CartItem()
          // }
          //
          // ListItem() {
          //   CartItem()
          // }
          //
          // ListItem() {
          //   CartItem()
          // }
          //
          // ListItem() {
          //   CartItem()
          // }
        }
        .divider({ strokeWidth: 0.5, color: '#FEF6E5' })
        .margin({ left: 15, right: 15 })

      }
      .backgroundColor(Color.White)
      .width('100%')
      // .height(`500VP`)
      .padding({ bottom: 75 })
      .borderRadius({ topLeft: 16, topRight: 12 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('rgba(0,0,0,0.5)')
    .justifyContent(FlexAlign.End)
  }
}