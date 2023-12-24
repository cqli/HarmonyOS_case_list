/**
 * @desc：网络请求工具类
 */

import http from '@ohos.net.http';
import ResponseResult from '../bean/ResponseResult';
import HttpConfig from '../http/HttpConfig';
import logUtils from '../../../../../common_library/src/main/ets/utils/LogUtils';

/**
 * Initiate an HTTP GET request to the specified URL.
 *
 * @param url URL for initiating an HTTP request.
 */
export function httpRequestGet(url: string): Promise<ResponseResult<any>> {
  return httpRequest(url, http.RequestMethod.GET);
}

/**
 * Initiate an HTTP POST request to the specified URL.
 *
 * @param url URL for initiating an HTTP request
 * @param newsData Additional data of the request
 * @returns
 */
export function httpRequestPost(url: string, params: Object) {
  return httpRequest(url, http.RequestMethod.POST, params);
}

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request
 * @param method Request method.
 * @param extraData Additional data of the request.
 * @returns Returns {@link ResponseResult}.
 */
function httpRequest(url: string, method: http.RequestMethod, params?: Object): Promise<ResponseResult<any>> {
  let httpRequest = http.createHttp();

  let responseResult = httpRequest.request(url, {
    method: method,
    header: {
      'Content-Type': 'application/json',
    },
    readTimeout: HttpConfig.HTTP_READ_TIMEOUT,
    connectTimeout: HttpConfig.HTTP_READ_TIMEOUT,
    extraData: params
  });
  let serverData: ResponseResult<any>;
  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {


    if (value.responseCode === HttpConfig.HTTP_CODE_200) {
      // Obtains the returned data.
      let result = `${value.result}`;

      logUtils.logDebug(result)
      // let resultJson: ResponseResult<T> = JSON.parse(result);
      // if (resultJson.code === HttpConfig.SERVER_CODE_SUCCESS) {
      //   serverData.data = resultJson.data;
      // }
      // serverData.code = resultJson.code;
      // serverData.code = resultJson.code;
      serverData = JSON.parse(result)
    } else {
      serverData = new ResponseResult<any>();
      serverData.errorMsg = `${$r('app.string.http_error_message')}&${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData = new ResponseResult<any>();
    serverData.errorMsg = $r('app.string.http_error_message');
    return serverData;
  });
}