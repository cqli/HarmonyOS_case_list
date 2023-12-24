import CourseModel from './CourseModel';

/**
 * course classity model
 */
export default class ClassifyModel {
  /**
   * classify id
   */
  classifyId: number;
  /**
   * classify name
   */
  classifyName: string;
  /**
   * course list of the classify.
   */
  courseList: Array<CourseModel>;

  constructor(classifyId: number, classifyName: string, courseList: Array<CourseModel>) {
    this.classifyId = classifyId;
    this.classifyName = classifyName;
    this.courseList = courseList;
  }
}