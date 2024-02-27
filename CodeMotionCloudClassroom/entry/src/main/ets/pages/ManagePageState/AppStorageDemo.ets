import { Person } from './LocalStorageDemo1'
import promptAction from '@ohos.promptAction'
import List from '@ohos.util.List'
/*
AppStorage是应用全局的UI状态存储，是和应用的进程绑定的，由UI框架在应用程序启动时创建，为应用程序UI状态属性提供中央存储。
和LocalStorage不同的是，LocalStorage是页面级的，通常应用于页面内的数据共享，而AppStorage是应用级的全局状态共享，还相当于整个应用的“中枢”。
注意：AppStorage也是基于内存进行状态存储管理。
*/
AppStorage.SetOrCreate<Person>('person', { name: '小小', age: 24 }) // 如果有引用AppStorage，没有的话，它会创建AppStorage
@Entry
@Component
struct AppStorageDemo {
  @StorageLink('person') person: Person = {}

  build() {
    Column({ space: 11 }) {
      Text(`根组件-AppStorage person信息；${this.person.name}-${this.person.age}`)
      Button(`根组件-给age加1`)

        .onClick(() => {
          this.person.age += 1
        })
      Divider()
      comA()
      Divider()
      ComB()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct comA {
  @StorageLink('person') person: Person = {}

  build() {
    Column({ space: 11 }) {
      Text(`A组件-AppStorage person信息；${this.person.name}-${this.person.age}`)
      Button(`AA组件-给age加1`)

        .onClick(() => {
          this.person.age += 1
        })
    }

  }
}

@Component
struct ComB {
  build() {
    Column({ space: 5 }) {
      Button(`获取AppStorage中的值`)
        .onClick(() => {
          const person: Person = AppStorage.Get<Person>(`person`)
          promptAction.showToast({ message: person.name + '-' + person.age })
        })
      // 通过API方式来操作AppStorage UI级别状态值
      Button(`设置AppStorage中的值`)
        .onClick(() => {
          AppStorage.Set<Person>(`person`, { name: '大大', age: 20 })

        })
      //
      // 通过API方式来操作AppStorage UI级别状态值
      Button(`link方式获取 / 设置值`)
        .onClick(() => {
          // 另一种获取值方法
          const Link: SubscribedAbstractProperty<Person> = AppStorage.Link('person')
          // 设置值
          Link.set({
            name: Link.get().name,
            age: Link.get().age += 1
          })
          promptAction.showToast({ message: Link.get().name + '-' + Link.get().age })


        })
    }
  }
}