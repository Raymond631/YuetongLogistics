<template>
<!--  <el-menu default-active="1" class="menu" @select="menuSelect">-->
<!--    <div >-->
<!--      head-->
<!--    </div>-->
<!--    <h4>main menu</h4>-->
<!--    <el-menu-item index="1" class="menu_item">-->
<!--      <el-icon class="menu_item_icon">-->
<!--        <Reading />-->
<!--      </el-icon>-->
<!--      <span class="menu_item_content">book</span>-->
<!--    </el-menu-item>-->
<!--    <el-menu-item index="自然科学总论" class="menu_item">-->
<!--      <el-icon class="menu_item_icon">-->
<!--        <Reading />-->
<!--      </el-icon>-->
<!--      <span class="menu_item_content">entity</span>-->
<!--    </el-menu-item>-->
<!--    <el-menu-item index="农业科学" class="menu_item">-->
<!--      <el-icon class="menu_item_icon">-->
<!--        <Reading />-->
<!--      </el-icon>-->
<!--      <span class="menu_item_content">yeuyue</span>-->
<!--    </el-menu-item>-->
<!--  </el-menu>-->

<!--  顶部标签-->
  <div class="header">
    <div class="yuetong">粤通物流</div>
    <div class="loginInfo">
      <label>欢迎您！</label>
      <label v-text="username"></label>
      <el-avatar :src="headImageSrc" :size="60" class="headImg"></el-avatar>
      <RouterLink to="">退出系统</RouterLink>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "PageHeader",
  data() {
    return {
      data: "",
      login: false,
      type: 2,
      username:"张三",
      headImageSrc:"https://i01piccdn.sogoucdn.com/9df2c4c9b7e3f7e6"
    };
  },
  mounted() {},
  methods: {
    menuSelect(index: string) {},
  },
});
</script>

<style lang="scss" scoped="scoped">
//.menu {
//  width: 270px;
//  height:$max_height;
//  background-color: white;
//  .menu_item {
//    margin-left: 20px;
//    width: 230px;
//    border-radius: 20px;
//    margin: 10px;
//    .menu_item_icon {
//      margin-left: 10%;
//    }
//    .menu_item_content {
//      margin-left: 10%;
//      font: {
//        family: Futura;
//        size: 20px;
//        weight: 400px;
//      }
//    }
//  }
//  .el-menu-item {
//    color: $word_color;
//  }
//  .is-active {
//    background-color: $theme_color;
//    color: white;
//  }
//}
$header_line_height:80px;
$font_color:#ffffff;

.header {
  background-color: #5e5c5c;
  width: 100%;
  height: $header_line_height;
  top: 0;
  left: 0;
  position: fixed;
  display: flex;
  flex-wrap: nowrap;
  z-index:999;
}
.yuetong{
  margin-left: 50px;
  font-family: "Microsoft YaHei",sans-serif;
  font-weight: bold;
  font-size: 35px;
  color: $font_color;
  line-height: $header_line_height;
}
.loginInfo{
  margin-left: 1000px;
  display: flex;
  flex-wrap: nowrap;
  color:$font_color;
  font-size: 20px;
  font-family: "Microsoft YaHei",sans-serif;
  line-height: $header_line_height;
}
.headImg{
  position: relative;
  margin-top: 10px;
  margin-left: 20px;
  margin-right: 20px;
}

</style>
