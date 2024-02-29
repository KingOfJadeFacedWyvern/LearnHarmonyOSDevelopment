import { Cart } from './Component/Catr'
import { Footer } from './Component/Footer'
import { Navigation1 } from './Component/Navigation'
import { ProductsMenu } from './Component/ProductsMenu'

@Entry
@Component
struct Hungry {
  @State ShowCart: boolean = false

  build() {
    // 层叠布局
    Stack({ alignContent: Alignment.Bottom }) {
      // 商品区
      Column() {
        // 导航部分
        Navigation1()

        // 商品部分
        ProductsMenu()
      }
      .width('100%')
      .height('100%')
      // 购物车
      if (this.ShowCart) {
        Cart()
      }

      // 结算区
      Footer({ ShowCart: $ShowCart })
    }
    .width('100%')
    .height('100%')
  }
}