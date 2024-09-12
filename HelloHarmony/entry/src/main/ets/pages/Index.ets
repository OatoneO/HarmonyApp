import Constants from '../common/Constants'
import { VideoInfoDataSource } from '../datasource/VideoInfoDataSource'
import { MainPage } from './MainPage'
import { MePage } from './MePage'
import { VideoPublishPage } from './VideoPublishPage'
import router from '@ohos.router'
import { UserInfo } from '../model/UserInfo'
import { VideoInfo } from '../model/VideoInfo'
import { UserVideoDataSource } from '../datasource/UserVideoDataSource'
import { ThumbsUpDataSource } from '../datasource/ThubmsUpDataSource'
import { FavouriteDataSource } from '../datasource/FavouriteDataSource'
import { FollowDataSource } from '../datasource/FollowDataSource'

@Entry
@Component
struct Index {
  // 是否显示视频界面
  @State isShowVideoView: boolean = false;
  // 视频信息数据源
  // @State videoInfoDataSource: VideoInfoDataSource
  //   = new VideoInfoDataSource(Constants.VIDEO_INFO_ARR);
  @Provide videoInfoDataSource: VideoInfoDataSource
    = new VideoInfoDataSource(Constants.VIDEO_INFO_ARR);
  // 当前Tabs页面的索引
  @State currentIndex: number = 0;
  // Tabs组件控制器
  private tabsController: TabsController = new TabsController();
  // 用户上传视频的数据源
  @State userVideoDataSource: UserVideoDataSource =
    new UserVideoDataSource(Constants.USER_VIDEO_INFO_ARR)
  // 点赞数据源
  @Provide thumbsUpDataSource: ThumbsUpDataSource =
    new ThumbsUpDataSource(Constants.THUMBS_UP_ARR)
  //收藏数据源
  @Provide favouriteDataSource: FavouriteDataSource =
    new FavouriteDataSource(Constants.FAVOURITE_ARR)
  //关注数据源
  @Provide followDataSource: FollowDataSource =
    new FollowDataSource(Constants.FOLLOW_ARR)

  // 组件即将出现的时候 回调该接口
  aboutToAppear(): void {
    this.isShowVideoView = true;
  }

  // 组件销毁之前 执行 修改为false
  aboutToDisappear(): void {
    this.isShowVideoView = false;
  }

  //页面每次显示的时候 包括路由 应用进入前台等
  onPageShow(): void {
    this.isShowVideoView = true;

    // 获取路由参数
    let params = router.getParams();

    // 判断路由参数对象是否存在
    if (params != null) {
      // 从路由参数中获取用户信息
      let userInfo: UserInfo = params[`${Constants.PARAM_LOGGED_USER_INFO_KEY}`];

      if (userInfo != null) {
        // 设置应用全局的UI状态存储
        AppStorage.SetOrCreate('UserInfo.username', userInfo.username);
        AppStorage.SetOrCreate('UserInfo.portraitPath', userInfo.portraitPath);
      }

      // 从路由参数中获取待发布的视频数据
      let selectedVideoInfo: VideoInfo = params[`${Constants.PARAM_PUBLISHED_VIDEO_INFO_KEY}`];

      if (selectedVideoInfo != null) {
        // 存储至视频数据源
        this.videoInfoDataSource.pushData(selectedVideoInfo);
        //存储至用户上传的视频数据源
        this.userVideoDataSource.pushData(selectedVideoInfo);
      }
    }

  }

  //页面每次隐藏的时候 修改
  onPageHide(): void {
    this.isShowVideoView = false;
  }

  build() {
    //基于Tabs组件实现导航栏
    //并且设置相关的属性将导航栏固定在页面的底部
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      // TabContent来设置导航栏标签页内容
      TabContent() {
        MainPage({
          isShowVideoView: this.isShowVideoView,
          videoInfoDataSource: this.videoInfoDataSource
        })
      }.tabBar(this.TabBuilder('首页', 0))

      TabContent().tabBar(this.TabBuilder('朋友', 1))
      TabContent() {

      }.tabBar(this.TabBuilder('+', 2))

      TabContent().tabBar(this.TabBuilder('消息', 3))
      TabContent() {
        MePage({
          userVideoDataSource: this.userVideoDataSource
        })
      }.tabBar(this.TabBuilder('我的', 4))

    }
  }

  //自定义导航栏样式
  @Builder
  TabBuilder(title: string, index: number) {
    Column() {
      //设置选中和未选中导航栏标签的样式
      Text(title)
        .fontColor(this.currentIndex === index ? '#FFFFFF' : '#E6E6E6')
        .fontSize(this.currentIndex === index ? 20 : 18)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Black)
    .onClick(() => {
      // 记录当前tabs页面索引
      this.currentIndex = index;

      // 判断当前索引是否是首页
      if (index === 0) {
        // 是首页
        this.isShowVideoView = true;
      } else {
        this.isShowVideoView = false;
      }

      // 如果是视频发布页面的页签索引，则跳转到视频发布页面
      if (index === 2) {
        router.pushUrl({
          url: 'pages/VideoPublishPage'
        })
      } else if (index === 1 || index === 3) {
        // 如果是页签索引为1或者3
        // 什么都不做
      } else {
        // 如果是页签索引为4或者是其他页签，则切换到该页签
        this.tabsController.changeIndex(index);
      }

    })
  }
}