import { promptAction, router } from '@kit.ArkUI'
import { CART_DATA_KEY } from '../../utils/constant'

interface CartItem {
  id: number,
  title: string,
  price: string,
  selected: boolean,
  count: number,
  image: string
}

@Component
export default struct PageBottomNavBox {
  @StorageLink(CART_DATA_KEY) cartData: CartItem[] = []
  addToCart() {
    const item: CartItem = {
      id: 1,
      title: 'HUAWEI MatePad 11.5S 灵动款 WiFi 8GB+256GB 湖光青',
      price: '2299',
      selected: false,
      count: 1,
      image: 'https://res.vmallres.com/pimages/FssCdnProxy/vmall_product_uom/pmsSalesFile/428_428_8DC16DC80D84DEF28A4C20DD776FD865.jpg'
    }
    this.cartData.push(item)
    promptAction.showToast({ message: '成功加入购物车' })
  }
  build() {
    Row() {
      Column({ space: 4 }) {
        Text('\ue607')
          .fontFamily('sysFont')
          .fontSize(26)
          .fontColor(Color.Black)
        Text('首页')
          .fontSize(12)
      }
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        router.pushUrl({
          url: 'pages/Index',
          params: {
            index: 0
          }
        })
      })

      Column({ space: 4 }) {
        Text('\uec2e')
          .fontFamily('sysFont')
          .fontSize(24)
          .fontColor(Color.Black)
        Text('客服')
          .fontSize(12)
      }
      .justifyContent(FlexAlign.Center)
      .padding({ left: 15, right: 15 })

      Column({ space: 4 }) {
        Text('\ue67e')
          .fontFamily('sysFont')
          .fontSize(26)
          .fontColor(Color.Black)
        Text('购物车')
          .fontSize(12)
      }
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        router.pushUrl({
          url: 'pages/Index',
          params: {
            index: 3
          }
        })
      })

      Row() {
        Text('加入购物车')
          .fontColor(Color.White)
          .backgroundColor('#ff924c')
          .padding(10)
          .border({
            radius: { topLeft: 30, bottomLeft: 30 }
          })
          .onClick(() => {
            this.addToCart()
          })
        Text('立即购买')
          .fontColor(Color.White)
          .backgroundColor('#db211e')
          .padding(10)
          .border({
            radius: { topRight: 30, bottomRight: 30 }
          })
      }
      .margin({ left: 10 })
    }
    .width('100%')
    .height(60)
    .backgroundColor($r('app.color.main_bg'))
    .border({
      width: { top: 1 },
      color: '#ffd9d5d5'
    })
    .justifyContent(FlexAlign.Center)
  }
}