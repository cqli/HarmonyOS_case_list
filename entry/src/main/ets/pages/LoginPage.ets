/**
 * 登录页面
 */
import router from '@ohos.router'
import { Constants } from '../common/constants/Constants'
import { closeLoadingDialog, openLoadingDialog, showLoadingDialog } from '../componets/BaseComponent'
import { LoadingDialog } from '../dialog/LoadingDialog'
import { AppUtils } from '../utils/AppUtils'

@Entry
@Component
struct LoginPage {
  @State message: string = 'Hello World'
  loadingDialogControl = new CustomDialogController({
    builder: LoadingDialog(),
    alignment: DialogAlignment.Center
  })

  build() {
    Column() {
      Row() {
        Image($r('app.media.member_icon_back'))
          .width(45)
          .height(45)
          .padding(10)
          .onClick((event) => {
            router.back()
          })
      }
      .margin({ left: -30 })
      .height(45)


      Text('账号登录')
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.common_text_black'))
        .fontSize(20)
        .textAlign(TextAlign.Start)
        .margin({ top: 30 })

      TextInput({ placeholder: "请输入账号、用户名、手机号" })
        .margin({ top: 30, right: 30 })
        .padding(0)
        .backgroundColor($r('app.color.common_white'))
      Text()
        .width('100%')
        .height(0.5)
        .margin({ top: 15, right: 30 })
        .backgroundColor($r('app.color.common_color_main_15'))

      TextInput({ placeholder: "请输入密码" })
        .margin({ top: 15, right: 30 })
        .padding(0)
        .backgroundColor($r('app.color.common_white'))
      Text()
        .width('100%')
        .height(0.5)
        .margin({ top: 15, right: 30 })
        .backgroundColor($r('app.color.common_color_main_15'))
      Row() {
        Checkbox()
        Text() {
          Span('我一阅读并同意')
          Span('《用户服务条款》')
          Span('与')
          Span('隐私协议')
        }
      }.margin({ top: 30, bottom: 30, right: 30 })


      Row() {
        Button('登录')
          .layoutWeight(1)
          .height(45)
          .margin({ top: 30 })
          .onClick(() => {
            this.loadingDialogControl.open()
            // openLoadingDialog()
            setTimeout(() => {
              // closeLoadingDialog()
              this.loadingDialogControl.close()
            }, 3000)
          })
          .fontColor($r('app.color.common_white'))
          .backgroundColor($r('app.color.common_color_light'))
      }
    }

    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ left: 30, right: 30, top: AppUtils.getInstance().getStateBarHeight() })
  }
}

@Preview({ title: "登录页面" })
@Component
struct PreviewLogin {
  build() {
    Flex() {
      LoginPage()
    }
  }
}
