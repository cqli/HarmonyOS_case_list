import ClassifyModel from '../../bean/AnimationModel';
import { Constants } from '../../common/constants/Constants';
import { RefreshConstants, RefreshState } from '../../common/constants/RefreshConstants';
import DimensionUtil from '../../utils/DimensionUtil';


@Component
export default struct RefreshAnimHeader {
  @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') state: number;
  @State iconWidth: number = Constants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH;

  private onStateCheck() {
    if (this.state === RefreshState.REFRESHING) {
      this.iconWidth = Constants.REFRESH_HEADER_ITEM_SCALE_WIDTH;
    } else {
      this.iconWidth = Constants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH;
    }
  }

  @Builder AttrAnimIcons(iconItem: ClassifyModel) {
    Image(iconItem.imgRes)
      .width(px2vp(DimensionUtil.adaptDimension(this.iconWidth)))
      .position({ x: iconItem.posX })
      .objectFit(ImageFit.Contain)
      .animation({
        duration: Constants.REFRESH_HEADER_ITEM_ANIM_DURATION,
        tempo: Constants.REFRESH_HEADER_ITEM_ANIM_TEMPO,
        delay: iconItem.delay,
        curve: Curve.Linear,
        playMode: PlayMode.Alternate,
        iterations: Constants.REFRESH_HEADER_ITEM_ANIM_ITERATIONS
      })
  }

  build() {
    Row() {
      if (this.state !== RefreshState.IDLE) { // stop animation when idle state.
        ForEach(Constants.REFRESH_HEADER_FEATURE, (iconItem: ClassifyModel) => {
          this.AttrAnimIcons(iconItem)
        }, (item: ClassifyModel) => JSON.stringify(item))
      }
    }
    .width(Constants.FULL_LENGTH)
    .height(Constants.FULL_LENGTH)
    .onAppear(() => {
      this.onStateCheck();
    })
  }
}