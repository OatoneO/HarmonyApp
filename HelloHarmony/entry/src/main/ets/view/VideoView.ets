/*
 * 视频播放界面
 * */
import { PlayState } from '../common/PlayState';
import { VideoInfo } from '../model/VideoInfo'
import { VideoClassificationTab } from './VideoClassificationTab';
import { VideoInfoDisplay } from './VideoInfoDisplay';
import { VideoSideOperationBar } from './VideoSideOperationBar';

@Preview
@Component
export struct VideoView {
  // 当前视频信息
  private videoInfo: VideoInfo = new VideoInfo();
  // 视频控制器
  private videoController: VideoController = new VideoController();
  // 播放器状态
  @State private playState: number = PlayState.STOP;
  //根据videoIndex和isShowVideoView更改视频播放状态
  // videoIndex记录 swiper当前显示的视频索引
  @Link @Watch('handlePageShow') videoIndex: number;
  // 用于控制标识视频播放器是否显示
  @Link @Watch('handlePageShow') isShowVideoView: boolean;
  // 当前视频的索引位置
  private videoInfoPosition: number = 0;
  // 当组件即将出现的时候回调该接口
  aboutToAppear():void{
    this.handlePageShow();
  }
  build() {
    //层叠布局
    Stack() {
      // 视频播放器
      Video({
        src: $rawfile(this.videoInfo.videoPath),
        previewUri: $rawfile(this.videoInfo.coverPath),
        controller: this.videoController
      })
        .controls(true)// 设置显示默认控制器
        .autoPlay(this.playState === PlayState.START ? true : false)//判断是否自动播放
        .objectFit(ImageFit.Contain)// 定义视频的适配模式 Contain为保持宽高比进行等比例缩小或放大
        .loop(true)//设置循环播放
        .width('100%')
        .height('100%')
        .onClick(() => this.handleOnClick()) //设计点击事件
      // 视频开始按钮
      Image($r('app.media.ic_public_play'))
        .width(50)
        .height(50)
        .visibility(this.playState === PlayState.START ? Visibility.Hidden : Visibility.Visible)
        .onClick(() => this.handleOnClick())


      // 视频分类页签
      VideoClassificationTab()
        .position({ x: 0, y: 0 })

      // 视频信息展示区
      VideoInfoDisplay({
        videoInfo: this.videoInfo
      })
        .offset({ x: '0%', y: '37%' })


      // 侧标操作栏
      VideoSideOperationBar({
        videoInfo: this.videoInfo
      })
        .position({ x: '89%', y: '45%' })
    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }

  /*
   * 播放
   * */
  play(): void {
    //修改播放状态
    if (this.playState != PlayState.START) {
      this.playState = PlayState.START;
    }
    //借助 videoController完成视频播放
    this.videoController.start();
  }

  /*
   * 暂停
   * */
  pause(): void {
    if (this.playState != PlayState.PAUSE) {
      this.playState = PlayState.PAUSE;
    }
    // 借助videoController 实现暂停
    this.videoController.pause();
  }

  /*
   *  点击处理事件
   * */
  handleOnClick(): void {
    //如果播放状态时开始 则暂停
    // 如果播放状态是暂停则开始
    if (this.playState === PlayState.START) {
      this.pause();
    } else if (this.playState === PlayState.PAUSE || this.playState === PlayState.STOP) {
      this.play();
    }
  }

  /*
   * 停止方法
   * */
  stop(): void {
    //修改播放状态为STOP
    if (this.playState != PlayState.STOP) {
      this.playState = PlayState.STOP;
    }
    // 通过控制器执行停止
    this.videoController.stop();
  }

  /*
   *  根据videoIndex isShowVideoView videoInfoPosition更改播放状态
   * */
  handlePageShow(): void {
    //判断视频是否进入前台
    //同时判断当前视频索引是否为Swiper选中的视频 来决定是否播放
    if (this.isShowVideoView === true && this.videoInfoPosition === this.videoIndex) {
      this.play();
    } else {
      //停止播放
      this.stop();
    }
  }
}