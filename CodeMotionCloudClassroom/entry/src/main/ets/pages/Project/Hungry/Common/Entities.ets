//菜单种类
export class Categroy{
  category_id:string
  category_name:string
  category_products:ProductInfo[]
}

//商品列表
export class ProductInfo{
  id:number
  picture:string
  name:string
  tag:string
  desc:string
  month_sale:number
  like_rate:string
  price:number
}