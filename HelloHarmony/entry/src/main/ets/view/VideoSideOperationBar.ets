/*
 * 侧边操作栏
 * */
import { FavouriteDataSource } from '../datasource/FavouriteDataSource';
import { FollowDataSource } from '../datasource/FollowDataSource';
import { ThumbsUpDataSource } from '../datasource/ThubmsUpDataSource';
import { VideoInfoDataSource } from '../datasource/VideoInfoDataSource';
import { VideoInfo } from '../model/VideoInfo'

@Component
export struct VideoSideOperationBar {
  @State videoInfo: VideoInfo = new VideoInfo();
  //引入点赞数据源
  @Consume thumbsUpDataSource: ThumbsUpDataSource;
  @Consume favouriteDataSource: FavouriteDataSource;
  @Consume videoInfoDataSource: VideoInfoDataSource;

  aboutToAppear(): void {
    //判断是否点赞
    this.videoInfo.isThumbsUp =
    this.thumbsUpDataSource.isExist(this.videoInfo.videoId);
    //判断是否收藏
    this.videoInfo.isFavorite =
    this.favouriteDataSource.isExist(this.videoInfo.videoId)

  }

  build() {
    Column() {
      //点赞
      // 点赞按钮
      Image(this.videoInfo.isThumbsUp ? $r('app.media.ic_like_red') : $r('app.media.ic_like'))
        .width(40)
        .height(40)
        .onClick(() => {
          //点赞和取消点赞
          if (this.videoInfo.isThumbsUp) {
            // 如果已经带你赞过了 则取消点赞
            this.videoInfo.isThumbsUp = false;
            this.videoInfo.thumbsUpCount = this.videoInfo.thumbsUpCount - 1; //自减1
            // 从数据源删除相关点赞信息
            this.thumbsUpDataSource.deleteDataById(this.videoInfo.videoId);
          }
          else {
            this.videoInfo.isThumbsUp = true;
            this.videoInfo.thumbsUpCount = this.videoInfo.thumbsUpCount + 1; // 自增1
            //将点赞信息添加到数据源
            this.thumbsUpDataSource.pushData(this.videoInfo)
          }
          //将点赞信息更新到视频数据源
          this.videoInfoDataSource.changeDataById(
            this.videoInfo.videoId,
            this.videoInfo
          )
        })
      // 点赞数
      Text(this.videoInfo.thumbsUpCount + '')
        .margin({ top: 12 })
        .fontSize(12)
        .width(40)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
      //评论
      // 评论按钮
      Image($r('app.media.ic_comment'))
        .width(40)
        .height(40)
      // 评论量
      Text(this.videoInfo.commentCount + '')
        .margin({ top: 12 })
        .fontSize(12)
        .width(40)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)

      // 收藏
      // 收藏按钮
      Image(this.videoInfo.isFavorite ? $r('app.media.ic_star_red') : $r('app.media.ic_star'))
        .width(40)
        .height(40)
        .onClick(() => {
          if (this.videoInfo.isFavorite) {
            this.videoInfo.isFavorite = false;
            this.videoInfo.favoriteCount = this.videoInfo.favoriteCount - 1; //自减1
            this.favouriteDataSource.deleteDataById(this.videoInfo.videoId);
          }
          else {
            this.videoInfo.isFavorite = true;
            this.videoInfo.favoriteCount = this.videoInfo.favoriteCount + 1; // 自增1
            this.favouriteDataSource.pushData(this.videoInfo)
          }
          this.videoInfoDataSource.changeDataById(
            this.videoInfo.videoId,
            this.videoInfo
          )
        })
      // 收藏量
      Text(this.videoInfo.favoriteCount + '')
        .margin({ top: 12 })
        .fontSize(12)
        .width(40)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
      // 分享
      // 分享按钮
      Image($r('app.media.ic_share'))
        .width(40)
        .height(40)
      // 分享量
      Text(this.videoInfo.shareCount + '')
        .margin({ top: 12 })
        .fontSize(12)
        .width(40)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)

    }

  }
}