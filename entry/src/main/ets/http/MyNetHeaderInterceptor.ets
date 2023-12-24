// import { NetHeaderInterceptor } from '@app/net/src/main/ets/interceptor/NetHeaderInterceptor';
// import { HttpHeaderOptions } from '@app/net/src/main/ets/model/HttpHeaderOptions';
// /**
//  *
//  */
// export class MyNetHeaderInterceptor implements NetHeaderInterceptor {
//   getHeader(options: HttpHeaderOptions): Promise<Object> {
//     return new Promise(async (resolve: Function) => {
//       // options.header = {
//       //   'Content-Type': 'application/json',
//       //   'X-Client': '{"channelId":"1","deviceId":"1A6D3FCB041465EB5ABCB29B7DB15CA08846870C","fixVersion":1,"mainVersion":"516","os":"android","platformId":1001,"pm":"JSC-AL50","screenSize":"1080*2197","sessionId":"17c48b47e5456c1d1d848e6a498c216d8001aa19","signVersion":1,"source":1,"subVersion":1,"systemVersion":"10","version":"5.1.6"}',
//       //   'sessionId': '17c48b47e5456c1d1d848e6a498c216d8001aa19'
//       // }
//       resolve(options)
//     })
//     // throw new Error('Method not implemented.');
//   }
// }