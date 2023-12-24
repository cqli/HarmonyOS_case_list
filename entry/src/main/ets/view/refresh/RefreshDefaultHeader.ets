import { Constants } from '../../common/constants/Constants';
import { RefreshConstants, RefreshState } from '../../common/constants/RefreshConstants';
import DimensionUtil from '../../utils/DimensionUtil';
import { GlobalContext } from '../../utils/GlobalContext';
import systemDateTime from '@ohos.systemDateTime';
import preferences from '@ohos.data.preferences';

let mPreferences: any = null
let LAST_UPDATE_TIME_TAG = 'last_update_time_tag'

/**
 * 默认刷新header
 */
@Component
export default struct RefreshDefaultHeader {
  @State refreshTitle: Resource = $r('app.string.refresh_default_header_hint');
  @State refreshIcon: Resource = $r('app.media.ic_pull_down_refresh');
  /**
   * 监听刷新状态
   */
  @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') state: number;
  /**
   * 更新时间存储
   */
  @State lastUpdateTime: string = new Date().getHours() + ' : ' + new Date().getMinutes();

  aboutToAppear() {
    try {
      preferences.getPreferences(getContext(this), LAST_UPDATE_TIME_TAG, function (err, val) {
        if (err) {
          console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
          return;
        }
        mPreferences = val;
        console.info("Succeeded in getting preferences.");
      })
    } catch (err) {
      console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);

    }


  }
  /**
   * 刷新状态监听方法
   */
  private onStateCheck() {
    switch (this.state) {
      case RefreshState.IDLE:
        this.refreshTitle = $r('app.string.refresh_default_header_hint');
        this.refreshIcon = $r('app.media.ic_pull_down_refresh');
        try {
          mPreferences.get(LAST_UPDATE_TIME_TAG, new Date().getHours() + ' : ' + new Date().getMinutes(), (err, time) => {
            this.lastUpdateTime = time
            if (err) {
              console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
              return;
            }
            console.info("Succeeded in putting value of 'startup'.");
          })
        } catch (err) {
          console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
        }
        break;
      case RefreshState.DRAGGING_REFRESHABLE:
        this.refreshTitle = $r('app.string.refresh_default_header_load');
        this.refreshIcon = $r('app.media.ic_pull_up_refresh');
        break;
      case RefreshState.REFRESHING:
        this.refreshTitle = $r('app.string.refresh_default_header_loading');
        this.refreshIcon = $r('app.media.ic_load_refresh');
        break;
      case RefreshState.COMPLETE:
        try {
          systemDateTime.getCurrentTime(false).then(time => {
            let data = new Date(time).getHours() + ' : ' + new Date().getMinutes()
            this.lastUpdateTime = data
            mPreferences.put(LAST_UPDATE_TIME_TAG, data, function (err) {
              if (err) {
                console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
                return;
              }
              console.info("Succeeded in putting value of 'startup'.");
            })
          })
        } catch (err) {
          console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
        }
        break;
    }
  }

  build() {
    Row() {
      Image(this.refreshIcon)
        .onAppear(() => {
          this.onStateCheck()
        })
        .width(20)
        .height(20)
        .margin({ right: 15 })
      Column() {
        Text(this.refreshTitle)
          .textAlign(TextAlign.Center)
          .fontSize(DimensionUtil.getFp($r('app.float.default_header_font_size')))
          .fontColor($r('app.color.common_text_black'))
          .backgroundColor($r('app.color.rect_stroke'))
          .onAppear(() => {
            this.onStateCheck();
          })
        Text('上次刷新' + this.lastUpdateTime)
          .textAlign(TextAlign.Center)
          .fontSize(DimensionUtil.getFp($r('app.float.default_header_font_size')))
          .fontColor($r('app.color.common_text_black'))
          .backgroundColor($r('app.color.rect_stroke'))
          .margin({ top: 5 })
          .onAppear(() => {
            this.onStateCheck();
          })
      }

    }.width(Constants.FULL_LENGTH)
    .height(Constants.FULL_LENGTH)
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.dark_orange'))

  }
}

@Preview({ title: "默认刷新头" })
@Component
struct refreshHeader {
  build() {
    Flex() {
      RefreshDefaultHeader()
    }
  }
}