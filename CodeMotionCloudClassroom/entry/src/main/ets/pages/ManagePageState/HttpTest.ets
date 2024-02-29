import http from '@ohos.net.http'

@Entry
@Component
struct HttpTest {
  @State jsonStr: string = ''
  Public: string = 'http://4f2dc7b0.r26.cpolar.top/posts'

  build() {
    Column() {
      Text(`${this.jsonStr}`)
      Button(`获取数据`)
        .onClick(() => {
          // 获取公网数据

          // 1. 第一步:创建Http数据
          const ReturnHttp = http.createHttp()
          // 2. 第二步:请求公网数据
          ReturnHttp.request(this.Public)
            .then((response) => {
              // 3. 通过Response对象获取数据
              const data = response.result.toString()
              console.log(data)

              this.jsonStr = data
            })
            .catch(err => {
              console.error('jsondata', err.message)
            })
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}