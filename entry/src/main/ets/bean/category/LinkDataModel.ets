/**
 * initial data model.
 */
export default class LinkDataModel {
  /**
   * parentId
   */
  superId: number;
  /**
   * ParentName
   */
  superName: string;
  id: number;
  courseName: string;
  imageUrl: Resource;
  price: number;

  constructor(superId: number, superName: string, id: number, courseName: string, imageUrl: Resource, price: number) {
    this.superId = superId;
    this.superName = superName;
    this.id = id;
    this.courseName = courseName;
    this.imageUrl = imageUrl;
    this.price = price;
  }
}