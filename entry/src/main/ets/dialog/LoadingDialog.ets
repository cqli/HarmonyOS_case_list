/**
 * loadingDialog
 */
@CustomDialog
export struct LoadingDialog {
  controller: CustomDialogController

  build() {
    Row() {
      LoadingProgress()
        .width(150)
        .height(150)
    }.justifyContent(FlexAlign.Center)
  }
}