import ArrayList from '@ohos.util.ArrayList';
import { HomeDataSource } from '../../bean/HomeDataSource';
import { Constants } from '../../common/constants/Constants';
import { RefreshConstants, RefreshHeaderStyle, RefreshState } from '../../common/constants/RefreshConstants';
import LoadMoreLayout from './LoadMoreLayout';
import RefreshAnimHeader from './RefreshAnimHeader';
import RefreshDefaultHeader from './RefreshDefaultHeader';


@Component
export default struct RefreshComponent {
  @Link @Watch('updateList') dataList: ArrayList<any>
  private data: HomeDataSource = new HomeDataSource();
  private headerStyle: RefreshHeaderStyle = RefreshHeaderStyle.DEFAULT;
  private listController: Scroller = new Scroller();
  private onRefresh?: () => void;
  private onLoadMore?: () => void;
  private onItemClick?: (item: any) => void;
  @Provide(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateChanged') state: number = RefreshState.IDLE;
  @Provide(RefreshConstants.LOAD_MORE_STATE_TAG) @Watch('onLoadMorStateChanged') loadMoreState: number = RefreshState.LOAD_MORE_COMPLETE;
  @BuilderParam itemLayout?: (item: any, index: number) => void;
  private isRefresh: boolean = true;
  private mEndIndex: number = 0
  private offsetY: number = 0
  private downY: number = 0
  private isCanLoadMore: boolean = true
  @Prop private marginHeader: number;
  @State headerOffset: number = -RefreshConstants.REFRESH_HEADER_HEIGHT + this.marginHeader;
  /**
   * 更新列表数据
   */
  private updateList() {
    if (this.isRefresh) {
      this.data.setNewData(this.dataList)
      this.isRefresh = false;
      this.isCanLoadMore = true
      if (this.state !== RefreshState.COMPLETE) {
        setTimeout(() => {
          this.state = RefreshState.COMPLETE;
        }, 2000)

      }
    } else {
      this.data.addAll(this.dataList)
      if (this.loadMoreState !== RefreshState.LOAD_MORE_COMPLETE) {

        if (this.dataList === null || this.dataList.length === 0) {
          this.loadMoreState = RefreshState.LOAD_LOAD_MORE_NO_DATA
          this.isCanLoadMore = false
        } else {
          this.loadMoreState = RefreshState.LOAD_MORE_COMPLETE
          this.isCanLoadMore = true
        }
      }
    }

  }

  private onStateChanged() {
    switch (this.state) {
      case RefreshState.REFRESHING:
        if (this.onRefresh !== undefined) {
          this.onRefresh();
          this.isRefresh = true;
        }
        break;
      case RefreshState.COMPLETE:
        this.headerOffset = -RefreshConstants.REFRESH_HEADER_HEIGHT + this.marginHeader;
        this.state = RefreshState.IDLE;
        break;

    }
  }

  private onLoadMorStateChanged() {
    switch (this.loadMoreState) {

      case RefreshState.LOAD_MORE_ING:
        if (this.onLoadMore !== undefined) {
          this.onLoadMore();
        }
        break;
    // case RefreshState.LOAD_MORE_COMPLETE:
    //   this.loadMoreState = RefreshState.LOAD_MORE_IDLE
    //   break;
    }
  }

  aboutToAppear() {
    if (this.state === RefreshState.REFRESHING) {
      this.headerOffset = 0 + this.marginHeader;
      this.onStateChanged();
    } else {
      this.state = RefreshState.IDLE;
      this.headerOffset = -RefreshConstants.REFRESH_HEADER_HEIGHT + this.marginHeader;
    }
  }

  build() {
    Column() {
      List({ scroller: this.listController }) {
        ListItem() {
          Column() {
            if (this.headerStyle === RefreshHeaderStyle.DEFAULT) {
              RefreshDefaultHeader().height(RefreshConstants.REFRESH_HEADER_HEIGHT)
            } else if (this.headerStyle === RefreshHeaderStyle.CLOUD) {
              RefreshAnimHeader().height(RefreshConstants.REFRESH_HEADER_HEIGHT)
            }

          }
          .width(Constants.FULL_LENGTH)
          .height(RefreshConstants.REFRESH_HEADER_HEIGHT)
        }

        LazyForEach(this.data, (item, index) => {

          ListItem() {
            this.itemLayout(item, index)
          }
          .onClick(() => {
            this.onItemClick(item)
          })
        })
        ListItem() {
          Column() {
            LoadMoreLayout()
          }
          .width(Constants.FULL_LENGTH)
        }
      }
      .edgeEffect(EdgeEffect.Spring)
      .width(Constants.FULL_LENGTH)
      .listDirection(Axis.Vertical)
      .margin({ top: this.headerOffset })
      // .offset({ y: this.headerOffset })
      .onScrollIndex((startIndex, endIndex) => {
        this.mEndIndex = endIndex
        if ((this.mEndIndex === this.data.totalCount() - 1 || this.mEndIndex === this.data.totalCount())
        && this.loadMoreState !== RefreshState.LOAD_MORE_ING) {
          if (this.isCanLoadMore) {
            this.loadMoreState = RefreshState.LOAD_MORE_ING;
          }
        }
      })
      .animation({
        curve: Curve.Smooth,
        duration: RefreshConstants.REFRESH_HEADER_ANIM_DURATION,
        playMode: PlayMode.Normal,
        onFinish: () => {
          if (this.headerOffset === -RefreshConstants.REFRESH_HEADER_HEIGHT) {
            this.state = RefreshState.IDLE;
          }
        }
      })
      .onTouch((event?: TouchEvent) => {
        if (!event) {
          return;
        }
        switch (event.type) {
          case TouchType.Down:
            this.downY = event.touches[0].y;
            if (this.state === RefreshState.IDLE) {
              this.state = RefreshState.DRAGGING;
            }
            break;
          case TouchType.Move:
            if (this.state === RefreshState.DRAGGING && this.listController.currentOffset()
              .yOffset <= -RefreshConstants.REFRESH_EFFECTIVE_HEIGHT) {
              this.state = RefreshState.DRAGGING_REFRESHABLE;
            } else if (this.state === RefreshState.DRAGGING && this.listController.currentOffset().yOffset === 0) {
              //触发下拉刷新
              this.offsetY = event.touches[0].y - this.downY;
              if (this.offsetY > 0 && Math.abs(this.offsetY) - RefreshConstants.REFRESH_EFFECTIVE_HEIGHT > 0) {
                this.state = RefreshState.DRAGGING_REFRESHABLE;
              }
            }
            break;
          case TouchType.Up:
            if (this.state === RefreshState.DRAGGING_REFRESHABLE) {
              this.headerOffset = 0 + this.marginHeader;
              this.state = RefreshState.REFRESHING;
            } else if (this.state === RefreshState.DRAGGING) {
              this.state = RefreshState.IDLE;
            }


            break;
          default:
            break;
        }
      })
    }
    .height('100%')
    .width('100%')

  }
}


