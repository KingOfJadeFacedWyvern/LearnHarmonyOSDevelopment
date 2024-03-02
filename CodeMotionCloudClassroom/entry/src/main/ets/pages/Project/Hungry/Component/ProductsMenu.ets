import { Categroy, ProductInfo } from '../Common/Entities'
import { ProductItem } from './ProductItem'

@Component
export struct ProductsMenu {
  @State MenuBarList: string [] = ['必点爆款', '买一送一', '单价套餐', '多人套餐']
  @Link categoryList: Categroy[]
  @State selectItem: number = 0

  build() {
    Row() {
      // 页面左侧菜单栏
      Column() {
        ForEach(this.categoryList, (item: Categroy, index: number) => {
          Text(item.category_name)
            .fontSize(12)
            .width('100%')
            .height(55)
            .textAlign(TextAlign.Center)
            .backgroundColor(this.selectItem == index ? '#FFFFFF' : '#F2F2F2')
            .onClick(() => {
              this.selectItem = index
            })
        })
      }
      .width('20%')
      .height('100%')
      .backgroundColor('#F2F2F2')
      .borderRadius(100)
      // 页面右侧的商品列表
      Column() {
        List() {
          ForEach(this.categoryList[this.selectItem]?.category_products, (item: ProductInfo, index: number) => {
            ListItem() {
              // 将每个商品抽取形成一个组件
              ProductItem({ ProductInfo: item })
              // ProductItem()
            }

          })


        }
      }
      .width('80%')
      .height('100%')
    }
    .width('100%')
  }
}

