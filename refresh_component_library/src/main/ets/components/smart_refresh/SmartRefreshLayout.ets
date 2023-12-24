/**
 * 下拉刷新组件
 */
import { LoadMoreLayout } from './LoadMoreLayout';
import { RefreshConstants, RefreshState } from './RefreshConstants';
import { RefreshDefaultHeader } from './RefreshDefaultHeader';

@Component
export struct SmartRefreshLayout {
  @Provide(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateChanged') smartState: number = RefreshState.IDLE;
  @Provide(RefreshConstants.LOAD_MORE_STATE_TAG) @Watch('onLoadMorStateChanged') smartLoadMoreState: number = RefreshState.LOAD_MORE_COMPLETE;

  private onStateChanged() {

  }

  private onLoadMorStateChanged() {

  }

  aboutToAppear() {
    let allinfo: string = JSON.stringify(getInspectorTree())
    let allinfoa: string = JSON.stringify(getInspectorTree())
  }

  build() {
    Scroll() {
      Column() {
        RefreshDefaultHeader()
          .height(70)
          .margin({ top: -35 })

        Text('中间区域')
          .layoutWeight(1)

        LoadMoreLayout()
          .height(70)
          .margin({ bottom: -35 })

      }.width('100%')
      .height('100%')
      .id('licq')
      .onAreaChange((oldValue, newValue) => {
        //组件区域变化事件


      })

    }
    .onScrollFrameBegin((offset: number, state: ScrollState) => {
      // logUtils.logDebug('偏移量：' + offset)
      return { offsetRemain: offset };
    })
  }
}