import { CroppingElement, lengthToNumber, Size_wh } from '../Component/CroppingElement'

@Entry
@Component
struct Index {
  croppingElement: CroppingElement
  // @State croppingElement: CroppingElement | null = null

  build() {
    Stack() {
      Image($r('app.media.PinkSchoolgirl'))
        .width('100%')
    }
    // .onAreaChange((oldValue, newValue)：这个作用是获取图片大小(oldValue：表示是旧值大小, newValue：表示是新值大小)
    .onAreaChange((oldValue, newValue) => {
      let size: Size_wh = {
        width: lengthToNumber(newValue.width),
        height: lengthToNumber(newValue.height)
      }
      this.croppingElement = new CroppingElement({
        size: size
      })
      console.log(JSON.stringify(this.croppingElement))

    })
    .width('100%')
    .height('100%')
    .backgroundColor('#2B2B2B')

  }
}