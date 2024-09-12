import { UserVideoDataSource } from '../datasource/UserVideoDataSource'
import { VideoInfoDataSource } from '../datasource/VideoInfoDataSource';
import { VideoInfo } from '../model/VideoInfo';

@Component
export struct MePageVideoList {
  //  用户上传的视频数据源
  @Link userVideoDataSource: UserVideoDataSource;
  // 视频数据源
  @Consume videoInfoDataSource: VideoInfoDataSource
  // 选中的视频数据
  @State selectedVideoInfo: VideoInfo = new VideoInfo();
  // 视频编辑窗口的实例化
  private controller: CustomDialogController
    = new CustomDialogController({
    builder: VideoEditCustomDialog({
      selectedVideoInfo: this.selectedVideoInfo,
      userVideoDataSource: this.userVideoDataSource
    }),
    alignment: DialogAlignment.Default
  });

  build() {
    Column() {
      List({ space: 1 }) {
        LazyForEach(this.userVideoDataSource, (videoInfo: VideoInfo) => {
          //列表项
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
                .margin({ left: 6 })
                .fontColor(Color.White)
              Row()
                .flexGrow(1)
              //操作区
              Column() {
                Button('编辑', { type: ButtonType.Normal })
                  .width(60)
                  .height(24)
                  .borderRadius(10)
                  .backgroundColor(Color.Blue)
                  .fontSize(14)
                  .onClick(() => {
                    // 记录当前选中的视频数据
                    this.selectedVideoInfo = videoInfo;
                    //打开自定义的编辑窗口
                    this.controller.open();

                  })
                Column()
                  .height(10)

                Button('删除', { type: ButtonType.Normal })
                  .width(60)
                  .height(24)
                  .borderRadius(10)
                  .backgroundColor(Color.Red)
                  .fontSize(14)
                  .onClick(() => {
                    // 删除用户上传的视频数据源
                    this.userVideoDataSource.deleteDataById(videoInfo.videoId);

                    // 删除视频数据源
                    this.videoInfoDataSource.deleteDataById(videoInfo.videoId);
                  })
              }
              .width(60)
            }
          }
        })
      }.width('100%')
      .listDirection(Axis.Vertical) // 排列方向为垂直
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
  }
}

@CustomDialog
struct VideoEditCustomDialog {
  // 视频信息
  @Link selectedVideoInfo: VideoInfo;
  // 由调用方传递提供控制器
  private controller: CustomDialogController;
  // 同步父组件的数据源
  @Link userVideoDataSource: UserVideoDataSource;
  // 消费祖先节点上的数据源
  @Consume videoInfoDataSource: VideoInfoDataSource;

  build() {
    Column(){
      //视频内容
      TextArea({
        placeholder: '请输入视频内容',
        text: this.selectedVideoInfo.content
      })
        .width(320)
        .height(100)
        .borderRadius(8)
        .backgroundColor('#F9F9F9')
        .margin({ top: 10 })
        .fontSize(20)
        .onChange((value: string) => {
          this.selectedVideoInfo.content = value;
        })
      // 按钮
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .backgroundColor(Color.White)
          .fontColor(Color.Black)
          .onClick(() => {
            //借助控制器实现关闭窗口
            this.controller.close();
          })
        Button('确定')
          .backgroundColor(Color.White)
          .fontColor(Color.Red)
          .onClick(() => {
            //借助控制器实现窗口关闭
            this.controller.close();
            //更新编辑之后的数据源
            this.onAccept();
          })
      }
      .margin({ bottom: 10 })
    }

  }

  onAccept(): void {
    //更新数据到用户上传的视频数据源
    this.userVideoDataSource.changeDataById(
      this.selectedVideoInfo.videoId, this.selectedVideoInfo
    )
    //更新数据到视频数据源
    this.videoInfoDataSource.changeDataById(
      this.selectedVideoInfo.videoId, this.selectedVideoInfo
    )
  }
}

