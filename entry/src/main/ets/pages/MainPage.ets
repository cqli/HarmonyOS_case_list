import window from '@ohos.window';
import { BottomTabs } from '../view/BottomTabs';
import { CategoryTabContent } from '../componets/home/CategoryContent';
import { CartTabContent } from '../componets/home/CartTabContent';
import { HomeTabContent } from '../componets/home/HomeTabContent';
import { MineTabContent } from '../componets/home/MineTabContent';
import { AnswersTabContent } from '../componets/home/AnswersContent';

/**
 * The MainPage that is routed as the SplashScreenPage.
 */
@Entry
@Component
struct MainPage {
  private controller: TabsController = new TabsController()
  /**
   * 底部tab选中index
   */
  @State bottomTabIndex: number = 0
  /**
   * 顶部状态栏高度
   */
  @State stateBarHeight: number = 0

  /**
   * 底部状态栏高度
   */
  @State bottomStateBarHeight: number = 0

  onPageShow() {
    window.getLastWindow(getContext(this), (err, data) => {
      if (err.code === 0) {
        data.setWindowLayoutFullScreen(true)
        this.stateBarHeight =
        px2vp(data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
          .topRect.height)
        this.bottomStateBarHeight = px2vp(data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
          .bottomRect.height)
      }
    })
  }
  /**
   * tab 资源信息
   */
  build() {
    Column() {

      /**
       * 中间的标签页组件
       * 分别为 最近会话/联系人/设置
       */
      Tabs({ barPosition: BarPosition.End, index: 0, controller: this.controller }) {
        TabContent() {
          HomeTabContent({ topBarHeight: this.stateBarHeight })
        }

        TabContent() {
          CategoryTabContent({ topBarHeight: this.stateBarHeight })
        }

        TabContent() {
          AnswersTabContent({ topBarHeight: this.stateBarHeight })
        }


        TabContent() {
          CartTabContent({ topBarHeight: this.stateBarHeight })
        }

        TabContent() {
          MineTabContent({ topBarHeight: this.stateBarHeight })
        }
      }
      .onChange((index: number) => {
        this.bottomTabIndex = index
      })
      .animationDuration(1)
      .vertical(false)
      .barHeight(0)
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      .scrollable(false)
      /**
       * 底部tab标签页
       * 详见bottomTabs.ets
       */
      BottomTabs({ controller: this.controller, bottomTabIndex: $bottomTabIndex })

    }
    .backgroundColor($r('app.color.common_white'))
    .width('100%')
    .height('100%')
    .padding({ bottom: this.bottomStateBarHeight })
  }
}