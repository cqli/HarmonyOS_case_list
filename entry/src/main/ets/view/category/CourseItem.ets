import CourseModel from '../../bean/category/CourseModel';
import { TreeItem } from '../../bean/TreeBean';
import { Constants } from '../../common/constants/Constants';
import HttpConfig from '../../http/HttpConfig';


@Component
export default struct CourseItem {
  @Prop itemStr: string;
  item?: TreeItem;
  cover: string

  aboutToAppear() {
    this.item = JSON.parse(this.itemStr);
  }

  build() {
    Row() {
      Image(this.cover)
        .height(Constants.FULL_LENGTH)
        .aspectRatio(1)
      Column() {
        Text(this.item?.name)
          .fontSize($r('app.float.normal_font_size'))
          .fontColor($r('app.color.base_font_color'))
          .fontFamily($r('app.string.hei_ti_medium'))
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Clip })
          .lineHeight($r('app.float.title_line_height'))
          .width(Constants.FULL_LENGTH)
        Text(this.item.desc)
          .fontSize($r('app.float.header_font_size'))
          .fontColor($r('app.color.price_color'))
          .fontFamily($r('app.string.hei_ti_medium'))
      }
      .padding($r('app.float.course_item_padding'))
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceBetween)
      .height(Constants.FULL_LENGTH)
    }
    .clip(true)
    .borderRadius($r('app.float.normal_border_radius'))
    .backgroundColor($r('app.color.start_window_background'))
    .width('100%')
    .height($r('app.float.course_item_height'))
  }
}