import webView from '@ohos.web.webview'
import router from '@ohos.router'
import window from '@ohos.window'


@Entry
@Component
struct WebViewPage {
  @State linkUrl: string = router.getParams()['linkUrl']
  /**
   * 顶部状态栏高度
   */
  @State stateBarHeight: number = 0
  /**
   * 底部状态栏高度
   */
  @State bottomStateBarHeight: number = 0
  controller: webView.WebviewController = new webView.WebviewController()
  testObj = {
    test: (data1, data2, data3) => {
      console.log("data1:" + data1)
      console.log("data2:" + data2)
      console.log("data3:" + data3)
      return "AceString"
    },
    toString: () => {
      console.log('toString' + "interface instead.")
    }
  }

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

  build() {
    Column() {
      Web({ src: this.linkUrl, controller: this.controller })
        .javaScriptAccess(true)
        .javaScriptProxy({
          object: this.testObj,
          name: "objName",
          methodList: ["test", "toStri  ng"],
          controller: this.controller,
        })
        .cacheMode(CacheMode.Default)
    }.width('100%')
    .margin({ top: this.stateBarHeight, bottom: this.bottomStateBarHeight })
    .height('100%')
  }
}