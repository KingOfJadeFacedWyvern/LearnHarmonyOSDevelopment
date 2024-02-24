import promptAction from '@ohos.promptAction';

/*
	                    @Observed&@ObjectLink装饰器-嵌套类对象属性变化更新UI
在实际应用开发中，应用会根据开发需要，封装自己的数据模型。对于多层嵌套的情况，比如二维数组，或者数组项class，或者class的属性是class，他们的第二层的属性变化是无法观察到的,当这些class的第二层属性变化时无法触发UI刷新，这就引出了@Observed/@ObjectLink装饰器。
@ObjectLink和@Observed类装饰器用于在涉及嵌套对象或数组的场景中进行双向数据同步：
*
* 1. @Observed装饰的类，可以被观察到属性的变化。创建类时需要使用new的方式传递数据，不能使用值传递。
* 2. 子组件中@ObjectLink装饰器装饰的状态变量用于接收@Observed装饰的类的实例，和父组件中对应的状态变量建立双向数据绑定。@ObjectLink不能用于entry标识的组件内。
* 3. 单独使用@Observed是没有任何作用的，需要搭配@ObjectLink或者@Prop使用。
* 想要修改Person数组中的每个数据引起UI变化，需要引入多种状态数据，比较麻烦：
*/
@Observed
class Person {
  id: number;
  name: string;
  age: number;

  constructor(id: number, name: string, age: number) {
    this.id = id
    this.name = name
    this.age = age
  }
}

@Entry
@Component
struct ObservedDemo1 {
  @State personList: Person[] = [
    new Person(1, '9', 18),
    new Person(2, '8', 19),
    new Person(3, '7', 17)
  ]

  build() {
    Column() {
      ForEach(this.personList, (item: Person) => {
        comB({ person: item })
      })
    }
  }
}

@Component
struct comB {
  @ObjectLink
  person: Person

  build() {
    Column() {
      Text(`ID:${this.person.id} - 姓名:${this.person.name} - ${this.person.age}`)
        .width(`100%`)
        .fontSize(25)
      Button('给当前Person对象的age加1')
        .onClick(() => {
          this.person.age += 1
          promptAction.showToast({ message: this.person.age.toString() })
        })
    }
  }
}