// 封装操作localstorage本地存储的方法  模块化

var storage = {
  set(key: any, value: any) {
    localStorage.setItem(key, JSON.stringify(value));
    // localStorage.key = value;
    // localStorage[key] = value;
  },
  get(key: any) {
    return JSON.parse(localStorage.getItem(key) || "{}");
  },
  getForIndex(index: any) {
    return localStorage.key(index);
  },
  getKeys() {
    let items = this.getAll();
    let keys = [];
    for (let index = 0; index < items.length; index++) {
      keys.push(items[index].key);
    }
    return keys;
  },
  getLength() {
    return localStorage.length;
  },
  getSupport() {
    return typeof Storage !== "undefined" ? true : false;
  },
  remove(key: any) {
    localStorage.removeItem(key);
  },
  removeAll() {
    localStorage.clear();
  },
  getAll() {
    let len = localStorage.length; // 获取长度
    let arr = new Array(); // 定义数据集
    for (var i = 0; i < len; i++) {
      // 获取key 索引从0开始
      let getKey: any;
      getKey = localStorage.key(i);
      // 获取key对应的值
      var getVal = localStorage.getItem(getKey);
      // 放进数组
      arr[i] = {
        key: getKey,
        val: getVal,
      };
    }
    return arr;
  },
};

export default storage;
