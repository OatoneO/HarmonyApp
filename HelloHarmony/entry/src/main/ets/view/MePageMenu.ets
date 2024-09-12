/*
 * 我的页面菜单栏
 * */
import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { VideoInfoDataSource } from '../datasource/VideoInfoDataSource'
import { VideoInfo } from '../model/VideoInfo'

@Component
export struct MePageMenu{
  // 视频数据源
  @Consume videoInfoDataSource: VideoInfoDataSource
  // 视频编辑窗口的实例化
  private controller: CustomDialogController
    = new CustomDialogController({
    builder: SearchDiaLog({

    }),
    alignment: DialogAlignment.Default
  });
  @State handlePopup: boolean = false
  build(){
    Row(){
      //Flex布局主轴方向元素等距离布局
      // 组件在主轴方向终点对齐
      // 最后一个子组件和父元素的边沿对齐
      // 其他元素与右一个元素对齐
      Flex({justifyContent:FlexAlign.End}){
        // 搜索
        Image($r('app.media.ic_public_search'))
          .width(40)
          .height(40)
          .onClick(()=>{
            this.controller.open()
          })
        //间隔
        Column().width(22)
        // 菜单
        Image($r('app.media.ic_public_view_list'))
          .width(40)
          .height(40)
          .bindMenu([
            {
              value:'个人设置',
              action: () => {
                this.handlePopup = !this.handlePopup
              }
            },
            {
            value:'退出账号',
              action: () => {
                router.replaceUrl({
                  url:'pages/RegisterPage'
                })
              }
            }
          ])
          .bindPopup(this.handlePopup, {
            message: '新功能正在骑马来的路上🥺',
            onStateChange: (e)=> {
              // 返回当前的气泡状态
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
      }
    }.width('100%')
    .height(40)
  }
}

@CustomDialog
struct SearchDiaLog{
  // 由调用方传递提供控制器
  private controller: CustomDialogController;
  // 消费祖先节点上的数据源
  @Consume videoInfoDataSource: VideoInfoDataSource;
  // 视频数据
  @State searchVideoInfo: VideoInfo = new VideoInfo();

  build() {
    Column(){
      //视频内容
      TextArea({
        placeholder: '请输入要搜索的视频内容',
      })
        .width(320)
        .height(80)
        .borderRadius(8)
        .backgroundColor('#F9F9F9')
        .margin({ top: 10 })
        .fontSize(20)
        .onChange((value:string)=>{
          this.searchVideoInfo.content = value
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
            let searchFlag = this.videoInfoDataSource.SearchDataByContent(this.searchVideoInfo.content)
            if (searchFlag) {
              promptAction.showToast({
                message: '存在该视频',
                duration: 2000
              })
            }else {
              promptAction.showToast({
                message: '不存在该视频',
                duration: 2000
              })
            }
          })
      }
      .margin({ bottom: 10 })
    }

  }
}