/*
 * 存放用户信息的类
 * */
export class UserInfo{
  // 用户id
  userId:number;
  //  输入的账号
  username:string;
  // 输入的密码
  password:string;
  // 头像路径
  portraitPath:string;
  // 构造函数
  constructor(username:string,password:string,portraitPath:string) {
    this.username = username;
    this.password = password;
    this.portraitPath = portraitPath;
  }

}