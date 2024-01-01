import ArrayList from '@ohos.util.ArrayList';
import { BaseDataSource } from './BaseDataSource';

export class HomeDataSource extends BaseDataSource {
  private dataArray: Array<any> = new Array<any>();

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): any {
    return this.dataArray[index];
    this.notifyDataReload()
  }

  /**
   * 追加数据
   * @param newData
   */
  public addAll(newData: Array<any>) {
    newData.forEach((value, index) => {
      this.dataArray.push(value)
      this.notifyDataAdd(index)
    })
  }
  /**
   * 刷新数据
   * @param newData
   */
  public setNewData(newData: Array<any>) {
    this.dataArray = []
    newData.forEach((value, index) => {
      this.dataArray.push(value)
    })
    this.notifyDataReload()
  }
  /**
   * 指定index下添加数据
   * @param index
   * @param data
   */
  public addData(index: number, data: any): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }
  /**
   * 默认再末尾下新增一条数据
   * @param data
   */
  public pushData(data: any): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}