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
/**
 * 首页
 */
@Component
export struct HomeTabContent {
  @State modules?: ArrayList<Article> = new ArrayList<Article>();
  @State banners?: Array<Banner> = new Array<Banner>();
  @State marginHeader: number = 150
  private mPage = 0;



  aboutToAppear() {

    getHomePageList(this.mPage).then(articleList => {
      this.modules = articleList
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
    Stack() {
      HomeBannerItem({ data: $banners })
        .width('100%')
        .height(150 + AppUtils.getInstance().getStateBarHeight())
        .backgroundColor($r('app.color.common_color_page_bg'))
        .padding({ top: AppUtils.getInstance().getStateBarHeight() })
        .zIndex(Constants.FILE_MANAGER_Z_INDEX)

      RefreshComponent({
        dataList: $modules,
        headerStyle: RefreshHeaderStyle.DEFAULT,
        itemLayout: (item: any, index: number): void => this.ContentBody(item, index),
        onRefresh: () => {
          this.mPage = 0;
          getHomePageList(this.mPage).then(articleList => {
            this.modules = articleList
          })
        },
        onLoadMore: () => {
          this.mPage++;
          getHomePageList(this.mPage).then(data => {
            setTimeout(() => {
              this.modules = data
            }, 1000)

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
        marginHeader: this.marginHeader +AppUtils.getInstance().getStateBarHeight()
      })
        .width(Constants.FULL_LENGTH)
        .height(Constants.FULL_LENGTH)
      // .margin({ top: 150 + this.topBarHeight })
      // .padding({ bottom: 80 + this.topBarHeight })
    }
    .height('100%')
    .alignContent(Alignment.Top)
    .backgroundColor($r('app.color.common_color_page_bg'))
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


