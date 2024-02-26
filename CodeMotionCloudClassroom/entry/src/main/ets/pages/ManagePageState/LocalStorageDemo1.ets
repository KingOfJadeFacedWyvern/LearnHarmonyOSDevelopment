export class Person {
  name?: string;
  age?: number;
}
// 页面级别状态存储对象。可憎管理简单数据类型数据，也可以管理对象类型数据
const Storage2 = new LocalStorage({ // 第一步：初始化LocalStorage全局的页面存储
  Person: { name: '玉面飞龙之王', age: 24 }
})


@Entry(Storage2) // 第二步：Storage数据绑定到Entry
@Component
struct LocalStorageDemo1 {
  @LocalStorageLink('Person') // 第三步：数据绑定@LocalStorageLink
  person1: Person = {}

  build() {
    Column() {
      Button(`父组件中age值: ${this.person1.name}-${this.person1.age}`)
        .onClick(() => {
          this.person1.age += 1
        })
      Chid2()

    }
  }
}

@Component
struct Chid2 {
  @LocalStorageProp('Person')
  person2: Person = {} //全局状态会覆盖初始值


  build() {
    Text(`子组件同步LocalStorage中的Person值：${this.person2.name}-${this.person2.age}`)
  }
}