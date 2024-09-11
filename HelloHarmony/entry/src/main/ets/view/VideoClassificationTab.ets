/*
 * 视频分类页标签
 * */
@Component
export  struct VideoClassificationTab{
  build(){
    Row(){
      //默认Flex布局主轴方向为自左向右
      //SpaceEvenly 元素和元素之间的距离 以及元素和边框线的距离 相等
      Flex({justifyContent:FlexAlign.SpaceEvenly}){
        Text('直播')
          .fontSize(18)
          .fontColor('#FEFEFE')
        Text('同城')
          .fontSize(18)
          .fontColor('#FEFEFE')
        Text('关注')
          .fontSize(18)
          .fontColor('#FEFEFE')
        Text('推荐')
          .fontSize(18)
          .fontColor('#FEFEFE')
        Text('搜索')
          .fontSize(18)
          .fontColor('#FEFEFE')
      }
    }
  }
}