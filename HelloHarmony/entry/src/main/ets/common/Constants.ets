/*
 * 常量类 用来存放常量
 * */
import { PortraitInfo } from '../model/PortraitInfo';
import { UserCheckInfo } from '../model/UserCheck';
import { VideoInfo } from '../model/VideoInfo';

export default class Constants{
  /*
   * 路由参数 代表头像数组数据的参数名
   * */
  static readonly PARAM_PORTRAIT_INFO_ARR_KEY:string
    = 'portraitInfoArr';
  /*
   * 头像数据
   * */
  static readonly PORTRAIT_INFO_ARR:Array<PortraitInfo> = [
    {
      "id": 0,
      "portraitPath": "portrait/portrait_00.jpg"
    },
    {
      "id": 1,
      "portraitPath": "portrait/portrait_01.jpg"
    },
    {
      "id": 2,
      "portraitPath": "portrait/portrait_02.jpg"
    },
    {
      "id": 3,
      "portraitPath": "portrait/portrait_03.jpg"
    },
    {
      "id": 4,
      "portraitPath": "portrait/portrait_04.jpg"
    },
    {
      "id": 5,
      "portraitPath": "portrait/portrait_05.jpg"
    },
    {
      "id": 6,
      "portraitPath": "portrait/portrait_06.jpg"
    },
    {
      "id": 7,
      "portraitPath": "portrait/portrait_07.jpg"
    },
    {
      "id": 8,
      "portraitPath": "portrait/portrait_08.jpg"
    },
    {
      "id": 9,
      "portraitPath": "portrait/portrait_09.jpg"
    },
    {
      "id": 10,
      "portraitPath": "portrait/portrait_10.jpg"
    },
    {
      "id": 11,
      "portraitPath": "portrait/portrait_11.jpg"
    },
    {
      "id": 12,
      "portraitPath": "portrait/portrait_12.jpg"
    },
    {
      "id": 13,
      "portraitPath": "portrait/portrait_13.jpg"
    },
    {
      "id": 14,
      "portraitPath": "portrait/portrait_14.jpg"
    },
    {
      "id": 15,
      "portraitPath": "portrait/portrait_15.jpg"
    },
    {
      "id": 16,
      "portraitPath": "portrait/portrait_16.jpg"
    },
    {
      "id": 17,
      "portraitPath": "portrait/portrait_17.jpg"
    },
    {
      "id": 18,
      "portraitPath": "portrait/portrait_18.jpg"
    },
    {
      "id": 19,
      "portraitPath": "portrait/portrait_19.jpg"
    },
    {
      "id": 20,
      "portraitPath": "portrait/portrait_20.jpg"
    },
    {
      "id": 21,
      "portraitPath": "portrait/portrait_21.jpg"
    },
    {
      "id": 22,
      "portraitPath": "portrait/portrait_22.jpg"
    },
    {
      "id": 23,
      "portraitPath": "portrait/portrait_23.jpg"
    },
    {
      "id": 24,
      "portraitPath": "portrait/portrait_24.jpg"
    },
    {
      "id": 25,
      "portraitPath": "portrait/portrait_25.jpg"
    },
    {
      "id": 26,
      "portraitPath": "portrait/portrait_26.jpg"
    },
    {
      "id": 27,
      "portraitPath": "portrait/portrait_27.jpg"
    },
    {
      "id": 28,
      "portraitPath": "portrait/portrait_28.jpg"
    },
    {
      "id": 29,
      "portraitPath": "portrait/portrait_29.jpg"
    },
    {
      "id": 30,
      "portraitPath": "portrait/portrait_30.jpg"
    }
  ]
/* 路由参数 代表选中的头像数据*/
  static readonly PARAM_SELECTED_PORTRAIT_INFO_KEY:string = 'selectedPortraitInfo';
  /* 路由参数:已经登录的用户数据*/
  static readonly PARAM_LOGGED_USER_INFO_KEY:string = 'loggedUserInfo';
  /* 视频数据 */
  static readonly VIDEO_INFO_ARR:Array<VideoInfo> = [
    {
      "videoId": 0,
      "coverPath": "video/video_cover_00.jpg",
      "videoPath": "video/video_00.mp4",
      "author": "KUN",
      "portraitPath": "portrait/portrait_00.jpg",
      "content": "品味咖啡如同品茶，不要“加糖加奶”去破坏一杯好咖啡的芬芳原味，就好比没有人把功夫茶当饮料茶加奶加糖一样",
      "thumbsUpCount": 2,
      "commentCount": 222,
      "favoriteCount": 12,
      "shareCount": 11,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 1,
      "coverPath": "video/video_cover_01.jpg",
      "videoPath": "video/video_01.mp4",
      "author": "科技速递",
      "portraitPath": "portrait/portrait_01.jpg",
      "content": "戴上他的小耳机和听一些小音乐",
      "thumbsUpCount": 1,
      "commentCount": 2,
      "favoriteCount": 3,
      "shareCount": 31,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 2,
      "coverPath": "video/video_cover_02.jpg",
      "videoPath": "video/video_02.mp4",
      "author": "小媛儿女装",
      "portraitPath": "portrait/portrait_02.jpg",
      "content": "已经开始期待春天了，感谢！我要上热门日常穿搭",
      "thumbsUpCount": 1,
      "commentCount": 2,
      "favoriteCount": 3,
      "shareCount": 3,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 3,
      "coverPath": "video/video_cover_03.jpg",
      "videoPath": "video/video_03.mp4",
      "author": "志儿",
      "portraitPath": "portrait/portrait_03.jpg",
      "content": "可以和我聊一聊你新年的计划吗？新年新開始，注重修为和能力！",
      "thumbsUpCount": 1,
      "commentCount": 2,
      "favoriteCount": 3,
      "shareCount": 53,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 4,
      "coverPath": "video/video_cover_04.jpg",
      "videoPath": "video/video_04.mp4",
      "author": "真爱生活",
      "portraitPath": "portrait/portrait_04.jpg",
      "content": "2元在家自制电解质水！",
      "thumbsUpCount": 511,
      "commentCount": 21,
      "favoriteCount": 13,
      "shareCount": 432,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 5,
      "coverPath": "video/video_cover_05.jpg",
      "videoPath": "video/video_05.mp4",
      "author": "夏琳",
      "portraitPath": "portrait/portrait_05.jpg",
      "content": "我好看吗，觉得还行吧！",
      "thumbsUpCount": 511,
      "commentCount": 21,
      "favoriteCount": 13,
      "shareCount": 55,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    }
  ];
  /**
   * 待上传视频数据
   */
  static readonly VIDEO_INFO_UPLOAD_ARR: Array<VideoInfo> = [
    {
      "videoId": 6,
      "coverPath": "video/video_cover_06.jpg",
      "videoPath": "video/video_06.mp4",
      "author": "",
      "portraitPath": "",
      "content": "",
      "thumbsUpCount": 0,
      "commentCount": 0,
      "favoriteCount": 0,
      "shareCount": 0,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 7,
      "coverPath": "video/video_cover_07.jpg",
      "videoPath": "video/video_07.mp4",
      "author": "",
      "portraitPath": "",
      "content": "",
      "thumbsUpCount": 0,
      "commentCount": 0,
      "favoriteCount": 0,
      "shareCount": 0,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 8,
      "coverPath": "video/video_cover_08.jpg",
      "videoPath": "video/video_08.mp4",
      "author": "",
      "portraitPath": "",
      "content": "",
      "thumbsUpCount": 0,
      "commentCount": 0,
      "favoriteCount": 0,
      "shareCount": 0,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 9,
      "coverPath": "video/video_cover_09.jpg",
      "videoPath": "video/video_09.mp4",
      "author": "",
      "portraitPath": "",
      "content": "",
      "thumbsUpCount": 0,
      "commentCount": 0,
      "favoriteCount": 0,
      "shareCount": 0,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 10,
      "coverPath": "video/video_cover_10.jpg",
      "videoPath": "video/video_10.mp4",
      "author": "",
      "portraitPath": "",
      "content": "",
      "thumbsUpCount": 0,
      "commentCount": 0,
      "favoriteCount": 0,
      "shareCount": 0,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    },
    {
      "videoId": 11,
      "coverPath": "video/video_cover_11.jpg",
      "videoPath": "video/video_11.mp4",
      "author": "",
      "portraitPath": "",
      "content": "",
      "thumbsUpCount": 0,
      "commentCount": 0,
      "favoriteCount": 0,
      "shareCount": 0,
      "isFollow": false,
      "isThumbsUp": false,
      "isFavorite": false
    }
  ];
  /*用户登陆校验参数*/
  static readonly USER_CHECK_INFO_ARR:Array<UserCheckInfo> = [
    {
      "userId":1,
      "username":"1",
      "password":"1",
    },
    {
      "userId":2,
      "username":"2",
      "password":"2",
    },
    {
      "userId":3,
      "username":"3",
      "password":"3",
    },
    {
      "userId":4,
      "username":"ikun",
      "password":"114514",
    }
  ];
  /*
   * 路由参数
   *
   * */
  static readonly PARAM_SELECTED_VIDEO_INFO_KEY:string = 'selectedVideoInfo';

  /*
   * 路由参数 待发布的视频数据
   * */
  static readonly PARAM_PUBLISHED_VIDEO_INFO_KEY:string = 'publishedVideoInfo';

  /*
   *  用户上传的视频数据
   * */
  static USER_VIDEO_INFO_ARR:Array<VideoInfo> = [];
  /*
   * 点赞数据
   */
  static THUMBS_UP_ARR:Array<VideoInfo> = [];
  /*
 * 收藏数据
 */
  static FAVOURITE_ARR:Array<VideoInfo> = [];
  /*
 * 关注数据
 */
  static FOLLOW_ARR:Array<VideoInfo> = [];
}