/**
 * 卡消费
 */
import { getTreeData } from '../../apis/HomeApi';
import { TreeItem } from '../../bean/TreeBean';
import { Constants } from '../../common/constants/Constants';
import ClassifyItem from '../../view/category/ClassityItem';
import CourseItem from '../../view/category/CourseItem';
import { AppUtils } from '../../utils/AppUtils';
import { BaseComponent, LOAD_LOADING, LOAD_SHOW_CONTENT } from '../BaseComponent';

@Component
export struct CategoryTabContent {
  @State currentClassify: number = 0; // selected classify index.
  @State requestSuccess: boolean = false; // is loading data.
  private classifyList: Array<TreeItem> = [];
  private classifyScroller: Scroller = new Scroller();
  private scroller: Scroller = new Scroller();
  @State loadState: number = LOAD_LOADING

  aboutToAppear() {

    getTreeData().then(data => {

      this.classifyList = data
      this.requestSuccess = true;
      this.loadState = LOAD_SHOW_CONTENT
    })

    // loading data.
    // setTimeout(() => {
    //   this.classifyList = ClassifyViewModel.getLinkData();
    //   this.requestSuccess = true;
    // }, 2000);
  }

  @Builder ClassifyHeader(classifyName: string) {
    Row() {
      Text(classifyName)
        .fontSize($r('app.float.header_font_size'))
        .fontColor($r('app.color.base_font_color'))
        .fontFamily($r('app.string.hei_ti_medium'))
        .fontWeight(500)
    }
    .padding({ left: $r('app.float.item_padding_left') })
    .height($r('app.float.classify_item_height'))
    .width(Constants.FULL_LENGTH)
    .backgroundColor($r('app.color.base_background'))
  }

  classifyChangeAction(index: number, isClassify: boolean) {
    if (this.currentClassify !== index) {
      // change the classify status.
      this.currentClassify = index;
      if (isClassify) {
        // scroll the course scroll.
        this.scroller.scrollToIndex(index);
      } else {
        // scroll the classify scroll.
        this.classifyScroller.scrollToIndex(index);
      }
    }
  }

  build() {
    BaseComponent({ loadingState: this.loadState }) {
      Row() {
        if (this.requestSuccess) {
          List({ scroller: this.classifyScroller }) {
            ForEach(this.classifyList, (item: TreeItem, index?: number) => {
              ListItem() {
                ClassifyItem({
                  classifyName: item.name,
                  isSelected: this.currentClassify === index,
                  onClickAction: () => {
                    if (index !== undefined) {
                      this.classifyChangeAction(index, true);
                    }
                  }
                })
              }
            })
          }
          .height(Constants.FULL_LENGTH)
          .width($r('app.float.classify_item_width'))
          .backgroundColor($r('app.color.classify_background'))
          .scrollBar(BarState.Off)

          List({ scroller: this.scroller }) {
            ForEach(this.classifyList, (classifyItem: TreeItem) => {
              ListItemGroup({
                header: this.ClassifyHeader(classifyItem.name),
                space: 12
              }) {
                ForEach(classifyItem.children, (courseItem: TreeItem) => {
                  ListItem() {
                    CourseItem({ itemStr: JSON.stringify(courseItem), cover: classifyItem.cover })
                  }
                }, (courseItem: TreeItem) => `${courseItem.id}`)
              }
            }, (item: TreeItem) => `${item.id}`)
          }
          .padding({ left: $r('app.float.item_padding_left'), right: $r('app.float.course_item_padding') })
          .sticky(StickyStyle.Header)
          .layoutWeight(1)
          .edgeEffect(EdgeEffect.None)
          .onScrollIndex((start: number) => this.classifyChangeAction(start, false))
        } else {
          Text($r('app.string.loading'))
            .fontFamily($r('app.string.hei_ti_medium'))
            .textAlign(TextAlign.Center)
            .height(Constants.FULL_LENGTH)
            .width(Constants.FULL_LENGTH)
        }
      }
      .padding({ top: AppUtils.getInstance().getStateBarHeight() })
      .backgroundColor($r('app.color.base_background'))
    }

  }
}