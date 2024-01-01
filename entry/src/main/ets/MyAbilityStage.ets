import { Net } from '@app/net/src/main/ets/utils/Net';
import AbilityStage from '@ohos.app.ability.AbilityStage';
import HttpConfig from './http/HttpConfig';
import { MyNetErrorInterceptor } from './http/MyNetErrorInterceptor';
import { MyNetHeaderInterceptor } from './http/MyNetHeaderInterceptor';

/**
 *  App启动入口
 * 和Android Application 一样
 */
export default class MyAbilityStage extends AbilityStage {
  onCreate() {

    // 应用的HAP在首次加载的时，为该Module初始化操作
    // @ts-ignore
    Net.getInstance().init({
      baseUrl: HttpConfig.baseURL, //设置全局baseurl
      connectTimeout: HttpConfig.HTTP_CONNECT_TIMEOUT, //设置连接超时
      readTimeout: HttpConfig.HTTP_READ_TIMEOUT, //设置读取超时
      netErrorInterceptor: new MyNetErrorInterceptor(), //设置全局错误拦截,需要自行创建,可在这里进行错误处理
      netHeaderInterceptor: new MyNetHeaderInterceptor(), //设置全局头拦截器,需要自行创建
      header: {
        'Content-Type': 'application/json'
      }, //头参数
      resultTag: [] //接口返回数据参数，比如data,items等等
    })
  }
}