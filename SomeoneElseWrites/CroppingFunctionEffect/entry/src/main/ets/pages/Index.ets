import { CroppingElement, lengthToNumber, Size_wh } from '../Component/CroppingElement'

@Entry
@Component
struct Index {
  // croppingElement: CroppingElement
  @State croppingElement: CroppingElement | null = null

  build() {
    Stack() {

      if (this.croppingElement) {
        Image($r('app.media.PinkSchoolgirl'))
          // 绑定数据 ↓
          // 图片数据加载成功和解码成功时均触发该回调，返回成功加载的图片尺寸。图片的宽width、图片的高height、组件的宽omponentWidth、组件的高componentHeight
          .onComplete((event) => {
            console.log(JSON.stringify(event))
            this.croppingElement.initImageInfo({
              width: event.width,
              height: event.height,
              componentWidth: px2vp(event.componentWidth),
              componentHeight: px2vp(event.componentHeight)
            })
          })
            // 绑定数据 ↑
          .objectFit(ImageFit.Fill)
          .width('100%')
          .opacity(0)

        if (this.croppingElement.imageInfo) {
          Image($r('app.media.PinkSchoolgirl'))
            .objectFit(ImageFit.Fill)
            .width(this.croppingElement.imageInfo.componentSize.width)
            .height(this.croppingElement.imageInfo.componentSize.height)
            .position({
              x: this.croppingElement.imageInfo.position.x,
              y: this.croppingElement.imageInfo.position.y
            })
        }


      }

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