<template>
  <el-menu default-active="0" class="menu" @select="menuSelect">
    <div class="title">
      <div class="title_icon">
        <el-icon><Ship /><Van /></el-icon>
      </div>
      <div class="title_name">粤通物流</div>
      <div class="title_groupName">木子石石石</div>
    </div>
    <h4 class="menu_title">Main Menu</h4>
    <el-menu-item index="0" class="menu_item">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">首页</span>
    </el-menu-item>
    <el-menu-item index="1" class="menu_item" v-if="userType === 1">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">车队信息管理</span>
    </el-menu-item>
    <el-menu-item index="2" class="menu_item" v-if="userType === 1">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">车辆信息维护</span>
    </el-menu-item>
    <el-menu-item index="3" class="menu_item" v-if="userType === 1">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">驾驶员信息维护</span>
    </el-menu-item>
    <el-menu-item index="4" class="menu_item" v-if="userType === 2">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">调度承运任务</span>
    </el-menu-item>
    <el-menu-item index="5" class="menu_item" v-if="userType === 3">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">承运单开出</span>
    </el-menu-item>
    <el-menu-item index="6" class="menu_item" v-if="userType === 3">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">承运单接收</span>
    </el-menu-item>
    <el-menu-item index="7" class="menu_item" v-if="userType === 4">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">成本维护</span>
    </el-menu-item>
    <el-menu-item index="8" class="menu_item" v-if="userType === 4">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">成本核算</span>
    </el-menu-item>
    <el-menu-item index="9" class="menu_item" v-if="userType === 2 || 4">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">运力综合</span>
    </el-menu-item>
    <el-menu-item index="10" class="menu_item" v-if="userType === 2 || 4">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">历史承运任务</span>
    </el-menu-item>
    <el-menu-item index="11" class="menu_item" v-if="userType === 5">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">用户维护</span>
    </el-menu-item>
    <el-menu-item index="12" class="menu_item" v-if="userType === 5">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">系统维护</span>
    </el-menu-item>
    <el-menu-item index="13" class="menu_item" v-if="userType === 5">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">日志维护</span>
    </el-menu-item>
    <div class="bottom">

    </div>
  </el-menu>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "header",
  data() {
    return {
      data: "",
      userType: 1,
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
