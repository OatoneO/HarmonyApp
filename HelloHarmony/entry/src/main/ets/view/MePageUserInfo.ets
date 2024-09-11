/*
 * "我" 页面个人信息展示
 * */
@Component
export struct MePageUserInfo{
  build(){
    //个人信息
    Row(){
      //头像
      Image($rawfile(AppStorage.Get(
        'UserInfo.portraitPath'
      )))
        .width(80)
        .height(80)
        .borderRadius(40)
      //账号
      Text(AppStorage.Get('UserInfo.username'))
        .fontColor(Color.White)
        .fontSize(22)
        .margin({left:6})

    }.width('100%')
    .height(80)

  }
}