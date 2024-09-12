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
                Row() {
                  Button('取关', { type: ButtonType.Normal })
                    .height(40)
                    .borderRadius(10)
                    .backgroundColor(Color.Red)
                    .fontSize(16)
                    .width(80)
                    .margin({left: '100%'})
                    .onClick(() => {
                      this.followDataSource.deleteDataById(videoInfo.videoId);
                      this.videoInfoDataSource.changeDataById(videoInfo.videoId, videoInfo);
                    })
                }
                .flexGrow(1)
                .justifyContent(FlexAlign.End)
              }
              .width('100%')
              .height(80)
              .margin({top:20})
              .padding(10)
              .justifyContent(FlexAlign.SpaceAround)
              .borderWidth(2)
              .borderRadius(8)
              .borderColor('#F7FFF3')
              .backdropBlur(10)
              .shadow({
                radius: 15,
                color: '#8e8e8e',
                offsetX: 0,
                offsetY: 6
              })
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