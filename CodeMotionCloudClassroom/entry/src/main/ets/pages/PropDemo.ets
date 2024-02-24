@Entry
@Component
struct PropDemo {
  @State count: number = 0

  build() {
    Column() {
      Text(`父组件Count：${this.count}`)
        .height(`80VP`)
      Button('父组件Button.给Count + 1')
        .onClick(() => {
          this.count += 1
        })
      Divider()
        .margin({ top: 45 })
      Child({ childCount: this.count })


    }
  }
}

@Component
struct Child {
  // @Prop装饰器-父子单向同步  @Prop装饰的变量可以和父组件建立单向的同步关系。@Prop装饰的变量是可变的，但是变化不会同步回其父组件。
  // 注意如下几点：
  //            1)	@prop修饰的变量类型只能是string，number，boolean类型。
  //            2)	@prop装饰器不能在@Entry装饰的自定义组件中使用。
  //            3)	@Prop在子组件中使用，不能进行初始化，由父组件调用传递状态值。

  @Prop childCount: number

  build() {
    Column() {
      Text(`父组件Count：${this.childCount}`)
        .height(`80VP`)
      Button('子组件Button.给childCount + 1')
        .onClick(() => {
          this.childCount += 1
        })
    }
  }
}