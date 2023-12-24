/**
 * @desc:4-Msg-数据逻辑类
 */
import { getDefaultAddress } from '../apis/CartApi';
import ResponseResult from '../bean/ResponseResult';
import HttpConfig from '../http/HttpConfig';

class CartViewModel {

  //1-导航页面数据接口

  //未读消息
  getMsgUnRead(): Promise<MsgData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      getDefaultAddress().then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }

  //已读消息
  getMsgRead(page: number): Promise<MsgData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      msgReadReq(page).then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
}

let cartViewModel = new CartViewModel();

export default cartViewModel as CartViewModel;