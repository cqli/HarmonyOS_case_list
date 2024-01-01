import { Article } from '../../bean/HomeModule';
import { getBanner, getHomeInfo, getHomePageList } from '../../apis/HomeApi';
import { Constants } from '../../common/constants/Constants';
import RefreshComponent from '../../view/refresh/RefreshComponent';
import DimensionUtil from '../../utils/DimensionUtil';
import { RefreshHeaderStyle } from '../../common/constants/RefreshConstants';
import display from '@ohos.display';
import { GlobalContext } from '../../utils/GlobalContext';
import ArrayList from '@ohos.util.ArrayList';
import ArticleItem from '../../view/home/ArticleItem';
import { HomeBannerItem } from '../../view/home/HomeBannerItem';
import { Banner } from '../../bean/BannerBean';
import router from '@ohos.router';
import { PageUrl } from '../../common/constants/PageUrl';
import { AppUtils } from '../../utils/AppUtils';
import { BaseComponent, LOAD_EMPTY, LOAD_ERROR, LOAD_LOADING, LOAD_SHOW_CONTENT } from '../BaseComponent';
/**
 * 首页
 */
@Component
export struct HomeTabContent {
  @State modules?: Array<Article> = new Array<Article>();
  @State banners?: Array<Banner> = new Array<Banner>();
  @State marginHeader: number = 150
  private mPage = 0;
  @State loadState: number = LOAD_LOADING
  private listController: Scroller = new Scroller();

  aboutToAppear() {
    getHomeInfo((data: Array<Article>) => {
      getHomePageList(this.mPage, (pageList: Array<Article>) => {
        this.modules = data.concat(pageList)
        this.loadState = LOAD_SHOW_CONTENT
      }, (netError) => {
        this.loadState = LOAD_ERROR
      })

    })


    getBanner().then(result => {
      this.banners = result
    })
  }

  @Builder
  ContentBody(item: any, index: number) {
    ArticleItem({ article: item })
  }

  build() {
    BaseComponent({ loadingState: this.loadState }) {
      RelativeContainer() {
        Stack() {
          HomeBannerItem({ data: $banners })
            .width('100%')
            .height(150 + AppUtils.getInstance().getStateBarHeight())
            .backgroundColor($r('app.color.common_color_page_bg'))
            .padding({ top: AppUtils.getInstance().getStateBarHeight() })
            .zIndex(Constants.FILE_MANAGER_Z_INDEX)

          RefreshComponent({
            dataList: $modules,
            listController: this.listController,
            headerStyle: RefreshHeaderStyle.DEFAULT,
            itemLayout: (item: any, index: number): void => this.ContentBody(item, index),
            onRefresh: () => {
              this.mPage = 0;

              getHomePageList(this.mPage, (data) => {
                this.modules = data
              }, (netError) => {
                // this.loadState = LOAD_ERROR
              })
            },

            onLoadMore: () => {
              this.mPage++;
              getHomePageList(this.mPage, (data) => {
                this.modules = data
              }, (netError) => {
                // this.loadState = LOAD_ERROR
              })

            },
            onItemClick: (item: Article) => {
              router.pushUrl({
                url: PageUrl.WEB_VIEW_PAGE_URL,
                params: {
                  linkUrl: item.link
                }
              });
            },
            marginHeader: this.marginHeader + AppUtils.getInstance().getStateBarHeight()
          })
            .width(Constants.FULL_LENGTH)
            .height(Constants.FULL_LENGTH)
          // .margin({ top: 150 + this.topBarHeight })
          // .padding({ bottom: 80 + this.topBarHeight })


        }
        .height('100%')
        .width('100%')
        .alignContent(Alignment.Top)
        .backgroundColor($r('app.color.common_color_page_bg'))
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          left: { anchor: "__container__", align: HorizontalAlign.Start },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          right: { anchor: "__container__", align: HorizontalAlign.End }
        })
        .id('id_stack_content')

        Column() {

          Image($r('app.media.wan'))
            .width(18)
            .height(18)
            .clip(new Circle({ width: 18, height: 18 }))

          Text('To Top')
            .margin({ top: 15 })
            .fontColor($r('app.color.common_text_black'))
            .fontSize(10)
            .fontWeight(FontWeight.Medium)
        }
        .width(70)
        .height(70)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .clip(new Circle({ width: 70, height: 70 }))
        .backgroundColor("#FF9966")
        .alignRules({
          bottom: { anchor: "id_stack_content", align: VerticalAlign.Bottom },
          right: { anchor: "id_stack_content", align: HorizontalAlign.End }
        })
        .onClick((event) => {
          this.listController.scrollEdge(Edge.Top)
        })
        .margin({ right: 15, bottom: 15 })
        .id("id_to_top")

      }.width('100%')
      .height('100%')
    }
  }
}

@Preview({
  title: 'FoodImage'
})
@Component
struct FoodImageDisplayPreview {
  build() {
    Flex() {
      HomeTabContent()
    }
  }
}


