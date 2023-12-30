/**
 * App工具类
 */

export class AppUtils {
  /**
   * 顶部状态栏高度
   */
  private mStateBarHeight = 0

  /**
   * 底部状态栏高度
   */
  private mBottomBarHeight = 0

  private constructor() {
  }

  private static instance: AppUtils;
  private _objects = new Map<string, Object>();

  public static getInstance(): AppUtils {
    if (!AppUtils.instance) {
      AppUtils.instance = new AppUtils();
    }
    return AppUtils.instance;
  }

  public setStateBarHeight(stateBarHeight: number) {
    this.mStateBarHeight = stateBarHeight;
  }

  public getStateBarHeight() {
    return this.mStateBarHeight
  }

  public setBottomBarHeight(BottomBarHeight: number) {
    this.mBottomBarHeight = BottomBarHeight;
  }

  public getBottomBarHeight() {
    return this.mBottomBarHeight
  }
}

/**
 * 1-判断是否为空字符串
 */
const isEmpty = (data) => {
  return data == undefined || data == "" || data.length <= 0
}

/**
 * 2-格式化字符串
 */
const formatHtml = (html) => {
  let data = ''
  if (!isEmpty(html)) {
    let regSymbol = RegExp("&.*;")
    let regHtml = RegExp(/<[^>]*>/g);
    data = html.replace(regSymbol, '').replace(regHtml, '')
  }
  return data
}

export {
  isEmpty, formatHtml
};