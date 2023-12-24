
/**
 * Card model.
 */
export default class CardModel {
  selectedIcon: Resource;
  defaultIcon: Resource;
  content: string;

  constructor(selectedIcon: Resource, defaultIcon: Resource, content: string) {
    this.selectedIcon = selectedIcon;
    this.defaultIcon = defaultIcon;
    this.content = content;
  }
}