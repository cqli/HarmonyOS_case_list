/**
 * 该组件为主界面第四个标签页面。
 * 该标签页显示个人设定信息界面
 */
import router from '@ohos.router'
import { PageUrl } from '../../common/constants/PageUrl'
import { AppUtils } from '../../utils/AppUtils'

@Component
export struct MineTabContent {
  @State isRefreshing: boolean = false
  scroller: Scroller = new Scroller()

  build() {
    Refresh({ refreshing: $$this.isRefreshing, offset: 120, friction: 100 }) {
      Stack({ alignContent: Alignment.TopStart }) {
        Image($r('app.media.common_page_header_bg'))
          .width('100%')
          .height(240)
        Scroll(this.scroller) {
          Column() {
            Row() {
              Image($r('app.media.wan'))
                .width(100)
                .height(100)
                .margin({ left: 15 })
                .clip(new Circle({ width: 100, height: 100 }))
              Column() {
                Text($r('app.string.mine_no_login_title'))
                  .fontColor($r('app.color.common_text_black'))
                  .fontSize($r('app.float.common_text_large_size'))
                  .margin({ left: 15 })
                  .fontColor($r('app.color.common_white'))
                  .fontSize(20)
                  .fontWeight(FontWeight.Medium)

                Row() {
                  Text('id: --')
                    .fontColor($r('app.color.common_text_black'))
                    .fontSize($r('app.float.common_text_large_size'))
                    .margin({ left: 15 })
                    .fontColor($r('app.color.common_white'))
                    .fontSize(18)
                  Text('排名: --')
                    .fontColor($r('app.color.common_text_black'))
                    .fontSize($r('app.float.common_text_large_size'))
                    .margin({ left: 15 })
                    .fontColor($r('app.color.common_white'))
                    .fontSize(18)

                }
                .margin({ top: 15 })
              }.width('100%')
              .alignItems(HorizontalAlign.Start)

            }
            .width('100%')
            .height(200)
            .onClick(() => {
              router.pushUrl({
                url: PageUrl.LOGIN_PAGE_URL
              })
            })
            .margin({ left: $r('app.float.common_margin'), right: $r('app.float.common_margin') })
            .padding({ top: AppUtils.getInstance().getStateBarHeight() })
            .backgroundColor($r('app.color.common_color_light'))

            Column() {
              this.mineItem('我的积分')
              this.mineItem('我的收藏')
              this.mineItem('我的文章')
              this.mineItem('TODO')
              Text()
                .height(10)
                .width('100%')
                .backgroundColor($r('app.color.common_color_main_15'))
              this.mineItem('开源网站')
              this.mineItem('我的项目')
              this.mineItem('系统设置')
            }
            .backgroundColor($r('app.color.common_color_page_bg'))
            .borderRadius({ topLeft: $r('app.float.common_margin'), topRight: $r('app.float.common_margin') })
            .margin({ top: -15 })
            .width('100%')
          }
          .width('100%')
        }
        .scrollable(ScrollDirection.Vertical)
        .scrollBarWidth(0) // 滚动条宽度
        .edgeEffect(EdgeEffect.None)
        .onScroll((xOffset: number, yOffset: number) => {
          console.info(xOffset + ' ' + yOffset)
        })
        .onScrollEdge((side: Edge) => {
          console.info('To the edge')
        })
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.common_color_page_bg'))
    }.onRefreshing(() => {
      setTimeout(() => {
        this.isRefreshing = false
      }, 3000)
      console.log('onRefreshing test')
    })

  }
  /**
   * 我的菜单栏
   */
  @Builder
  mineItem(titleName: string) {

    Column() {
      Row() {
        Image($r('app.media.wan'))
          .width(40)
          .height(40)
        Text(titleName)
          .layoutWeight(1)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.common_text_black'))
          .margin({ left: $r('app.float.common_margin') })
        Image($r('app.media.user_icon_top_right'))
          .width(18)
          .height(18)

      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .height(50)

      Text()
        .width('100%')
        .height(0.5)
        .backgroundColor($r('app.color.common_color_main_15'))
    }
    .padding({ left: $r('app.float.common_margin'), right: $r('app.float.common_margin') })

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