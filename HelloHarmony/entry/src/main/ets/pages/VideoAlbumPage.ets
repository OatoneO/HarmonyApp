import router from '@ohos.router'
import Constants from '../common/Constants'
import { VideoInfo } from '../model/VideoInfo'

/**
 * 视频相册
 */
@Entry
@Component
struct VideoAlbumPage {
  build() {
    // 导航
    Navigation() {
      // 相册网格
      Grid() {
        ForEach(Constants.VIDEO_INFO_UPLOAD_ARR, (videoInfo: VideoInfo) => {
          // 生成GridItem
          GridItem() {
            // 相片
            Image($rawfile(videoInfo.coverPath))
              .width('100%')
              .height('100%')
              .onClick(() => { // 点击选择视频
                // 返回视频发布页面
                router.back({
                  url: 'pages/VideoPublishPage',

                  // 传回选择的视频
                  params: {
                    [`${Constants.PARAM_SELECTED_VIDEO_INFO_KEY}`]: videoInfo
                  }
                })

              })
          }
          .width('100%')
          .aspectRatio(0.755) // 调整宽高比例
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr') // 列在网格布局宽度上的占比
      .rowsGap(2) // 行间距
      .columnsGap(2) // 列间距

    }
    .title('视频相册')
    .hideBackButton(false) // 显示返回按钮
    .titleMode(NavigationTitleMode.Mini) // 小标题模式
  }
}