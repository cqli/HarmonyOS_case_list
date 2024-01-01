import { NetHeaderInterceptor } from '@app/net/src/main/ets/interceptor/NetHeaderInterceptor';
import { HttpHeaderOptions } from '@app/net/src/main/ets/model/HttpHeaderOptions';
/**
 * 可以添加统一的header
 */
export class MyNetHeaderInterceptor implements NetHeaderInterceptor {
  getHeader(options: HttpHeaderOptions): Promise<Object> {
    return new Promise(async (resolve: Function) => {

      resolve(options)
    })
    // throw new Error('Method not implemented.');
  }
}