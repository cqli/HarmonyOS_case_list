/**
 * 该组件为主界面第四个标签页面。
 * 该标签页显示个人设定信息界面
 */
import { AppUtils } from '../../utils/AppUtils'

@Component
export struct MineTabContent {

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Image($r('app.media.common_page_header_bg'))
        .width('100%')
        .height(240)
      Column() {
        Row() {
          Image($r('app.media.user_icon_default_header'))
            .width(34)
            .height(34)

          Text($r('app.string.mine_no_login_title'))
            .fontColor($r('app.color.common_text_black'))
            .fontSize($r('app.float.common_text_large_size'))
            .layoutWeight(1)
            .margin({ left: 15 })

          Image($r('app.media.user_icon_top_message'))
            .width(34)
            .height(34)
            .padding(5)

          Image($r('app.media.user_icon_setting'))
            .width(34)
            .height(34)
            .margin({ left: 11 })
            .padding(5)

        }.width('100%')
        .height(68)
        .margin({ top: 10 })

        Text('联系我，一块交流')
          .margin(15)




      }
      .height('100%')
      .width('100%')
      .padding({ left: 15, right: 15, top:AppUtils.getInstance().getStateBarHeight() })

    }
    .width('100%')
    .height('100%')

    .backgroundColor($r('app.color.common_color_page_bg'))
  }
}

@Preview({
  title: 'MinePage'
})
@Component
struct FoodImageDisplayPreview {
  build() {
    Flex() {
      MineTabContent()
    }
  }
}