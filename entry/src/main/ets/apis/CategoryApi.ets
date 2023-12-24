/**
 * 首页相关接口
 */
import ResponseResult from '../bean/ResponseResult'
import { ArticleTop } from '../bean/HomeModule'

/**
 * 首页接口
 */
const HOME_PAGE_INDEX: string = "/goods-api/homepage/index"

/**
 * 分类接口
 */
const MALL_CATEGORY = "/goods-api/home-category/get"

/**
 * 分类接口
 */
const MALL_CATEGORY_BY_ID = "/goods-api/home-category/get/{firstId}"
/**
 * 获取首页数据
 */
export const getHomeInfo = (success: (result: ArticleTop) => void) => {

}