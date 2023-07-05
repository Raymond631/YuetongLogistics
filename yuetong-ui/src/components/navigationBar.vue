<template>
  <el-menu default-active="1" class="menu" @select="menuSelect">
    <div class="title">
      <div class="title_icon">
        <el-icon><Ship /><Van /></el-icon>
      </div>
      <div class="title_name">粤通物流</div>
      <div class="title_groupName">木子石石石</div>
    </div>
    <h4 class="menu_title">Main Menu</h4>
    <el-menu-item index="1" class="menu_item">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">book_love</span>
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
    };
  },
  mounted() {},
  methods: {
    menuSelect(index: string) {},
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../assets/style/components/navigationBar.scss";
</style>
