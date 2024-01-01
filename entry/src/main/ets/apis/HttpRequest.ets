import HttpConfig from '../http/HttpConfig';
import { httpRequestGet } from './HttpService';
/**
 * @desc：Http网络请求
 */

//1-home(首页)banner
const bannerReq = () => httpRequestGet(HttpConfig.bannerUrl);
//2-nav(导航)
const treeReq = () => httpRequestGet(HttpConfig.treeUrl);
//首页分页列表
const treeListReq = (page: number, cid: number) => httpRequestGet(`${HttpConfig.treeListUrl}/${page}/json?cid=${cid}`);

export {
  bannerReq, treeReq, treeListReq
}