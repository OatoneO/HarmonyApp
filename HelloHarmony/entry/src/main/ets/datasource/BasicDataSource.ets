/*
 * 抽象类BasicDataSource 使用泛型T 实现内置接口IDataSource
 *
 * */
export abstract class BasicDataSource<T> implements IDataSource {
  // 监听器数组
  private listeners: Array<DataChangeListener> = new Array<DataChangeListener>();
  // 定义数据源 支持泛型的数组
  private dataSource: Array<T> = new Array<T>();
  ;
  // 构造函数 接受一个泛型数组作为参数 用于初始化数据源
  constructor(dataSource: Array<T>) {
    //初始化数据源
    this.dataSource = dataSource;
  }

  // 返回数据源的长度
  totalCount(): number {
    return this.dataSource == null ? 0 : this.dataSource.length;
  }

  //获取指定索引的数据 判断索引是否合法 如果非法返回null
  getData(index: number) {
    return index >= 0 && index < this.totalCount() ? this.dataSource[index] : null;
  }

  // 添加数据
  addData(index:number,data:T):void{
    this.dataSource.splice(index,0,data);
    this.notifyDataAdd(index);
  }
  //追加数据
  pushData(data:T):void{
    this.dataSource.push(data);
    this.notifyDataAdd(this.dataSource.length-1);
  }
  // 删除数据
  deleteData(index:number):void{
    this.dataSource.splice(index,1);
    this.notifyDataDelete(index);
  }
  //通知数据删除
  notifyDataDelete(index:number){
    this.listeners.forEach(listener=>{
      listener.onDataDelete(index);
    })
  }

  /* 通知数据添加
   *
   * */
  notifyDataAdd(index:number){
    this.listeners.forEach(listener=>{
      listener.onDataAdd(index);
    })
  }
//修改数据
  changeData(index:number,data:T):void{
    this.dataSource.splice(index,1,data);
    this.notifyDataChange(index);
  }
  //通知数据变更
  notifyDataChange(index:number):void{
    this.listeners.forEach(listener=>{
      listener.onDataChange(index);
    })
  }
  // 重新加载数据
  reloadData():void{
    this.notifyDataReload();
  }
  //通知数据重载
  notifyDataReload():void{
    this.listeners.forEach(listener=>{
      listener.onDataReloaded();
    })
  }
  //获取数据源方法
  getDataSource():Array<T>{
    return this.dataSource;
  }
  //注册数据变化监听器
  registerDataChangeListener(listener: DataChangeListener) {
    if(this.listeners.indexOf(listener)<0){
    //   如果参数监听器没有在数组中则添加
      this.listeners.push(listener);
    }
  }
//取消注册数据变化监听器
  unregisterDataChangeListener(listener: DataChangeListener) {
   let index = this.listeners.indexOf(listener);
    if(index>0){
      this.listeners.splice(index,1);
    }
  }
}