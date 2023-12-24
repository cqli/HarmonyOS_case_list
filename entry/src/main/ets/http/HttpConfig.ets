/*
 *  @desc：网络请求相关配置
 */
export default class HttpConfig {
  /**
   * 接口域名地址
   */
  static readonly baseURL = "https://www.wanandroid.com/"

  //1-首页
  static readonly bannerUrl: string = HttpConfig.baseURL + 'banner/json';

  static readonly treeUrl: string = HttpConfig.baseURL + 'tree/json';
  static readonly treeListUrl: string = HttpConfig.baseURL + 'article/list';

  /**
   * The request success status code.
   */
  static readonly SERVER_CODE_SUCCESS: number = 0;

  /**
   * The off set coefficient.
   */
  static readonly Y_OFF_SET_COEFFICIENT: number = 0.1;

  /**
   * The page size.
   */
  static readonly PAGE_SIZE: number = 10;

  /**
   * The refresh and load height.
   */
  static readonly CUSTOM_LAYOUT_HEIGHT: number = 70;

  /**
   * Gt tab data current page.
   */
  static readonly GET_TAB_DATA_CURRENT_PAGE: number = 1;

  /**
   * Http request success status code.
   */
  static readonly HTTP_CODE_200: number = 200;
  static readonly HTTP_CODE_0: number = 0;
  /**
   * The animation delay time.
   */
  static readonly DELAY_ANIMATION_DURATION: number = 300;

  /**
   * The delay time.
   */
  static readonly DELAY_TIME: number = 1000;

  /**
   * The animation duration.
   */
  static readonly ANIMATION_DURATION: number = 2000;

  /**
   * The http timeout duration.
   */
  static readonly HTTP_READ_TIMEOUT: number = 10000;

  /**
   * The http connect_timeout duration.
   */
  static readonly HTTP_CONNECT_TIMEOUT: number = 10000;
}







