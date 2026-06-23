import GoodPick from '../../components/common/GoodPick'
import { router } from '@kit.ArkUI'
import { CART_DATA_KEY } from '../../utils/constant'
import { display } from '@kit.ArkUI'

interface CartItem {
  id: number,
  title: string,
  price: string,
  selected: boolean,
  count: number,
  image: string
}

@Component
struct ShoppingCart {
  @StorageLink(CART_DATA_KEY) cartData: CartItem[] = []
  @State showCover: boolean = false
  @State currentItemIndex: number = 0
  coverOptions1: ContentCoverOptions = {
    modalTransition: ModalTransition.NONE,
    backgroundColor: Color.Transparent
  }
  @Builder
  coverBuilder1(index: number) {
    Row() {
      Button('移出购物车')
        .backgroundColor(Color.Red)
        .fontColor(Color.White)
        .onClick(() => {
          this.cartData.splice(index, 1)
          this.showCover = false
        })
    }.height('100%')
  }
  areaChangeHandler(value: Area) {
    if (value.globalPosition.x && value.globalPosition.y && value.globalPosition.x >= 0 && value.globalPosition.y >= 0 &&
      value.globalPosition.x < display.getDefaultDisplaySync().width &&
      value.globalPosition.y < display.getDefaultDisplaySync().height) {
      this.showCover = false
    }
  }

  build() {
    Column() {
      Text('购物车')
        .width('100%')
        .fontSize(20)
        .fontWeight(600)
      Scroll() {
        Column() {
          if(this.cartData.length == 0) {
            Column() {
              Image($r('app.media.convemptyCart'))
                .width(100)
              Text('购物车空荡荡')
                .fontColor('#666')
                .padding({
                  top: 20,
                  bottom: 10
                })
              Text('为辛苦的自己去挑选几件商品吧')
                .fontColor('#666')
                .fontSize(13)
              Button('去购物')
                .padding({
                  left: 40,
                  right: 40
                })
                .backgroundColor('#cf0a2c')
                .margin({
                  top: 20
                })
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/Index',
                    params: {
                      index: 0
                    }
                  })
                })
            }
            .margin({
              top: 40
            })
          } else {
            ForEach(this.cartData, (item: CartItem, index: number) => {
              Row() {
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(600)
                  .margin({ left: 20, right: 20 })
                Row() {
                  Text('共')
                    .fontSize(12)
                  Text(item.count.toString())
                    .fontSize(12)
                    .margin({ left: 5, right: 5 })
                  Text('件')
                    .fontSize(12)
                }
              }
              .width('100%')
              .height(80)
              .backgroundColor('#fff')
              .margin({
                top: 15,
                left: 15,
                right: 15
              })
              .borderRadius(20)
              .alignItems(VerticalAlign.Center)
              .bindContentCover(this.showCover && index === this.currentItemIndex, this.coverBuilder1(index), this.coverOptions1)
              .gesture(
                SwipeGesture({ direction: SwipeDirection.Horizontal })
                  .onAction(() => {
                    this.showCover = true
                    this.currentItemIndex = index
                  })
              )
            })
          }
          GoodPick()
        }
      }
      .scrollBar(BarState.Off)
    }
    .height('100%')
    .width('100%')
    .padding(15)
    .backgroundColor('#f1f3f5')
    .onAreaChange((oldValue: Area, newValue: Area) => {
      this.areaChangeHandler(newValue)
    })
  }
}

export default ShoppingCart