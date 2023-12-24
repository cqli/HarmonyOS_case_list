import { RefreshConstants, RefreshState } from '../../common/constants/RefreshConstants';


/**
 * 自定义上拉加载
 */
@Component
export default struct LoadMoreLayout {
  /**
   * 上拉加载title更新
   */
  @State loadMoreTitle: Resource = $r('app.string.refresh_default_load_more_loading');
  /**
   * 上拉加载 图片更新
   */
  @State loadImg: Resource = $r('app.media.ic_load_refresh');
  @State visibilityLoadMore: Visibility = Visibility.Hidden
  @Consume(RefreshConstants.LOAD_MORE_STATE_TAG) @Watch('onLoadMorStateChanged') loadMoreState: number;
  private defaultHeight = 70
  @State loadMoeHeight: number = 0
  /**
   * 上拉加载状态变化监听
   */
  private onLoadMorStateChanged() {
    switch (this.loadMoreState) {
      case RefreshState.LOAD_MORE_ING:
        this.loadMoreTitle = $r('app.string.refresh_default_load_more_loading');
        this.loadImg = $r('app.media.ic_load_refresh');
        this.loadMoeHeight = this.defaultHeight
        this.visibilityLoadMore = Visibility.Visible
        break;
      case RefreshState.LOAD_MORE_COMPLETE:
        this.loadMoreTitle = $r('app.string.refresh_default_load_more_complete');
        this.loadImg = $r('app.media.ic_succeed_refresh');
        this.visibilityLoadMore = Visibility.Hidden
        this.loadMoeHeight = 0
        break;
      case RefreshState.LOAD_LOAD_MORE_NO_DATA:
        this.loadMoreTitle = $r('app.string.refresh_default_load_more_no_data');
        this.loadImg = $r('app.media.ic_succeed_refresh');
        this.loadMoeHeight = this.defaultHeight
        this.visibilityLoadMore = Visibility.Visible
        break;

    }
  }

  build() {
    Row() {
      Image(this.loadImg)
        .width(16)
        .height(16)
        .onAppear(() => {
          this.onLoadMorStateChanged()
        })

      Text(this.loadMoreTitle)
        .margin({ left: 8 })
        .fontColor($r('app.color.common_text_black'))
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .onAppear(() => {
          this.onLoadMorStateChanged()
        })
    }
    .width('100%')
    .visibility(this.visibilityLoadMore)
    .height(this.loadMoeHeight)
    .backgroundColor($r('app.color.rect_stroke'))
    .justifyContent(FlexAlign.Center)
  }
}

@Preview({ title: "loadMore" })
@Component
struct LoadMorePreview {
  build() {
    Flex() {
      LoadMoreLayout()
    }
  }
}