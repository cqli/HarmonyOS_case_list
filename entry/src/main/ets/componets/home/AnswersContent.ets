import { Constants } from '../../common/constants/Constants';
import { AppUtils } from '../../utils/AppUtils';

@Component
export struct AnswersTabContent {
  aboutToAppear() {
    //
  }

  build() {
    Scroll() {
      Text('滑动区域') {

      }
      .height('120%')
      .width('100%')
      .textAlign(TextAlign.Center)
      .width(Constants.FULL_LENGTH)
      .backgroundColor($r('app.color.common_text_gray'))
    }
    .height('100%')
    .scrollBar(BarState.On)
    .width(Constants.FULL_LENGTH)
    .padding({ top: AppUtils.getInstance().getStateBarHeight() })
    .backgroundColor($r('app.color.base_background'))
  }
}