<template>
  <el-menu default-active="1" class="menu" @select="menuSelect">
    <div >
      head
    </div>
    <h4>main menu</h4>
    <el-menu-item index="1" class="menu_item">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">book</span>
    </el-menu-item>
    <el-menu-item index="自然科学总论" class="menu_item">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">entity</span>
    </el-menu-item>
    <el-menu-item index="农业科学" class="menu_item">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">yeuyue</span>
    </el-menu-item>
  </el-menu>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "header",
  data() {
    return {
      data: "",
      login: false,
      type: 2,
    };
  },
  mounted() {},
  methods: {
    menuSelect(index: string) {},
  },
});
</script>

<style lang="scss" scoped="scoped">
.menu {
  width: 270px;
  height:$max_height;
  background-color: white;
  .menu_item {
    margin-left: 20px;
    width: 230px;
    border-radius: 20px;
    margin: 10px;
    .menu_item_icon {
      margin-left: 10%;
    }
    .menu_item_content {
      margin-left: 10%;
      font: {
        family: Futura;
        size: 20px;
        weight: 400px;
      }
    }
  }
  .el-menu-item {
    color: $word_color;
  }
  .is-active {
    background-color: $theme_color;
    color: white;
  }
}
</style>
