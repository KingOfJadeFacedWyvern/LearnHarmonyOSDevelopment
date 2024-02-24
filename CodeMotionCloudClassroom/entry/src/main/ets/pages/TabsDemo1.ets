import promptAction from '@ohos.promptAction'

class TabsBarItem {
  title: string
  defaultImage: Resource
  selectedImage: Resource
  color: Color
}

@Entry
@Component
struct TabsDemo1 {
  @State tabsBarList: TabsBarItem[] = [
    {
      title: '主页',
      defaultImage: $r('app.media.home1'),
      selectedImage: $r('app.media.home2'),
      color: Color.Pink },
    {
      title: '信息',
      defaultImage: $r('app.media.message1'),
      selectedImage: $r('app.media.message2'),
      color: Color.Pink
    },
    {
      title: '图片',
      defaultImage: $r('app.media.photo1'),
      selectedImage: $r('app.media.photo2'),
      color: Color.Pink
    },
    {
      title: '你的',
      defaultImage: $r('app.media.mine1'),
      selectedImage: $r('app.media.mine2'),
      color: Color.Pink
    }
  ]

  @Builder TabsBarBuilder(item: TabsBarItem, index: number) {
    Column({ space: 5 }) {
      Image(this.activeImage === index ? item.selectedImage : item.defaultImage)
        .width(20)
        .aspectRatio(1)
      Text(item.title)
        .fontSize(this.activeImage === index ? 16 : 12)
        .fontColor(this.activeImage === index ? Color.Blue : Color.Black)
    }

  }

  @State activeImage: number = 0 // 控制选中value (主页、信息、图片、你的)

  build() {
    //barPosition: BarPosition.End控制页签在下面，还有一个值Start表示是在上面页签
    Tabs({ barPosition: BarPosition.End }) {
      ForEach(this.tabsBarList, (item: TabsBarItem, index: number) => {
        TabContent() {
          Text(index.toString())
            .fontSize(30)
        }.tabBar(this.TabsBarBuilder(item, index))
        .backgroundColor(item.color)
      })
    }
    // value存储下标
    .onChange((value) => {
      this.activeImage = value
      promptAction.showToast({ message: '选择下标：' + this.activeImage })
    })

  }
}