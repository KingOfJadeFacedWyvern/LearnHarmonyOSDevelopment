@Component
export struct Footer {
  @Link  ShowCart: boolean

  build() {
    Text('结算区')
      .onClick(() => {
        this.ShowCart= !this.ShowCart

      })
  }
}