/*
 * 关注信息数据源
 * */
import { VideoInfo } from '../model/VideoInfo';
import { BasicDataSource } from './BasicDataSource';

export class FollowDataSource extends BasicDataSource<VideoInfo> {
  constructor(videoArray: Array<VideoInfo>) {
    super(videoArray); //调用父类构造函数完成初始化
  }

  //判断指定id的元素是否存在于数据源中
  isExist(id: number): boolean {
    let dataSource: Array<VideoInfo> = this.getDataSource();
    //遍历 找到返回true 找不到返回false

    for (let i: number = 0; i < dataSource.length; i++) {
      if (dataSource[i].videoId === id) {
        return true;
      }
    }
    return false;
  }

  //根据id删除数据
  deleteDataById(id:number):void{
    let dataSource: Array<VideoInfo> = this.getDataSource();
    for (let i: number = 0; i < dataSource.length; i++) {
      if (dataSource[i].videoId === id) {
        this.deleteData(i);
        break;
      }
    }
  }
}