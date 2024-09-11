import { UserVideoDataSource } from '../datasource/UserVideoDataSource'
import { MePageClassificationTab } from '../view/MePageClassificationTab'
import { MePageMenu } from '../view/MePageMenu'
import { MePageUserInfo } from '../view/MePageUserInfo'

@Preview
@Component
export struct MePage{
  @Link userVideoDataSource:UserVideoDataSource
  build() {
    Column(){
      // 菜单栏
      MePageMenu().padding({right:10,top:10})
      // 个人信息展示区
      MePageUserInfo().padding({left:10,top:60})
      // 作品分类
      MePageClassificationTab({
        userVideoDataSource:this.userVideoDataSource
      })
        .padding({left:10,right:10,top:10,bottom:10})
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.background')) //背景图片设置
    .backgroundImageSize({width:'100%',height:'100%'})//设置背景图片的宽高

  }
}