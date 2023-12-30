// import { Net } from '@app/net/src/main/ets/utils/Net';
import AbilityStage from '@ohos.app.ability.AbilityStage';
import window from '@ohos.window';
import HttpConfig from './http/HttpConfig';
import { AppUtils } from './utils/AppUtils';
// import { MyNetErrorInterceptor } from './http/MyNetErrorInterceptor';
// import { MyNetHeaderInterceptor } from './http/MyNetHeaderInterceptor';

/**
 *  App启动入口
 * 和Android Application 一样
 */
export default class MyAbilityStage extends AbilityStage {
  onCreate() {

    // 应用的HAP在首次加载的时，为该Module初始化操作
    let xClient = {
      "channelId": "1",
      "deviceId": "1A6D3FCB041465EB5ABCB29B7DB15CA08846870C",
      "fixVersion": 1,
      "mainVersion": "516",
      "os": "android",
      "platformId": 1001,
      "pm": "JSC-AL50",
      "screenSize": "1080*2197",
      "sessionId": "17c48b47e5456c1d1d848e6a498c216d8001aa19",
      "signVersion": 1,
      "source": 1,
      "subVersion": 1,
      "systemVersion": "10",
      "version": "5.1.6"
    }
    // Net.getInstance().init({
    //   baseUrl: HttpConfig.baseURL, //设置全局baseurl
    //   connectTimeout: HttpConfig.HTTP_CONNECT_TIMEOUT, //设置连接超时
    //   readTimeout: HttpConfig.HTTP_READ_TIMEOUT, //设置读取超时
    //   netErrorInterceptor: new MyNetErrorInterceptor(), //设置全局错误拦截,需要自行创建,可在这里进行错误处理
    //   netHeaderInterceptor: new MyNetHeaderInterceptor(), //设置全局头拦截器,需要自行创建
    //   header: {
    //     'Content-Type': 'application/json',
    //     'X-Client': JSON.stringify(xClient),
    //     'sessionId': '17c48b47e5456c1d1d848e6a498c216d8001aa19'
    //   }, //头参数
    //   resultTag: [] //接口返回数据参数，比如data,items等等
    // })
  }
}