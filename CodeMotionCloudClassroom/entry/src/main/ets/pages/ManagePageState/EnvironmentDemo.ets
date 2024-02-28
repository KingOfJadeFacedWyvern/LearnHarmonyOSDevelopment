// 获取设备的当前语言
import i18n from '@ohos.i18n';
// 获取系统语言
const systemLanguage = i18n.getSystemLanguage()

// 通过Environment来存入变量
Environment.EnvProp('Language', systemLanguage)


@Entry
@Component
struct EnvironmentDemo {
  @StorageLink('Language') language: string = ''
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(`当前系统语言：${this.language}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}