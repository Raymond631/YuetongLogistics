<template>
  <div class="container">
    <div class="title">
      <label class="label-fade-enter-from label1">可靠安全的物流系统：</label>
      <label class="label-fade-enter-from label2">YueTong</label>
      <label class="label-fade-enter-from label3">粤通物流系统</label>
    </div>
    <RouterLink to="/login"
      ><el-button class="enterBtn">管理员登录</el-button></RouterLink
    >
  </div>
</template>
<script lang="ts">
import navigationBar from "../components/navigationBar.vue";
import welcomeHeader from "../components/header.vue";
import { defineComponent } from "vue";

export default defineComponent({
  name: "home",
  data() {
    return {
      data: "",
    };
  },
  components: { welcomeHeader, navigationBar },
  mounted() {},
  methods: {
    menuSelect(index: string) {},
  },
});
</script>

<style scoped lang="scss">
$title_color: #ffffff;
@mixin font {
  font-family: "Microsoft YaHei", sans-serif;
  color: $title_color;
}
.flex-grow {
  flex-grow: 1;
}
.container {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  /*背景图片*/
  background-image: url("../assets/images/indexBgi.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  overflow: hidden;
}
.title {
  width: 300px;
  height: 100px;
  display: grid;
  margin-top: 100px;
  margin-left: 100px;
  @include font;
  .label1 {
    font-size: 20px;
  }
  .label2,
  .label3 {
    font-size: 40px;
    font-weight: bold;
  }
}
.enterBtn {
  width: 150px;
  height: 50px;
  margin-top: 100px;
  margin-left: 700px;
  background-color: rgba(255, 255, 255, 0.8);
  border-radius: 10px;
  @include font;
  font-size: 20px;
}
</style>
