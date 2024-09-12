/*
 * 视频信息数据源 指定范行为VideoInfo类型
 * */
import { VideoInfo } from '../model/VideoInfo';
import { BasicDataSource } from './BasicDataSource';

export class VideoInfoDataSource extends BasicDataSource<VideoInfo>{
  constructor(videoArray: Array<VideoInfo>) {
    //调用父类构造函数
    super(videoArray);
  }
  //根据ID删除数据
  deleteDataById(id:number):void{
    let dataSource:Array<VideoInfo> = this.getDataSource();
    for(let i:number;i<dataSource.length;i++){
      //判断是否是指定元素
      if(dataSource[i].videoId === id){
        this.deleteData(i)
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
  //根据内容查找数据
  SearchDataByContent(content: string): Boolean {
    let dataSource: Array<VideoInfo> = this.getDataSource();
    let regex = new RegExp(content, 'i');
    //遍历数据源的元素 直到找到指定id的元素位置 进行数据的更新
    for (let i: number = 0; i < dataSource.length; i++) {
      if (regex.test(dataSource[i].content)) {
        return true
      }
    }
    return false
  }
}