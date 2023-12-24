/**
 * @desc：网络请求返回结果
 */
export default class ResponseResult<T> {
  /**
   * Code returned by the network request: success, fail.
   */
  errorCode: number;

  /**
   * Message returned by the network request.
   */
  errorMsg: string | Resource;

  /**
   * Data returned by the network request.
   */
  data?: T;

  constructor() {
    this.errorCode = -1;
    this.errorMsg = '';
    this.data = null;
  }
}