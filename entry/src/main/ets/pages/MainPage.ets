import window from '@ohos.window';
import { BottomTabs } from '../view/BottomTabs';
import { CategoryTabContent } from '../componets/home/CategoryContent';
import { CartTabContent } from '../componets/home/CartTabContent';
import { HomeTabContent } from '../componets/home/HomeTabContent';
import { MineTabContent } from '../componets/home/MineTabContent';
import { AnswersTabContent } from '../componets/home/AnswersContent';
import { AppUtils } from '../utils/AppUtils';

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

  onPageShow() {
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
          HomeTabContent()
        }

        TabContent() {
          CategoryTabContent()
        }

        TabContent() {
          AnswersTabContent()
        }


        TabContent() {
          CartTabContent()
        }

        TabContent() {
          MineTabContent()
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
    .padding({ bottom: AppUtils.getInstance().getBottomBarHeight() })
  }
}