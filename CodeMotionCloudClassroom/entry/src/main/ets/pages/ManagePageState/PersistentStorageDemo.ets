// PersistentStorage.ets这个文件主要介绍PersistentStorage是应用全局的UI状态存储，创建PersistentStorage.PersistProp对象，它是持久化数据（它是一个存储），不能预览器运行，看不到效果。只能运行模拟器跟真机才行

// 创建PersistentStorage对象，它是持久化数据
PersistentStorage.PersistProp('cnt', 15) // 它是一个
@Entry
@Component
struct PersistentStorageDemo {
  @StorageLink('cnt') count: number = 0

  build() {
    Column() {
      Button(`当前count值：${this.count}`)
        .onClick(() => {
          this.count++
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}