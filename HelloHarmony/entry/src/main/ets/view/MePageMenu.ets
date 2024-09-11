/*
 * 我的页面菜单栏
 * */

@Component
export struct MePageMenu{
  build(){
    Row(){
      //Flex布局主轴方向元素等距离布局
      // 组件在主轴方向终点对齐
      // 最后一个子组件和父元素的边沿对齐
      // 其他元素与右一个元素对齐
      Flex({justifyContent:FlexAlign.End}){
        // 搜索
        Image($r('app.media.ic_public_search'))
          .width(22)
          .height(22)
        //间隔
        Column().width(22)
        // 菜单
        Image($r('app.media.ic_public_view_list'))
          .width(22)
          .height(22)
      }
    }.width('100%')
    .height(22)
  }
}