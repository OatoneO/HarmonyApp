import { FollowDataSource } from '../datasource/FollowDataSource';
import { VideoInfoDataSource } from '../datasource/VideoInfoDataSource';
import { VideoInfo } from '../model/VideoInfo';

@Component
export struct MePageFollowList {
  @Consume followDataSource: FollowDataSource;
  @Consume videoInfoDataSource: VideoInfoDataSource;

  build() {
    Column() {
      //列表
      List({ space: 1 }) {
        // 生成列表项
        LazyForEach(
          this.followDataSource,
          (videoInfo: VideoInfo) => {
            ListItem() {
              Row() {
                Image($rawfile(videoInfo.portraitPath))
                  .width(60)
                  .height(60)
                  .borderRadius(30)
                Text(videoInfo.author)
                  .margin({ left: 6 })
                  .fontSize(25)
                  .fontColor(Color.White)
                //操作区
                Column() {
                  Button('取关', { type: ButtonType.Normal })
                    .width(60)
                    .height(24)
                    .borderRadius(1)
                    .backgroundColor(Color.Red)
                    .fontSize(14)
                    .onClick(() => {
                      this.followDataSource.deleteDataById(videoInfo.videoId);
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