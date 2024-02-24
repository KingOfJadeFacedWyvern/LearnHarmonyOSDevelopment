import promptAction from '@ohos.promptAction'

@Entry
@Component
  // Navigation组件一般作为页面的根容器，提供了属性来设置页面的标题栏、工具栏、导航栏等
struct NavigationDemo {
  arr: string[] = [
    '笔记1', '笔记2', '笔记3', '笔记4', '笔记4', '笔记5', '笔记6', '笔记7', '笔记8', '笔记9', '笔记10', '笔记11', '笔记12'
  ]

  build() {
    Column() {
      Navigation() {
        //   内容区
        TextInput({ placeholder: '搜索笔记...' })
          .width('90%')
          .backgroundColor(Color.White)
          .margin({ top: 15 })

        List({ space: 12 }) {
          ForEach(this.arr, (item: any, index: number) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height(75)
                .backgroundColor(Color.White)
                .textAlign(TextAlign.Center)
                .fontWeight(FontWeight.Bold)
                .borderRadius(55)
            }
          })
        }
        .width('100%')
        .height(500)
        // .backgroundColor(Color.Pink)
        .margin({ top: 12 })
        .padding({ left: '10%', right: '10%' })

      }
      .title('全部笔记') //这是标题栏
      .titleMode(NavigationTitleMode.Mini) //标题样式

      .menus([ // 有三个参数： 一个参数：菜单栏显示文本(必需要填写)。二个参数：图标资源路径，三个参数：当前选项被选中的事件回调。
        { value: '新增', icon: './Images/new.png', action: () => {
          promptAction.showToast({ message: '添加新增' })
        } },
        { value: '历史', icon: './Images/history.png', action: () => {
          promptAction.showToast({ message: '菜单历史' })
        } },
        { value: '收藏', icon: './Images/collect.png', action: () => {
          promptAction.showToast({ message: '菜单收藏' })
        } },
      ])
      // 底部的工具栏
      .toolBar({
        items: [
          {
            value: '笔记',
            icon: './Images/todo.png',
            action: () => { // 有三个参数： 一个参数：菜单栏显示文本(必需要填写)。二个参数：图标资源路径，三个参数：当前选项被选中的事件回调。
              promptAction.showToast({ message: '笔记' })
            }
          },
          { value: '收藏', icon: './Images/todo.png', action: () => {
            promptAction.showToast({ message: '收藏' })
          } },
        ]
      })
      // .hideTitleBar(true)
      // .hideToolBar(true)
      // .hideNavBar(true)
      .hideBackButton(true)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}