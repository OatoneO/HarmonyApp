/**
 * 视频发布页面
 */
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import Constants from '../common/Constants';
import { VideoInfo } from '../model/VideoInfo';

// @Preview   // 转为能路由的页面
@Entry
@Component
export struct VideoPublishPage {
  // 选中的视频对象
  @State selectedVideoInfo: VideoInfo = new VideoInfo();

  onPageShow() {
    // 获取选中的视频
    // 通过传递过来的路由参数中的对象
    let params = router.getParams();

    // 判断参数对象是否存在，存在再获取视频封面
    if (params != null) {
      this.selectedVideoInfo = (params as Record<string, VideoInfo>)[`${Constants.PARAM_SELECTED_VIDEO_INFO_KEY}`];
    }

  }

  build() {
    Row() {
      Column() {
        // 视频封面
        Image($rawfile(this.selectedVideoInfo.coverPath != null
          ? this.selectedVideoInfo.coverPath : 'video/ic_video_upload.png'))
          .width(136)
          .height(180)
          .onClick(() => {
            // 跳转到视频相册
            router.pushUrl({
              url: 'pages/VideoAlbumPage'
            })
          })

        // 视频内容
        TextArea({ placeholder: '请输入视频内容' })
          .width(320)
          .height(100)
          .borderRadius(8)
          .backgroundColor('#F9F9F9')
          .margin({ top: '10' })
          .fontSize(20)
          .onChange((value: string) => {
            //  每当文本域中的内容发生变化的时候 将数据通同步给对应变量
            this.selectedVideoInfo.content = value;
          })

        // 发布按钮
        Button('发布', { type: ButtonType.Normal })
          .width(320)
          .height(50)
          .borderRadius(8)
          .backgroundColor('#FFD0DA')
          .margin({ top: '10' })
          .fontSize(24)
          .onClick(() => {
            // 校验视频封面和视频内容
            if (this.selectedVideoInfo.coverPath != null
              && this.selectedVideoInfo.content != null
              && this.selectedVideoInfo.content != '') {
              // 获取应用全局的UI状态存储
              let username: string = AppStorage.Get('UserInfo.username');
              let portraitPath: string = AppStorage.Get('UserInfo.portraitPath');

              // 把用户信息设置到选中的视频信息上去
              this.selectedVideoInfo.author = username;
              this.selectedVideoInfo.portraitPath = portraitPath;

              // 校验通过
              // 跳转到Index页面
              router.replaceUrl({
                url: 'pages/Index',

                // 通过路由参数，传递待发布的视频数据
                params: {
                  [`${Constants.PARAM_PUBLISHED_VIDEO_INFO_KEY}`]: this.selectedVideoInfo
                }
              })
            } else {
              // 校验不通过
              // 给出提示信息
              promptAction.showToast({
                message: '视频封面、内容不能为空！',
                duration: 2000 // 单位：毫秒
              })
            }
          })
      }.width('100%')

    }.height('100%')
  }
}