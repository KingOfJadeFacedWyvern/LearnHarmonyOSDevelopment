//获取全局LocalStorage状态
import { Person } from './LocalStorageDemo1'

const pageStorage1 = LocalStorage.GetShared() // 获取共享状态

@Entry(pageStorage1)
@Component
struct Page1 {
  @LocalStorageLink('Person')
  person1: Person = {}
  @State message: string = 'Hello World'

  build() {
    Column() {
      Text(`Page1页面中获取到LocalStorage 信息：${this.person1.name}-${this.person1.age}`)
      Button(`修改Page1 person数据大，给Page加1 `)
        .onClick(() => {
          this.person1.age += 1
        })

      Navigator({
        target: 'pages/ManagePageState/Page2'
      }) {
        Text(`跳转到Page2`)
      }
    }
  }
}