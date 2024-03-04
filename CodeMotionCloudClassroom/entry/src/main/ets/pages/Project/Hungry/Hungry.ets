import { Cart } from './Component/Catr'
import { Footer } from './Component/Footer'
import { Navigation1 } from './Component/Navigation'
import { ProductsMenu } from './Component/ProductsMenu'
import http from '@ohos.net.http'
import { Categroy } from './Common/Entities'
// 创建 HTTP Request对象
const request = http.createHttp()

@Entry
@Component
struct Hungry {
  @State ShowCart: boolean = true
  @State categoryList: Categroy[] = []
  Address: string = 'https://1c3ca57b.r8.cpolar.top/infos'

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
      Footer({ ShowCart: $ShowCart })
    }
    .width('100%')
    .height('100%')
  }
}