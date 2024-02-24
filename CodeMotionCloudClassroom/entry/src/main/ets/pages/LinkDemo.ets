@Entry
@Component
struct PropTest {
  @State count: number = 0;

  build() {
    Column() {
      Text(`父组件count:${this.count}`).height(80)

      // 父组件的修改会同步给子组件
      Button("父组件Button:count加1").onClick(() => {
        this.count += 1;
      })

      Divider()
      Child({ count: $count })
    }
  }
}

@Component
struct Child {
  // @Link装饰器-父子双向同步
  // 子组件中被@Link装饰的变量与其父组件中对应的数据源建立双向数据绑定。
  // 注意如下几点：
  //            1)	@Link装饰的变量与其父组件中的数据源共享相同的值。支持string、number、boolean和对象类型。
  //            2)	@Link装饰器不能在@Entry装饰的自定义组件中使用。
  //            3)	父组件使用子组件向子组件传值的时候需要将this.改成 $
  @Link count: number;

  build() {
    Column() {
      Text(`子组件count:${this.count}`).height(80)

      // @Prop装饰的变量不会同步给父组件
      Button('子组件Button:count加1').onClick(() => {
        this.count += 1;
      })
    }
  }
}