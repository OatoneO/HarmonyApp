import { ThumbsUpDataSource } from '../datasource/ThubmsUpDataSource'
import { VideoInfoDataSource } from '../datasource/VideoInfoDataSource';
import { VideoInfo } from '../model/VideoInfo';

@Component
export struct MePageThumbsUpList {
  @Consume thumbsUpDataSource: ThumbsUpDataSource;
  @Consume videoInfoDataSource: VideoInfoDataSource;

  build() {
    Column() {
      //列表
      List({ space: 1 }) {
        // 生成列表项
        LazyForEach(
          this.thumbsUpDataSource,
          (videoInfo: VideoInfo) => {
            ListItem() {
              Row() {
                //视频封面
                Image($rawfile(videoInfo.coverPath))
                  .width(136)
                  .height(180)
                //视频内容
                Text(videoInfo.content)
                  .width(190)
                  .fontSize(16)
                  .fontColor(Color.White)
                //操作区
                Column() {
                  Button('删除', { type: ButtonType.Normal })
                    .width(60)
                    .height(24)
                    .borderRadius(1)
                    .backgroundColor(Color.Red)
                    .fontSize(14)
                    .onClick(() => {
                      //取消点赞 从点赞数据源中删除点赞信息
                      this.thumbsUpDataSource.deleteDataById(videoInfo.videoId);
                      //更新点赞信息到视频数据源
                      //点赞量递减
                      videoInfo.thumbsUpCount = videoInfo.thumbsUpCount - 1;
                      this.videoInfoDataSource.changeDataById(videoInfo.videoId, videoInfo);
                    })
                }
                .width(60)
              }
              .width('100%')
              .height(180)
            }
            .width('100%')
          },
          (VideoInfo: VideoInfo) => JSON.stringify(VideoInfo)
        )
      }
      .width('100%')
      .listDirection(Axis.Vertical) //排列方向 垂直
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
    }
    .width('100%')
    .height('100%')
  }
}