import { FavouriteDataSource } from '../datasource/FavouriteDataSource';
import { VideoInfoDataSource } from '../datasource/VideoInfoDataSource';
import { VideoInfo } from '../model/VideoInfo';

@Component
export struct MePageFavouriteList {
  @Consume favouriteDataSource: FavouriteDataSource;
  @Consume videoInfoDataSource: VideoInfoDataSource;

  build() {
    Column() {
      //列表
      List({ space: 1 }) {
        // 生成列表项
        LazyForEach(
          this.favouriteDataSource,
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
                  .margin({left:12})
                //操作区
                Row() {
                  Button('删除', { type: ButtonType.Normal })
                    .width(60)
                    .height(24)
                    .borderRadius(10)
                    .backgroundColor(Color.Red)
                    .fontSize(14)
                    .onClick(() => {
                      this.favouriteDataSource.deleteDataById(videoInfo.videoId);
                      videoInfo.favoriteCount = videoInfo.favoriteCount - 1;
                      this.videoInfoDataSource.changeDataById(videoInfo.videoId, videoInfo);
                    })
                }
                .flexGrow(1)
                .justifyContent(FlexAlign.End)
              }
              .width('100%')
              .height(180)
              .margin(10)
              .padding(10)
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