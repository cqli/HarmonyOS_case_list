import ArrayList from '@ohos.util.ArrayList';
/**
 * 首页指定数据
 */
export class ArticleTop {
  data?: Array<Article>;
}

export class ArticleList {
  curPage: number = 0;
  datas: Array<Article>;
  offset: number = 0;
  over: boolean = false;
  pageCount: number = 0;
  size: number = 0;
  total: number = 0;
}

export class Article {
  isTop: boolean = false; //是否为置顶
  adminAdd: boolean = false; //是否为管理员添加
  apkLink: string = ''; //apk链接
  audit: number = 0;
  author: string = ''; //作者
  canEdit: boolean = false;
  chapterId: number = 0;
  chapterName: string = ''; //chapter
  collect: boolean = false;
  courseId: number = 0;
  desc: string = '';
  descMd: string = '';
  envelopePic: string = '';
  fresh: boolean = false;
  host: string = '';
  id: number = 0;
  isAdminAdd: boolean = false;
  link: string = '';
  niceDate: string = '';
  niceShareDate: string = '';
  origin: string = '';
  prefix: string = '';
  projectLink: string = '';
  publishTime: number = 0;
  realSuperChapterId: number = 0;
  selfVisible: number = 0;
  shareDate: number = 0;
  shareUser: number = 0;
  superChapterId: number = 0;
  superChapterName: string = '';
  tags: Tag[] = [];
  title: string = '';
  type: number = 0;
  userId: number = 0;
  visible: number = 0;
  zan: number = 0;
}

export class Tag {
  name: string = '';
  url: string = '';
}

