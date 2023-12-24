/**
 * banner
 */
import router from '@ohos.router'
import { Banner } from '../../bean/BannerBean'
import { PageUrl } from '../../common/constants/PageUrl'

@Component
export struct HomeBannerItem {
  @Link private data: Array<Banner>

  build() {
    Column() {
      Swiper() {
        ForEach(this.data, (item: Banner) => {
          Image(item.imagePath)
            .height('100%')
            .width('100%')
            .borderRadius(10)
            .onClick(() => {
              router.pushUrl({
                url: PageUrl.WEB_VIEW_PAGE_URL,
                params: {
                  linkUrl: item.url
                }
              });
            })
        })
      }
      .index(0)
      .autoPlay(true)
      .interval(3000)
      .indicator(true)
      .indicatorStyle({ mask: true, bottom: 2 })
      .loop(true)
      .height(150)
      .width('100%')
    }
    .width('100%')
    .borderRadius(15)
  }
}