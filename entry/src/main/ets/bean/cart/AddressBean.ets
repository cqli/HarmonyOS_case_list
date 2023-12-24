/**
 * @description: 购物车默认地址
 */
export class AddressBean {

  /**
   *联系人
   */
  contacts: string;
  /**
   *联系电话
   */
  contactMobile: string;

  /**
   *第一级code
   */
  firstCode: string;
  /**
   *第一级code对应的名称
   */
  firstName: string;

  /**
   * 第二级code
   */
  secondCode: string;
  /**
   *第二级name
   */
  secondName: string;
  /**
   *第三级code
   */
  thirdCode: string;
  /**
   *第三级name
   */
  thirdName: string;


  /**
   *第四级code
   */
  fourthCode: string;
  /**
   *第四级code对应的名称
   */
  fourthName: string;

  /**
   *详细地址
   */
  detail: string

  /**
   * 标签
   */
  label: string;

  /**
   *是否默认：1-是；0-否
   */
  ifDefault: number;

  /**
   *主键id
   */
  id: number;
  isChecked: boolean;
}