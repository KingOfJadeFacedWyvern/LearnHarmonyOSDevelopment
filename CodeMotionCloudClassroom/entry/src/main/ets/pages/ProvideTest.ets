@Entry
@Component
struct CompA {
  // @Provide装饰的变量count由入口组件CompA提供其后代组件

  // 1)	@Provide/@Consume装饰的状态变量支持对象、string、number、boolean类型。
  // 2)	@Provide装饰的状态变量自动对其所有后代组件可用，即该变量被“provide”给他的后代组件。由此可见，@Provide的方便之处在于，开发者不需要多次在组件之间传递变量。
  // 3)	后代通过使用@Consume去获取@Provide提供的变量，建立在@Provide和@Consume之间的双向数据同步，与@State/@Link不同的是，前者可以在多层级的父子组件之间传递。
  // 4)	@Provide和@Consume可以通过相同的变量名或者相同的变量别名绑定，变量类型必须相同。
  // 通过相同的变量名绑定
  // @Provide a: number = 0;
  // @Consume a: number;
  // 通过相同的变量别名绑定
  // @Provide('a') b: number = 0;
  // @Consume('a') c: number;


  @Provide count: number = 0;

  build() {
    Column() {
      Button(`count数值：(${this.count})，点击加1`)
        .onClick(() => this.count += 1)
      CompB()
    }
  }
}

@Component
struct CompB {
  build() {
    CompC()
  }
}


@Component
struct CompC {
  build() {
    Row({ space: 5 }) {
      CompD()
      CompD()
    }
  }
}


@Component
struct CompD {
  // @Consume装饰的变量通过相同的属性名绑定其祖先组件CompA内的@Provide装饰的变量

  // 1)	@Provide/@Consume装饰的状态变量支持对象、string、number、boolean类型。
  // 2)	@Provide装饰的状态变量自动对其所有后代组件可用，即该变量被“provide”给他的后代组件。由此可见，@Provide的方便之处在于，开发者不需要多次在组件之间传递变量。
  // 3)	后代通过使用@Consume去获取@Provide提供的变量，建立在@Provide和@Consume之间的双向数据同步，与@State/@Link不同的是，前者可以在多层级的父子组件之间传递。
  // 4)	@Provide和@Consume可以通过相同的变量名或者相同的变量别名绑定，变量类型必须相同。
  // 通过相同的变量名绑定
  // @Provide a: number = 0;
  // @Consume a: number;
  // 通过相同的变量别名绑定
  // @Provide('a') b: number = 0;
  // @Consume('a') c: number;

  @Consume count: number;

  build() {
    Column() {
      Text(`D组件中Count值：(${this.count})`)
      Button(`D组件中count值：(${this.count})，点击加1`)
        .onClick(() => this.count += 1)
    }
    .width('50%')
  }
}
