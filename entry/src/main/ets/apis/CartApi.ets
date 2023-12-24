// import { Net } from '@app/net/src/main/ets/utils/Net'
/**
 * 首页相关接口
 */
import ResponseResult from '../bean/ResponseResult'
import { AddressBean } from '../bean/cart/AddressBean'
import { httpRequestGet } from './HttpService'
import HttpConfig from '../http/HttpConfig'


/**
 * 获取默认收货地址
 */
const USER_ADDRESS_DEFAULT = ""


/**
 * 获取默认地址
 */
export const getDefaultAddress = (): Promise<AddressBean> => {
  // Net.post(USER_ADDRESS_DEFAULT)
  //   .requestObject<ResponseResult<AddressBean>>((responseData) => {
  //     //data 为 返回的TestModel对象
  //     success(responseData.data)
  //   }, (errorMsg) => {
  //
  //   })
  return new Promise(async (resolve: Function, reject: Function) => {
    httpRequestGet(USER_ADDRESS_DEFAULT)
      .then((data: ResponseResult<AddressBean>) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          reject($r('app.string.page_none_msg'));
        }
      })
  })
}