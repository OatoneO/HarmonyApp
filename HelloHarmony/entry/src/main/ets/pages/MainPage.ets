/*
 * 首页页面原型
 * */
import Constants from '../common/Constants';
import { VideoInfoDataSource } from '../datasource/VideoInfoDataSource';
import { VideoInfo } from '../model/VideoInfo'
import { VideoView } from '../view/VideoView';

@Preview
@Component
// export 声明组件的导出
export struct MainPage{
  // @State private videoInfo:VideoInfo = new VideoInfo();

  // aboutToAppear(){
  //   this.videoInfo.videoPath = 'video/video_00.mp4';
  //   this.videoInfo.coverPath = 'video/video_cover_00.jpg';
  //   this.videoInfo.author = "哥哥";
  //   this.videoInfo.portraitPath = 'portrait/portrait_00.jpg';
  //   this.videoInfo.isFollow = false;
  //   this.videoInfo.content = "再看一眼就会爆炸,再喝一点就会融化";
  //   this.videoInfo.isThumbsUp = false;
  //   this.videoInfo.thumbsUpCount = 66;
  //   this.videoInfo.commentCount = 222;
  //   this.videoInfo.isFavorite = false;
  //   this.videoInfo.favoriteCount = 8848;
  //   this.videoInfo.shareCount = 6666;
  //
  // }

  // 视频列表
  // private videoArr:Array<VideoInfo> = Constants.VIDEO_INFO_ARR;
  //视频信息数据源
  @Link videoInfoDataSource:VideoInfoDataSource;
  // 当前播放的视频索引
  @State videoIndex:number = 0;
  // 是否显示视频界面
  @Link isShowVideoView:boolean;

  build(){
    Column(){
      Swiper(){
        // ForEach(this.videoArr,(VideoInfo:VideoInfo,position)=>{
        // 懒加载 从提供的数据源中按需迭代数据
        LazyForEach(this.videoInfoDataSource,(VideoInfo:VideoInfo,position)=>{
          VideoView({
            videoInfo:VideoInfo,
            videoInfoPosition:position,
            videoIndex:this.videoIndex,
            isShowVideoView:this.isShowVideoView
          })
        })
      }
      .width('100%')
      .height('100%')
      .indicator(false) //是否启用导航点指示器
      .loop(false) //是否开启循环
      .vertical(true) //是否为纵向滑动
      .onChange((i:number)=>{
        //记录当前播放的视频索引
        this.videoIndex = i;
      })
    }
    .width('100%')

  }



  // build(){
  //   Row(){
  //     Column(){
  //       VideoView({videoInfo:this.videoInfo})
  //     }.width('100%')
  //   }.height('100%')
  // }
}