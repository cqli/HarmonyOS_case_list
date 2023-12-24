
/**
 * Course Model
 */
export default class CourseModel {
  classifyId: number;
  courseId: number;
  courseName: string;
  imageUrl: Resource;
  price: number;

  constructor(classifyId: number, courseId: number, courseName: string, imageUrl: Resource, price: number) {
    this.classifyId = classifyId;
    this.courseId = courseId;
    this.courseName = courseName;
    this.imageUrl = imageUrl;
    this.price = price;
  }
}