import { router, display } from "@kit.ArkUI"

@Component
export struct HomeSubarea {
  @State columns: number = 2

  aboutToAppear(): void {
    this.updateColumns()
  }

  updateColumns(): void {
    const displayWidth = display.getDefaultDisplaySync().width
    const vpWidth = px2vp(displayWidth)
    if (vpWidth >= 840) {
      this.columns = 4
    } else if (vpWidth >= 600) {
      this.columns = 3
    } else {
      this.columns = 2
    }
  }

  build() {
    Column() {
      Column() {
        Row() {
          Text('手机专区')
            .fontSize(18)
            .fontWeight(700)
          Blank()
          Row() {
            Text('更多')
              .fontSize(14)
              .fontColor('#ff9b9a9a')
            Image($r('app.media.ic_public_arrow_right'))
              .width(18)
              .fillColor('#ff9b9a9a')
          }
        }
        .width('100%')

        Flex({
          wrap: FlexWrap.Wrap
        }) {
          Column() {
            Image($r('app.media.classify01'))
              .width(120)
            Text('Mate 60 Pro')
              .fontSize(14)
              .fontWeight(600)
              .margin(6)

            Text('￥4599')
              .fontSize(14)
              .fontWeight(600)
          }
          .width(`${100 / this.columns}%`)
          .onClick(() => {
            router.pushUrl({ url: 'pages/product/ProductDetail' })
          })

          Column() {
            Image($r('app.media.classify02'))
              .width(120)
            Text('Mate 60 Pro')
              .fontSize(14)
              .fontWeight(600)
              .margin(6)

            Text('￥4599')
              .fontSize(14)
              .fontWeight(600)
          }
          .width(`${100 / this.columns}%`)
          .onClick(() => {
            router.pushUrl({ url: 'pages/product/ProductDetail' })
          })
        }
      }
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(15)
      .padding(15)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding({
      left: 12,
      right: 12
    })
    .margin({
      top: 8
    })
  }
}

export default HomeSubarea

