/**
 * 默认地址管理
 */

@Component
export struct CartDefaultAddress {
  build() {
    Row() {

      Text($r('app.string.cart_title_name'))
        .fontSize(20)
        .fontColor($r('app.color.common_text_black'))
        .fontWeight(FontWeight.Bold)

      Row() {
        Image($r('app.media.icon_cart_select_address'))
          .width(18)
          .height(18)

        Text('请添加收货地址')
          .fontSize(14)
          .fontColor($r('app.color.common_color_light'))
          .margin({ left: 5 })
          .layoutWeight(1)

        Image($r('app.media.user_icon_top_right'))
          .width(12)
          .height(12)
      }
      .layoutWeight(1)
      .padding({ left: 6, right: 6 })
      .margin({ left: 5, right: 45 })
      .backgroundColor($r('app.color.common_white'))
      .borderRadius(13)
      .height(26)

      Text('管理')
        .fontSize(16)
        .fontColor($r('app.color.common_text_black'))
        .onClick(() => {

        })

    }
    .padding({ left: 15, top: 15, right: 15, bottom: 8 })

  }
}

@Preview
@Component
struct PreCartTitle {
  build() {
    Flex() {
      CartDefaultAddress()
    }
  }
}