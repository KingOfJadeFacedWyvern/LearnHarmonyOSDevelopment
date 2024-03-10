// ClipTool.ets主要作用触摸交互，还有组件传参之间状态管理
import { CroppingElement, Position_xy } from '../Component/CroppingElement'
import colorSpaceManager from '@ohos.graphics.colorSpaceManager'

@Component
struct ClipTool {
  @Link croppingElement: CroppingElement

  // 要缓存记录手指按下在哪里，移动位置减去按下位置，拿到偏移量
  startPos: Position_xy = {
    x: 0,
    y: 0
  }

  build() {

    Stack() {

    }
    .border({ width: 1, color: Color.Pink })
    .width(this.croppingElement.clipArea.size.width)
    .height(this.croppingElement.clipArea.size.height)
    .position({
      x: this.croppingElement.clipArea.position.x,
      y: this.croppingElement.clipArea.position.y
    })
    .onTouch((event) => {
      let touchPos: Position_xy = {
        x: event.touches[0].x,
        y: event.touches[0].y,
      }
      if (event.type == TouchType.Down) {
        this.startPos = touchPos
      }
      if (event.type == TouchType.Move) {
        let touchOffset: Position_xy = {
          x: touchPos.x - this.startPos.x,
          y: touchPos.y - this.startPos.y
        }
        this.croppingElement.clipArea = {
          size: this.croppingElement.clipArea.size,
          position: {
            x: this.croppingElement.clipArea.position.x += touchOffset.x,
            y: this.croppingElement.clipArea.position.y += touchOffset.y,
          }
        }

        // console.log(JSON.stringify(touchOffset.x))
        // console.log(JSON.stringify(touchOffset.y))
        this.startPos = touchPos
      }
    })
  }
}

export default ClipTool