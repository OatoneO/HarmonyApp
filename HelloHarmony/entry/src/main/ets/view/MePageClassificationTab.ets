/*
 * 我页面的作品分类
 * */
import { UserVideoDataSource } from '../datasource/UserVideoDataSource';
import { MePageFavouriteList } from './MePageFavouriteList';
import { MePageFollowList } from './MePageFollowList';
import { MePageThumbsUpList } from './MePageThumbsUpList';
import { MePageVideoList } from './MePageVideoList';

@Component
@Preview
export struct MePageClassificationTab {
  // 当前tabs页签的索引
  @State currentIndex:number = 0;
  //用户上传的视频数据源
  @Link userVideoDataSource:UserVideoDataSource;
  build() {
    Column() {
      // 将元素固定在顶部
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          //引入作品列表
          MePageVideoList({
            userVideoDataSource:this.userVideoDataSource
          })
        }.tabBar(this.TabBuilder('作品',0))

        TabContent() {
          //引入点赞列表
          MePageThumbsUpList()
        }.tabBar(this.TabBuilder('喜欢',1))

        TabContent() {
          //引入收藏列表
          MePageFavouriteList()
        }.tabBar(this.TabBuilder('收藏',2))

        TabContent() {
          //引入关注列表
          MePageFollowList()
        }.tabBar(this.TabBuilder('关注',3))
      }
      .onChange((index:number)=>{
        //记录当前tabs页签的索引
        this.currentIndex = index;
      })
    }
  }
  @Builder
  TabBuilder(title:string,index:number){
    Column(){
      //设置选中和不选中的样式
      Text(title)
        .fontColor(this.currentIndex === index ?'#FFFFFF':'#F8FAEC')
        .fontSize(this.currentIndex === index ? 20 : 18)
      // 设置选中时添加下划线效果
      Divider()
        .strokeWidth(1)
        .color('#FFFFFF')
        .visibility(this.currentIndex === index?Visibility.Visible:Visibility.Hidden)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}