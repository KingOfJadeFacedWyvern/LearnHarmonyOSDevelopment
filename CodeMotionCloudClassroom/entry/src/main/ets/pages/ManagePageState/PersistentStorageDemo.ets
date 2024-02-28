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