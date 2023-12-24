// import { ListView, RefreshController } from '@app/refresh'
import { getDefaultAddress } from '../../apis/CartApi'
import { AddressBean } from '../../bean/cart/AddressBean'
import { Constants } from '../../common/constants/Constants'
import { RefreshConstants, RefreshHeaderStyle, RefreshState } from '../../common/constants/RefreshConstants'
import DimensionUtil from '../../utils/DimensionUtil'
import { CartDefaultAddress } from '../../view/cart/TitleAddress'
import display from '@ohos.display'
import { GlobalContext } from '../../utils/GlobalContext'
import RefreshComponent from '../../view/refresh/RefreshComponent'
import { SmartRefreshLayout } from 'smart_refresh/src/main/ets/components/smart_refresh/SmartRefreshLayout'
/**
 * 卡管理
 */
@Component
export struct CartTabContent {
  // @State controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []
  @State mAddressBean: AddressBean = null
  @Prop topBarHeight: number
  @Provide(RefreshConstants.REFRESH_STATE_TAG) state: number = RefreshState.REFRESHING;
  private deviceDisplay: display.Display = GlobalContext.getContext().getObject('display') as display.Display;

  aboutToAppear() {
    for (var i = 0; i < 30; i++) {
      this.array.push(i)
    }
    getDefaultAddress().then(addressBean => {
      this.mAddressBean = addressBean
    })
  }
  /**
   * Author:AbnerMing
   * Describe:条目布局
   * @param item  数据对象
   * @param index  数据索引
   */
  @Builder
  ContentBody() {
    Text("测试数据" + 1)
      .width("95%")
      .height(50)
      .margin(10)
      .textAlign(TextAlign.Center)
      .border({ width: 1, color: Color.Pink })
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {


      CartDefaultAddress()
        .height(56)
      SmartRefreshLayout()
        .height('100%')
        .flexGrow(1)
      // RefreshComponent({
      //   headerStyle: RefreshHeaderStyle.DEFAULT,
      //   itemLayout: (): void => this.ContentBody(),
      //   displayHeight: (
      //     px2vp(this.deviceDisplay.height) - DimensionUtil.getVp($r('app.float.file_index_title_height'))),
      //   onRefresh: () => {
      //     setTimeout(() => {
      //       this.state = RefreshState.COMPLETE;
      //     }, 3000);
      //   }
      // })
      //   .width(CommonConstants.FULL_LENGTH)
      //   .margin({ top: DimensionUtil.getVp($r('app.float.file_index_title_height')) })
    }

    .padding({ top: this.topBarHeight })
    .height('100%')
    .backgroundColor($r('app.color.common_color_page_bg'))
  }
}

@Preview({ title: "购物车" })
@Component
struct preCart {
  build() {
    Flex() {
      CartTabContent({ topBarHeight: 10 })
    }
  }
}
