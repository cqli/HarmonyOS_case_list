import { NetErrorInterceptor } from '@app/net/src/main/ets/interceptor/NetErrorInterceptor';
import { NetError } from '@app/net/src/main/ets/error/NetError';
/**
 *  统一处理错误
 */
export class MyNetErrorInterceptor implements NetErrorInterceptor {
  httpError(error: NetError) {
    return ""
    // throw new Error('Method not implemented.');

  }
}