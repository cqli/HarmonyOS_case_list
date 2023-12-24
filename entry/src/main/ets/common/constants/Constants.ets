/**
 * Common Constants for all features.
 */
import ClassifyModel from '../../bean/AnimationModel';
import display from '@ohos.display';
import { GlobalContext } from '../../utils/GlobalContext';

let deviceDisplay: display.Display = GlobalContext.getContext().getObject('display') as display.Display;

export class Constants {


  /**
   * 启动页打开后，三秒后启动app主页
   */
  static readonly DELAY_SECONDS: number = 3;

  /**
   * Skip button radius.
   */
  static readonly SKIP_BUTTON_RADIUS: number = 14;


  /**
   * common full length
   */
  static readonly FULL_LENGTH = '100%';

  /**
   * refresh header item width
   */
  static readonly REFRESH_HEADER_ITEM_DEFAULT_WIDTH = 30;

  /**
   * refresh header item scale width
   */
  static readonly REFRESH_HEADER_ITEM_SCALE_WIDTH = 80;


  /**
   * refresh header item animation duration
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_DURATION = 2000;

  /**
   * refresh header item animation temp
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_TEMPO = 3.0;

  /**
   * refresh header item animation ITERATIONS
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_ITERATIONS = -1;

  /**
   * refresh header item feature
   */
  static readonly REFRESH_HEADER_FEATURE: ClassifyModel[] = [
    new ClassifyModel($r('app.media.ic_home_selected'), (px2vp(deviceDisplay.width) / 2 - Constants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 100, 400),
    new ClassifyModel($r('app.media.ic_nav_selected'), (px2vp(deviceDisplay.width) / 2 - Constants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 50, 800),
    new ClassifyModel($r('app.media.ic_msg_selected'), px2vp(deviceDisplay.width) / 2 - Constants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2, 1200),
    new ClassifyModel($r('app.media.ic_project_selected'), (px2vp(deviceDisplay.width) / 2 - Constants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 50, 1600),
    new ClassifyModel($r('app.media.ic_me_selected'), (px2vp(deviceDisplay.width) / 2 - Constants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 100, 2000)
  ];

  /**
   * refresh header item width
   */
  static readonly FILE_MANAGER_Z_INDEX = 1;

  /**
   * index default select
   */
  static readonly INDEX_DEFAULT_SELECT = 1;
}