// import { Net } from '@app/net/src/main/ets/utils/Net'
/**
 * 首页相关接口
 */
import ResponseResult from '../bean/ResponseResult'
import { Article, ArticleList, ArticleTop } from '../bean/HomeModule'
import HttpConfig from '../http/HttpConfig'
import { httpRequestGet } from './HttpService'
import ArrayList from '@ohos.util.ArrayList'
import { bannerReq, treeListReq, treeReq } from './HttpRequest'
import { Banner } from '../bean/BannerBean'
import { TreeArticle, TreeItem } from '../bean/TreeBean'

/**
 * 首页接口
 */
const HOME_PAGE_INDEX: string = HttpConfig.baseURL + "article/top/json"
const HOME_BANNER: string = HttpConfig.baseURL + 'banner/json';
const articleListUrl: string = HttpConfig.baseURL + 'article/list';


/**
 * 获取首页数据
 * @returns
 */
export const getHomeInfo = (): Promise<ArrayList<Article>> => {
  return new Promise(async (resolve: Function, reject: Function) => {
    httpRequestGet(HOME_PAGE_INDEX)
      .then((data: ResponseResult<ArrayList<Article>>) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          reject($r('app.string.page_none_msg'));
        }
      })
  })
}

export const getHomePageList = (page: number): Promise<ArrayList<Article>> => {
  return new Promise(async (resolve: Function, reject: Function) => {
    httpRequestGet(`${articleListUrl}/${page}/json`)
      .then((rsp: ResponseResult<ArticleList>) => {
        if (rsp.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(rsp.data.datas);
        } else {
          reject($r('app.string.page_none_msg'));
        }
      })
  })
}

export const getBanner = (): Promise<Array<Banner>> => {
  return new Promise(async (resolve: Function, reject: Function) => {
    bannerReq()
      .then((rsp: ResponseResult<Array<Banner>>) => {
        if (rsp.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(rsp.data);
        } else {
          reject($r('app.string.page_none_msg'));
        }
      })
  })
}

export const getTreeData = (): Promise<Array<TreeItem>> => {
  return new Promise(async (resolve: Function, reject: Function) => {
    treeReq()
      .then((rsp: ResponseResult<Array<TreeItem>>) => {
        if (rsp.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(rsp.data);
        } else {
          reject($r('app.string.page_none_msg'));
        }
      })
  })
}

export const getTreeArticleLists = (page: number, cid: number): Promise<Array<TreeArticle>> => {
  return new Promise(async (resolve: Function, reject: Function) => {
    treeListReq(page, cid)
      .then((rsp: ResponseResult<Array<TreeArticle>>) => {
        if (rsp.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(rsp.data);
        } else {
          reject($r('app.string.page_none_msg'));
        }
      })
  })
}

