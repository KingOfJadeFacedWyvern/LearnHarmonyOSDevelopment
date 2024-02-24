@Entry
@Component
struct BuilderParamTest {
  @State message: string = 'Hello World'

  build() {
    Column() {
      MyComp({
        info1: '文本A',
        info2: '文本B'
      }) { // 尾随闭包初始化在自定义组件中使用@BuilderParam装饰的属性时也可通过尾随闭包进行初始化。在初始化自定义组件时，组件后紧跟一个大括号“{}”
        Button('第一行按钮')
      }

      MyComp({ info1: '文本C', info2: '文本D' }) {
        Text('第二行文本')
          .width(`100VP`)
          .height(`100VP`)
          .backgroundColor(Color.Yellow)
      }

      MyComp({ info1: '文本E', info2: '文本F' }) {
        Image($r('app.media.icon'))
          .width(100)

      }

      MyComp({ info1: '文本E', info2: '文本F' })

    }
    .width('100%')
    .height('100%')

  }
}
// 通过从复代码提出来，放在自定义组件上。自定义的好处，它将我们共用的代码提出来行成小组件
@Component
struct MyComp {
  info1: string
  info2: string
  // 当在自定义Component中使用了@BuilderParam装饰器装饰的方法，在外部组件中调用该Component时必须传入符合@BuilderParam装饰方法定义的参数内容来初始化@BuilderParam装饰器装饰的方法，否则会显示异常。
  @Builder DefaultBuilder() {
    Text('默认文本')
      .width(100)
      .height(100)
      .backgroundColor(Color.Red)
  }
  // @BuilderParam用来装饰指向@Builder方法的变量，开发者可在初始化自定义组件时对此属性进行赋值，为自定义组件增加特定的功能。该装饰器用于声明任意UI描述的一个元素，类似slot占位符。
  // @Builder方法初始化，两种初始化方式本质一样，即：初始化@BuilderParam装饰器装饰的方法必须通过@Builder方法。
  @BuilderParam MyBuilderParam: () => void = this.DefaultBuilder

  build() {
    Row() {
      Text(this.info1)
        .width(`100}VP`)
        .height(`100VP`)
        .backgroundColor(Color.Orange)
        .textAlign(TextAlign.Center)
      Text(this.info2)
        .width(`100}VP`)
        .height(`100VP`)
        .backgroundColor(Color.Green)
        .textAlign(TextAlign.Center)
      this.MyBuilderParam()
      // Button('按钮')
    }
    .width('100%')
    .backgroundColor(Color.Pink)
    .margin(5)
  }
}