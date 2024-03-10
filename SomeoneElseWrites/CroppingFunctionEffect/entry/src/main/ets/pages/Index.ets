import { CroppingElement, lengthToNumber, Size_wh } from '../Component/CroppingElement'
import ClipTool from '../Components/ClipTool'
import picker from '@ohos.file.picker'
// AppStorage是应用级 ↓
AppStorage.SetOrCreate<CroppingElement>('croppingElement', new CroppingElement({
  size: {
    width: 0,
    height: 0
  }
}))
// AppStorage是应用级 ↑
// LocalStorage是页面级UI状态存储真 ↓
// let storage = new LocalStorage({
//   'croppingElement': new CroppingElement({
//     size: {
//       width: 0,
//       height: 0
//     } })
// })
// LocalStorage是页面级UI状态存储真 ↑
@Entry
@Component
struct Index {
  // LocalStorage是页面级UI状态存储真 ↓
  // @LocalStorageLink('croppingElement') croppingElement: CroppingElement | null = null
  // LocalStorage是页面级UI状态存储真 ↑
  // AppStorage是应用级 ↓
  @StorageLink('croppingElement') croppingElement: CroppingElement | null = null
  // AppStorage是应用级 ↑
  // croppingElement: CroppingElement
  // @State croppingElement: CroppingElement | null = null

  @State imageUri: string = 'Photos/PinkSchoolgirl.jpg'

  photosElect() {
    console.log('开始选择文件')
    // 打开图片 ↓
    let PhotoSelectOptions = new picker.PhotoSelectOptions();
    PhotoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
    PhotoSelectOptions.maxSelectNumber = 1;
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.select(PhotoSelectOptions).then((PhotoSelectResult) => {
      console.info('图片选择的URI' + JSON.stringify(PhotoSelectResult));
      let uri = PhotoSelectResult.photoUris[0]
      this.imageUri = uri
    }).catch((err) => {
      console.error('PhotoViewPicker.select failed with err: ' + err);
    });
    //   打开图片 ↑
  }

  build() {
    Stack() {

      if (this.croppingElement) {
        // 获取图上宽高 ↓
        Image(this.imageUri)
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
            this.croppingElement.initClipArea()
          })
            // 绑定数据 ↑
            // 获取图上宽高 ↑
          .objectFit(ImageFit.Fill)
          .width('100%')
          .opacity(0)
        // 被裁剪。图片预览 ↓
        if (this.croppingElement.imageInfo) {
          Image(this.imageUri)
            .objectFit(ImageFit.Fill)
            .width(this.croppingElement.imageInfo.componentSize.width)
            .height(this.croppingElement.imageInfo.componentSize.height)
            .position({
              x: this.croppingElement.imageInfo.position.x,
              y: this.croppingElement.imageInfo.position.y
            })
        }
        // 被裁剪。图片预览 ↑
        //   剪辑区域
        if (this.croppingElement.clipArea) {
          ClipTool({
            croppingElement: $croppingElement
          })
        }
        Row({ space: 15 }) {
          Button('Select').type(ButtonType.Normal)
            .onClick(() => {
              this.photosElect()
            })
          Button('Cropping').type(ButtonType.Normal)
        }
        .padding(5)
        .backgroundColor('#880F')
        .width('100%')
        .position({
          y: '90%'
        })
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
      // console.log(JSON.stringify(this.croppingElement))

    })
    .width('100%')
    .height('100%')
    .backgroundColor('#2B2B2B')

  }
}