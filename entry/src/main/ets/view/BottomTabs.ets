/**
 * 底部标签页每个项数据
 * 这段数据是固定不变的，无需暴露model接口，就放在该文件中
 * @param imgSrcNormal 按钮图片
 * @param imgSrcPress 按下后图片
 * @param tabText 按钮文字
 */
class TabItem {
  imgSrcNormal: Resource
  imgSrcPress: Resource
  tabText: Resource

  constructor(imgSrcNormal: Resource, imgSrcPress: Resource, tabText: Resource) {
    this.imgSrcNormal = imgSrcNormal
    this.imgSrcPress = imgSrcPress
    this.tabText = tabText
  }
}

/**
 * 用于初始化TabItem的数组
 */
export function getTabItems(): Array<TabItem> {
  let itemsArray: Array<TabItem> = []
  itemsArray.push(new TabItem(
    $r('app.media.ic_home_normal'),
    $r('app.media.ic_home_selected'),
    $r('app.string.bottom_tab_home')))
  itemsArray.push(new TabItem(
    $r('app.media.ic_nav_normal'),
    $r('app.media.ic_nav_selected'),
    $r('app.string.bottom_tab_classes')))
  itemsArray.push(new TabItem(
    $r("app.media.ic_msg_normal"),
    $r("app.media.ic_msg_selected"),
    $r('app.string.bottom_tab_cart')))
  itemsArray.push(new TabItem(
    $r("app.media.ic_project_normal"),
    $r("app.media.ic_project_selected"),
    $r('app.string.bottom_tab_project')))
  itemsArray.push(new TabItem(
    $r('app.media.ic_me_normal'),
    $r('app.media.ic_me_selected'),
    $r('app.string.bottom_tab_me')))
  return itemsArray;
}

@Component
export struct BottomTabs {
  private tabSrc: number[] = [0, 1, 2, 3, 4]
  private controller: TabsController = new TabsController()
  @Link bottomTabIndex: number
  private tabItemArray: Array<TabItem> = getTabItems()

  build() {
    Flex({ direction: FlexDirection.Row,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceEvenly }) {
      ForEach(this.tabSrc, item => {
        Column() {
          Image((this.bottomTabIndex == item) ? this.tabItemArray[item].imgSrcPress : this.tabItemArray[item].imgSrcNormal)
            .objectFit(ImageFit.Contain)
            .width(24)
            .height(24)
          Text(this.tabItemArray[item].tabText)
            .fontSize(12)
            .margin({ top: 4 })
            .fontColor((this.bottomTabIndex == item) ? $r('app.color.bottom_tabs_font_color_selected') : $r('app.color.common_color_text_hint'))
        }
        .onClick(() => {
          this.controller.changeIndex(item)
        })
        .layoutWeight(1)
      }, item => item.toString())
    }
    .width('100%')
    .height(60)
    .backgroundColor($r('app.color.common_white'))
  }
}