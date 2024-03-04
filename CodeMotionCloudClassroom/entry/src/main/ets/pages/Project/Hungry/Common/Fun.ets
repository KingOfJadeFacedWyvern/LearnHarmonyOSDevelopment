// 将商品加入购物车
import { CartProductInfo, ProductInfo } from './Entities'
//定义购物车中状态对应的KEY
export const KEY: string = "ELeMeKey"

export const addToCart = (product: ProductInfo) => {
  //从状态中获取到持久化的购物车列表信息
  const jsomStr: string = AppStorage.Get<string>(KEY) || '[]'
  //将jsonStr 转换成CartProductInfo对象数组
  const cartProductList: CartProductInfo[] = JSON.parse(jsomStr) as CartProductInfo[]
  //判断当前 product是否已经在购物车中
  const findProduct: CartProductInfo = cartProductList.find(item => item.id === product.id)
  if (!findProduct) {
    const currentSelectProductInfo: CartProductInfo = { //购物车中没有该商品
      //准备 CartProductInfo 对象

      id: product.id,
      picture: product.picture,
      name: product.name,
      price: product.price,
      cnt: 1

    }
    //将该对象加入到购物车列表中
    cartProductList.push(currentSelectProductInfo)
  } else {
    //购物车中已经有了该商品
    findProduct.cnt++
  }
  //最后将 cartProductList 转换成字符串设置到状态中
  AppStorage.Set(KEY,JSON.stringify(cartProductList))

}