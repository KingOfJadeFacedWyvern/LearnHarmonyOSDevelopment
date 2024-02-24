import promptAction from '@ohos.promptAction';

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
struct ObservedDemo {
  @State personList: Person[] = [
    new Person(1, '9', 18),
    new Person(2, '8', 19),
    new Person(3, '7', 17)
  ]

  build() {
    Column() {
      ForEach(this.personList, (item: Person, index: number) => {
        comB({ person: item, personList: $personList, CurrentIndex: index })
      })
    }
  }
}

@Component
struct comB {
  person: Person
  @Link
  personList: Person[]
  CurrentIndex: number

  build() {
    Column() {
      Text(`ID:${this.person.id} - 姓名:${this.person.name} - ${this.person.age}`)
        .width(`100%`)
        .fontSize(25)
      Button('给当前Person对象的age加1')
        .onClick(() => {
          const newAge = this.person.age += 1
          this.personList[this.CurrentIndex] = new Person(this.person.id, this.person.name, newAge)
          promptAction.showToast({ message: this.person.age.toString() })
        })
    }
  }
}