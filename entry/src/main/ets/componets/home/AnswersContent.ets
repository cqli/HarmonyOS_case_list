/**
 * 问答页面
 */
import ClassifyModel from '../../bean/category/ClassifyModel';
import ClassifyViewModel from '../../bean/category/ClassifyViewModel';
import CourseModel from '../../bean/category/CourseModel';
import { Constants } from '../../common/constants/Constants';
import ClassifyItem from '../../view/category/ClassityItem';
import CourseItem from '../../view/category/CourseItem';

@Component
export struct AnswersTabContent {
  @Prop topBarHeight: number

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
    .padding({ top: this.topBarHeight, })
    .backgroundColor($r('app.color.base_background'))
  }
}