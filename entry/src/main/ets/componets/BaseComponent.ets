/**
 * 由于组件不能继承；先创建一个二级根页面作为base页面
 * 注意this指向问题
 * 开发者谨慎使用bind改变函数调用的上下文，可能会使this指向混乱。
 * loading 页面暂时不支持扩展
 *
 * 具体的错误信息怎么传到错误页面展示呢
 */
import window from '@ohos.window'
import { LogUtils } from '../../../../../common_library/src/main/ets/utils/LogUtils';
import { LoadingDialog } from '../dialog/LoadingDialog';
import { AppUtils } from '../utils/AppUtils';
/**
 * 初始化dialog 控制器
 */
let loadingDialogControl = new CustomDialogController({
  builder: LoadingDialog(),
  alignment: DialogAlignment.Center,
  autoCancel: false,
  gridCount: 1
})
/**
 * 打开加载 loading
 */
export function openLoadingDialog() {
  loadingDialogControl.open()
}
/**
 * 关闭加载 loading
 */
export function closeLoadingDialog() {
  loadingDialogControl.close()
}


export function showLoadingDialog() {

}

/**
 * 加载中
 */
export let LOAD_LOADING = 1

/**
 * 显示内容
 */
export let LOAD_SHOW_CONTENT = 2

/**
 * 空数据
 */
export let LOAD_EMPTY = 3

/**
 * 加载数据失败
 */
export let LOAD_ERROR = 4


@Component
export struct BaseComponent {

  /**
   * 顶部状态栏高度
   */
  @State stateBarHeight: number = 0

  /**
   * 底部状态栏高度
   */
  @State bottomBarHeight: number = 0
  /**
   * 页面加载状态
   */
  @Prop @Watch('loadingStateChange') loadingState: number;
  /**
   * 页面加载状态监听
   */
  private loadingStateChange() {

  }

  aboutToAppear() {
    window.getLastWindow(getContext(this), (err, data) => {
      if (err.code === 0) {
        data.setWindowLayoutFullScreen(true)
        AppUtils.getInstance().setStateBarHeight(px2vp(data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
          .topRect.height))
        AppUtils.getInstance().setBottomBarHeight(px2vp(data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
          .bottomRect.height))
      } else {
        LogUtils.logDebug("")
      }
    })
  }
  /**
   *  主要展示内容
   */
  @BuilderParam content: () => void

  // /**
  //  *  主要error页面
  //  */
  // @BuilderParam buildError: () => void = this.showError
  /**
   * 加载中
   */
  @Builder showLoading() {
    Column() {
      LoadingProgress()
        .padding({ left: 50, right: 50 })
    }.width('100%')
    .height('100%')

    .backgroundColor($r('app.color.common_white'))

  }

  @Builder showError() {
    Column() {
      Image($r('app.media.wan'))
        .width(50)
        .height(50)

      Text('加载失败，请稍后重试')
        .fontColor($r('app.color.common_text_black'))
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 20 })

    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.common_white'))
  }

  @Builder showEmpty() {
    Column() {
      Image($r('app.media.wan'))
        .width(50)
        .height(50)

      Text('暂无数据')
        .fontColor($r('app.color.common_text_black'))
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 20 })

    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.common_white'))
  }

  @Builder showContent() {
  }

  build() {
    Stack() {
      if (this.loadingState !== LOAD_SHOW_CONTENT) {
        Column() {
          if (this.loadingState === LOAD_LOADING) {
            this.showLoading()
          } else if (this.loadingState === LOAD_ERROR) {
            this.showError()
          }
          else if (this.loadingState === LOAD_EMPTY) {
            this.showEmpty()
          }
        }.width('100%')
        .height('100%')
        .zIndex(1)
      }


      this.content()
    }.padding({ top: this.stateBarHeight, bottom: this.bottomBarHeight })
  }
}

@Preview({ title: 'base组件' })
@Component
struct BaseComponentPreview {
  @State load_state: number = LOAD_LOADING

  @Builder
  Content() {
    Text('内容展示')
      .width('100%')
      .height('100%')
      .textAlign(TextAlign.Center)
  }

  build() {
    Flex() {
      BaseComponent({ loadingState: this.load_state, content: this.Content })
    }
  }
}