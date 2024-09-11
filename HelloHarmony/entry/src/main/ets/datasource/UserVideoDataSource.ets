/*
 * 用户上传信息的数据源
 * */
import { VideoInfo } from '../model/VideoInfo';
import { BasicDataSource } from './BasicDataSource';

export class UserVideoDataSource extends BasicDataSource<VideoInfo> {
  constructor(videoArray: Array<VideoInfo>) {
    super(videoArray); //调用父类构造函数进行初始化
  }

  //根据Id删除数据
  deleteDataById(id: number): void {
    let dataSource: Array<VideoInfo> = this.getDataSource();
    // 遍历数据源中的元素 直到找到指定id的元素为止
    for (let i: number = 0; i < dataSource.length; i++) {
      //如果找到指定的id
      if (dataSource[i].videoId === id) {
        // 删除
        this.deleteData(i);
        //结束遍历
        break;
      }

    }

  }

  //根据ID更新数据
  changeDataById(id: number, videoInfo: VideoInfo): void {
    let dataSource: Array<VideoInfo> = this.getDataSource();
    //遍历数据源的元素 直到找到指定id的元素位置 进行数据的更新
    for (let i: number = 0; i < dataSource.length; i++) {
      if (dataSource[i].videoId === id) {
        this.changeData(i, videoInfo);
        break;
      }
    }
  }
}
