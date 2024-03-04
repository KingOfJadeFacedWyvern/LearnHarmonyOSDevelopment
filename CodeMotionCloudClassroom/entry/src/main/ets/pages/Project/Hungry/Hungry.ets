import { Cart } from './Component/Catr'
import { Footer } from './Component/Footer'
import { Navigation1 } from './Component/Navigation'
import { ProductsMenu } from './Component/ProductsMenu'
import http from '@ohos.net.http'
import { CartProductInfo, Categroy } from './Common/Entities'
import { KEY } from './Common/Fun'
// 创建 HTTP Request对象
const request = http.createHttp()

@Entry
@Component
struct Hungry {
  Address: string = 'https://1c3ca57b.r8.cpolar.top/infos'
  @State ShowCart: boolean = false
  @State categoryList: Categroy[] = []
  @StorageProp(KEY) @Watch('setCartProductListInfo') cartProductListJsnoStr: string = '[]'
  @State cartProductList: CartProductInfo[] = JSON.parse(this.cartProductListJsnoStr)

  setCartProductListInfo() {
    this.cartProductList = JSON.parse(this.cartProductListJsnoStr)
  }
  // 在build前执行
  aboutToAppear() {
    request.request(this.Address)
      .then((ResponseType) => {
        const categoryList = JSON.parse(ResponseType.result as string) as Categroy[]
        this.categoryList = categoryList
      })
  }

  build() {
    // 层叠布局
    Stack({ alignContent: Alignment.Bottom }) {
      // 商品区
      Column() {
        // 导航部分
        Navigation1()

        // 商品部分
        ProductsMenu({ categoryList: $categoryList })
      }
      .width('100%')
      .height('100%')
      // 购物车
      if (this.ShowCart) {
        Cart()
      }

      // 结算区
      Footer({ ShowCart: $ShowCart, cartProductList: $cartProductList })
    }
    .width('100%')
    .height('100%')
  }
}