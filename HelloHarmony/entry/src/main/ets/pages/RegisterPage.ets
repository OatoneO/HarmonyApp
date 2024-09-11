import router from '@ohos.router';
import Constants from '../common/Constants';
import { PortraitInfo } from '../model/PortraitInfo';
import { UserInfo } from '../model/UserInfo';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct RegisterPage {
  //将该变量声明为一个状态变量 后续变量的值被更改
  // 对应的视图也会同步变化
  @State selectedPortraitInfo:PortraitInfo = new PortraitInfo();

  @State username:string = '';

  @State password:string = '';

  //页面显示的时候自动加载
  onPageShow() {
    // 从路由获取选中的头像
    let params = router.getParams();
    //判断参数数据是否存在
    // 存在则获取参数数据
    if(params!=null){
      this.selectedPortraitInfo =
        (params as Record<string,PortraitInfo>)[`${Constants.PARAM_SELECTED_PORTRAIT_INFO_KEY}`]
    }
  }

  build() {
    Row() {
      //设置行的高度为手机屏幕高度的100%
      Column() {
        // 进行三元逻辑判断 如果非空则使用率路由获取到的头像信息的路径 作为图片路径
        // 如果为空 则使用默认图片
        Image($rawfile(this.selectedPortraitInfo.portraitPath!=null
        ?this.selectedPortraitInfo.portraitPath:'portrait/ic_portraitmaleplus.png'))
          .height(108)
          .width(108)//添加点击事件
          .onClick(() => {
            //  读取头像JSON数据转换为对象模型
            // 通过路由参数的形式 传递给头像相册页面
            router.pushUrl({
              url: 'pages/PortraitAlbumPage',
              params: { [`${Constants.PARAM_PORTRAIT_INFO_ARR_KEY}`]:
              Constants.PORTRAIT_INFO_ARR }
            });
          })
        TextInput({ placeholder: '请输入账号' })
          .width(320)
          .height(50)
          .borderRadius(8)
          .backgroundColor('#f9f9f9')
          .margin({ top: '10' })
          .fontSize(27)
          .type(InputType.Normal)
          //每当输入框的值发生变化的时候 就会触发的函数
          .onChange((value:string)=>{
            // 获取输入框内改变的内容
            this.username = value;
          })
        TextInput({ placeholder: '请输入密码' })
          .width(320)
          .height(50)
          .borderRadius(8)
          .backgroundColor('#f9f9f9')
          .margin({ top: '10' })
          .fontSize(27)
          .type(InputType.Password)
          .onChange((value:string)=>{
            this.password = value;
          })
        Button('注册/登录', { type: ButtonType.Normal })
          .width(320)
          .height(50)
          .borderRadius(8)
          .backgroundColor('#ffd0da')
          .margin({ top: 10 })
          .fontSize(24)
          .onClick(()=>{
            if(this.username!='' && this.password!=''
              && this.selectedPortraitInfo.portraitPath!=null){
              //校验通过
              // 封装用户信息
              let  userInfo:UserInfo =
                new UserInfo(this.username,this.password,
                  this.selectedPortraitInfo.portraitPath);
              //用户登陆信息校验
              let checkFlag:boolean
              for (let checkInfo of Constants.USER_CHECK_INFO_ARR) {
                if (this.username === checkInfo.username && this.password === checkInfo.password) {
                  checkFlag = true;
                  break;
                }else {
                  checkFlag = false;
                }
              }
              if (checkFlag) {
                // 跳转到Index页面 并且传递用户的登录信息
                router.replaceUrl({
                  url:'pages/Index',
                  params:{[`${Constants.PARAM_LOGGED_USER_INFO_KEY}`]:userInfo}
                })
              }else {
                promptAction.showToast({
                  message: '账号，密码不存在',
                  duration: 2000
                })
              }
            }else {
              //校验不通过
              // 提示
              promptAction.showToast({
                message:'账号,密码,头像都不可以为空!',
                duration:2000
              })
            }


          })
      }.width('100%')
    }.height('100%')
  }
}