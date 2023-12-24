import router from '@ohos.router';
import window from '@ohos.window';
import { Constants } from '../common/constants/Constants';
import { PageUrl } from '../common/constants/PageUrl';

/**
 * SplashScreenPage is the entry of the application and shows how to develop a front page.
 * Stay in SplashScreenPage for seconds to jump to the MainPage.
 * Developers can replace background images with advertising videos.
 */
@Entry
@Component
struct SplashScreenPage {
  @State pageShowTime: number = 0;
  @State intervalID: number = 0;
  @State topBarHeight: number = 0

  build() {
    Column() {
      SkipButton({
        secondsCount: (Constants.DELAY_SECONDS - this.pageShowTime),
        topBarHeight: this.topBarHeight
      })
      Image($r('app.media.ic_splash'))
        .objectFit(ImageFit.Auto)
        .align(Alignment.Bottom)


    }
    .alignItems(HorizontalAlign.Start)
    .width(Constants.FULL_LENGTH)
    .height(Constants.FULL_LENGTH)

  }

  /**
   * When the SplashScreenPage is displayed, switch to the next page after 3 seconds.
   * 当启动页显示出来，3s后打开首页
   */
  onPageShow() {
    //设置页面全屏、同时获取全屏下状态栏高度
    window.getLastWindow(getContext(this), (err, data) => {
      if (err.code === 0) {
        data.setWindowLayoutFullScreen(true)
        this.topBarHeight =
        px2vp(data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
          .topRect.height)
      }
    })
    this.intervalID = setInterval(() => {
      this.pageShowTime += 1
      if (this.pageShowTime > Constants.DELAY_SECONDS) {
        router.replaceUrl({
          url: PageUrl.MAIN_PAGE_URL
        });
      }
    }, 1000);
  }

  /**
   * When the SplashScreenPage is hide, clear interval.
   */
  aboutToDisappear() {
    clearInterval(this.intervalID);
  }
}

@Component
struct SkipButton {
  @Prop secondsCount: number;
  @Prop topBarHeight: number

  build() {
    Flex({
      direction: FlexDirection.Row,
      justifyContent: FlexAlign.End
    }) {
      Text($r('app.string.skip', this.secondsCount))
        .backgroundColor($r('app.color.rect_area_background'))
        .borderRadius(14)
        .fontColor(Color.White)
        .width($r('app.float.skip_text_width'))
        .height($r('app.float.skip_text_height'))
        .fontSize($r('app.float.skip_text_size'))
        .margin({
          right: $r('app.float.skip_text_margin_right'),
          top: this.topBarHeight + 10
        })
        .textAlign(TextAlign.Center)
        .border({ width: 1 })
        .borderColor($r('app.color.rect_stroke'))
        .onClick(() => {
          router.replaceUrl({
            url: PageUrl.MAIN_PAGE_URL
          });
        })
    }
  }
}

