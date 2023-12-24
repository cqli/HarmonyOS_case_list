/**
 * 下拉刷新常量
 */
export class RefreshConstants {

  /**
   * 下拉刷新状态更新的 tag
   */
  static readonly REFRESH_STATE_TAG = 'refresh_state_tag';
  /**
   * 上拉加载状态更新的 tag
   */
  static readonly LOAD_MORE_STATE_TAG = 'load_more_state_tag';

  /**
   * 刷新header的高度
   */
  static readonly REFRESH_HEADER_HEIGHT = 70;

  /**
   * refresh effective height
   */
  static readonly REFRESH_EFFECTIVE_HEIGHT = 1.2 * RefreshConstants.REFRESH_HEADER_HEIGHT;

  /**
   * refresh layout extra height
   */
  static readonly REFRESH_LAYOUT_EXTRA_HEIGHT = 0.1;

  /**
   * refresh header animation duration
   */
  static readonly REFRESH_HEADER_ANIM_DURATION = 440;
}

/**
 * refresh state enum
 */
export enum RefreshState {
  /**
   * 默认状态
   */
  IDLE = 0,
  /**
   * 下拉状态
   */
  DRAGGING = 1,
  /**
   * 释放刷行
   */
  DRAGGING_REFRESHABLE = 2,
  /**
   * 刷新中
   */
  REFRESHING = 3,
  /**
   * 刷新加载完成
   */
  COMPLETE = 4,
  // /**
  //  * 加载更多默认状态
  //  */
  // LOAD_MORE_IDLE = 5,
  /**
   *  加载更多加载中
   */
  LOAD_MORE_ING = 6,
  /**
   *  加载更多 完成
   */
  LOAD_MORE_COMPLETE = 7,
  /**
   *  加载更多 没有更多数据了
   */
  LOAD_LOAD_MORE_NO_DATA = 8,

}

/**
 * refresh header style enum
 */
export enum RefreshHeaderStyle {
  /**
   * 默认模式
   */
  DEFAULT,
  /**
   * 动画模式
   */
  CLOUD
}

