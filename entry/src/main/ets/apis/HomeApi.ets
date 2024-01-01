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
import { Net } from '@app/net/src/main/ets/utils/Net'
import http from '@ohos.net.http'
import { LogUtils } from '../../../../../common_library/src/main/ets/utils/LogUtils'
import { NetError } from '@app/net/src/main/ets/error/NetError'

/**
 * 首页接口
 */
const HOME_PAGE_INDEX: string = HttpConfig.baseURL + "article/top/json"
const HOME_BANNER: string = HttpConfig.baseURL + 'banner/json';
const articleListUrl: string = HttpConfig.baseURL + 'article/list';


/**
 * 获取首页置顶数据
 * @returns
 */
export const getHomeInfo = (success: (result: Array<Article>) => void): http.HttpRequest => {
  return Net.get(HOME_PAGE_INDEX).requestObject<ResponseResult<Array<Article>>>((data) => {
    //data 为 返回的TestModel对象
    success(data.data)
  }, (errorMsg) => {
    LogUtils.logDebug(errorMsg.getMessage())
  })

  // return new Promise(async (resolve: Function, reject: Function) => {
  //   httpRequestGet(HOME_PAGE_INDEX)
  //     .then((data: ResponseResult<ArrayList<Article>>) => {
  //       if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
  //         resolve(data.data);
  //       } else {
  //         reject($r('app.string.page_none_msg'));
  //       }
  //     })
  // })
}

export const getHomePageList = (page: number, success: (result: Array<Article>) => void, failed: (error: NetError) => void): http.HttpRequest => {
  // return new Promise(async (resolve: Function, reject: Function) => {
  return Net.get(`${articleListUrl}/${page}/json`).requestObject<ResponseResult<ArticleList>>((data) => {
    //data 为 返回的TestModel对象
    success(data.data.datas)
  }, (errorMsg) => {
    failed(errorMsg)
    LogUtils.logDebug(errorMsg.getMessage())
  })
  //   httpRequestGet(`${articleListUrl}/${page}/json`)
  //     .then((rsp: ResponseResult<ArticleList>) => {
  //       if (rsp.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
  //         resolve(rsp.data.datas);
  //       } else {
  //         reject($r('app.string.page_none_msg'));
  //       }
  //     })
  // })
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

