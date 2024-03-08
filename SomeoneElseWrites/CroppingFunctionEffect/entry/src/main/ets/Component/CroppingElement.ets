export interface Size_wh {
  width: number
  height: number
}

export interface Position_xy {
  x: number
  y: number
}

// 想要裁剪哪一区域，首先要知道画布大小
export class CroppingElement {
  size: Size_wh
  //   被裁剪图片信息
  imageInfo: {
    size: Size_wh,
    componentSize: Size_wh,
    position: Position_xy
  } // = {
  //   size: {
  //     width: 200,
  //     height: 55
  //   },
  //   position: {
  //     x: 0,
  //     y: 0
  //   }
  // }
  //   裁剪区域
  clipArea: {
    size: Size_wh
    position: Position_xy
  }
  // 类初始化
  constructor(options: { size: Size_wh }) { //当用户打开裁剪图片工具，用户并不知道要裁剪哪一区域跟裁剪多大。要把传进来图片大小
    if (options) { //如果options有值执行下面代码
      this.size = options.size
    }
  }

  initImageInfo(params: {
    width: number,
    height: number,
    componentWidth: number,
    componentHeight: number
  }) {
    this.imageInfo = {
      size: {
        width: params.width,
        height: params.height
      },
      componentSize: {
        width: params.componentWidth,
        height: params.componentHeight
      },
      position: {
        x: this.size.width / 2 - params.componentWidth / 2,
        y: this.size.height / 2 - params.componentHeight / 2
      }
    }
  }
}

export const lengthToNumber = (l: Length): number => {
  return parseFloat(l.toString())
}