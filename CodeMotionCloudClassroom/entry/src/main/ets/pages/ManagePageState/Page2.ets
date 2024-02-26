//获取全局LocalStorage状态
import { Person } from './LocalStorageDemo1'

const pageStorage2 = LocalStorage.GetShared() // 获取共享状态@Entry
@Entry(pageStorage2)
@Component
struct Page2 {
  @LocalStorageLink('Person')
  person1: Person = {}
  @State message: string = 'Hello World'

  build() {
    Column() {
      Text(`Page2页面中获取到LocalStorage 信息：${this.person1.name}-${this.person1.age}`)
      Button(`修改Page2 person数据大，给Page加1 `) {


      }
      .onClick(() => {
        this.person1.age += 1
      })
      // Navigator({
      //   target: 'pages/ManagePageState/Page1'
      // }) {
      //   Text(`跳转到Page1`)
      // }
    }
  }
}