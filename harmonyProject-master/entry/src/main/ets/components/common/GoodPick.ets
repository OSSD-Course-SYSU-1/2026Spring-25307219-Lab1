import { router, display } from "@kit.ArkUI"

@Component
struct GoodPick {
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
      Text('好物精选')
        .fontSize(16)
        .fontWeight(600)
        .width('100%')
        .margin({
          bottom: 12
        })
      Flex({
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.SpaceBetween
      }) {
        ForEach(Array.from({ length: 20 }), () => {
          Column() {
            Image($r('app.media.classify01'))
              .width(120)
            Column() {
              Text('Mate 60 Pro')
                .fontSize(14)
              Text('6.88mm轻薄可靠|鸿蒙AI趣玩|后置5000万悬停自拍')
                .fontSize(12)
                .fontColor('#666')
                .margin({ top: 6, bottom: 6 })
                .textOverflow({
                  overflow: TextOverflow.Ellipsis
                })
                .maxLines(1)

              Text('￥4599')
                .fontSize(14)
                .fontWeight(600)
            }
            .alignItems(HorizontalAlign.Start)
          }
          .width(`${(100 / this.columns) - 2}%`)
          .backgroundColor('#fff')
          .margin({ bottom: 6 })
          .borderRadius(12)
          .padding(8)
          .onClick(() => {
            router.pushUrl({ url: 'pages/product/ProductDetail' })
          })
        })
      }
    }
    .margin({
      top: 20,
      bottom: 20
    })
  }
}

export default GoodPick