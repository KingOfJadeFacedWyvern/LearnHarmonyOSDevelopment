// 页面级别状态存储对象。可憎管理简单数据类型数据，也可以管理对象类型数据
const Storage = new LocalStorage({ // 第一步：初始化LocalStorage全局的页面存储
  age: 24
})


@Entry(Storage) // 第二步：Storage数据绑定到Entry
@Component
struct LocalStorageDemo {
  @LocalStorageLink('age') // 第三步：数据绑定@LocalStorageLink
  firstAge: number = 100 //全局状态会覆盖初始值

  build() {
    Column() {
      Button(`父组件中age值: ${this.firstAge}`)
        .onClick(() => {
          this.firstAge += 1
        })
      Chid()

    }
  }
}

@Component
struct Chid {
  @LocalStorageProp('age')
  secondAge: number = 2 //全局状态会覆盖初始值

  build() {
    Text(`子组件同步LocalStorage中的age值：${this.secondAge}`)
  }
}