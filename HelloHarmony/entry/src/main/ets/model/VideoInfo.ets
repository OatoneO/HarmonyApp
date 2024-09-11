/*
 *  视频信息类
 * */
export class VideoInfo{
  // 视频id
  videoId:number;
  // 视频文件路径
  videoPath:string;
  // 作者
  author:string;
  // 头像文件路径
  portraitPath:string;
  // 视频封面图片文件路径
  coverPath:string;
  //  内容
  content:string;
  // 点赞数量
  thumbsUpCount:number;
  // 评论数量
  commentCount:number;
  // 收藏数量
  favoriteCount:number;
  // 分享数量
  shareCount:number;
  // 是否关注
  isFollow:boolean;
  //是否点赞
  isThumbsUp:boolean;
  // 是否收藏
  isFavorite:boolean;

}