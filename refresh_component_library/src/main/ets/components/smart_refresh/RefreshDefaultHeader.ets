import systemDateTime from '@ohos.systemDateTime';
import preferences from '@ohos.data.preferences';
import { RefreshConstants, RefreshState } from './RefreshConstants';

let mPreferences: any = null
let LAST_UPDATE_TIME_TAG = 'last_update_time_tag'

/**
 * 默认刷新header
 */
@Component
export struct RefreshDefaultHeader {
  @State refreshTitle: Resource = $r('app.string.refresh_default_header_hint');
  @State refreshIcon: Resource = $r('app.media.ic_pull_down_refresh');
  // @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') smartState: number;
  @State lastUpdateTime: string = new Date().getHours() + ' : ' + new Date().getMinutes();

  aboutToAppear() {
    // try {
    //   preferences.getPreferences(getContext(this), LAST_UPDATE_TIME_TAG, function (err, val) {
    //     if (err) {
    //       console.error("Failed to get preferences. code =" + err.code + ", message =" + err.message);
    //       return;
    //     }
    //     mPreferences = val;
    //     console.info("Succeeded in getting preferences.");
    //   })
    // } catch (err) {
    //   console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
    //
    // }


  }

  // private onStateCheck() {
  //   switch (1) {
  //     case RefreshState.IDLE:
  //       this.refreshTitle = $r('app.string.refresh_default_header_hint');
  //       this.refreshIcon = $r('app.media.ic_pull_down_refresh');
  //
  //       try {
  //
  //         mPreferences.get(LAST_UPDATE_TIME_TAG, new Date().getHours() + ' : ' + new Date().getMinutes(), (err, time) => {
  //           this.lastUpdateTime = time
  //           if (err) {
  //             console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
  //             return;
  //           }
  //           console.info("Succeeded in putting value of 'startup'.");
  //         })
  //
  //       } catch (err) {
  //         console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
  //       }
  //       break;
  //     case RefreshState.DRAGGING_REFRESHABLE:
  //       this.refreshTitle = $r('app.string.refresh_default_header_load');
  //       this.refreshIcon = $r('app.media.ic_pull_up_refresh');
  //       break;
  //     case RefreshState.REFRESHING:
  //       this.refreshTitle = $r('app.string.refresh_default_header_loading');
  //       this.refreshIcon = $r('app.media.ic_load_refresh');
  //       break;
  //     case RefreshState.COMPLETE:
  //       try {
  //
  //         systemDateTime.getCurrentTime(false).then(time => {
  //           let data = new Date(time).getHours() + ' : ' + new Date().getMinutes()
  //           this.lastUpdateTime = data
  //           mPreferences.put(LAST_UPDATE_TIME_TAG, data, function (err) {
  //
  //             if (err) {
  //               console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
  //               return;
  //             }
  //             console.info("Succeeded in putting value of 'startup'.");
  //           })
  //         })
  //
  //       } catch (err) {
  //         console.error("Failed to put value of 'startup'. code =" + err.code + ", message =" + err.message);
  //       }
  //       break;
  //
  //   }
  // }

  build() {
    Row() {
      Image(this.refreshIcon)
        // .onAppear(() => {
        //   this.onStateCheck()
        // })
        .width(20)
        .height(20)
        .margin({ right: 15 })
      Column() {
        Text(this.refreshTitle)
          .textAlign(TextAlign.Center)
          .fontSize(20)
          .fontColor($r('app.color.common_text_black'))
          .backgroundColor($r('app.color.common_text_gray'))
        // .onAppear(() => {
        //   this.onStateCheck();
        // })
        Text('上次刷新' + this.lastUpdateTime)
          .textAlign(TextAlign.Center)
          .fontSize(20)
          .fontColor($r('app.color.common_text_black'))
          .backgroundColor($r('app.color.common_text_gray'))
          .margin({ top: 5 })
        // .onAppear(() => {
        //   this.onStateCheck();
        // })
      }

    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.common_text_gray'))

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