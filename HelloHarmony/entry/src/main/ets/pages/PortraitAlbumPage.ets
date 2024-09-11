import { PortraitInfo } from '../model/PortraitInfo'
import router from '@ohos.router'
import Constants from '../common/Constants'

@Entry
@Component
struct PortraitAlbumPage{
  //获取数组并绑定路由参数数据
@State portraitInfoArr : Array<PortraitInfo>
  = (router.getParams() as Record<string,Array<PortraitInfo>>)
[`${Constants.PARAM_PORTRAIT_INFO_ARR_KEY}`]
  build(){
    //导航组件 用于页面返回
     Navigation(){
        //网格grid
       Grid(){
         //网格项gridItem
         ForEach(this.portraitInfoArr,(portraitInfo:PortraitInfo)=>{
           GridItem(){
             Image($rawfile(portraitInfo.portraitPath))
               .width('100%')
               .height('100%')
               .onClick(()=>{
                 //返回到注册页面 并且借助路由将参数传递给注册页面
                 router.back({
                   url:'pages/RegisterPage',
                   // 传递选择的头像
                   params:{[`${Constants.PARAM_SELECTED_PORTRAIT_INFO_KEY}`]:portraitInfo}
                 })
               })
           }
           .width('100%')
           .aspectRatio(1) //网格项高和宽的比例
         })
       }
       .columnsTemplate('1fr 1fr 1fr 1fr')
       .rowsGap(2)
       .columnsGap(2)
     }
     .title('头像相册')
     .hideBackButton(false) //显示返回按钮
     .titleMode(NavigationTitleMode.Mini)
  }
}