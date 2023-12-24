import ArrayList from '@ohos.util.ArrayList';
import { BaseDataSource } from './BaseDataSource';

export class HomeDataSource extends BaseDataSource {
  private dataArray: ArrayList<any> = new ArrayList<any>();

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
  public addAll(newData: ArrayList<any>) {
    newData.forEach((value, index) => {
      this.dataArray.add(value)
      this.notifyDataAdd(index)
    })
  }
  /**
   * 刷新数据
   * @param newData
   */
  public setNewData(newData: ArrayList<any>) {
    this.dataArray.clear()
    newData.forEach((value, index) => {
      this.dataArray.add(value)
      this.notifyDataAdd(index)
    })
  }
  /**
   * 指定index下添加数据
   * @param index
   * @param data
   */
  public addData(index: number, data: any): void {
    this.dataArray.insert(data, index);
    this.notifyDataAdd(index);
  }
  /**
   * 默认再末尾下新增一条数据
   * @param data
   */
  public pushData(data: any): void {
    this.dataArray.add(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}